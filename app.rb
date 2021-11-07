require 'sinatra'
require 'sinatra/contrib/all'

get '/' do
    erb :index  
end

post '/' do
  @name = params[:name]
  @phone = params[:phone]
  @date = params[:date]

  f = File.open './public/users.txt', 'a'
  f.write "Customer: #{@name}, phone: #{@phone}, arival's date: #{@date}\n"
  f.close
  erb :index
end

get '/admin' do
  erb :admin
end

get '/contacts' do 
  '19191991'
end

post '/admin' do
  @login = params[:aaa]
  @password =params[:bbb]
  
    if @login == 'admin' && @password == 'secret'
      v = File.open './public/users.txt', 'r'
       @users = v.read
       v.close
       erb :admin 
    else
       erb "Access Denied" 
    end
end
