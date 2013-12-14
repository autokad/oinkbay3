# Readme
## Description
* www.Oinkbay.com is a place to share and comment on pig pictures!

## Functionalities
* Home page with awesome pictures

* Fantastic menu bar that links to:

** home

** a really awesome about page (likeness of me included)

** the gallery

** Lots of awesome images that are organized in like order and masonry keeps them tightly together even in various window sizes.

*** Users can like/dislike if authenticated in the gallery, as well as click on the user who uploaded the image/pin and see ALL of the awesome pictures they submited.  Each pin links to the individual pin-show page.

*** Gallery paginates after so many images to prevent slowness of loading the page.  It also makes the gallery more browsable.

*** IF the user submited the pin in the gallery, they can edit/destroy them by clicking the link under the pin.

** the user's edit page - welcome included

** the users own images/pins

** Add+ Pin button

*** Can upload with an image from one's computer or

*** can upload with image URL

** edit profile/logout if authenticated, and sign up/login/login with facebook if not.

* Individual Pin view

** can see larger version of image with description and user who submited.

** can view comments associated with pin.

** can comment by typing comment in 'say something' and clicking some pig.

** can go back to gallery with back button.

## GEMS

### Gem: Leter Opener
1 Whats it for?

··* Enables me to preview email without needing to send it or have an email delivery system.

2 see it work:

*Since this is a development gem, I included a screen shot http://www.oinkbay.com/assets/LeterOpener.jpg

3 Documentation:

*https://github.com/ryanb/letter_opener/blob/master/README.rdoc

### Gem: devise
1 Whats it for?

..* Highly tested and community approved user and authorization management.
2 see it work:

..* simply log in, sign up, use password retrieval, etc

3 Documentation:

..* https://github.com/plataformatec/devise/blob/master/README.md

### Gem: omniauth-facebook
1 Whats it for?

* Enables users to log in oinkbay and authenticate through facebook.  It also scrapes email, first name, last name, etc and puts it into their user profile.
2 see it work:

* Simply click the 'login with facebook' button.  I gather user profile information and stick it into the users database, such as email, first/last name.  This can be verified by going to edit - user profile.* Note, due to limitations with facebook applications which is required for authorizing through facebook, a specific domain name must be used in order to work.  For this reason, you must use it through www.oinkbay.com

3 Documentation:

* https://github.com/mkdynamic/omniauth-facebook/blob/master/README.md

### Gem: aws-sdk
1 Whats it for?

* Enables me to host my images/pins on Amazon's S3 Service.  The functionalities are greater then that, however I only need this particular service due to heroku limitations.
* 
2 see it work:

* Right click on an image/pin and select copy image URL (chrome).  Notice the URL is hosted on Amazon S3
http://s3.amazonaws.com/autobucket/pins/images/000/000/016/medium/jeeppig.jpg?1376515523

3 Documentation:

* http://aws.amazon.com/sdkforruby/

### Gem: make_voteable
1 Whats it for?

* makes managing a user like/disliking system easier than coding one myself.  When a user liked something, in this case images/pins, the like value for that user and that pin goes up.  Likewise for dis-liking.  If a person likes something and clicks dislike, the like is automatically removed and the dislikes is incremented to 1, visa versa.  A user can only like or dislike something once.

2 see it work:

* log in to www.oinkbay.com.  Navigate to the gallery or to a particular image/pin.  Click the like or dislike and notice the change in likes/dislikes.

3 Documentation:

* https://github.com/medihack/make_voteable/blob/master/README.rdoc

### Gem: rack-google-analytics
1 Whats it for?

* Makes it easy to install GA.  It also makes it easy to run GA only in production, so testing doesnt skew hits.
2 see it work:

* Since you cannot view my GA, I included a link to a screen shot. http://www.oinkbay.com/assets/GA.jpg

3 Documentation:

* https://github.com/kangguru/rack-google-analytics/blob/master/README.md

### Gem: will_paginate
1 Whats it for?

* Enables things to paginate, in my case images/pins.  Otherwise, ALL the images/pins would show up on one page which could slow one's computer down.  This way, users can page through the gallery at their leisure.
2 see it work:

* Notice in the gallery that it automagically creates pages when there are too many images/pins.  

3 Documentation:

* https://github.com/mislav/will_paginate/blob/master/README.md

### Gem: bootstrap-will_paginate
1 Whats it for?

* makes pagination pretty
2 see it work:

* see the pagination bar at the bottom of the gallary page
3 Documentation:

* https://github.com/nickpad/will_paginate-bootstrap/blob/master/README.markdown

### Gem: bootstrap-will_paginate
1 Whats it for?

* makes pagination pretty

2 see it work:

* upload an image

3 Documentation:

* https://github.com/thoughtbot/paperclip/blob/master/README.md


## Heroku Link
* http://blooming-retreat-4898.herokuapp.com/
* please use www.oinkbay.com for navigating site

## GITHUB
* https://github.com/autokad/oinkbay3/blob/master/README.md

---
# Gems
See Gems above

---
# Heroku Addon
## SendGrid
* Sendgrid enables me to send email on heroku hosting; currently the only use for email in the site is for password retrieval.


---
# Database Structure - Resources
## Models
* comment
* pin
* user

## Views
* users
** http://www.oinkbay.com/mypage
** http://www.oinkbay.com/users/edit
* pins
** MANY including partials for likes/dislikes and pages such as edit, index, new, show, etc
* pages
** pages such as home and about http://www.oinkbay.com/about
* layouts
** header
** footer
** application
* devise
* comments
** index - http://www.oinkbay.com/comments
** new - http://www.oinkbay.com/comments/new
*** this new method is not the prefered way to submit a comment
** show, edit, form partial

## Controlers
* application
* comments
* pages
* pins*
* users

## Tables
** comments
** pins
** users
** voting

## belongs_to/has_many Relationships
* user has_many :pins, dependent: :destroy
* user has_many :comments, dependent: :destroy
* pin belongs_to :user
* pin has_many :comments, :dependent => :destroy
* comment belongs_to :user
* comment belongs_to :pin

## CRUD
* Users
** C click sign up
** R click user in gallery, click username in menu bar when signed in
** U click edit profile when signed in
** D on edit profile, click cancel account
* Pins
** C click Add+ on menu bar when signed in
** R click galllery, click in pin in gallery, click on my page on menu bar when signed in, click pin in my page
** U click edit on pin page or in gallery if pin bellongs to user
** D click destroy on pin page or in gallery if pin belongs to user
* Comments
** C create via pin page
** R view in pin page or comment index http://www.oinkbay.com/comments
** U edit in comment index http://www.oinkbay.com/comments
** D destroy in comment index http://www.oinkbay.com/comments

# Validations
* comment must have user_id
* comment must have pin_id
* comment length must be at least length 2
* pin must have description
* pin must have userid
* pin image must be jpeg, jpg, png, or gif
* pin image must be less than 5 megabytes
* user must have username
* user username must be unique

# Scope
* pins sort by likes