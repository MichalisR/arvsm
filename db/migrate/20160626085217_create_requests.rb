class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :description
      t.datetime :starting_date
      t.datetime :end_date
      t.string :absense_type
      t.string :status
      t.string :comment
      t.integer :no_days
      t.integer :approver_id

      t.timestamps null: false
    end
  end
end
