require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "validations" do
    it "is valid with a title" do
      user = User.create(
        name: "John Doe", email: "e@e.com", age: 22, 
        phone_number: 3212431244, year_of_experience: 43, role: 1, 
        password: "111111", password_confirmation: "111111", confirm_by_admin: true) 
      
      post = Post.new(
        title: "Sample Title",
        post_for: "Preciousian",
        user_id: user.id, 
        created_at: Time.current,
        updated_at: Time.current
      )
      expect(post).to be_valid
    end

    it "not validate without title" do
      user = User.create(name: "John Doe", email: "e@e.com", age: 22, phone_number: 3212431244, year_of_experience: 43, role: 1, password: "111111", password_confirmation: "111111", confirm_by_admin: true) 
      
      post = Post.new(
        # title: "Sample Title",
        post_for: "Preciousian",
        user_id: user.id, 
        created_at: Time.current,
        updated_at: Time.current
      )
      expect(post).not_to be_valid
    end



  end
end
