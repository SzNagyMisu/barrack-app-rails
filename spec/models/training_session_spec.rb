require 'rails_helper'

RSpec.describe TrainingSession, type: :model do
  describe 'VALIDATIONS'

  describe 'CLASS METHODS, SCOPES' do
    describe 'default scope' do
      it 'returns the records ordered by `start_time`.' do
        session_1 = FactoryBot.create :training_session, start_time: 3.days.from_now
        session_2 = FactoryBot.create :training_session, start_time: 2.days.from_now
        session_3 = FactoryBot.create :training_session, start_time: 4.days.from_now

        expect(TrainingSession.pluck :code).to eq [ session_2.code, session_1.code, session_3.code ]
      end
    end

    describe '.default' do
      it 'returns only records that have `start_time` today or in the future.' do
        # cannot create a session in the past because of validation rules
        session_1 = FactoryBot.create :training_session, start_time: 2.days.from_now
        session_1.start_time = 2.days.ago
        session_1.save validate: false

        session_2 = FactoryBot.create :training_session, start_time: 2.days.from_now
        session_3 = FactoryBot.create :training_session, start_time: 3.days.from_now
        session_4 = FactoryBot.create :training_session, start_time: 4.days.from_now

        expect(TrainingSession.default.pluck :code).to eq [session_2, session_3, session_4].map(&:code)
      end
    end
  end

  describe 'INSTANCE METHODS' do
    describe '#trainer_name' do
      it 'returns the name of the trainer that the session belongs to.' do
        subject.build_trainer name: 'Test Trainer'
        expect(subject.trainer_name).to eq 'Test Trainer'
      end
      it 'returns nil if there is no trainer.' do
        expect(subject.trainer_name).to be_nil
      end
    end
  end

  describe 'HOOKS' do
    subject { FactoryBot.build :training_session }

    it 'sets `code` on create.' do
      expect { subject.save! }.to change(subject, :code).from(nil).to /\w{6}/
    end
  end
end
