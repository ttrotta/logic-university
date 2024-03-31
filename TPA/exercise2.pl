% Definition of days for each month in a non-leap year
days_in_month(non_leap_year, january, 31).
days_in_month(non_leap_year, february, 28).
days_in_month(non_leap_year, march, 31).
days_in_month(non_leap_year, april, 30).
days_in_month(non_leap_year, may, 31).
days_in_month(non_leap_year, june, 30).
days_in_month(non_leap_year, july, 31).
days_in_month(non_leap_year, august, 31).
days_in_month(non_leap_year, september, 30).
days_in_month(non_leap_year, october, 31).
days_in_month(non_leap_year, november, 30).
days_in_month(non_leap_year, december, 31).

% Definition of days in February for a leap year
days_in_month(leap_year, february, 29).

% Predicate to determine if a year is a leap year or not
is_leap_year(Year) :-
    0 is Year mod 4,
    \+ (0 is Year mod 100),
    0 is Year mod 400.

% Predicate to get the days of a month in a specific year
days_in_month_in_year(Month, Year, Days) :-
    is_leap_year(Year),
    days_in_month(leap_year, Month, Days).
days_in_month_in_year(Month, Year, Days) :-
    \+ is_leap_year(Year),
    days_in_month(non_leap_year, Month, Days).

% Example query: Get the days of February in a non-leap year
% ?- days_in_month_in_year(february, 2023, Days).
% Days = 28
