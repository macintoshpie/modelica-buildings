within Buildings.Experimental.OpenBuildingControl.CDL.Logical.Composite.Validation;
model OnHold "Validation model for the OnHold block"
extends Modelica.Icons.Example;

  Sources.BooleanPulse                                                booPul(period=8000)
    annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  .Buildings.Experimental.OpenBuildingControl.CDL.Logical.Composite.OnHold onHold
    annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  annotation (
  experiment(StopTime=10.0, Tolerance=1e-06),
  __Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Experimental/OpenBuildingControl/CDL/Logical/Validation/And.mos"
        "Simulate and plot"),
    Documentation(info="<html>
<p>
Validation test for the block
<a href=\"modelica://Buildings.Experimental.OpenBuildingControl.CDL.Logical.Composite.OnHold\">
Buildings.Experimental.OpenBuildingControl.CDL.Logical.Composite.OnHold</a>.
</p>
</html>", revisions="<html>
<ul>
<li>
May 24, 2017, by Milica Grahovac:<br/>
First implementation.
</li>
</ul>

</html>"));
end OnHold;
