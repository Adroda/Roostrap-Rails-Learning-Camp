module Api
  module V1
    class TargetsController < Api::V1::ApiController
      def create
        @target = Target.create!(target_params)
      end

      private

      def target_params
        params.require(:target).permit(:topic_id, :title, :radius, :lat, :lng)
      end
    end
  end
end
