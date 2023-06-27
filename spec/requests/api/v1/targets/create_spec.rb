describe 'POST api/v1/targets/', type: :request do
  let(:target) { Target.last }
  let(:user) { create(:user) }
  let(:topic) { create(:topic) }
  let(:failed_response) { 400 }

  describe 'POST create' do
    subject { post api_v1_targets_path, headers: auth_headers, params:, as: :json }

    let(:topic_id) { topic.id }
    let(:title) { Faker::Lorem.sentence }
    let(:radius) { Faker::Number.decimal(l_digits: 5, r_digits: 2) }
    let(:lat) { Faker::Number.decimal(l_digits: 2, r_digits: 6) }
    let(:lng) { Faker::Number.decimal(l_digits: 2, r_digits: 6) }

    let(:params) do
      {
        target: {
          topic_id:,
          title:,
          radius:,
          lat:,
          lng:
        }
      }
    end

    it 'returns a successful response' do
      subject
      expect(response).to have_http_status(:success)
    end

    it 'creates the target' do
      expect { subject }.to change(Target, :count).by(1)
    end

    it 'returns the target', :aggregate_failures do
      subject

      expect(json[:target][:id]).to eq(target.id)
      expect(json[:target][:topic_id]).to eq(target.topic_id)
      expect(json[:target][:title]).to eq(target.title)
      expect(json[:target][:radius]).to eq(target.radius)
      expect(json[:target][:lat]).to eq(target.lat)
      expect(json[:target][:lng]).to eq(target.lng)
    end

    shared_examples 'necessary attribute' do |attribute|
      let(attribute) { nil }

      it 'does not create a target' do
        expect { subject }.not_to change { Target.count }
      end

      it 'does not return a successful response' do
        subject
        expect(response).to be_bad_request
      end
    end

    it_behaves_like 'necessary attribute', :topic_id
    it_behaves_like 'necessary attribute', :title
    it_behaves_like 'necessary attribute', :radius
    it_behaves_like 'necessary attribute', :lat
    it_behaves_like 'necessary attribute', :lng
  end
end
