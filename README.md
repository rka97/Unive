# README

A simple Ruby on Rails website for managing university classes. Course project for Database Systems.

To use:
As any rails application: install rails, run bundle install, then db:setup and open the server using rails server. The website will then be on localhost:3000.

Changelog:
- [x] Make a Student database table and the corresponding model (won't add much functionality yet).
- [x] Make a Department database table and the corresponding model.
- [x] Make a Teacher database table and the corresponding model (empty controller).
- [x] Make an Employee database table and the corresponding model.
- [x] Link User to Student\Staff\Employee. (Model / View).
- [x] Make a seeding script for the database that initializes a few students, a few teachers, a few users, and an administrator.
- [x] Make a student-department association (Enrollment model).
- [x] Admin can search students.
- [x] Admin can search users.
- [x] Admin can remove, edit, add students.
- [x] Admin can remove, edit, add enrollments.
- [x] Add teacher degrees to model.
- [x] Add teacher research interests to model.
- [x] Admin can remove, edit, add teachers.
- [x] Admin can remove, edit, add departments.
- [x] Add courses model.
- [x] Admin can remove, edit, add courses.
- [x] Add course enrollment model.
- [x] Admin can assign teachers to courses.
- [x] Admin can remove teachers from courses.
- [x] Admin can enroll students in course.
- [x] Admin can remove students from course.
- [x] Add coursework.
- [x] Add student-coursework association.
- [x] Add course notes.
- [x] Add lectures.
- [x] Admin can manage number of lectures in a course.
- [x] Admin can assign teacher to a lecture.
- [x] Admin can browse friendships among users.
- [x] Admin should be able to make any user into an admin.
- [x] Admin can see students marks, can track which students are close to failing (or failed).
- [x] Add profile-profile messaging.
- [x] Add profile-profile friendship.
- [x] Add some statistical data visualization for courses and students.
- [ ] Add teams model.
- [ ] Admin can browse teams and associated team coursework.
- [ ] Admin/Teacher can announce things to students.
- [ ] Admin can ban students.
- [ ] Admin can ask teacher to confirm lecture time/place.
- [ ] Add chatrooms.
- [ ] Clean up schema.
- [ ] Add course prerequisites.
- [ ] Add comments on course notes and lectures.
- [ ] Add file uploading on course notes.
- [ ] Add locations on campus.
