Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    User.create!(user)
  end
end

Given /the following homeworks exist/ do |homework_table|
  homework_table.hashes.each do |homework|
    Homework.create!(homework)
  end
end

Given /the following courses exist/ do |a|
  a.hashes.each do |b|
    Course.create!(b)
  end
end

Given /the following course_to_users exist/ do |a|
  a.hashes.each do |b|
    CourseToUser.create!(b)
  end
end


Given /the following course_to_homeworks exist/ do |a|
  a.hashes.each do |b|
    CourseToHomework.create!(b)
  end
end

Given /the following submissions exist/ do |a|
  a.hashes.each do |b|
    Submission.create!(b)
  end
end

