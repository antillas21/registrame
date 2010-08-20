class Label < ActiveRecord::Base
  validates_presence_of :name, :width, :height
end
