within Buildings.Applications.DHC.Loads.Examples.BaseClasses;
model RCBuildingRefactor "Building model of type RC one element"
  extends Buildings.Applications.DHC.Loads.BaseClasses.PartialBuildingRefactor(
    haveFanPum=true,
    haveEleHeaCoo=false,
    nLoa=1);
  package Medium2 = Buildings.Media.Air
    "Load side medium";
  Buildings.BoundaryConditions.SolarIrradiation.DiffusePerez HDifTil[2](
    each outSkyCon=true,
    each outGroCon=true,
    each til=1.5707963267949,
    each lat=0.87266462599716,
    azi={3.1415926535898,4.7123889803847})
    "Calculates diffuse solar radiation on titled surface for both directions"
    annotation (Placement(transformation(extent={{-68,20},{-48,40}})));
  Buildings.BoundaryConditions.SolarIrradiation.DirectTiltedSurface HDirTil[2](
    each til=1.5707963267949,
    each lat=0.87266462599716,
    azi={3.1415926535898,4.7123889803847})
    "Calculates direct solar radiation on titled surface for both directions"
    annotation (Placement(transformation(extent={{-68,52},{-48,72}})));
  Buildings.ThermalZones.ReducedOrder.SolarGain.CorrectionGDoublePane corGDouPan(n=2, UWin=2.1)
    "Correction factor for solar transmission"
    annotation (Placement(transformation(extent={{6,54},{26,74}})));
  Buildings.ThermalZones.ReducedOrder.RC.OneElement thermalZoneOneElement(
    VAir=52.5,
    hRad=4.999999999999999,
    hConWin=2.7000000000000006,
    gWin=1,
    ratioWinConRad=0.09,
    hConExt=2.0490178828959134,
    nExt=1,
    RExt={0.00331421908725},
    CExt={5259932.23},
    RWin=0.01642857143,
    RExtRem=0.1265217391,
    nOrientations=2,
    AWin={7,7},
    ATransparent={7,7},
    AExt={3.5,8},
    redeclare package Medium = Medium2,
    extWallRC(thermCapExt(each der_T(fixed=true))),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=295.15,
    nPorts=2)       "Thermal zone"
    annotation (Placement(transformation(extent={{44,-10},{92,26}})));
  Buildings.ThermalZones.ReducedOrder.EquivalentAirTemperature.VDI6007WithWindow
                                             eqAirTemp(
    n=2,
    wfGro=0,
    wfWall={0.3043478260869566,0.6956521739130435},
    wfWin={0.5,0.5},
    withLongwave=true,
    aExt=0.7,
    hConWallOut=20.0,
    hRad=5.0,
    hConWinOut=20.0,
    TGro=285.15) "Computes equivalent air temperature"
    annotation (Placement(transformation(extent={{-24,-14},{-4,6}})));
  Modelica.Blocks.Math.Add solRad[2]
    "Sums up solar radiation of both directions"
    annotation (Placement(transformation(extent={{-38,6},{-28,16}})));
  Buildings.HeatTransfer.Sources.PrescribedTemperature preTem
    "Prescribed temperature for exterior walls outdoor surface temperature"
    annotation (Placement(transformation(extent={{8,-6},{20,6}})));
  Buildings.HeatTransfer.Sources.PrescribedTemperature preTem1
    "Prescribed temperature for windows outdoor surface temperature"
    annotation (Placement(transformation(extent={{8,14},{20,26}})));
  Modelica.Thermal.HeatTransfer.Components.Convection theConWin
    "Outdoor convective heat transfer of windows"
    annotation (Placement(transformation(extent={{38,16},{28,26}})));
  Modelica.Thermal.HeatTransfer.Components.Convection theConWall
    "Outdoor convective heat transfer of walls"
    annotation (Placement(transformation(extent={{36,6},{26,-4}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow perRad
    "Radiative heat flow of persons"
    annotation (Placement(transformation(extent={{48,-42},{68,-22}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow perCon
    "Convective heat flow of persons"
    annotation (Placement(transformation(extent={{48,-58},{68,-38}})));
  Modelica.Blocks.Sources.CombiTimeTable intGai(
    table=[0,0,0,0; 3600,0,0,0; 7200,0,0,0; 10800,0,0,0; 14400,0,0,0;
        18000,0,0,0; 21600,0,0,0; 25200,0,0,0; 25200,80,80,200; 28800,80,
        80,200; 32400,80,80,200; 36000,80,80,200; 39600,80,80,200; 43200,
        80,80,200; 46800,80,80,200; 50400,80,80,200; 54000,80,80,200;
        57600,80,80,200; 61200,80,80,200; 61200,0,0,0; 64800,0,0,0; 72000,
        0,0,0; 75600,0,0,0; 79200,0,0,0; 82800,0,0,0; 86400,0,0,0],
    columns={2,3,4},
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic) "Table with profiles for persons (radiative and convective) and machines
    (convective)"
    annotation (Placement(transformation(extent={{-2,-40},{14,-24}})));
  Modelica.Blocks.Sources.Constant const[2](each k=0)
    "Sets sunblind signal to zero (open)"
    annotation (Placement(transformation(extent={{-20,14},{-14,20}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow macConv
    "Convective heat flow of machines"
    annotation (Placement(transformation(extent={{48,-76},{68,-56}})));
  Modelica.Blocks.Sources.Constant alphaWall(k=25*11.5)
    "Outdoor coefficient of heat transfer for walls"
    annotation (Placement(
    transformation(
    extent={{-4,-4},{4,4}},
    rotation=90,
    origin={30,-16})));
  Modelica.Blocks.Sources.Constant alphaWin(k=20*14)
    "Outdoor coefficient of heat transfer for windows"
    annotation (Placement(
    transformation(
    extent={{4,-4},{-4,4}},
    rotation=90,
    origin={32,38})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant minTSet(k=20) "Minimum temperature setpoint"
    annotation (Placement(transformation(extent={{-300,260},{-280,280}})));
  Buildings.Controls.OBC.UnitConversions.From_degC from_degC1
    annotation (Placement(transformation(extent={{-260,260},{-240,280}})));
  Buildings.Applications.DHC.Loads.BaseClasses.FlowDistribution disFloHea(
    m_flow1_nominal=terUni.m_flow1_nominal[1],
    T_a1_nominal=313.15,
    T_b1_nominal=308.15,
    nLoa=1)
    annotation (Placement(transformation(extent={{-120,-120},{-100,-100}})));
  Buildings.Applications.DHC.Loads.Examples.BaseClasses.Terminal4PipesFluidPorts
    terUni(
    Q_flow_nominal={500,2000},
    T_a2_nominal={293.15,297.15},
    T_b1_nominal={disFloHea.T_b1_nominal,disFloCoo.T_b1_nominal},
    T_a1_nominal={disFloHea.T_a1_nominal,disFloCoo.T_a1_nominal},
    m_flow2_nominal={1,1},
    dp2_nominal={100,100})
    annotation (Placement(transformation(extent={{-160,-60},{-140,-40}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant maxTSet(k=24) "Minimum temperature setpoint"
    annotation (Placement(transformation(extent={{-300,220},{-280,240}})));
  Buildings.Controls.OBC.UnitConversions.From_degC from_degC2
    annotation (Placement(transformation(extent={{-260,220},{-240,240}})));
  Buildings.Applications.DHC.Loads.BaseClasses.FlowDistribution disFloCoo(
    m_flow1_nominal=terUni.m_flow1_nominal[2],
    T_a1_nominal=280.15,
    T_b1_nominal=285.15,
    nLoa=1)
    annotation (Placement(transformation(extent={{-120,-160},{-100,-140}})));
equation
  connect(eqAirTemp.TEqAirWin,preTem1. T)
    annotation (Line(
    points={{-3,-0.2},{0,-0.2},{0,20},{6.8,20}},   color={0,0,127}));
  connect(eqAirTemp.TEqAir,preTem. T)
    annotation (Line(points={{-3,-4},{4,-4},{4,0},{6.8,0}},
    color={0,0,127}));
  connect(intGai.y[1],perRad. Q_flow)
    annotation (Line(points={{14.8,-32},{48,-32}},
                                      color={0,0,127}));
  connect(intGai.y[2],perCon. Q_flow)
    annotation (Line(points={{14.8,-32},{14.8,-48},{48,-48}},
                                                            color={0,0,127}));
  connect(intGai.y[3],macConv. Q_flow)
    annotation (Line(points={{14.8,-32},{28,-32},{28,-66},{48,-66}},
                                      color={0,0,127}));
  connect(const.y,eqAirTemp. sunblind)
    annotation (Line(points={{-13.7,17},{-12,17},{-12,8},{-14,8}},
    color={0,0,127}));
  connect(HDifTil.HSkyDifTil,corGDouPan. HSkyDifTil)
    annotation (Line(
    points={{-47,36},{-28,36},{-6,36},{-6,66},{4,66}}, color={0,0,127}));
  connect(HDirTil.H,corGDouPan. HDirTil)
    annotation (Line(points={{-47,62},{-10,62},{-10,70},{4,70}},
    color={0,0,127}));
  connect(HDirTil.H,solRad. u1)
    annotation (Line(points={{-47,62},{-42,62},{-42,
    14},{-39,14}}, color={0,0,127}));
  connect(HDirTil.inc,corGDouPan. inc)
    annotation (Line(points={{-47,58},{4,58}}, color={0,0,127}));
  connect(HDifTil.H,solRad. u2)
    annotation (Line(points={{-47,30},{-44,30},{-44,
    8},{-39,8}}, color={0,0,127}));
  connect(HDifTil.HGroDifTil,corGDouPan. HGroDifTil)
    annotation (Line(
    points={{-47,24},{-4,24},{-4,62},{4,62}}, color={0,0,127}));
  connect(solRad.y,eqAirTemp. HSol)
    annotation (Line(points={{-27.5,11},{-26,11},{-26,2}},
    color={0,0,127}));
  connect(perRad.port,thermalZoneOneElement. intGainsRad)
    annotation (Line(
    points={{68,-32},{104,-32},{104,16},{92,16}},
    color={191,0,0}));
  connect(theConWin.solid,thermalZoneOneElement. window)
    annotation (
    Line(points={{38,21},{40,21},{40,12},{44,12}},   color={191,0,0}));
  connect(preTem1.port,theConWin. fluid)
    annotation (Line(points={{20,20},{28,20},{28,21}}, color={191,0,0}));
  connect(thermalZoneOneElement.extWall,theConWall. solid)
    annotation (Line(points={{44,4},{40,4},{40,1},{36,1}},
    color={191,0,0}));
  connect(theConWall.fluid,preTem. port)
    annotation (Line(points={{26,1},{24,1},{24,0},{20,0}}, color={191,0,0}));
  connect(alphaWall.y,theConWall. Gc)
    annotation (Line(points={{30,-11.6},{30,-4},{31,-4}}, color={0,0,127}));
  connect(alphaWin.y,theConWin. Gc)
    annotation (Line(points={{32,33.6},{32,26},{33,26}}, color={0,0,127}));
  connect(macConv.port,thermalZoneOneElement. intGainsConv)
    annotation (
    Line(points={{68,-66},{98,-66},{98,12},{92,12}},          color={191,
    0,0}));
  connect(perCon.port,thermalZoneOneElement. intGainsConv)
    annotation (
    Line(points={{68,-48},{98,-48},{98,12},{92,12}}, color={191,0,0}));
  connect(corGDouPan.solarRadWinTrans,thermalZoneOneElement. solRad)
    annotation (Line(points={{27,64},{40,64},{40,23},{43,23}},         color={0,
    0,127}));
  connect(weaBus.TBlaSky, eqAirTemp.TBlaSky) annotation (Line(
      points={{1,300},{-160,300},{-160,-4},{-26,-4}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(weaBus.TDryBul, eqAirTemp.TDryBul) annotation (Line(
      points={{1,300},{-160,300},{-160,-10},{-26,-10}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(weaBus, HDifTil[2].weaBus) annotation (Line(
      points={{1,300},{-160,300},{-160,30},{-68,30}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(weaBus, HDirTil[1].weaBus) annotation (Line(
      points={{1,300},{-160,300},{-160,62},{-68,62}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(weaBus, HDirTil[2].weaBus) annotation (Line(
      points={{1,300},{-160,300},{-160,62},{-68,62}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(weaBus, HDifTil[1].weaBus) annotation (Line(
      points={{1,300},{-160,300},{-160,30},{-68,30}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(minTSet.y, from_degC1.u) annotation (Line(points={{-278,270},{-262,
          270}},                                                                  color={0,0,127}));
  connect(thermalZoneOneElement.ports[1], terUni.port_a2)
    annotation (Line(points={{81.475,-9.95},{86.5,-9.95},{86.5,-42},{-140,-42}}, color={0,127,255}));
  connect(terUni.port_b2, thermalZoneOneElement.ports[2])
    annotation (Line(points={{-160,-42},{-180,-42},{-180,-22},{84.525,-22},{84.525,-9.95}}, color={0,127,255}));
  connect(from_degC1.y, terUni.uSet[1])
    annotation (Line(points={{-238,270},{-200,270},{-200,-46},{-161,-46}},
                                                                         color={0,0,127}));
  connect(disFloHea.Q_flow1Act, Q_flow1Act[1, 1]) annotation (Line(points={{-99,
          -119},{220,-119},{220,280},{320,280}}, color={0,0,127}));
  connect(ports_a1[1], disFloHea.port_a) annotation (Line(points={{-300,0},{-280,
          0},{-280,-110},{-120,-110}}, color={0,127,255}));
  connect(disFloHea.port_b, ports_b1[1]) annotation (Line(points={{-100,-110},{280,
          -110},{280,0},{300,0}}, color={0,127,255}));
  connect(maxTSet.y, from_degC2.u) annotation (Line(points={{-278,230},{-262,
          230}},                                                                  color={0,0,127}));
  connect(from_degC2.y, terUni.uSet[2])
    annotation (Line(points={{-238,230},{-200,230},{-200,-46},{-161,-46}},
                                                                         color={0,0,127}));
  connect(ports_a1[2], disFloCoo.port_a) annotation (Line(points={{-300,0},{-280,
          0},{-280,-150},{-120,-150}}, color={0,127,255}));
  connect(disFloCoo.port_b, ports_b1[2]) annotation (Line(points={{-100,-150},{280,
          -150},{280,0},{300,0}}, color={0,127,255}));
  connect(terUni.m_flow1Req[1], disFloHea.m_flow1Req_i[1]) annotation (Line(
        points={{-139,-44},{-130,-44},{-130,-115},{-121,-115}}, color={0,0,127}));
  connect(terUni.m_flow1Req[2], disFloCoo.m_flow1Req_i[1]) annotation (Line(
        points={{-139,-44},{-130,-44},{-130,-155},{-121,-155}}, color={0,0,127}));
  connect(terUni.ports_b1[1], disFloHea.ports_a1[1]) annotation (Line(points={{-140,
          -56},{-80,-56},{-80,-104},{-100,-104}},     color={0,127,255}));
  connect(disFloHea.ports_b1[1], terUni.ports_a1[1]) annotation (Line(points={{-120,
          -104},{-180,-104},{-180,-56},{-160,-56}},     color={0,127,255}));
  connect(disFloCoo.ports_b1[1], terUni.ports_a1[2]) annotation (Line(points={{-120,
          -144},{-200,-144},{-200,-56},{-160,-56}},     color={0,127,255}));
  connect(disFloCoo.Q_flow1Act, Q_flow1Act[2, 1]) annotation (Line(points={{-99,
          -159},{240,-159},{240,280},{320,280}}, color={0,0,127}));
  connect(terUni.ports_b1[2], disFloCoo.ports_a1[1]) annotation (Line(points={{-140,
          -56},{-100,-56},{-100,-56},{-60,-56},{-60,-144},{-100,-144}},
        color={0,127,255}));
  connect(terUni.PFanPum, PFanPum)
    annotation (Line(points={{-139,-48},{260.5,-48},{260.5,240},{320,240}}, color={0,0,127}));
  annotation (
  Documentation(info="<html>
  <p>
  This is a simplified building model with:
  </p>
  <ul>
  <li> one instance of
  <a href=\"modelica://Buildings.ThermalZones.ReducedOrder.RC.OneElement\">
  Buildings.ThermalZones.ReducedOrder.RC.OneElement</a> providing the temperature of one cooling load and one
  heating load. The required cooling and heating heat flow rates to maintain the maximum and minimum
  temperature setpoints are computed by means of a PI controller;
  </li>
  <li>
  one additional heating load which temperature is computed with
  <a href=\"modelica://Buildings.DistrictEnergySystem.Loads.BaseClasses.FirstOrderODE\">
  Buildings.DistrictEnergySystem.Loads.BaseClasses.FirstOrderODE</a>
  and the required heating heat flow rate is provided by a time function.
  </li>
  </ul>
  <p>
  </p>
  </html>"),
  Diagram(coordinateSystem(extent={{-300,-300},{300,300}})), Icon(
        coordinateSystem(extent={{-100,-100},{100,100}})));
end RCBuildingRefactor;
