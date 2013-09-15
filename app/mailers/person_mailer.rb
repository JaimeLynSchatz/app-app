class PersonMailer < ActionMailer::Base
  default from: "contact@adadevelopersacademy.org"

  def thanks_for_applying(person_id)
    @person = Person.find(person_id)
    mail to: @person.email
  end

  def reviewer_accepted(person_id)
    @person = Person.find(person_id)

    mail to: @person.email
  end

  def interview_invite(person_id)
    @person = Person.find(person_id)
    mail to: @person.email
  end
end
