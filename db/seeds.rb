# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#User.create(name: 'Bob', email: 'bob@email.com', password: 'password')

user1 = User.create!(
    name: 'Bob',
    email:    'bob@email.com',
    password: 'password'
)

user2 = User.create!(
    name: 'Alice',
    email:    'alice@email.com',
    password: 'password'
)



# Create a user
# db/seeds.rb

# db/seeds.rb

# ... (previous code)

# Create a user
user = User.create!(
    name: 'Ryan',
    email: 'unique_email@example.com',
    password: 'password',
    notification_preferences: 'Your notification preferences'
)
  
  # Build a post associated with the user (without saving it)
post = user.posts.build(
    title: 'Your Post Title',
    content: 'Sloths, known for their leisurely pace and endearing charm, spend their days navigating treetops with deliberate slowness, embodying a serene and relaxed approach to life in the lush canopies of their rainforest habitats'
)
  
  # Save the user and associated post
if user.save
    post.save! # Save the post with a bang (!) to raise an exception if validation fails
    puts "User and Post created successfully."
else
    puts "User creation failed: #{user.errors.full_messages.join(', ')}"
end
  
  
  
  
  # Create posts for the user
user.posts.create!(
    title: 'First Post',
    content: "Fascinated by sloths lately! Their unhurried lifestyle is strangely relatable. Picture embracing life at a sloth's pace—no rush, just pure tranquility. They're the zen masters of the animal kingdom. Hanging out in trees has never seemed so appealing!"
)
  
user.posts.create!(
    title: 'Second Post',
    content: "Sloths redefine the art of leisurely dining—watching them eat is like observing a culinary meditation. Their unhurried approach to meals is a symphony of slow-motion grace. As they leisurely munch on leaves, it's a reminder that life doesn't always have to be a fast-paced race. Picture this: a canopy-dwelling gourmet, meticulously selecting each leaf with deliberate movements. Their methodical chewing seems almost contemplative, as if savoring every moment of the dining experience. Sloths embody a culinary philosophy of enjoying the journey, not just the destination. Their unhurried meals offer a lesson in savoring the simple pleasures and finding joy in the unhurried rhythms of life. It's a tranquil reminder that in a world filled with hustle, taking a moment to relish the flavors of existence at a sloth's pace can be a source of unexpected wisdom. So, here's to the sloths and their slow, deliberate feasts—a gentle nudge to embrace a more mindful approach to our own daily banquets. Life's too short to rush through meals; let's take a cue from our sloth friends and savor the richness each moment offers."
)
  
  # Repost the first post by the same user
user.reposts.create!(
    post: Post.first
)

post_1 = Post.create!(
    title: 'My post',
    content: 'Sloths, renowned for their unhurried pace of life, spend the majority of their time hanging upside down in trees and move so slowly that algae often grows on their fur, providing them with a natural camouflage. Despite their seemingly leisurely lifestyle, these fascinating creatures boast a unique adaptation for survival in the dense canopies of Central and South American rainforests.',
    user: user1
)

user2.posts.create!(
    title: 'Post',
    content: '
    Sloths, recognized for their deliberate and leisurely movements, are arboreal mammals that have evolved to thrive in the treetops of tropical rainforests. Their slow-paced lifestyle not only conserves energy but also forms a symbiotic relationship with algae, creating a distinctive and effective form of camouflage on their fur.'
)

comment1 = Comment.create!(
    content: 'I love sloths so much. This was such a great post', 
    user: user1 ,
    post: post_1
)
#Post.create!(
 #   content: "Fascinated by sloths lately! Their unhurried lifestyle is strangely relatable. Picture embracing life at a sloth's pace—no rush, just pure tranquility. They're the zen masters of the animal kingdom. Hanging out in trees has never seemed so appealing!"
#)

#Post.create!(
 #   content: "Sloths redefine the art of leisurely dining—watching them eat is like observing a culinary meditation. Their unhurried approach to meals is a symphony of slow-motion grace. As they leisurely munch on leaves, it's a reminder that life doesn't always have to be a fast-paced race. Picture this: a canopy-dwelling gourmet, meticulously selecting each leaf with deliberate movements. Their methodical chewing seems almost contemplative, as if savoring every moment of the dining experience. Sloths embody a culinary philosophy of enjoying the journey, not just the destination. Their unhurried meals offer a lesson in savoring the simple pleasures and finding joy in the unhurried rhythms of life. It's a tranquil reminder that in a world filled with hustle, taking a moment to relish the flavors of existence at a sloth's pace can be a source of unexpected wisdom. So, here's to the sloths and their slow, deliberate feasts—a gentle nudge to embrace a more mindful approach to our own daily banquets. Life's too short to rush through meals; let's take a cue from our sloth friends and savor the richness each moment offers."
#)