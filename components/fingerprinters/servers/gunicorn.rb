=begin
    Copyright 2010-2015 Tasos Laskos <tasos.laskos@arachni-scanner.com>

    This file is part of the Arachni Framework project and is subject to
    redistribution and commercial restrictions. Please see the Arachni Framework
    web site for more information on licensing and terms of use.
=end

module Arachni
module Platform::Fingerprinters

# Identifies ASP.NET MVC resources.
#
# @author Tasos "Zapotek" Laskos <tasos.laskos@arachni-scanner.com>
# @version 0.1
class Gunicorn < Platform::Fingerprinter

    def run
        return update_platforms if server_or_powered_by_include?( 'gunicorn' )

        headers.keys.each do |header|
            return update_platforms if header.start_with?( 'x-gunicorn')
        end
    end

    def update_platforms
        platforms << :python << :gunicorn
    end

end

end
end
