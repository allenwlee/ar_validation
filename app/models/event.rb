class Event < ActiveRecord::Base

  validates :date, :presence => { :message => "you must enter in a date" }
  validates :title, :uniqueness => { :message => "event title is already taken" }
  validates :organizer_name, :presence => { :message => "you must enter in an organizer name" }
  validates :organizer_email, :presence => { :message => "you must enter in an organizer email" }
  validates_format_of :organizer_email, :with => /\w+@\w+.\w{2,}/
  validate :proper_date
  
  def proper_date
    self.date > Time.now
  end

end
