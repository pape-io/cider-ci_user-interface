#  Copyright (C) 2013, 2014 Dr. Thomas Schank  (DrTom@schank.ch, Thomas.Schank@algocon.ch)
#  Licensed under the terms of the GNU Affero General Public License v3.
#  See the LICENSE.txt file provided with this software.

module ExceptionHelper 

  class << self

    def with_log_and_supress!
      begin 
        yield
      rescue Exception => e
        Rails.logger.warn Formatter.exception_to_log_s(e)
      end
    end

    def with_log_and_reraise
      begin 
        yield
      rescue Exception => e
        Rails.logger.error Formatter.exception_to_log_s(e)
        raise e
      end
    end

  end
end
