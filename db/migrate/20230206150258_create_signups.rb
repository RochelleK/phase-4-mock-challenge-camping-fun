class CreateSignups < ActiveRecord::Migration[6.1]
  def change
    create_table :signups do |t|
      t.integer :time
      t.string :camper_id
      t.string :activity_id

      t.timestamps
    end
  end
end
