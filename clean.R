houses = read.csv('house_rankings_2018.csv')
N = sum(houses$X1)
newdf = data.frame(Adams=rep(0,N),
                   Cabot=rep(0,N),
                   Kirkland=rep(0,N),
                   Mather=rep(0,N),
                   Quincy=rep(0,N),
                   Leverett=rep(0,N),
                   Dunster=rep(0,N),
                   Currier=rep(0,N),
                   Eliot=rep(0,N),
                   Lowell=rep(0,N),
                   Pforzheimer=rep(0,N),
                   Winthrop=rep(0,N))
newdf
for (i in 1:12) {
  counter = c()
  for (ii in 1:12) {
    add = rep(ii, houses[i,ii+1])
    counter = c(counter, add)
  }
  newdf[,i] <- counter
}
# write.csv(newdf, 'house_cleaned.csv')

house = read.csv('house_elections.csv')
house_2018 = house[which(house$year == 2018),]
house_2018 = house_2018[-which(is.na(house_2018$party)),]
house_2018$party = as.character(house_2018$party)
house_2018$party[house_2018$party != "democrat" & house_2018$party != "republican"] = "other"
table(house_2018$party)
prop = house_2018$candidatevotes/house_2018$totalvotes
house_2018 = data.frame(house_2018, prop = prop)
View(house_2018)

house_2018 = house_2018[-which(house_2018$prop > 1),]

write.csv(house_2018, 'house_elections_2018_clean.csv')
max(house_2018$prop)
