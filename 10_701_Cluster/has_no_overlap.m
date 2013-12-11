function flag = has_no_overlap (interval1, interval2)

assert(interval1(1) < interval1(2));
assert(interval2(1) < interval2(2));

if (interval1(2)<=interval2(1)) || (interval2(2)<=interval1(1))
    flag = true;
else
    flag= false;

end

end