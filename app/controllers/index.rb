get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  # p CLIENT.user ( " Sferik " ) #Se hizo una prueva del API
  erb :index
end

post '/fetch' do
  redirect to '/:handle'
end

get '/:handle' do

end