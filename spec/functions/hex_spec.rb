# frozen_string_literal: true

require 'spec_helper'

describe 'crc32::hex' do
  context 'when default' do
    it { is_expected.not_to eq(nil) }
    it { is_expected.to run.with_params.and_raise_error(ArgumentError, %r{crc32::hex}) }
  end

  context 'when testing a simple string' do
    it { is_expected.to run.with_params('my string').and_return('18fbd270') }
  end

  context 'when testing a sensitive string' do
    it { is_expected.to run.with_params(sensitive('my string')).and_return('18fbd270') }
  end
end
