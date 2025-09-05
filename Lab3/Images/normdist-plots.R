x <- seq(-4, 4, length=100)
y <- dnorm(x)
normdist <- data.frame(x=x, y=y)

library(scales)
library(ggplot2)

pnorm_plot <- ggplot(normdist, aes(x=x, y=y, ymin=0, ymax=y, xmax=1.8))+
  geom_line()+
  geom_area(aes(x=stage(x, after_stat=oob_censor(x, c(-4, 1.6))),
                alpha=0.7), show.legend=FALSE, fill="cadetblue")+
  annotate("segment", x=1.6, xend=1.6, y=-0.01, yend=dnorm(1.6), col="cadetblue4", alpha=0.96)+
  annotate("text", label="pnorm(q)", x=0, y=0.11, col="darkslategrey",
           family="mono")+
  annotate("text", label="q", x=1.6, y=-0.03, col="darkslategrey", family="mono")+
  coord_cartesian(clip='off', ylim=c(0, 0.4), xlim=c(-4.1, 4.1))+
  scale_y_continuous(expand=expansion())+
  theme_classic()+
  theme(axis.title=element_blank(),
        plot.background=element_blank(),
        panel.grid.major=element_line(),
        panel.grid.minor=element_blank(),
        plot.margin=unit(c(1,1,1.6,1), "lines"))

qnorm_plot <- ggplot(normdist, aes(x=x, y=y, ymin=0, ymax=y))+
  geom_line()+
  geom_area(aes(x=stage(x, after_stat=oob_censor(x, c(-4, -0.5))),
                alpha=0.7), fill="seagreen", show.legend=FALSE)+
  annotate("segment", x=-0.5, xend=-0.5, y=-0.06, yend=dnorm(-0.5), col="seagreen", alpha=0.96)+
  annotate("text", label="p", x=-1.2, y=0.06, col="darkslategrey",
           family="mono")+
  annotate("text", label="qnorm(p)", x=-0.8, y=-0.08, col="darkslategrey", 
           family="mono")+
  coord_cartesian(clip='off', ylim=c(0, 0.4), xlim=c(-4.1, 4.1))+
  scale_y_continuous(expand=expansion())+
  theme_classic()+
  theme(axis.title=element_blank(),
        plot.background=element_blank(),
        panel.grid.major=element_line(),
        panel.grid.minor=element_blank(),
        plot.margin=unit(c(1,1,1.6,1), "lines"))

dnorm_plot <- ggplot(normdist, aes(x=x, y=y, ymin=0, ymax=y))+
  geom_line()+
  annotate("segment", x=1, xend=1, y=-0.01, yend=dnorm(1), linetype=2, col="darkslategrey")+
  annotate("pointrange", xmin=-4.5, x=1, xmax=1, y=dnorm(1), linetype=2, size=0.2,
           col="darkslategrey")+
  annotate("text", label="x", x=1, y=-0.03, col="darkslategrey", family="mono")+
  annotate("text", label="dnorm(x)", x=-3, y=dnorm(1)+0.025, family="mono")+
  coord_cartesian(ylim=c(0, 0.4), xlim=c(-4.1, 4.1), clip='off')+
  scale_y_continuous(expand=expansion())+
  theme_classic()+
  theme(axis.title=element_blank(),
        plot.background=element_blank(),
        panel.grid.major=element_line(),
        panel.grid.minor=element_blank(),
        plot.margin=unit(c(1,1,1.6,1), "lines"))

library(gridExtra)
library(svglite)
svglite("Images/normdist_plots.svg", width=14, height=3)
grid.arrange(pnorm_plot, qnorm_plot, dnorm_plot, ncol=3)
dev.off()

png(filename = "Images/normdist_plots.png", width = 23, height = 5, units = "cm", res = 400)
grid.arrange(pnorm_plot, qnorm_plot, dnorm_plot, ncol=3)
dev.off()


