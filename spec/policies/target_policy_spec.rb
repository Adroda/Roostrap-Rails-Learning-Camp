describe TargetPolicy do
  subject { described_class }

  permissions :create?, :index? do
    let(:user) { create(:user) }
    let(:target) { create(:target) }

    it 'denies access to targets if user is nil' do
      expect(subject).not_to permit(nil, target)
    end

    it 'allow access to targets if user exists' do
      expect(subject).to permit(user, target)
    end
  end
end
