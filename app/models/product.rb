class Product < ApplicationRecord

  validates :name, :model, :brand, :released_date, :ram, :external_storage, presence: true

  belongs_to :user

end
