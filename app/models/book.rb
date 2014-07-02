class Book < ActiveRecord::Base
  attr_accessible :number_of_pages, :price, :title

  translates :title
  globalize_accessors

  globalize_locales.each do |locale|
    validates "title_#{locale}", length: { within: 2..255 }, presence: true
  end
  validates :title, :globalized_uniqueness => {:scope => :locale}

  validates :price,
            presence: true,
            numericality: { greater_than: 0 }
end