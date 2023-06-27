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
#
# Indexes
#
#  index_targets_on_topic_id  (topic_id)
#

FactoryBot.define do
  factory :target do
    topic
    title { Faker::Lorem.sentence }
    radius { Faker::Number.decimal(l_digits: 5, r_digits: 2) }
    lat { Faker::Number.decimal(l_digits: 2, r_digits: 6) }
    lng { Faker::Number.decimal(l_digits: 2, r_digits: 6) }
  end
end
