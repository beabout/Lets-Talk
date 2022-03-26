puts "WARNING: DELETING EVERYTHING!!"
User.destroy_all
Topic.destroy_all
Conversation.destroy_all

puts "creating users"
users = User.create([
  { email: 'a@email.com', password: 'password'},
  { email: Faker::Internet.unique.email, password: 'password'},
  { email: Faker::Internet.unique.email, password: 'password'},
  { email: Faker::Internet.unique.email, password: 'password'},
  { email: Faker::Internet.unique.email, password: 'password'},
  { email: Faker::Internet.unique.email, password: 'password'},
  { email: Faker::Internet.unique.email, password: 'password'},
  { email: Faker::Internet.unique.email, password: 'password'},
  { email: Faker::Internet.unique.email, password: 'password'},
  { email: Faker::Internet.unique.email, password: 'password'},
  { email: Faker::Internet.unique.email, password: 'password'}
])

puts "creating topics"
topics = Topic.create([
  { title: 'US Should provide military support to Ukraine', domain: 0 },
  { title: 'The Batman > The Dark Knight', domain: 3 },
  { title: 'We should ', domain: 0 },
  { title: 'Blockchain: Benefits of decentralization < cost of energy', domain: 1 },
  { title: 'The Office > Parks and Recreation', domain: 3 },
  { title: 'Yeezy > Air Force 1', domain: 1 },
  { title: 'Crocs should have never come back in style', domain: 1 }
])

puts "creating conversations"
conversations = Conversation.create([
  { likes: (0..500).to_a.sample, topic: topics.sample },
  { likes: (0..500).to_a.sample, topic: topics.sample },
  { likes: (0..500).to_a.sample, topic: topics.sample },
  { likes: (0..500).to_a.sample, topic: topics.sample },
  { likes: (0..500).to_a.sample, topic: topics.sample },
  { likes: (0..500).to_a.sample, topic: topics.sample },
  { likes: (0..500).to_a.sample, topic: topics.sample },
  { likes: (0..500).to_a.sample, topic: topics.sample },
  { likes: (0..500).to_a.sample, topic: topics.sample },
  { likes: (0..500).to_a.sample, topic: topics.sample },
  { likes: (0..500).to_a.sample, topic: topics.sample },
  { likes: (0..500).to_a.sample, topic: topics.sample },
  { likes: (0..500).to_a.sample, topic: topics.sample },
  { likes: (0..500).to_a.sample, topic: topics.sample },
  { likes: (0..500).to_a.sample, topic: topics.sample },
  { likes: (0..500).to_a.sample, topic: topics.sample }
])

puts "adding users to conversations"
conversations.each do |c|
  users.sample((5..8).to_a.sample).each do |u|
    participating = [true, false].sample
    side = participating ? [true, false].sample : nil
    u.add_to_conversation(cid: c.id, participating: participating, side: side)
    puts "adding #{u.email} to conversation (ID: #{c.id}, topic: #{c.title}"
  end

  puts "creating messages"
  left_user = c.participants.first
  right_user = c.participants.last
  10.times do
    c.messages.create(author: left_user, text: Faker::Quote.famous_last_words)
    c.messages.create(author: right_user, text: Faker::Quote.famous_last_words)
  end
end