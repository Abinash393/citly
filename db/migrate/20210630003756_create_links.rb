class CreateLinks < ActiveRecord::Migration[6.0]
  def up
    create_table :links, id: :uuid do |t|
      t.string :original_url, null: false
      t.string :short_url, null: false, unique: true
      t.bigint :counter, default: 0
      t.datetime :pinned_at
      t.timestamps
    end
  end

  def down
    drop_table :links
  end
end
