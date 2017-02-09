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

for a in [-5..5] do
    for b in [-5..5] do
        w := a*u + b*v;
        Print(w, "\n");
    od;
od;