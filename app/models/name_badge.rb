class NameBadge < ActiveRecord::Base
  validates_presence_of :name, :width, :height, :font_size
end
