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
class Entry < ApplicationRecord
  belongs_to :user

  has_one_attached :photo  # 画像を使うなら

  enum :mood, { neutral: 0, happy: 1, sad: 2, tired: 3, angry: 4 }, prefix: true

  validates :date, :title, :body, presence: true
  validates :title, length: { maximum: 50 }

  scope :recent, -> { order(date: :desc, created_at: :desc) }
end
