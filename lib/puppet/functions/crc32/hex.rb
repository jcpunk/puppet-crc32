# frozen_string_literal: true

require 'zlib'
# @summary
# Run the CRC32 calculation against a given string
Puppet::Functions.create_function(:'crc32::hex') do
  # @param my_string The string to evaluate
  # @example crc32::hex('my string') => 18fbd270
  # @return String
  dispatch :hex do
    param 'Variant[String, Sensitive[String]]', :my_string
    return_type 'String'
  end

  def hex(my_string)
    Zlib.crc32(my_string.unwrap).to_s(16).downcase
  rescue
    Zlib.crc32(my_string).to_s(16).downcase
  end
end
