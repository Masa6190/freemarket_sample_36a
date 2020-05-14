class AddDelivernameToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :familyname_deliver, :string
    add_column :addresses, :firstname_deliver, :string
    add_column :addresses, :familyname_deliver_kana, :string
    add_column :addresses, :firstname_deliver_kana, :string
  end
end
