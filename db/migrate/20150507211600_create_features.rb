class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :name
      t.belongs_to :project, index: true
      t.integer :min_days
      t.integer :max_days

      t.timestamps null: false
    end
    add_foreign_key :features, :projects
  end
end
