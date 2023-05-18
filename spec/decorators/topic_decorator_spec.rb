describe TopicDecorator do
  let(:topic) { create(:topic) }
  let(:decorated_topic) { topic.decorate }

  it 'returns same email' do
    expect(decorated_topic.name).to eq(topic.name)
  end
end
