# -*- encoding: utf-8 -*-
# stub: wysihtml-rails 0.6.0.beta2 ruby lib

Gem::Specification.new do |s|
  s.name = "wysihtml-rails".freeze
  s.version = "0.6.0.beta2"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Tanel Jakobsoo".freeze]
  s.date = "2018-06-13"
  s.description = "A wysiwyg text editor for Rails assets pipeline".freeze
  s.email = ["tanel@fraktal.ee".freeze]
  s.files = [".gitignore".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "lib/wysihtml/rails.rb".freeze, "lib/wysihtml/rails/version.rb".freeze, "vendor/assets/javascripts/wysihtml.js".freeze, "vendor/assets/javascripts/wysihtml/all_commands.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/alignCenterStyle.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/alignJustifyStyle.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/alignLeftStyle.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/alignRightStyle.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/bgColorStyle.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/bold.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/command_formatCode.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/command_insertImage.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/fontSize.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/fontSizeStyle.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/foreColor.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/foreColorStyle.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/insertBlockQuote.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/insertHorizontalRule.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/insertOrderedList.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/insertUnorderedList.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/italic.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/justifyCenter.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/justifyFull.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/justifyLeft.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/justifyRight.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/subscript.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/superscript.js".freeze, "vendor/assets/javascripts/wysihtml/extra_commands/underline.js".freeze, "vendor/assets/javascripts/wysihtml/parser_rules/advanced.js".freeze, "vendor/assets/javascripts/wysihtml/parser_rules/advanced_and_extended.js".freeze, "vendor/assets/javascripts/wysihtml/parser_rules/advanced_unwrap.js".freeze, "vendor/assets/javascripts/wysihtml/parser_rules/simple.js".freeze, "vendor/assets/javascripts/wysihtml/table_editing.js".freeze, "vendor/assets/javascripts/wysihtml/toolbar.js".freeze, "vendor/assets/stylesheets/wysihtml.css".freeze, "wysihtml-rails.gemspec".freeze]
  s.homepage = "https://github.com/Voog/wysihtml-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Wysihtml (http://wysihtml.com) text editor for Rails assets pipeline.".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>.freeze, [">= 3.1.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 0"])
    else
      s.add_dependency(%q<railties>.freeze, [">= 3.1.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, ["~> 0"])
    end
  else
    s.add_dependency(%q<railties>.freeze, [">= 3.1.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, ["~> 0"])
  end
end
