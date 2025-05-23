# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tasks::Imports::GoogleRecords do
  describe '#call' do
    let(:user) { create(:user) }
    let(:file_path) { Rails.root.join('spec/fixtures/files/google/records.json').to_s }

    it 'schedules the Import::GoogleTakeoutJob' do
      expect(Import::GoogleTakeoutJob).to receive(:perform_later).exactly(1).time

      described_class.new(file_path, user.email).call
    end
  end
end
