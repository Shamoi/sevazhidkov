# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.create([{ name: 'Do my homework',  short_description: 'School homework',
                  markdown_description: 'My big homework from my school teacher' },
                { name: 'Create new Facebook',  short_description: 'Startup',
                  markdown_description: 'Every startup man wanna makes new Facebook' }
               ])
