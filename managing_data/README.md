## Data
Why does this matter? I dare not be too prescriptive about how data should be presented, what format, what standard &c. Science is too diverse and dynamic for us to ever be able to standardize its presentation.

But what I would argue is that if you publish it, it should be centrally accessible (with appropriate governance [PHI, &c]) for our peers and the public to access. If we're OK with reporting a useful conclusion from scientific data, then we should share it too!

### Data APIs
If we are going to share data, wouldn't it be nice if we could store our data someplace that has a fixed reference? Why would this be useful?
* It's difficult for other people (my PI, my peers, and once it's published, the public) to access data on my laptop
* If the data were stored in a web-accessible datastore, granting other people anywhere access to it would just involve access privileges and a URL

Even better, wouldn't it be nice if we could directly access those data from an analytic environment? Application Programming Interfaces (APIs) allow us to do that.

In the R code vignettes here, I show how one can use the Figshare and Synapse APIs via R programmatic clients to access and store data, and even analyze the data and push new intermediate data back to the web.
