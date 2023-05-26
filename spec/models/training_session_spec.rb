require 'rails_helper'

RSpec.describe TrainingSession, type: :model do
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
end
