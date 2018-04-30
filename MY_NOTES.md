Objective-

-- Build a Sinatra MVC webapp which allows dog foster volunteers to - 
  - CREATE/signup allows an foster to signup to the portal
  -LOGIN/LOGOUT allows an existing foster to login and logout of the app
  - READ - allows a logged-in foster to view details of all dogs in the care of the shelter
  - UPDATE - allows a logged-in foster to update details of dogs in their care such as 
     -- Name
     -- Age
     -- Breed
     -- Adopted?
  - DELETE delete details of dog no longer being fostered


   Project requirements - 

    - Build an MVC Sinatra Application.
    - CRUD is key
    - Use ActiveRecord with Sinatra.
    - Use Multiple controllers/models.
    - Use at least one has_many relationship on a User model and one belongs_to relationship on another model
    - Must have user accounts. The user that created a given piece of content should be the only person who can modify that content
    - Must have the abilty to create, read, update and destroy any instance of the resource that belongs to a user.
    - Ensure that any instance of the resource that belongs to a user can be edited or deleted only by that user.
    - You should also have validations for user input to ensure that bad data isn't added to the database. The fields in your signup form should be required and the user attribute that is used to login a user should be a unique value in the DB before creating the user.

