class Application < ApplicationRecord
  validates :name, presence: :true
  validates :street_address, presence: :true
  validates :city, presence: :true
  validates :state, presence: :true
  validates :zip_code, presence: :true
  validates :description, presence: :true
  validates :status, presence: :true
  
  has_many :pet_applications
  has_many :pets, through: :pet_applications
  

  def pet_app_status(pet)
    PetApplication.where(application_id: self.id, pet_id: pet.id).pick(:status)
  end
end