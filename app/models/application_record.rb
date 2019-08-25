class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  require 'carrierwave'
  require 'carrierwave/orm/activerecord'
end
