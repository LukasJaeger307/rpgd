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
require_relative "../src/DivClassPhotoUriExtractor"
require "test/unit"
require "test/unit/assertions"
include Test::Unit::Assertions

class DivClassPhotoUriExtractorTest < Test::Unit::TestCase
  def test_extract_photo_uris_no_pictures()
    html_string = load_string_from_file(TEST_FILE_1)
    extractor = DivClassPhotoUriExtractor.new()
    uris = extractor.extract_photo_uris(html_string, nil)
    assert_empty(uris)
  end

  def test_extract_photo_uris_id_not_in_html()
    html_string = load_string_from_file(TEST_FILE_2)
    extractor = DivClassPhotoUriExtractor.new()
    uris = extractor.extract_photo_uris(html_string, "image")
    assert_empty(uris)
  end

  def test_extract_photo_uris_all_pictures()
    html_string = load_string_from_file(TEST_FILE_2)
    extractor = DivClassPhotoUriExtractor.new()
    actual_uris = extractor.extract_photo_uris(html_string, nil)
    expected_uris = ["img/flag_english.svg", "img/flag_german.svg", 
                     "img/label_queenofthewest.png", "img/label_lamiedelanuit.png", 
                     "img/label_troislunes.png"]
    assert_true(check_array_of_expected_uris(expected_uris, actual_uris))
  end

  def check_array_of_expected_uris(expected_uris, actual_uris)
    result = true
    result &= (expected_uris.length() == actual_uris.length())
    expected_uris.each do |expected_uri|
      result &= (actual_uris.include?(expected_uri))
    end
    return result
  end

  def test_extract_photo_uris_flags()
    html_string = load_string_from_file(TEST_FILE_2)
    extractor = DivClassPhotoUriExtractor.new()
    actual_uris = extractor.extract_photo_uris(html_string, "flag")
    expected_uris = ["img/flag_english.svg", "img/flag_german.svg"]
    assert_true(check_array_of_expected_uris(expected_uris, actual_uris))
  end
  
  def test_extract_photo_uris_labels()
    html_string = load_string_from_file(TEST_FILE_2)
    extractor = DivClassPhotoUriExtractor.new()
    actual_uris = extractor.extract_photo_uris(html_string, "label")
    expected_uris = ["img/label_queenofthewest.png", "img/label_lamiedelanuit.png", 
                     "img/label_troislunes.png"]
    assert_true(check_array_of_expected_uris(expected_uris, actual_uris))
  end
end
