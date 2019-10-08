require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require './models'

enable :sessions

get '/' do
  erb :index
end




get '/member/signin' do
  erb :member_sign_in
end

post '/member/signin' do
  erb :member_sign_in
end

get '/member/signup' do
  erb :member_sign_up
end

post '/member/signup' do
  img_url = ''
  if params[:file]
    img = params[:file]
    tempfile = img[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    img_url = upload['url']
  end
  @member = Member.create(name: params[:name], password:params[:password],password_confirmation:params[:password_confirmation],image: img_url)
  if @member.persisted?
    session[:member] = @member.id
  end
  redirect '/member'
end

get '/' do
  erb :member_index
end




get '/mentor/signin' do
  erb :mentor_sign_in
end

post '/mentor/signin' do
  erb :mentor_sign_in
end

get '/mentor/signup' do
  erb :mentor_sign_up
end

post '/mentor/signup' do
  erb :meetor_sign_up
end