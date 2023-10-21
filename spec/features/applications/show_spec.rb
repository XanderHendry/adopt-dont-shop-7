require 'rails_helper' 

RSpec.describe "Application Show Page" do 
  # let(:shelter) { Shelter.create(name: "Aurora shelter", city: "Aurora, CO", foster_program: false, rank: 9) } 
  # let(:application1) { Application.create(name: "John", street_address: "123 makebelieve dr.", city: "fakesville", state: "NA", zip_code: 12345, description: "I lika da pets", status: "In Progress") } 
  # let(:pet1) { Pet.create(adoptable: true, age: 1, breed: "sphynx", name: "Lucille Bald", shelter_id: shelter.id) } 
  # let(:pet2) { Pet.create(adoptable: true, age: 3, breed: "doberman", name: "Lobster", shelter_id: shelter.id) }
  before(:each) do 
    @shelter_1 = Shelter.create(name: "Aurora shelter", city: "Aurora, CO", foster_program: false, rank: 9)
    @application1 = Application.create(name: "John", street_address: "123 makebelieve dr.", city: "fakesville", state: "NA", zip_code: 12345, description: "I lika da pets", status: "In Progress")
    @pet_1 = @shelter_1.pets.create(name: "Mr. Pirate", breed: "tuxedo shorthair", age: 5, adoptable: true)
    @pet_2 = @shelter_1.pets.create(name: "Clawdia", breed: "shorthair", age: 3, adoptable: true)
    @pet_3 = @shelter_1.pets.create(name: "Ann", breed: "ragdoll", age: 3, adoptable: false)
  end
  describe "visiting the application show page" do 
    it 'shows the applicant and all the applicants details' do 
      
      visit "/applications/#{@application1.id}"

      expect(page).to have_content("Name: #{@application1.name}")
      expect(page).to have_content("Street Address: #{@application1.street_address}")
      expect(page).to have_content("#{@application1.city}")
      expect(page).to have_content("#{@application1.state}")
      expect(page).to have_content("#{@application1.zip_code}")
      expect(page).to have_content("Why I would make a good home: #{@application1.description}")
      expect(page).to have_content("Applying to Adopt:" )
      expect(page).to have_content("Status: #{@application1.status}")
    end
  end
end 
