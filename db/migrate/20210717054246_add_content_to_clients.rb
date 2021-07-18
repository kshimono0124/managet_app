class AddContentToClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :content, :text
  end
end
