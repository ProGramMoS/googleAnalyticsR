% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/remarketingAudiences.R
\name{ga_remarketing_build}
\alias{ga_remarketing_build}
\title{Create a remarketing audience for creation}
\usage{
ga_remarketing_build(
  segment,
  membershipDurationDays = NULL,
  daysToLookBack = NULL,
  state_duration = c("TEMPORARY", "PERMANENT")
)
}
\arguments{
\item{segment}{The definition of the segment (v3 syntax)}

\item{membershipDurationDays}{Number of days (in the range 1 to 540) a user remains in the audience.}

\item{daysToLookBack}{The look-back window lets you specify a time frame for evaluating the behavior that qualifies users for your audience.}

\item{state_duration}{If to be used in a state based audience, whether to make the segment temporary or permanent.}
}
\description{
Create definitions to be used within \link{ga_remarketing_create}
}
\details{
The look-back window lets you specify a time frame for evaluating the behavior that qualifies users for your audience. For example, if your filters include users from Central Asia, and Transactions Greater than 2, and you set the look-back window to 14 days, then any user from Central Asia whose cumulative transactions exceed 2 during the last 14 days is added to the audience.
}
\examples{

\dontrun{
adword_list <- ga_adwords_list(123456, "UA-123456-1")

adword_link <- ga_adword(adword_list$id[[1]])

segment_list <- ga_segment_list()$items$definition

my_remarketing1 <- ga_remarketing_build(segment_list[[1]], 
                    state_duration = "TEMPORARY",
                    membershipDurationDays = 90, 
                    daysToLookBack = 14)
                    
my_remarketing2 <- ga_remarketing_build(segment_list[[2]], 
                     state_duration = "PERMANENT",
                     membershipDurationDays = 7, 
                     daysToLookBack = 31)
                     
# state based only can include exclusions
ga_remarketing_create(adwords_link = adword_link,
                     include = my_remarketing1, 
                     exclude = my_remarketing2,
                     audienceType = "STATE_BASED", 
                     name = "my_remarketing_seg1")

}
}
\seealso{
Other remarketing management functions: 
\code{\link{ga_remarketing_create}()},
\code{\link{ga_remarketing_estimate}()},
\code{\link{ga_remarketing_get}()},
\code{\link{ga_remarketing_list}()}
}
\concept{remarketing management functions}
