function xdate = genTimes(m, n)
l = n - m + 1;
% Create arrays for an arbitrary date, here June 1, 1987
year = 1987 * ones(1,l);
month = 6 * ones(1,l);
day = 1 * ones(1,l);
% Create arrays for each of n-m+1 hours;
hour = m:n;
minutes = zeros(1,l);
% Get the datenums for the data (only hours change)
xdate = datenum(year,month,day,hour,minutes,minutes);
