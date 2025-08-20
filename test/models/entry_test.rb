# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  body       :text
#  date       :date
#  mood       :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_entries_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require "test_helper"

class EntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
