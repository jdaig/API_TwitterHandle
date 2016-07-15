get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  # p CLIENT.user ( " Sferik " ) #Se hizo una prueva del API
  erb :index
end

# Estos metodos de inicio, como un tipo de guia prueba
post '/fetch' do
  redirect to "/fetch/#{params[:th]}"
end

get '/fetch/:handle' do
  @thandle = params[:handle]
  # p @thandle
  @ary_tweets = CLIENT.user_timeline(@thandle).take(10)
  # Tweet.base(@thandle)
  erb :handle_view
end

# Para una actualizacion o segunda consulta
post '/fetch_u' do
  # p params[:hiddenth]
  redirect to "/fetch_u/#{params[:hiddenth]}"
end

get '/fetch_u/:username' do
  @thandle = params[:username]
  # Se crea un TwitterUser si no existe en la base de datos de lo contrario trae de la base al usuario.
  @tu = TwitterUser.create(usuario: @thandle) unless @tu = TwitterUser.find_by(usuario: @thandle)
  @dbt = @tu.tweets
  # p @dbt
  if @dbt.empty? # La base de datos no tiene tweets?  
    @ary_tweets =[]
    # Pide a Twitter los últimos tweets del usuario y los guarda en la base de datos
    @dbt = Tweet.base(@thandle)
    # p @dbt
    @dbt.each{|tweet_id| @ary_tweets << tweet_id}
    # puts "*"*50
    # p @ary_tweets
  else 
    @ary_tweets_db = @tu.tweets.take(10)
  end

  # Se hace una petición por los ultimos 10 tweets a la base de datos. 
  erb :handle_view
end