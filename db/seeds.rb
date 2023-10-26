# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Shelter.destroy_all
Application.destroy_all
Pet.destroy_all
PetApplication.destroy_all


@shelter_1 = Shelter.create(name: "Aurora shelter", city: "Aurora, CO", foster_program: false, rank: 9)
@shelter_2 = Shelter.create(name: "RGV animal shelter", city: "Harlingen, TX", foster_program: false, rank: 5)
@shelter_3 = Shelter.create(name: "Fancy pets of Colorado", city: "Denver, CO", foster_program: true, rank: 10)


@pet_1 = @shelter_1.pets.create(name: "Mr. Pirate", breed: "tuxedo shorthair", age: 5, adoptable: false)
@pet_2 = @shelter_1.pets.create(name: "Clawdia", breed: "shorthair", age: 3, adoptable: true)
@pet_3 = @shelter_3.pets.create(name: "Lucille Bald", breed: "sphynx", age: 8, adoptable: true)
@pet_4 = @shelter_1.pets.create(name: "Ann", breed: "ragdoll", age: 5, adoptable: true)

@application_1 = Application.create(name: "John", street_address: "123 makebelieve dr.", city: "fakesville", state: "NA", zip_code: 12345, description: "I need a companion!", status: "Pending")
@application_2 = Application.create(name: "Jacob", street_address: "123 makebelieve dr.", city: "fakesville", state: "NA", zip_code: 12345, description: "I need a companion!", status: "Pending")
@application_3 = Application.create(name: "Jingle", street_address: "123 makebelieve dr.", city: "fakesville", state: "NA", zip_code: 12345, description: "I need a companion!", status: "In Progress")
@application_4 = Application.create(name: "Pending", street_address: "123 makebelieve dr.", city: "fakesville", state: "NA", zip_code: 12345, description: "I need a companion!", status: "In Progress")
@application_5 = Application.create(name: "Schmit", street_address: "123 makebelieve dr.", city: "fakesville", state: "NA", zip_code: 12345, description: "I need a companion!", status: "Pending")

@pet_app_1 = PetApplication.create!(application_id: "#{@application_1.id}", pet_id: "#{@pet_3.id}", status: "Pending")
@pet_app_2 = PetApplication.create!(application_id: "#{@application_2.id}", pet_id: "#{@pet_1.id}", status: "Pending")
@pet_app_3 = PetApplication.create!(application_id: "#{@application_3.id}", pet_id: "#{@pet_3.id}", status: "Pending")
@pet_app_4 = PetApplication.create!(application_id: "#{@application_4.id}", pet_id: "#{@pet_2.id}", status: "Pending")