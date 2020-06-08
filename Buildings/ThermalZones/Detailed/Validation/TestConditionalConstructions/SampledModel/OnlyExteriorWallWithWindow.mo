within Buildings.ThermalZones.Detailed.Validation.TestConditionalConstructions.SampledModel;
model OnlyExteriorWallWithWindow
  "Test model with sampleModel = true"
  extends Buildings.ThermalZones.Detailed.Validation.TestConditionalConstructions.OnlyExteriorWallWithWindow(
    roo(
      sampleModel=true));
  annotation(
    __Dymola_Commands(
      file="modelica://Buildings/Resources/Scripts/Dymola/ThermalZones/Detailed/Validation/TestConditionalConstructions/SampledModel/OnlyExteriorWallWithWindow.mos"
        "Simulate and plot"),
    Diagram(
      coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100}, {200, 160}})),
    experiment(
      Tolerance=1e-06,
      StopTime=86400),
    Documentation(
      info="<html>
<p>
This model is identical to
<a href=\"modelica://Buildings.ThermalZones.Detailed.Validation.TestConditionalConstructions.OnlyExteriorWallWithWindow\">
Buildings.ThermalZones.Detailed.Validation.TestConditionalConstructions.OnlyExteriorWallWithWindow</a>,
except that it sets <code>sampleModel=true</code>.
</p>
</html>",
      revisions="<html>
<ul>
<li>
October 25, 2017, by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"));
end OnlyExteriorWallWithWindow;
