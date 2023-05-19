require 'rails_helper'

RSpec.describe Api::V1::TopicsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/topics').to route_to('topics#index')
    end

    it 'routes to #create' do
      expect(post: '/topics').to route_to('topics#create')
    end
  end
end
