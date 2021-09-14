require_relative "../src/UriDownloader"
require "test/unit"

TESTFILE1 = "test_data/test1.html"

class UriDownloaderTest < Test::Unit::TestCase

  def load_expected_string_from_file(filename)
    return IO.read(filename)
  end

  def test_load_as_string
    expectedString = load_expected_string_from_file(TESTFILE1)
    uriDownloader = UriDownloader.new()
    assert_equal(expectedString, uriDownloader.load_as_string("https://crimsonsunrise.hopto.org/test/test1.html"))
  end

end
