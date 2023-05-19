# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  name       :string
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

describe Topic do
  subject(:topic) { FactoryBot.create(:topic) }
  it { is_expected.to be_an Topic }
  it { is_expected.to be_persisted }
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:image).of_type(:string) }
end
