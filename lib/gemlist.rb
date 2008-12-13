class Gemlist
  include Comparable
  attr_accessor :name, :versions

  def self.all
    @@gemlists = []
    Gem::SourceIndex.from_installed_gems.each do |index|
      self << index[1] # second element of index is gem spec
    end
    @@gemlists.reject! { |g| g.main_rdoc_path.nil? }
    @@gemlists.sort!
  end
  
  def self.<< (gem_spec)
    gemlist = @@gemlists.find { |gl| gl.name == gem_spec.name }
    if gemlist
      gemlist.versions << gem_spec
    else
      @@gemlists << Gemlist.new(gem_spec)
    end
  end
  
  def self.path
    Gem.path.find { |p| p !~ /\.gem/ } # system gem path
  end
  
  def initialize(gem_spec)
    self.name = gem_spec.name
    self.versions = [gem_spec]
  end
  
  def available_versions
    versions.select do |gem_spec|
      File.exists?(Gemlist.path / "doc" / gem_spec.full_name / "rdoc/index.html")
    end
  end
  
  def main_rdoc_path
    return if available_versions.empty?
    "/#{versions.max.full_name}/rdoc/index.html"
  end
  
  def <=>(other)
    name.downcase <=> other.name.downcase
  end

end
