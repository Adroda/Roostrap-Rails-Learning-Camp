class AddTargets < ActiveRecord::Migration[7.0]
  def change
    create_table :targets do |t|
      t.belongs_to :topic, foreign_key: true
      t.string :title, null: false
      t.float :radius, null: false
      t.float :lat, null: false
      t.float :lng, null: false

      t.timestamps
    end
  end
end
