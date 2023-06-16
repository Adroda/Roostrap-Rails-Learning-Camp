describe Target do
  subject(:target) { FactoryBot.create(:target) }
  it { is_expected.to be_an Target }
  it { is_expected.to be_persisted }
  it { expect(:topic_id).not_to be_nil }
  it { expect(:title).not_to be_nil }
  it { expect(:radius).not_to be_nil }
  it { expect(:lat).not_to be_nil }
  it { expect(:lng).not_to be_nil }
  it { should have_db_column(:radius).of_type(:float) }
  it { should have_db_column(:lat).of_type(:float) }
  it { should have_db_column(:lng).of_type(:float) }
end
