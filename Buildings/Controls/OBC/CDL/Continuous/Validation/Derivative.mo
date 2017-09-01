within Buildings.Controls.OBC.CDL.Continuous.Validation;
model Derivative "Validation model for the Derivative block"
extends Modelica.Icons.Example;
//   import Buildings.Controls.OBC.CDL.Types.Init;
  Buildings.Controls.OBC.CDL.Continuous.Cos cos1
    "Block that outputs the cosine of the input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Ramp ramp1(
    duration=5,
    offset=0,
    height=6.283*5) "Block that generates ramp signal"
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));

  Buildings.Controls.OBC.CDL.Continuous.Derivative der1(
    initType=Buildings.Controls.OBC.CDL.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{34,-10},{54,10}})));

equation
  connect(ramp1.y, cos1.u)
    annotation (Line(points={{-39,0},{-12,0}},         color={0,0,127}));
  connect(cos1.y, der1.u)
    annotation (Line(points={{11,0},{32,0}},        color={0,0,127}));
  annotation (
  experiment(StopTime=5.0, Tolerance=1e-06),
  __Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Controls/OBC/CDL/Continuous/Validation/Derivative.mos"
        "Simulate and plot"),
    Documentation(info="<html>
<p>
Validation test for the block
<a href=\"modelica://Buildings.Controls.OBC.CDL.Continuous.Derivative\">
Buildings.Controls.OBC.CDL.Continuous.Derivative</a>.
</p>
<p>
The input <code>u</code> varies from <i>0.0</i> to <i>+5*6.283</i>.
</p>
</html>", revisions="<html>
<ul>
<li>
March 17, 2017, by Jianjun Hu:<br/>
First implementation.
</li>
</ul>

</html>"));
end Derivative;
