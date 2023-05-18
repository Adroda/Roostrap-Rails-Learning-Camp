require 'rails_helper'

RSpec.describe TopicsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/topics').to route_to('topics#index')
    end
  end
end
