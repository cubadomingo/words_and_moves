# == Schema Information
#
# Table name: subregions
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  region_id  :integer
#

require 'rails_helper'

RSpec.describe Subregion, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
