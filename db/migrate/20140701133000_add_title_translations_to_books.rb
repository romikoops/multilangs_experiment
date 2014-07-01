class AddTitleTranslationsToBooks < ActiveRecord::Migration
  def up
    remove_column :books, :title
    add_column :books, :title_translations, 'hstore'
  end
  def down
    remove_column :books, :title_translations
    add_column :books, :title, :string
  end
end