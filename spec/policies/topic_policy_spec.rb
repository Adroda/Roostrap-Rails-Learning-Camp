describe TopicPolicy do
  subject { described_class }

  permissions :create? do
    let(:user) { create(:user) }
    let(:topic) { create(:topic) }
    
    it 'denies access if user is nil' do
      expect(subject).not_to permit(nil, topic)
    end

    it 'allow access if user exists' do
      expect(subject).to permit(user, topic)
    end
  end
end
