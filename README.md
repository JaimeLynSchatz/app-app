# App-App
An *application* application for Ada candidates.


## Structure

### Person
- Full Name : string
- Email : string
- Twitter Handle : string
- avatar         : string
- phone          : string
  
###Submission
- video  : string
- responses : Gist (has_many)
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

1. Auth Twitter
2. Give name & email (create person record)
3. Complete Resume & Video (create submission)

## TODO
