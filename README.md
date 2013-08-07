# App-App
An *application* application for Ada candidates.


## Structure

### Person
- Full Name : string
- Email : string
- Nickname (handle) : string
- avatar         : string
- phone          : string
  
###Submission
- assignments : Gist (has_many)
- status : string
- person_id : integer (belongs_to)
- Validates n gist associations

###Assignment
- parent_id   : integer (polymorphic association)
- parent_type : string
- type
- url         : string  
- name        : string
  
### Reviewer

3 step sign-up process.

1. Auth Github
2. Give name & email (create person record)
3. Complete Resume & Video (create submission)

## TODO
