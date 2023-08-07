# README

he project Title is "Precious Connect"

		Technologies used :- 
- Programming Languages: ruby ( version - 3.0.0 )
- framework: ruby on rails 
- Frontend: HTML, CSS
- Backend: ruby on rails ( version - 7.0.6 )
- Database: SQLite3 ( version - 1.4 )


		Description :- 
- Hello guys, this is a private social media site for a organization. 
- Where a user wlll have 3 roles ( "Preciousian", "NonPreciousian", "Admin" ).
- If a user is Employee of Precious then its role will be Preciousian or Admin and if not then NonPreciousian.
- If anyone do sign up then his account will be confirmed by admin. 
- Preciousian can create his/her profile.
- Preciousian can follow or unfollow other Preciousians and Admins. 
- Preciousian can create post for other Preciousians.
- Preciousian can comment on other's post.
- Preciousian can like or unlike other posts   
- Preciousian will have a common public group where he/she can send message which will be seen by all other Preciousians.
- After Following Other preciousian he/she can have a private chat with each other.


- If User is Admin then all the fuctionality will same as Preciousian but he can also create Post for NonPreciousian.
- And Admin can approve account request. ( after approval the email will be sent to the account holder telling him about approval ).


If User is NonPreciousian then he/she can:-
- Create a profile 
- can react on the post made for NonPreciousian.
- can comment on the post.
- And can contact to the HR of the organization.


		Gem Used
1) Mailcatcher 	- to see all the mails. 
2) Devise 		- to handel authentication.
3) wil_paginate 	- to divide the content in multiple pages.
4) redis 		- for chat functionality.
5) acts_as_votable 	- for like and dislike functionality.  
6) acts_as_follower 	- for follow and unfollow functionality.
7) byebug 		- to resolve bugs.
8) cancancan 		- for authorization. 
9) image_processing 	- for resizig images.
10) active_storage 	- for uploading photos.
11) bourbon 		- for design.
12) bitters 		- for design.
13) sassc 		- to use of the original Ruby Sass library.


-	Before running project do this necessary commends.
1) bundle install - to install all the gems.
2) rails db:migrate  - to make the schema.
3) rails db:seed to create admin devise user. 
