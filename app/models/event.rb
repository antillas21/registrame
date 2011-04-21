class Event < ActiveRecord::Base
  validates_presence_of :name

  def date_formatted
    self.date.strftime('%A %B %e %Y')
  end
end
