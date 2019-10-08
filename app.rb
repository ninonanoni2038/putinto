require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require './models'

enable :sessions

before do
  Dotenv.load
  Cloudinary.config do |config|
    config.cloud_name = ENV['CLOUD_NAME']
    config.api_key = ENV['CLOUDINARY_API_KEY']
    config.api_secret = ENV['CLOUDINARY_API_SECRET']
  end
end

get '/' do
  erb :index
end




get '/member/signin' do
  erb :member_sign_in
end

post '/member/signin' do
  member = Member.find_by(name: params[:name])
  if member && member.authenticate(params[:password])
    session[:member] = member.id
    puts 'ユーザーいたよ'
    redirect '/member'
  end
  puts 'ユーザーいないよ'
  redirect '/member/signin'
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

get '/member/signout' do
  session[:member] = nil
  redirect '/member/signin'
end

get '/member' do
  @errors = Error.where(member_id: session[:member])
  erb :member_index
end

get '/member/new' do
  erb :member_new
end

post '/member/new' do

  @error = Error.create(want: params[:want], timing: params[:timing],detail: params[:detail],challenge: params[:challenge],article: params[:article],rank: params[:rank],member_id: session[:member])
  files = params[:file]
  files.each do |file|
    img_url = ''
    if file
      img = file
      tempfile = img[:tempfile]
      upload = Cloudinary::Uploader.upload(tempfile.path)
      img_url = upload['url']
    end
    @error_image = ErrorImage.create(image: img_url,error_id:@error.id)
  end
  redirect '/member'
end

get '/member/detail/:id' do
  @error = Error.find(params[:id])
  @error_images = ErrorImage.where(error_id: params[:id])
  erb :member_detail
end






get '/mentor/signin' do
  erb :mentor_sign_in
end

post '/mentor/signin' do
  erb :mentor_sign_in
end

get '/mentor/signup' do
  img_url = ''
  if params[:file]
    img = params[:file]
    tempfile = img[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    img_url = upload['url']
  end
  @mentor = Mentor.create(name: params[:name], password:params[:password],password_confirmation:params[:password_confirmation],image: img_url)
  if @mentor.persisted?
    session[:mentor] = @mentor.id
  end
  redirect '/mentor'
end

post '/mentor/signup' do
  erb :mentor_sign_up
end

get '/mentor' do
  erb :mentor_index
end