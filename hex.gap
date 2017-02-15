# Calculate over the field Q(a) where a is a solution to x^2-3 = 0
x := Indeterminate(Rationals, "x");
p := x^2-3;
e := AlgebraicExtension(Rationals, p);
a := RootOfDefiningPolynomial(e);

b1 := [1, 0] * One(e);
b2 := [1/2, 1/2*a] * One(e);

s := [-1/2, 1/2*a] * One(e);
t := [-1/2, -1/2*a] * One(e);

u := s - b1;
v := t - b1;

ToFloat := function(element)
  local coefficients;
  coefficients := ExtRepOfObj(element);
  return Float(coefficients[1]) + Sqrt(3.0)*Float(coefficients[2]);
end;

scale := 4;
n := 3;
radius := 2*Ceil(n/2.0);

points := [];
for a in [-n..n] do
  for b in [-n..n] do
    for c in [b1, b2] do
      w := (a*u + b*v) + c;
      norm := ToFloat(w * w);
      if norm <= radius^2 then
        w := scale * w;
        Add(points, w);
      fi;
    od;
  od;
od;

PrintToConsole := function(index, element)
  Print(element, "\n");
end;

psFile := "data.ps";
PrintToPS := function(index, element)
  AppendTo(psFile, "\t[", ToFloat(element[1]), " ", ToFloat(element[2]), "]\n"); 
end;

tspFile := "data.tsp";
PrintToTSP := function(index, element)
  AppendTo(tspFile, index, " ", ToFloat(element[1]), " ", ToFloat(element[2]), "\n");
end;

header := "NAME: hex-paper\n\
TYPE: TSP\n\
COMMENT: Taking concorde for a run on a small problem\n\
DIMENSION: 4\n\
EDGE_WEIGHT_TYPE: EUC_2D\n\
NODE_COORD_TYPE: TWOD_COORDS\n\
NODE_COORD_SECTION:\n";
 
PrintTo(psFile);
PrintTo(tspFile, header);

index := 0;
for w in points do
  PrintToConsole(index, w);
  PrintToPS(index, w);
  PrintToTSP(index, w);
  index := index + 1;
od;