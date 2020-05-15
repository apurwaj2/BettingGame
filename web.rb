require 'sinatra'
require './users'

configure :production do
  DataMapper.setup(:default, ENV['DATABASE_URL'])
end

def save_session(para, money)
  count = (session[para] || 0).to_i
  count += money
  session[para] = count
end

get '/' do
  erb :login
end

post '/login' do
  user = User.first(username: params[:username])
  if user != nil  && user.password != nil && 
      params[:password] == user.password
      session[:name] = params[:username]
      redirect to '/users'
  else
      session[:message] = "Username or Password is incorrect"
      redirect '/'
  end
end

post '/bet' do
  money = params[:money].to_i
  number = params[:number].to_i
  roll = rand(6) + 1
  if number == roll
    save_session(:win, 10*money)
    save_session(:profit, 9*money)
    session[:message] = "The dice landed on #{roll}, you chose #{number} and you won #{10*money} dollars"
  else
    save_session(:loss, money)
    save_session(:win, -1*money)
    session[:message] = "The dice landed on #{roll}, you chose #{number} and you lost #{money} dollars"
  end
  redirect '/bet'
end

post '/logout' do
  user = User.first(username: session[:name])
  user.update(totalWins: session[:win] + user.totalWins)
  user.update(totalLoss: session[:loss] + user.totalLoss)
  user.update(totalProfit: session[:profit] + user.totalProfit)
  session[:login] = nil
  session[:name] = nil
  session[:message] = "You have successfully logged out"
  redirect '/'
end

not_found do
  "Page requested not found"
end
