class Book < ActiveRecord::Base
  attr_accessible :number_of_pages, :price, :title, *I18n.available_locales.map{|l| "title_#{l}"}

  translates :title
  I18n.available_locales.each do |locale|
    validates "title_#{locale}",
            #uniqueness: true, it does not work, needs other solution
            presence: true,
            length: { within: 2..255 }
  end

  validates :price,
            presence: true,
            numericality: { greater_than: 0 }
end