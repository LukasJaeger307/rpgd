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
require_relative "../src/ImgPhotoUriExtractor"

class ImgPhotoUriExtractorTest < Test::Unit::TestCase
  def test_extract_photo_uris_no_pictures()
    html_string = load_string_from_file(TEST_PAGE_FILE_1)
    extractor = ImgPhotoUriExtractor.new()
    uris = extractor.extract_photo_uris(html_string, nil)
    assert_empty(uris)
  end

  def test_extract_photo_uris_no_criterion()
    html_string = load_string_from_file(TEST_PAGE_FILE_2)
    extractor = ImgPhotoUriExtractor.new()
    actual_uris = extractor.extract_photo_uris(html_string, nil)
    expected_uris = ["img/flag_english.svg", "img/flag_german.svg", 
                     "img/label_queenofthewest.png", "img/label_lamiedelanuit.png", 
                     "img/label_troislunes.png"]
    assert_true(check_array_of_expected_uris(expected_uris, actual_uris))
  end

  def test_extract_photo_uris_with_criterion()
    html_string = load_string_from_file(TEST_PAGE_FILE_2)
    extractor = ImgPhotoUriExtractor.new()
    actual_uris = extractor.extract_photo_uris(html_string, "flag")
    expected_uris = ["img/flag_english.svg", "img/flag_german.svg", 
                     "img/label_queenofthewest.png", "img/label_lamiedelanuit.png", 
                     "img/label_troislunes.png"]
    assert_true(check_array_of_expected_uris(expected_uris, actual_uris))
  end
  
end
