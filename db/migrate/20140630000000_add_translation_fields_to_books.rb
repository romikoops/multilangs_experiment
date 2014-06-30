class AddTranslationFieldsToBooks < ActiveRecord::Migration
  def up
    Book.create_translation_table!({
                                       title: :string
                                   }, {
                                       migrate_data: true
                                   })
  end

  def down
    Book.drop_translation_table!(migrate_data: true)
  end
end