get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :create_event
end


post '/events/create' do
  p params
  @error_message = []
  @event = Event.new(params[:event])

  if Event.all.map { |e| e.title }.include?(@event.title)
    @error_message << 'title already exists'
  end
  if @event.organizer_name.nil?
    @error_message << 'you must enter an organizer name'
  end

  @error_message << 'invalid email' unless @event.organizer_email =~ /\w+@\w+.\w{2,}/
    
  if @event.organizer_email.nil?
    @error_message << 'you must enter an organizer email'
  end

  if @error_message.length == 0
    @event.save
    redirect '/'
  else
    erb :error_message
  end
  

end
