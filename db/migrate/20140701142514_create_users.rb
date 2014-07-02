class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :session_id, null: false
      t.string :locale, null: false, default: I18n.default_locale

      t.timestamps
    end
  end
end
