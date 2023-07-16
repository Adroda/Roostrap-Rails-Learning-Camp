module Api
  module V1
    class TargetsController < Api::V1::ApiController
      def create
        @target = current_user.targets.new(target_params)
        authorize(@target)
        @target.save!
      end

      def index
        @targets = policy_scope(Target)
      end

      def destroy
        @target = current_user.targets.find(target_params[:id])
        @target.destroy!
      end

      private

      def target_params
        params.require(:target).permit(:topic_id, :title, :radius, :lat, :lng)
      end
    end
  end
end
