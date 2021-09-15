# This file is part of rpgd.
#
# rpgd is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# rpgd is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#  
# You should have received a copy of the GNU General Public License
# along with rpgd.  If not, see <http://www.gnu.org/licenses/>.

require_relative "TestUtils"
require_relative "../src/UriDownloader"
require_relative "../src/UriNotFoundError"
require "test/unit"
require "test/unit/assertions"
include Test::Unit::Assertions

class UriDownloaderTest < Test::Unit::TestCase

  def test_load_as_string()
    expectedString = load_string_from_file(TEST_PAGE_FILE_1)
    uriDownloader = UriDownloader.new()
    assert_equal(expectedString, uriDownloader.load_as_string(TEST_PAGE_URI_1))
  end

  def test_load_as_string_wrong_uri()
    uriDownloader = UriDownloader.new()
    expected_message = "Could not load " + TEST_URI_NONEXISTENT + ". Check URI and network."
    assert_raise_message(expected_message) do
      uriDownloader.load_as_string(TEST_URI_NONEXISTENT)
    end
  end

  def test_load_as_string_test2()
    expectedString = load_string_from_file(TEST_PAGE_FILE_2)
    uriDownloader = UriDownloader.new()
    assert_equal(expectedString, uriDownloader.load_as_string(TEST_PAGE_URI_2))
  end

  def test_load_as_binary()
    expectedBinary = load_binary_from_file(TEST_IMAGE_FILE_1)
    uriDownloader = UriDownloader.new()
    assert_equal(expectedBinary, uriDownloader.load_as_binary(TEST_IMAGE_URI_1))
  end

  def test_load_as_binary_wrong_uri()
    uriDownloader = UriDownloader.new()
    expected_message = "Could not load " + TEST_URI_NONEXISTENT + ". Check URI and network."
    assert_raise_message(expected_message) do
      uriDownloader.load_as_binary(TEST_URI_NONEXISTENT)
    end
  end
end
