class MarathonPaceTime
  #some pretty wierd data... the curve seems to change direction at the start ie the pace is relatively fatster in 905 than 900 and continues to be fast till 990 where the relative pace slows
  #to see this effect:
  #MarathonPaceTime.MarathonPace.keys.map {|key| MarathonPaceTime.MarathonPace[key] / (key/5.0) }
  def self.MarathonPace
    return Hash[
      900,207,
      905,208,
      910,209,
      915,209,
      920,210,
      925,211,
      930,212,
      935,213,
      940,213,
      945,214,
      950,216,
      955,218,
      960,219,
      965,220,
      970,222,
      975,223,
      980,224,
      985,226,
      990,228,
      995,229,
      1000,231,
      1005,232,
      1010,233,
      1015,235,
      1020,236,
      1025,237,
      1030,238,
      1035,239,
      1040,241,
      1045,242,
      1050,242,
      1055,244,
      1060,245,
      1065,246,
      1070,247,
      1075,248,
      1080,249,
      1085,251,
      1090,252,
      1095,253,
      1100,254,
      1105,255,
      1110,256,
      1115,257,
      1120,259,
      1125,260,
      1130,261,
      1135,262,
      1140,264,
      1145,265,
      1150,266,
      1155,267,
      1160,268,
      1165,269,
      1170,270,
      1175,271,
      1180,272,
      1185,273,
      1190,274,
      1195,275,
      1200,276,
      1205,277,
      1210,278,
      1215,280,
      1220,281,
      1225,282,
      1230,283,
      1235,285,
      1240,286,
      1245,287,
      1250,288,
      1255,290,
      1260,290,
      1265,292,
      1270,293,
      1275,294,
      1280,295,
      1285,297,
      1290,297,
      1295,298,
      1300,300,
      1305,301,
      1310,302,
      1315,303,
      1320,305,
      1325,306,
      1330,307,
      1335,308,
      1340,310,
      1345,311,
      1350,312,
      1355,313,
      1360,314,
      1365,315,
      1370,316,
      1375,318,
      1380,319,
      1385,320,
      1390,321,
      1395,322,
      1400,323,
      1405,324,
      1410,325,
      1415,326,
      1420,327,
      1425,328,
      1430,329,
      1435,330,
      1440,331,
      1445,333,
      1450,334,
      1455,335,
      1460,336,
      1465,338,
      1470,339,
      1475,340,
      1480,341,
      1485,343,
      1490,344,
      1495,345,
      1500,346,
      1505,347,
      1510,349,
      1515,350,
      1520,351,
      1525,352,
      1530,354,
      1535,355,
      1540,356,
      1545,357,
      1550,358,
      1555,359,
      1560,360,
      1565,361,
      1570,362,
      1575,363,
      1580,364,
      1585,366,
      1590,367,
      1595,368,
      1600,369,
      1605,370,
      1610,371,
      1615,372,
      1620,374,
      1625,375,
      1630,376,
      1635,377,
      1640,379,
      1645,380,
      1650,381,
      1655,382,
      1660,383,
      1665,384,
      1670,385,
      1675,387,
      1680,388,
      1685,389,
      1690,390,
      1695,391,
      1700,392,
      1705,393,
      1710,395,
      1715,395,
      1720,397,
      1725,398,
      1730,399,
      1735,400,
      1740,402,
      1745,403,
      1750,404,
      1755,405,
      1760,407,
      1765,408,
      1770,410,
      1775,411,
      1780,413,
      1785,414,
      1790,415,
      1795,417,
      1800,418,
      1805,420,
      1810,421,
      1815,422,
      1820,423,
      1825,424,
      1830,425,
      1835,426,
      1840,428,
      1845,429,
      1850,430,
      1855,432,
      1860,433,
      1865,434,
      1870,436,
      1875,437,
      1880,438,
      1885,439,
      1890,440,
      1895,441,
      1900,443,
      1905,444,
      1910,445,
      1915,446,
      1920,448,
      1925,448,
      1930,449,
      1935,451,
      1940,452,
      1945,453,
      1950,454,
      1955,456,
      1960,457,
      1965,458,
      1970,459,
      1975,461,
      1980,462,
      1985,464,
      1990,465,
      1995,466,
      2000,467,
      2005,469,
      2010,470,
      2015,471,
      2020,472,
      2025,474,
      2030,476,
      2035,477,
      2040,478,
      2045,479,
      2050,480,
      2055,482,
      2060,483,
      2065,484,
      2070,485,
      2075,487,
      2080,488,
      2085,489,
      2090,491,
      2095,492,
      2100,494,
      2105,495,
      2110,496,
      2115,497,
      2120,499,
      2125,500,
      2130,501,
      2135,502,
      2140,503,
      2145,504,
      2150,505,
      2155,507,
      2160,508,
      2165,509,
      2170,510,
      2175,512,
      2180,513,
      2185,514,
      2190,515,
      2195,516,
      2200,517,
      2205,518,
      2210,520,
      2215,521,
      2220,522,
      2225,523,
      2230,525,
      2235,526,
      2240,527,
      2245,528,
      2250,530,
      2255,531,
      2260,533,
      2265,534,
      2270,535,
      2275,536,
      2280,538,
      2285,539,
      2290,540,
      2295,542,
      2300,543,
      2305,545,
      2310,546,
      2315,547,
      2320,548,
      2325,549,
      2330,551,
      2335,552,
      2340,553,
      2345,554,
      2350,556,
      2355,557,
      2360,558,
      2365,559,
      2370,561,
      2375,562,
      2380,563,
      2385,564,
      2390,566,
      2395,567,
      2400,568]
  end
end
