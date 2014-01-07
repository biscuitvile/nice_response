class CreateGerbils < ActiveRecord::Migration
  def change
    create_table :gerbils do |t|
      t.string :name
    end
  end
end
