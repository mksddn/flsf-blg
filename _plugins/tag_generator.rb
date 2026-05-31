# frozen_string_literal: true

module Jekyll
  module TagSlug
    MAP = {
      'а' => 'a', 'б' => 'b', 'в' => 'v', 'г' => 'g', 'д' => 'd', 'е' => 'e', 'ё' => 'yo',
      'ж' => 'zh', 'з' => 'z', 'и' => 'i', 'й' => 'y', 'к' => 'k', 'л' => 'l', 'м' => 'm',
      'н' => 'n', 'о' => 'o', 'п' => 'p', 'р' => 'r', 'с' => 's', 'т' => 't', 'у' => 'u',
      'ф' => 'f', 'х' => 'h', 'ц' => 'ts', 'ч' => 'ch', 'ш' => 'sh', 'щ' => 'sch',
      'ъ' => '', 'ы' => 'y', 'ь' => '', 'э' => 'e', 'ю' => 'yu', 'я' => 'ya'
    }.freeze

    module_function

    def slugify(text)
      text.to_s.downcase.chars.map { |char| MAP[char] || char }.join
            .gsub(/[^a-z0-9]+/, '-').gsub(/\A-+|-+\z/, '')
    end
  end

  class TagPage < Page
    def initialize(site, tag, posts)
      @site = site
      @base = site.source
      @dir = 'tag'
      @name = "#{TagSlug.slugify(tag)}.html"

      @data = {
        'layout' => 'tag',
        'title' => tag,
        'tag_title' => tag,
        'tag_slug' => TagSlug.slugify(tag),
        'tag_description' => "Статьи по теме «#{tag}» — #{site.config['tagline']}",
        'tag_posts' => posts.sort_by { |post| post.date || Time.at(0) }.reverse
      }

      process(@name)
    end
  end

  module TagSlugFilter
    def tag_slug(input)
      TagSlug.slugify(input)
    end
  end

  Liquid::Template.register_filter(TagSlugFilter)

  class TagPageGenerator < Generator
    safe true
    priority :low

    def generate(site)
      tags = Hash.new { |hash, key| hash[key] = [] }

      site.posts.docs.each do |post|
        Array(post.data['tags']).each do |tag|
          tags[tag] << post
        end
      end

      tags.each do |tag, posts|
        site.pages << TagPage.new(site, tag, posts)
      end
    end
  end
end
