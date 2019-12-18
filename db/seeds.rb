
User.create(username: 'cwk', password: 'testpass', food_concern: 'none')

Review.create(rating: 5, content: 'test review cont', user_id: 1, establishment_id: 2)

Establishment.create(name: 'The Dolphin', location: 'Dorking', type_of: 'Restaurant')

Blacklist.create(user_id: 1, establishment_id: 2, comment: 'pretty bad place not gonna lie')
Blacklist.create(user_id: 7, establishment_id: 1, comment: 'rubbish')




# *********************** example of users post ******************** CURRENTLY WORKING 
   # fetch('http://localhost:3000/api/v1/users', {
   #    method: 'POST',
   #    headers: {
   #       'Content-Type': 'application/json',
   #       Accept: 'application/json'
   #    },
   #    body: JSON.stringify({
   #       user: {
   #          username: 'Chrees',
   #          password: 'test',
   #          food_concern: 'Gluten'
   #       }
   #    })
   # }).then(resp => resp.json())
   # .then(data => console.log(data))

# *************example of reviews post ***************************CURRENTLY WORKING
#    fetch('http://localhost:3000/api/v1/reviews', {
#       method: 'POST',
#       headers: {
#          'Content-Type': 'application/json',
#          Accept: 'application/json'
#       },
#       body: JSON.stringify({
#          review: {
#             rating: 5,
#             content: 'test',
#             establishment_id: 1,
#             user_id: 1
#          }
#       })
#    }).then(resp => resp.json())
#    .then(data => console.log(data))


#    ******* establishment post ***** make it so that it can inject information from the API***CURRENTLY WORKING

   # fetch('http://localhost:3000/api/v1/establishments', {
   #    method: 'POST',
   #    headers: {
   #       'Content-Type': 'application/json',
   #       Accept: 'application/json'
   #    },
   #    body: JSON.stringify({
   #       establishment: {
   #          location: 'Hackney',
   #          name: 'Pret',
   #          type_of: 'Pub/Bar/Club'

   #       }
   #    })
   # }).then(resp => resp.json())
   # .then(data => console.log(data))
   