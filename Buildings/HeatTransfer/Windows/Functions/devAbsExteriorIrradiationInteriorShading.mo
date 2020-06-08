within Buildings.HeatTransfer.Windows.Functions;
function devAbsExteriorIrradiationInteriorShading
  "Angular and hemispherical absorptance of a shading device for exterior irradiation with interior shading"
  extends Buildings.HeatTransfer.Windows.Functions.BaseClasses.partialWindowShadingRadiation;
  output Real absExtIrrIntShaDev[HEM, NSta](
    each min=0,
    each max=1)
    "Absorptance of a shading device for exterior irradiation with interior shading";
algorithm
  for iSta in 1 : NSta loop
    for iD in 1 : HEM loop
      absExtIrrIntShaDev[iD, iSta] := traRef[TRA, 1, N, iD, iSta]*(1-traIntShaDev-refIntShaDev)/(1-refIntShaDev*traRef[Rb, N, 1, HEM, iSta])
        "Equation (A.4.91)";
    end for;
  end for;
  annotation(
    Documentation(
      info="<html>
<p>
This function computes the angular and hemispherical absorptance of a shading device for exterior irradiation with interior shading.
Pane <code>1</code> is facing the outside and pane <code>N</code> is facing the room.
</p>
</html>",
      revisions="<html>
<ul>
<li>
August 7, 2015, by Michael Wetter:<br/>
Revised model to allow modeling of electrochromic windows.
This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/445\">issue 445</a>.
</li>
<li>
August 29, 2010, by Wangda Zuo:<br/>
First implementation.
</li>
</ul>
</html>"));
end devAbsExteriorIrradiationInteriorShading;
