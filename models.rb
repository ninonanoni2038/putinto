require 'bundler/setup'
Bundle.require

if development?
  ActiveRecord::Base.establish_connection("sqlite3:db/development.db")
end

class Member < ActiveRecord::Base
  has_secure_password
end

class Mentor < ActiveRecord::Base
  has_secure_password
end

class Error < ActiveRecord::Base
end

class Solution < ActiveRecord::Base
end

class ErrorImage < ActiveRecord::Base
end

class SolutionImage < ActiveRecord::Base
end

class Follow < ActiveRecord::Base
end

class ErrorSolution < ActiveRecord::Base
end