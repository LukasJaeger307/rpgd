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
require_relative "../src/XPathPhotoUriExtractor"

class XPathPhotoUriExtractorTest < Test::Unit::TestCase
  def test_extract_photo_uris_no_pictures()
    html_string = load_string_from_file(TEST_PAGE_FILE_1)
    extractor = XPathPhotoUriExtractor.new()
    expected_message = "Not implemented."
    assert_raise_message(expected_message) do
      extractor.extract_photo_uris(html_string, nil)
    end
  end
end
