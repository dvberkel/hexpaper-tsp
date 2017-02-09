# Calculate over the field Q(a) where a is a solution to x^2-3 = 0
x := Indeterminate(Rationals, "x");
p := x^2-3;
e := AlgebraicExtension(Rationals, p);
a := RootOfDefiningPolynomial(e);

u := [1, 0] * One(e);
v := [1/2, 1/2*a] * One(e);

ToFloat := function(element)
  local coefficients;
  coefficients := ExtRepOfObj(element);
  return Float(coefficients[1]) + Sqrt(3.0)*Float(coefficients[2]);
end;

scale := 10;
n := 5;
radius := 4.0;

for a in [-n..n] do
    for b in [-n..n] do
        w := (a*u + b*v);
        norm := ToFloat(w * w);
        if norm <= radius^2 then
           w := scale * w;
           Print("[", ToFloat(w[1]), " ", ToFloat(w[2]), "]\n");
        fi;
    od;
od;