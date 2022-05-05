# frozen_string_literal: true

require 'zlib'
# @summary
# Run the CRC32 calculation against a given string
Puppet::Functions.create_function(:'crc32::int') do
  # @param my_string The string to evaluate
  # @example crc32::int('my string') => 419156592
  # @return Integer
  dispatch :int do
    param 'Variant[String, Sensitive[String]]', :my_string
    return_type 'Integer'
  end

  def int(my_string)
    Zlib.crc32(my_string.unwrap)
  rescue
    Zlib.crc32(my_string)
  end
end
