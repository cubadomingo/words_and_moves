# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  location   :string
#  event_date :datetime
#

class Event < ActiveRecord::Base
end
