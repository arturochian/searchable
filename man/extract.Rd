% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/extract.R
\docType{methods}
\name{[,searchable,character,missing-method}
\alias{$,searchable-method}
\alias{$<-,searchable-method}
\alias{[,searchable,character,missing-method}
\alias{[<-,searchable,character,missing-method}
\alias{[[,searchable,character-method}
\alias{[[<-,searchable,character,missing-method}
\alias{extract}
\title{Extraction operators for searchable object}
\usage{
\S4method{[}{searchable,character,missing}(x, i, j, ..., drop = TRUE)

\S4method{[[}{searchable,character}(x, i)

\S4method{$}{searchable}(x, name)

\S4method{[}{searchable,character,missing}(x, i) <- value

\S4method{[[}{searchable,character,missing}(x, i) <- value

\S4method{$}{searchable}(x, name) <- value
}
\arguments{
\item{x}{searchable object}

\item{i}{character; pattern with potential match modifiers applied,}

\item{j}{missing; never specified}

\item{...}{additional arguments. See \code{\link[base]{Extract}}}

\item{drop}{For matrices and arrays. If TRUE the result is coerced to the
lowest possible dimension (see the examples). This only works for
extracting elements, not for the replacement. See \code{\link[base]{drop}}
for further details.}

\item{name}{character; a name to be extracted, used with \code{$}, so no
match modification can be applied to the name.}

\item{value}{replacement value for replacement functions

The methods for searching respect the modifiers applied to both \code{x} and
\code{i}.}
}
\value{
The values after the extracting methods have been applied:\cr
  \code{[} returns a subset of \code{x}, but which is not searchable.  \cr
  \code{[[} returns an element of \code{x}  \cr
  \code{$} retutrns an element of \code{x} \cr
}
\description{
Defines  \code{[}, \code{[[}, and \code{$} for searchable objects
}
\section{\code{[}, \code{[<-} }{


\code{[} and \code{[<-} are used for getting and setting
\strong{zero or more} elemenxts of \code{x}. When searching using a pattern,
this is generally the search type that is wanted.

\code{[} does not return a searchable object. It is generally thought that
the returned object should not be a returnable object.
}

\section{\code{[[}, \code{[[<-} and \code{$}, \code{$<-} }{


These operators are used for getting and setting at \strong{zero or one}
element of \code{x}. Matches to more than one element result in an error.
}

\section{repeated-names}{


Unlike for environments or hashes, there are no constraints ensuring
uniqueness for names in vectors and lists. These structures may contain
multiple elements with the same name. Attempts to extract by this name yield
the first occurence of the name.
}
\examples{
# ATOMIC VECTORS:
    v <- c( a=1, b=2, B=3, c=4, c2=5 )
    sv <- searchable(v)

  # EXTRACT:
    sv[ c('a','b') ]        # Normal
    sv[ perl('c.?') ]
    sv[ fixed('c') ]
    sv[ 'x' ]                # NA

    sv[["a"]]
    sv[[ ignore.case("a") ]]
    sv[[ ignore.case("A") ]]

    sv$a
    sv$b
    sv$B


  # WITH MARGRITTR:
  \dontrun{
    "b" \%>\% sv[[.]]
    "B" \%>\% ignore.case \%>\% sv[.]
    "c." \%>\% perl \%>\% sv[[.]]
    "c.?" \%>\% perl \%>\% sv[.]
   }

  # REPLACEMENT:
    sv[['a']] <- "first"
    sv[[ perl('c.') ]] <- "third"
    # sv[[ perl('c.?') ]] <- "third"


  # RECURSIVE LISTS:
    l <- list( a=1, b=2, c=3 )
    sl <- searchable(l)
    sl[["b"]]
    sl[[ ignore.case("B") ]]
   \dontrun{
    sl[[ "B"  \%>\% ignore.case ]]
    "b" \%>\% sl[[.]]
    "B" \%>\% ignore.case \%>\% sl[[ . ]]
   }
}
\seealso{
\code{\link{searchable}}           \cr
   \code{\link[base]{Extract}}        \cr
   \code{\link[stringr]{ignore.case}} \cr
   \code{\link[stringr]{perl}}        \cr
   \code{\link{reverse.lookup}}       \cr
}

