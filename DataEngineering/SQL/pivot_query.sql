select [state], [2008], [2009], [2010], [2011], [2012]
from [dbo].[HoneyProduction]
pivot
( sum(producevalue)
  for year in ([2008], [2009], [2010], [2011], [2012])
) as ProduceYear;