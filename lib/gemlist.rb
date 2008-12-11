class Gemlist
  include Comparable
  attr_accessor :name, :versions

  GEMPATH = Gem.path.find { |p| p !~ /\.gem/ } # system gem path

  def self.all
    @@gems = []
    gem_specs.collect(&:name).uniq.each do |name|
      @@gems << Gemlist.new(name)
    end
    @@gems.reject! { |g| g.main_path.nil? }
    @@gems.sort!
  end
  
  def self.path
    GEMPATH
  end
  
  def initialize(name)
    self.name = name
    self.versions = Gemlist.gem_specs.select do |spec|
      spec.name == name && spec.has_rdoc? && File.exists?(File.join(GEMPATH, "doc", spec.full_name, "rdoc/index.html"))
    end
  end
  
  def main_path
    return if versions.empty?
    versions.first.full_name+'/rdoc/index.html'
  end
  
  def <=>(other)
    name.downcase <=> other.name.downcase
  end
  
  private
    def self.gem_specs
      @@gem_specs ||= Gem::SourceIndex.from_installed_gems.collect do
        |spec| spec[1]
      end
    end
end
