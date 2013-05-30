helpers do
  def valid_event(event)
    @error_message = []
    if Event.all.map { |e| e.title }.include?(@event.title)
      @error_message << 'title already exists'
    end
    if event.organizer_name.nil?
      @error_message << event.error
      p @error_message
    end

    @error_message << 'invalid email' unless event.organizer_email =~ /\w+@\w+.\w{2,}/
      
    if event.organizer_email.nil?
      @error_message << 'you must enter an organizer email'
    end

    if @error_message.length == 0
      @event.save
      redirect '/'
    else
      erb :error_message
    end
  end
end