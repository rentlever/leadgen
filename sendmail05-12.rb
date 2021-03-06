require 'mail'
require 'csv'

options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'localhost:3000',
            :user_name            => 'murat@rentlever.com',
            :password             => 'murat1979',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }


Mail.defaults do
  delivery_method :smtp, options
end

CSV.foreach('batch.csv') do |row|

Mail.deliver do
       to "#{row[3]}"
     from 'Scott Drexel <scott.d@rentlever.com>'
     subject "Re: Your home at  *#{row[4]}*"
     body "Hi #{row[1]}- sorry, I just realized I made a mistake on the subject line of the email I sent you yesterday. I have your home at #{row[4]}, correct?

I ran a brief analysis on your property to get an initial idea of what kind of vacation rental income we'd be able to generate, and came up with a range of #{row[5]} to  #{row[6]}. We\'d even be willing to offer a guarantee.

Do you have 5 minutes to chat?

-Scott
(530) 206-5063

On May 11, 2017, at 12:51 PM, Scott Drexel <ceo@rentlever.com> wrote:

Hi #{row[1]},

My name is Scott and my company, rentLEVER, is the fastest growing vacation rental manager in Lake Tahoe. Our unique approach
results in as much as 2X greater profit for our home owners, while reducing management fees to just 18%,
and maintaining the highest standards for guest quality and care for your home.

Do you have 10 minutes to connect about your home?

Regards,
Scott Drexel, CEO
(530) 206-5063

rentLEVER - vacation rental management. smarter.

scott drexel | ceo • rentLEVER | 832 sansome st | san francisco • ca • 94111

find out how much your home could earn at rentLEVER.com!

"
   end
    sleep 2
    p "#{row[3]} email sent"
 end
