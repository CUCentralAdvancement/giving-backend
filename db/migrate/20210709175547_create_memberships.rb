class CreateMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.string :aasm_state
      t.integer :level
      # t.datetime :start_date
      # t.datetime :end_date

      t.belongs_to :space
      t.belongs_to :user

      t.timestamps
    end
  end
end
