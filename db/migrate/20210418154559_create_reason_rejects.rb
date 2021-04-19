class CreateReasonRejects < ActiveRecord::Migration[6.1]
  def up
    create_table :reason_rejects do |t|
      t.references :request_payment
      t.text :reason

      t.timestamps
    end
  end

  def down
    drop_table :reason_rejects
  end
end
