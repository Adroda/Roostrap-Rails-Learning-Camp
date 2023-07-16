class UserTargetDependencies < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :targets, :user, foreign_key: true
  end
end
