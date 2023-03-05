require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "minitest"
  gem "rails-dom-testing"
end

require "minitest/autorun"
require "rails/dom/testing/assertions"

class TestHtmlBoilerplate < Minitest::Test
  include Rails::Dom::Testing::Assertions

  def test_html_tag_is_present
    render_html

    assert_select "html"
  end

  def test_html_tag_has_lang_attribute
    render_html

    assert_select "html[lang]"
  end

  def test_html_tag_has_lang_attribute_with_en
    render_html

    assert_select "html[lang='en']"
  end

  def test_head_tag_is_present
    render_html

    assert_select "head"
  end

  def test_meta_charset_tag_is_present
    render_html

    assert_select "html head meta[charset]"
  end

  def test_meta_charset_tag_has_utf8
    render_html

    assert_select "html head meta[charset='utf-8']"
  end

  def test_title_tag_is_present
    render_html

    assert_select "html head title"
  end

  def test_title_tag_has_text
    render_html

    assert_select "html head title", text: /[a-z]+/i
  end

  def test_body_tag_is_present
    render_html

    assert_select "body"
  end

  def test_h1_tag_is_present
    render_html

    assert_select "body h1"
  end

  def test_h1_tag_has_text
    render_html

    assert_select "body h1", text: /[a-z]+/i
  end

  def test_p_tag_is_present
    render_html

    assert_select "body p"
  end

  def test_p_tag_has_text
    render_html

    assert_select "body p", text: /[a-z]+/i
  end

  def test_strong_tag_is_present
    render_html

    assert_select "body strong"
  end

  def test_strong_tag_has_text
    render_html

    assert_select "body strong", text: /[a-z]+/i
  end

  def test_em_tag_is_present
    render_html

    assert_select "body em"
  end

  def test_em_tag_has_text
    render_html

    assert_select "body em", text: /[a-z]+/i
  end

  def test_h1_tag_has_text_in_body
    render_html

    assert_select "body h1", text: /[a-z]+/i
  end

  def test_p_tag_has_text_in_body
    render_html

    assert_select "body p", text: /[a-z]+/i
  end

  def test_ul_tag_is_present
    render_html

    assert_select "body ul"
  end

  def test_li_tag_is_present
    render_html

    assert_select "body ul li"
  end

  def test_li_tag_is_present_in_ul
    render_html

    assert_select "body ul li", text: /[a-z]+/i
  end

  def test_ol_tag_is_present
    render_html

    assert_select "body ol"
  end

  def test_li_tag_is_present_in_ol
    render_html

    assert_select "body ol li", text: /[a-z]+/i
  end

  def test_a_tag_is_present
    render_html

    assert_select "body a"
  end

  def test_a_tag_has_href
    render_html

    assert_select "body a[href]"
  end

  def test_a_tag_has_href_with_http
    render_html

    assert_select "body" do
      assert_select "a[href^='http']"
    end
  end

  def test_img_tag_is_present
    render_html

    assert_select "body img"
  end

  def test_img_tag_has_src
    render_html

    assert_select "body img[src]"
  end

  def test_img_tag_has_alt_attribute
    render_html

    assert_select "body img[alt]"
  end

  def test_img_tag_has_alt_attribute_with_text
    render_html

    assert_select "body" do
      assert_select "img:match('alt', ?)", /[a-z]+/i
    end
  end

  def test_all_img_tags_have_alt_attribute
    render_html

    assert_select "img:not([alt])", count: 0
  end

  private

  def render_html
    return @html_document if defined?(@html_document)

    html = File.read("public/index.html")
    @html_document = Nokogiri::HTML::Document.parse(html)
  end

  def document_root_element
    @html_document.root
  end
end


