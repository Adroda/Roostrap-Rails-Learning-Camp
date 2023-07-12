# == Schema Information
#
# Table name: targets
#
#  id         :bigint           not null, primary key
#  topic_id   :bigint
#  title      :string           not null
#  radius     :float            not null
#  lat        :float            not null
#  lng        :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_targets_on_topic_id  (topic_id)
#  index_targets_on_user_id   (user_id)
#
class Target < ApplicationRecord
  acts_as_mappable

  belongs_to :topic
  belongs_to :user
  validates :title, :radius, :lat, :lng, presence: true
  validate :count_user_targets

  MAX_TARGETS = 3

  def count_user_targets
    count = user.targets.count
    errors.add(:targets, 'This user already made the maximum of 3 targets') if count >= MAX_TARGETS
  end
end
