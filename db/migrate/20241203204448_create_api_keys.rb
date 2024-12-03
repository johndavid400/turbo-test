class CreateApiKeys < ActiveRecord::Migration[7.1]
  def change
    create_table :api_keys do |t|
      t.string :token
      t.string :secret
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
