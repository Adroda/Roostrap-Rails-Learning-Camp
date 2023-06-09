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

describe Topic do
  subject(:topic) { FactoryBot.create(:topic) }
  it { is_expected.to be_an Topic }
  it { is_expected.to be_persisted }
  it { expect(:name).not_to be_nil }
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:image).of_type(:string) }
end
