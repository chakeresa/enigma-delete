require './test/test_helper'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_encrypt_lowercase_and_spaces_only
    skip
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
    # The encrypt method takes a message String as an argument. It can optionally take a Key and Date as arguments to use for encryption. If the key is not included, generate a random key. If the date is not included, use today’s date.
  end

  def test_encrypt_uppercase_becomes_lowercase
    skip
    assert_equal "keder ohulw", @enigma.encrypt("HELLO world", "040895", "02715")
  end

  def test_encrypt_special_characters_unchanged
    skip
    assert_equal "keder ohulw!", @enigma.encrypt("hello world!", "040895", "02715")
  end

  def test_encrypt_with_no_date
    skip
    # expected = ? # TO DO
    # assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_encrypt_with_no_optional_args
    skip
    # expected = ? # TO DO
    # assert_equal expected, @enigma.encrypt("hello world")
  end

  def test_decrypt
    skip
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
    # Enigma#decrypt(ciphertext, key, date)
    # The decrypt method takes a ciphertext String and the Key used for encryption as arguments. The decrypt method can optionally take a date as the third argument. If no date is given, this method should use today’s date for decryption.
  end

  def test_decrypt_with_todays_date
    skip
    encrypted = @enigma.encrypt("hello world", "02715")

    assert_equal "hello world", @enigma.decrypt(encrypted[:encryption], "02715")[:decryption]
  end
end
