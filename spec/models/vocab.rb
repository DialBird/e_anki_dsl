require 'spec_helper'

RSpec.describe Vocab do
  describe 'validation' do
    shared_examples 'empty error' do |field|
      it 'error occurs when empty' do
        is_expected.to be_valid
        subject.send("#{field}=", nil)
        is_expected.to be_invalid
      end
    end

    shared_examples 'not unique error' do |field|
      let(:pre_vocab) { FactoryBot.build(:vocab) }
      it 'error occurs when value not unique' do
        is_expected.to be_valid
        pre_vocab.send("#{field}=", subject.send(field))
        pre_vocab.save
        is_expected.to be_invalid
      end
    end

    subject { FactoryBot.build(:vocab) }

    describe '#name' do
      it_behaves_like 'empty error', :name
      it_behaves_like 'not unique error', :name
    end
    describe '#answer' do
      it_behaves_like 'empty error', :answer
    end
  end
end
