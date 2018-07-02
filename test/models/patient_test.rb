require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should generate uuid on create" do
    person = Person.new(
      person_name: PersonName.new(firstname: 'Foo', lastname: 'Bar'),
      birthdate: '2000-01-01',
      gender: 'Unknown'
    )
    patient = Patient.new person: person
    assert patient.save     # Make sure patient is created
    assert_not patient.uuid.nil?
  end
end
