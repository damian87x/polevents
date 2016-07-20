City.create([
                    {name: 'Krakow'},
                    {name: 'Warszawa'},
                    {name: 'Lublin'},
                    {name: 'Gdansk'}
            ])

Topic.create([
              {name: 'Crazy programming'},
              {name: 'Drinking and programming'},
              {name: 'Programming on holiday '},
              {name: 'Programmer no live'},
             ])


DateAndRange.create(
        [
                {start_time: Time.now,end_time: Time.now + 2.hours, start_date: Time.now},
                {start_time: Time.now,end_time: Time.now + 1.hours, start_date: Time.now}

        ]
)


User.create([
        {email: 'test@test.uk', password: '12345678'},
        {email: 'test@test2.uk', password: '12345678'}
            ])

Event.create([
                     {name: 'Programming',start_time: Time.now, end_time: Time.now + 1.hours,
                      user_id: User.first.id, city_id: City.first.id, topic_id: Topic.first.id  },
                     {name: 'React JS', start_time: Time.now, end_time: Time.now + 2.hours,
                      user_id: User.last.id, city_id: City.last.id, topic_id: Topic.last.id }
             ])


Filter.create([
               {user_id: User.first.id, owner_id: City.last.id, owner_type: 'City'},
               {user_id: User.first.id, owner_id: Topic.last.id, owner_type: 'Topic'},
               {user_id: User.first.id, owner_id: DateAndRange.last.id, owner_type: 'DateAndRange'}
              ])

