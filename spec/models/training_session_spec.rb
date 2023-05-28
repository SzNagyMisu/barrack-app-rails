require 'rails_helper'

RSpec.describe TrainingSession, type: :model do
  describe 'VALIDATIONS'

  describe 'CLASS METHODS, SCOPES' do
    describe 'default scope'
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
    subject { described_class.new start_time: 1.day.from_now, price: 1000, trainer: Trainer.new(name: 'Test Trainer') }

    it 'sets `code` on create.' do
      expect { subject.save! }.to change(subject, :code).from(nil).to /\w{6}/
    end
  end
end
