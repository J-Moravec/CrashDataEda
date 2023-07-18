square = function(x){
    y = sqrt(x) |> ceiling()
    c(y,y)
    }

rectangulate = function(x){
    y = sqrt(x) |> round()
    c( ceiling(x / y), y)
    }

# barplot with numbers above bars
barplot = function(height, width=1, space=NULL, angle=0, cex=0.8, cex.axis=cex, labels=TRUE, ...){
    names(height)[is.na(names(height))] = "NA"

    ylim = c(0, 1.1*max(height))

    xx = graphics::barplot.default(height, width=width, space=space, ylim=ylim, ylab="", xlab="", xaxt="n", ...)

    text(x = xx, par("usr")[3], labels = names(height), srt = angle,
        adj = c(1.1,1.1), xpd = TRUE, cex=cex.axis, ...)

    if(labels)
        text(x = xx, y = height, label = height, pos = 3, cex = cex, xpd=TRUE, ...)
    }


# multiple barplots
barplots = function(data, options=list()){
    # reset par after
    oldpar = par(no.readonly=TRUE)
    on.exit(par(oldpar))

    par("mfrow" = length(data) |> rectangulate())
    par("mar"=c(3.1, 2.1, 2.1, 0.1))
    par("cex" = 0.5)
    par(options)

    for(name in names(data)){
        barplot(data[[name]], main=name)
        }
    }
