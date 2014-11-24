class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true
      t.text :description
      t.string :pic

      t.timestamps
    end
  end
end
