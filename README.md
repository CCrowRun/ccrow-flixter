# Flixter

Flixter allows users to log in, create video curriculums, and enroll in other created curriculums.

This application was created as part of the University of Wisconsin Extension Bootcamp.

## User Stories

As an anonymous user, I want to:
  * See a complete list of courses so that I can find classes to enroll in
  * See the details of the course so that I can make an informed decision to enroll
  * Learn about the Flixter application so that I can assess its credibility

As an authenticated student user, I want to:
  * Enroll in courses so that I may learn the content
  * View the course videos so that I can learn
  * View a dashboard of all the courses I am enrolled in, so that I can keep on track with all of them
  * Make payments in system so that I can successfully enroll
  
As an authenticated instructor user, I want to:
  * Create courses so that I may market them to prospective students
  * Create sections so that I may organize the video lessons logically
  * Upload video lessons to the section so that students may view them
  * Upload a picture to the course so that students will be interested to learn more
  * Reorganize sections or lessons on the interface so that I can keep content in the correct order
  * View a dashboard of all the courses I have created, so that I can track them.
  * Edit courses, sections, or lessons as needed

## How to run the application:

### Production
Navigate to the production location of [Flixter](https://flixter-carrie-crow.herokuapp.com/)

#### All Users
1. To sign up, sign in, or log out, use the hyperlinks in the navigation bar:
  ![Screenshot of the main page](/app/assets/images/home.png)
2. All users are able to view a dashboard of all courses they are connected to by selecting "My Dashboard":
  ![Screenshot of Enrollment section of dashboard](/app/assets/images/dashboard-1.png)
  ![Screenshot of Administration section of dashboard](/app/assets/images/dashboard-2.png)

#### As a Student
1. To see a list of available courses to register for, select "Courses":
  ![Screenshot of the list of courses](/app/assets/images/courses.png)
2. To view details of the selected course, select either "More Details", or the hyperlink of the course name:
  ![Screenshot of the details page](app/assets/images/detail-course.png)
3. From this page, you can enroll in a course, see the cost, and view available lessons if you are enrolled.
  ![Screenshot of the lessons details](app/assets/images/lessons.png)

#### As an Instructor
1. To create a course, select "Teach a Course" in the application footer:
  ![Screenshot of the main page](/app/assets/images/courses.png)
2. Fill in the appropriate fields for the course:
  ![Screenshot of new course form](/app/assets/images/add-course.png)
3. Create a section beneath that course, to begin organizing it:
  ![Screenshot of new section form](/app/assets/images/add-section.png)
4. Create lessons within the section, and upload videos of the lesson:
  ![Screenshot of new section form](/app/assets/images/add-lesson.png)
5. As an instructor, you are always able to administer the page. You can edit all levels, and you can drag and drop to reorganize them:
  ![Screenshot of the administration page](app/assets/images/administer.png)

## High Level Specs
Flixter is a two-sided marketplace, allowing users to fill two roles: student, and instructor. Students can pay to view a course by creating an enrollment, which ties that student to the course. This provides access to all the connected sections and lessons. Instructors can create content for courses, sections, or lessons, and modify it later. The two roles are not mutually exclusive, and the user's role depends on whether they created a course, and/or whether they have an active enrollment.

Courses are comprised of sections, which contain lessons. Each course has many sections, each section has many lessons, and they are all traceable back to one section or course. Each of these models can only be updated by the instructor who created it, though they can be viewed by a student with an active enrollment.

### Application Specs
Flixter is a Ruby on Rails application, with a database is managed by PostgreSQL
* Rails v. 5.2.3
* Ruby v. 2.5.3

### Integrations Used

The following gems support Flixter's functionality:
* Devise, for user authentication
* Simple form, for managing user inputs
* Stripe, for managing user payments
* JQuery UI and Ranked Model, for reordering elements on the DOM
* Figaro, for controlling environment variables
* Carrierwave, for photo upload
* carrierwave-aws, for storing photos on Amazon Web Services
* Font-Awesome, for graphics
* Bootstrap, for page layout