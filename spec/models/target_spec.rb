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
describe Target do
  subject(:target) { FactoryBot.create(:target) }

  it { is_expected.to be_an Target }
  it { is_expected.to be_persisted }
  it { expect(:topic_id).not_to be_nil }
  it { expect(:title).not_to be_nil }
  it { expect(:radius).not_to be_nil }
  it { expect(:lat).not_to be_nil }
  it { expect(:lng).not_to be_nil }
  it { should have_db_column(:topic_id).of_type(:integer) }
  it { should have_db_column(:title).of_type(:string) }
  it { should have_db_column(:radius).of_type(:float) }
  it { should have_db_column(:lat).of_type(:float) }
  it { should have_db_column(:lng).of_type(:float) }
end
