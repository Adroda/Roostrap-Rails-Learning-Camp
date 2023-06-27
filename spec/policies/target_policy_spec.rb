describe TargetPolicy do
  subject { described_class }

  permissions :create? do
    let(:user) { create(:user) }
    let(:target) { create(:target) }
    
    it 'denies access if user is nil' do
      expect(subject).not_to permit(nil, target)
    end

    it 'allow access if user exists' do
      expect(subject).to permit(user, target)
    end
  end
end
