require 'securerandom'

class Patient < ApplicationRecord
    SERIALIZE_OPTIONS = {
        include: {
            person: Person::SERIALIZE_OPTIONS
        }
    }

    belongs_to :person
    validates :person, presence: true
    before_create :generate_uuid

    def destroy
        person.destroy ignore = :patient
        super() # destroy self
    end

    def as_json(options = {})
        super(options.merge(SERIALIZE_OPTIONS))
    end

    protected

    def generate_uuid
        self.uuid = SecureRandom.uuid
    end
end
