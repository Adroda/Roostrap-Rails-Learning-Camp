describe TopicPolicy do
  subject { described_class }

  permissions :index? do
    let(:topic) { create(:topic) }

    it 'allows index show' do
      expect(subject).to permit(topic)
    end
  end
end
