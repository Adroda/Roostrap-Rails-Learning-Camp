require 'rails_helper'

RSpec.describe API::V1::TopicsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/topics').to route_to('topics#index')
    end

    it 'routes to #show' do
      expect(get: '/topics/1').to route_to('topics#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/topics').to route_to('topics#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/topics/1').to route_to('topics#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/topics/1').to route_to('topics#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/topics/1').to route_to('topics#destroy', id: '1')
    end
  end
end
