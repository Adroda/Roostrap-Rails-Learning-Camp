module Api
  module V1
    class TargetsController < Api::V1::ApiController
      def create
        @target = Target.new(target_params)
        authorize(@target)
        @target.save!
      end

      private

      def target_params
        params.require(:target).permit(:topic_id, :title, :radius, :lat, :lng)
      end
    end
  end
end
