get '/' do
  @gem_specs = Gem::SourceIndex.from_installed_gems.collect { |spec| spec[1] }
  @gem_names = @gem_specs.collect(&:name).uniq
  haml :index
end
