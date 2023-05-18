module Api
  module V1
    class TopicsController < Api::V1::TopicsController
      def index
        @topics = policy_scope(Topic)
      end
    end
  end
end
