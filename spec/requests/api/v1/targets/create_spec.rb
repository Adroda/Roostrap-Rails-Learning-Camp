describe 'POST api/v1/targets/', type: :request do
  let(:target)            { Target.last }
  let(:user)          { create(:user) }
  let(:topic)          { create(:topic) }
  let(:failed_response) { 400 }

  describe 'POST create' do
    subject { post api_v1_targets_path, headers: auth_headers, params:, as: :json }


    let(:topic_id) { topic.id }
    let(:title) { 'Test' }
    let(:radius) { 27384.4 }
    let(:lat) { 54.12321 }
    let(:lng) { 12.546546 }

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

    it 'returns the target' do
      subject

      expect(json[:target][:id]).to eq(target.id)
      expect(json[:target][:topic_id]).to eq(target.topic_id)
      expect(json[:target][:title]).to eq(target.title)
      expect(json[:target][:radius]).to eq(target.radius)
      expect(json[:target][:lat]).to eq(target.lat)
      expect(json[:target][:lng]).to eq(target.lng)
    end

    context 'when the topic is missing' do
      let(:topic_id) { nil }

      it 'does not create a target' do
        expect { subject }.not_to change { Target.count }
      end

      it 'does not return a successful response' do
        subject
        expect(response.status).to eq(failed_response)
      end
    end

    context 'when the title is missing' do
      let(:title) { nil }

      it 'does not create a target' do
        expect { subject }.not_to change { Target.count }
      end

      it 'does not return a successful response' do
        subject
        expect(response.status).to eq(failed_response)
      end
    end

    context 'when the title is missing' do
      let(:radius) { nil }

      it 'does not create a target' do
        expect { subject }.not_to change { Target.count }
      end

      it 'does not return a successful response' do
        subject
        expect(response.status).to eq(failed_response)
      end
    end

    context 'when the title is missing' do
      let(:lat) { nil }

      it 'does not create a target' do
        expect { subject }.not_to change { Target.count }
      end

      it 'does not return a successful response' do
        subject
        expect(response.status).to eq(failed_response)
      end
    end

    context 'when the title is missing' do
      let(:lng) { nil }

      it 'does not create a target' do
        expect { subject }.not_to change { Target.count }
      end

      it 'does not return a successful response' do
        subject
        expect(response.status).to eq(failed_response)
      end
    end

    
  end
end
