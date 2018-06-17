module BootLib
  module Require
    ARCHDIR    = RbConfig::CONFIG['archdir']
    RUBYLIBDIR = RbConfig::CONFIG['rubylibdir']
    DLEXT      = RbConfig::CONFIG['DLEXT']

    def self.from_archdir(feature)
      require(File.join(ARCHDIR, "#{feature}.#{DLEXT}"))
    end

    def self.from_rubylibdir(feature)
      require(File.join(RUBYLIBDIR, "#{feature}.rb"))
    end

    def self.from_gem(gem, feature)
      match = $LOAD_PATH
        .select { |e| e.match(gem_pattern(gem)) }
        .map    { |e| File.join(e, feature) }
        .detect { |e| File.exist?(e) }
      if match
        require(match)
      else
        puts "[BootLib::Require warning] couldn't locate #{feature}"
        require(feature)
      end
    end

    def self.gem_pattern(gem)
      %r{
        /
        (gems|extensions/[^/]+/[^/]+)          # "gems" or "extensions/x64_64-darwin16/2.3.0"
        /
        #{Regexp.escape(gem)}-(\h{12}|(\d+\.)) # msgpack-1.2.3 or msgpack-1234567890ab
      }x
    end
  end
end


ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup'
#require 'bootsnap'
BootLib::Require.from_gem('bootsnap', 'bootsnap')
env = ENV['RAILS_ENV'] || "development"
Bootsnap.setup(
  cache_dir:            'tmp/cache',          # Path to your cache
  development_mode:     env == 'development', # Current working environment, e.g. RACK_ENV, RAILS_ENV, etc
  load_path_cache:      env != 'development',                 # Optimize the LOAD_PATH with a cache
  autoload_paths_cache: env != 'development',                 # Optimize ActiveSupport autoloads with cache
  disable_trace:        true,                 # (Alpha) Set `RubyVM::InstructionSequence.compile_option = { trace_instruction: false }`
  compile_cache_iseq:   true,                 # Compile Ruby code into ISeq cache, breaks coverage reporting.
  compile_cache_yaml:   true                  # Compile YAML into a cache
)


