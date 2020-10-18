class CreateGroupEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :group_events do |t|
      t.text :name
      t.text :description
      t.text :location
      t.boolean :deleted, default: 0
      t.string :startDate
      t.string :endDate
      t.integer :duration
      t.boolean :published, default: 0

      t.timestamps
    end
  end
end
