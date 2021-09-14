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

require_relative "../src/UriDownloader"
require_relative "../src/UriNotFoundError"
require "test/unit"
require "test/unit/assertions"
include Test::Unit::Assertions

TEST_DATA_FOLDER = "test_data/"
TEST_DOMAIN = "https://crimsonsunrise.hopto.org/test/"

TEST_FILE_1 = TEST_DATA_FOLDER + "test1.html"
TEST_URI_1 = TEST_DOMAIN + "test1.html"

TEST_FILE_2 = TEST_DATA_FOLDER + "test2.html"
TEST_URI_2 = TEST_DOMAIN + "test2.html"

TEST_URI_NONEXISTENT = TEST_DOMAIN + "test_gnampf.html"

class UriDownloaderTest < Test::Unit::TestCase

  def test_load_as_string()
    expectedString = load_expected_string_from_file(TEST_FILE_1)
    uriDownloader = UriDownloader.new()
    assert_equal(expectedString, uriDownloader.load_as_string(TEST_URI_1))
  end

  def load_expected_string_from_file(filename)
    return IO.read(filename)
  end

  def test_load_as_string_wrong_uri()
    uriDownloader = UriDownloader.new()
    expected_message = "Could not load " + TEST_URI_NONEXISTENT + ". Check URI and network."
    assert_raise_message(expected_message) do
      uriDownloader.load_as_string(TEST_URI_NONEXISTENT)
    end
  end

  def test_load_as_string_test2()
    expectedString = load_expected_string_from_file(TEST_FILE_2)
    uriDownloader = UriDownloader.new()
    assert_equal(expectedString, uriDownloader.load_as_string(TEST_URI_2))
  end
end
