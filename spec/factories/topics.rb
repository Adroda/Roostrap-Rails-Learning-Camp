# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  label      :string
#  icon       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :topic do
    name { Faker::Name.unique.name }
    image { Faker::LoremFlickr.image }
  end
end
