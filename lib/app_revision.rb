class AppRevision

  def self.version
    @version ||= begin
      if revision_file.exist?
        revision_file.read
      else
        `git rev-parse HEAD`
      end.strip
    end
  end

  def self.revision_file
    Rails.root.join('REVISION')
  end
end
