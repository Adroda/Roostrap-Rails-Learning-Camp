describe 'GET api/v1/targets', type: :request do
  let(:user) { create(:user) }
  let!(:targets)       { create_list(:target, 10) }
  let(:first_target)   { targets.first }
  subject { get api_v1_targets_path, headers: auth_headers, as: :json }

  it 'returns a successful response' do
    subject
    expect(response).to be_successful
  end

  it 'returns all targets' do
    subject
    expect(json[:targets].pluck(:title)).to match_array(targets.pluck(:title))
  end

  it 'returns targets in correct format' do
    subject
    expect(json[:targets].first[:id]).to eq(first_target.id)
    expect(json[:targets].first[:topic_id]).to eq(first_target.topic_id)
    expect(json[:targets].first[:title]).to eq(first_target.title)
    expect(json[:targets].first[:radius]).to eq(first_target.radius)
    expect(json[:targets].first[:lat]).to eq(first_target.lat)
    expect(json[:targets].first[:lng]).to eq(first_target.lng)
    expect(json[:targets].first[:created_at]).to eq(first_target.created_at.as_json)
    expect(json[:targets].first[:updated_at]).to eq(first_target.updated_at.as_json)
  end
end
