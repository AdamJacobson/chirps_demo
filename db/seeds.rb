Chirp.destroy_all
Upvote.destroy_all

c1 = Chirp.create!(message: 'this is the first chirp')
c2 = Chirp.create!(message: 'this is the second chirp')

Upvote.create!(chirp: c1, ip: '192.168.0.0')
Upvote.create!(chirp: c2, ip: '192.168.0.0')
