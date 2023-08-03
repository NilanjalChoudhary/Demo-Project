require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "validation" do
    it "commenter:- commenter should be present" do 
      user = User.create(
        name: "John Doe", email: "e@e.com", age: 22, 
        phone_number: 3212431244, year_of_experience: 43, role: 1, 
        password: "111111", password_confirmation: "111111", confirm_by_admin: true) 
      
      post = Post.create(
        title: "Sample Title",
        post_for: "Preciousian",
        user_id: user.id, 
        created_at: Time.current,
        updated_at: Time.current
      )
      comment = Comment.new(
        # commenter: user.name
        comment: "test comment",
        post_id: post.id
      )
      expect(comment).not_to be_valid
      expect(comment.errors[:commenter]).to include( "can't be blank" )
    end

    # it "comment:- Comment length must be in between 1..100" do
    #         user = User.create(
    #     name: "John Doe", email: "e@e.com", age: 22, 
    #     phone_number: 3212431244, year_of_experience: 43, role: 1, 
    #     password: "111111", password_confirmation: "111111", confirm_by_admin: true) 
      
    #   post = Post.create(
    #     title: "Sample Title",
    #     post_for: "Preciousian",
    #     user_id: user.id, 
    #     created_at: Time.current,
    #     updated_at: Time.current
    #   )
    #   comment = Comment.new(
    #     commenter: nil,
    #     comment: "test comment",
    #     post_id: post.id
    #   )
    #   expect(comment).to be_valid
    # end

  end
end




