require "rails_helper"

RSpec.describe User, type: :model do
  describe "Validation" do
    it "name:- Validate with name" do
      user = User.create(name: "John Doe", email: "e@e.com", age: 22, 
      phone_number: 3212431244, year_of_experience: 43, role: 1, 
      password: "111111", password_confirmation: "111111", confirm_by_admin: true
    ) 
    expect(user).to be_valid
    end

  it "email:- validate with email" do
    user = User.create(name: "John Doe", email: "e@e.com", age: 22, 
    phone_number: 3212431244, year_of_experience: 43, role: 1, 
    password: "111111", password_confirmation: "111111", confirm_by_admin: true
  ) 
    expect(user).to be_valid
    end

  it "email:- not validate with without @ in email" do
    user = User.create(name: "John Doe", email: "e_e.com", age: 22, 
    phone_number: 3212431244, year_of_experience: 43, role: 1, 
    password: "111111", password_confirmation: "111111", confirm_by_admin: true
  ) 
    expect(user).not_to be_valid
    end

  it "phone_number:- validate with phone_number" do
    user = User.create(name: "John Doe", email: "e@e.com", age: 22, 
    phone_number: 3212431244, year_of_experience: 43, role: 1, 
    password: "111111", password_confirmation: "111111", confirm_by_admin: true
  ) 
    expect(user).to be_valid
    end

  it "year_of_experience:- not valid without year_of_experience" do
    user = User.create(name: "John Doe", email: "e@e.com", age: 22, 
    phone_number: 32124, year_of_experience: nil, role: 1, 
    password: "111111", password_confirmation: "111111", confirm_by_admin: true
  ) 
    expect(user).not_to be_valid
    end
  
  it "year_of_experience:- accept only integer" do
    user = User.create(name: "John Doe", email: "e@e.com", age: 22, 
    phone_number: 32124, year_of_experience: "a string", role: 1, 
    password: "111111", password_confirmation: "111111", confirm_by_admin: true
  ) 
    expect(user).not_to be_valid
    end


end
end