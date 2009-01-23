# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{postgres_sequence_support}
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Elijah Miller"]
  s.date = %q{2009-01-22}
  s.description = %q{Easy manipulation of PostgreSQL sequences from ActiveRecord.}
  s.email = %q{elijah.miller@gmail.com}
  s.extra_rdoc_files = ["CHANGELOG", "lib/postgres_sequence_support.rb", "LICENSE", "README.rdoc"]
  s.files = ["CHANGELOG", "init.rb", "lib/postgres_sequence_support.rb", "LICENSE", "Manifest", "postgres_sequence_support.gemspec", "Rakefile", "README.rdoc"]
  s.has_rdoc = true
  s.homepage = %q{}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Postgres_sequence_support", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{postgres_sequence_support}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Easy manipulation of PostgreSQL sequences from ActiveRecord.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
