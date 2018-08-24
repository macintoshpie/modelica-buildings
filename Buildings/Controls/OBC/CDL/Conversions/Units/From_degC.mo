block From_degC "Block that converts temperature from degree celsius to kelvin"

  Buildings.Controls.OBC.CDL.Interfaces.RealInput u(
    final unit = "degC",
    final quantity = "ThermodynamicTemperature")
    "Temperature in degree celsius"
    annotation (Placement(transformation(extent={{-80,-20},{-40,20}}),
      iconTransformation(extent={{-140,-20},{-100,20}})));

  Buildings.Controls.OBC.CDL.Interfaces.RealOutput y(
    final unit = "K",
    final quantity = "ThermodynamicTemperature")
    "Temperature in kelvin"
    annotation (Placement(transformation(extent={{40,-10},{60,10}}),
      iconTransformation(extent={{100,-10},{120,10}})));

protected
  parameter Real k = 1. "Multiplier";
  parameter Real p = 273.15 "Adder";

  Buildings.Controls.OBC.CDL.Continuous.AddParameter conv(
    final p = p,
    final k = k) "Unit converter"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

equation
  connect(u, conv.u)
    annotation (Line(points={{-60,0},{-12,0}}, color={0,0,127}));
  connect(conv.y, y)
    annotation (Line(points={{11,0},{50,0}}, color={0,0,127}));
  annotation (
      defaultComponentName = "From_degC",
    Icon(graphics={
        Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{20,58}}, color={28,108,200}),
        Text(
          lineColor={0,0,255},
          extent={{-150,110},{150,150}},
          textString="%name"),
        Text(
          extent={{-80,40},{0,0}},
          lineColor={0,0,127},
          textString="degC"),
        Text(
          extent={{0,-40},{80,0}},
          lineColor={0,0,127},
          textString="K")}),
        Documentation(info="<html>
<p>
Converts temperature given in degree celsius [degC] to kelvin [K].
</p>
</html>", revisions="<html>
<ul>
<li>
July 05, 2018, by Milica Grahovac:<br/>
First implementation.
</li>
</ul>
</html>"));
end From_degC;
