within Buildings.district_heating_system_new.Districts;
model DistrictEnergySystem_oneETS
  extends Modelica.Icons.Example;
  // District Parameters
  package MediumW=Buildings.Media.Water
    "Source side medium";
  package MediumA=Buildings.Media.Air
    "Load side medium";

  // Models

      // time series load

      // cooling indirect instance

      // TODO: move these components into a single component
  Buildings.Fluid.Sources.Boundary_pT souChW1(
    redeclare package Medium = MediumW,
    use_T_in=true,
    nPorts=1) "Chilled water supply" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-64,140})));

  constant Integer nBui_disNet_9750fe7b=1;
  parameter Modelica.SIunits.MassFlowRate mDis_flow_nominal_disNet_9750fe7b=heaETS1.mDis_flow_nominal
    "Nominal mass flow rate of the distribution pump";
  parameter Modelica.SIunits.MassFlowRate mCon_flow_nominal_disNet_9750fe7b[
    nBui_disNet_9750fe7b]={heaETS1.mDis_flow_nominal}
    "Nominal mass flow rate in each connection line";
  parameter Modelica.SIunits.PressureDifference dpDis_nominal_disNet_9750fe7b[nBui_disNet_9750fe7b]= {dp_nominal_disNet_9750fe7b}
    "Pressure drop between each connected building at nominal conditions (supply line)";

  parameter Modelica.SIunits.PressureDifference dp_nominal_disNet_9750fe7b=dpSetPoi_disNet_9750fe7b+nBui_disNet_9750fe7b*7000
    "District network pressure drop";
  // NOTE: this differential pressure setpoint is currently utilized by plants elsewhere
  parameter Modelica.SIunits.Pressure dpSetPoi_disNet_9750fe7b=50000
    "Differential pressure setpoint";

      // time series load
  Experimental.DHC.Loads.Examples.BaseClasses.BuildingTimeSeries bui1(
    filNam=
        "modelica://Buildings/Resources/Data/Experimental/DHC/Loads/Examples/SwissResidential_20190916.mos",
    T_aHeaWat_nominal=323.15,
    nPorts_bChiWat=1,
    nPorts_aChiWat=1,
    nPorts_bHeaWat=1,
    nPorts_aHeaWat=1)
    "Building model integrating multiple time series thermal zones."
    annotation (Placement(transformation(extent={{-20,134},{0,154}})));

      // cooling indirect instance
  district_heating_system_new.Substations.HeatingIndirect heaETS1(
    allowFlowReversal1=false,
    allowFlowReversal2=false,
    show_T=true,
    redeclare package Medium = MediumW,
    mDis_flow_nominal=mDis_flow_nominal_5e4fb651,
    mBui_flow_nominal=mBui_flow_nominal_5e4fb651,
    dpValve_nominal=6000,
    dp1_nominal=500,
    dp2_nominal=500,
    use_Q_flow_nominal=true,
    Q_flow_nominal=Q_flow_nominal_5e4fb651,
    T_a1_nominal=55 + 273.15,
    T_a2_nominal=42 + 273.15,
    eta=0.8,
    k=0.1,
    Ti=30,
    yMax=0.7,
    yCon_start=0.7,
    reverseActing=true)
    annotation (Placement(transformation(extent={{-14,80},{6,100}})));

      // TODO: move these components into a single component
  Buildings.Fluid.Sources.Boundary_pT sinChw1(redeclare package Medium =
        MediumW, nPorts=1) "Chilled water sink" annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,140})));

  parameter Modelica.SIunits.MassFlowRate mHW_flow_nominal_heaPla_4f74367f=mBoi_flow_nominal_heaPla_4f74367f*heaPla_4f74367f.numBoi
    "Nominal heating water mass flow rate";
  parameter Modelica.SIunits.MassFlowRate mBoi_flow_nominal_heaPla_4f74367f=QBoi_nominal_heaPla_4f74367f/(4200*heaPla_4f74367f.delT_nominal)
    "Nominal heating water mass flow rate";
  parameter Modelica.SIunits.Power QBoi_nominal_heaPla_4f74367f=Q_flow_nominal_heaPla_4f74367f/heaPla_4f74367f.numBoi
    "Nominal heating capaciaty";
  parameter Modelica.SIunits.HeatFlowRate Q_flow_nominal_heaPla_4f74367f=80000
    "Heating load";
  parameter Modelica.SIunits.PressureDifference dpHW_nominal_heaPla_4f74367f=45000
    "Nominal heating water side pressure";
  parameter Modelica.SIunits.MassFlowRate mMin_flow_heaPla_4f74367f=0.2*mBoi_flow_nominal_heaPla_4f74367f
    "Minimum mass flow rate of single boiler";
  // controls
  parameter Modelica.SIunits.Pressure pumDP=(heaPla_4f74367f.dpBoi_nominal+dpSetPoi_disNet_9750fe7b+50000)
    "Heating water pump pressure drop";
  parameter Modelica.SIunits.Time tWai_heaPla_4f74367f=30
    "Waiting time";
  parameter Buildings.Fluid.Movers.Data.Generic perHWPum_heaPla_4f74367f(
    pressure=Buildings.Fluid.Movers.BaseClasses.Characteristics.flowParameters(
      V_flow=mBoi_flow_nominal_heaPla_4f74367f/1000*{0.1,1.1},
      dp=pumDP*{1.1,0.1}))
    "Performance data for heating water pumps";

  district_heating_system_new.Plants.CentralHeatingPlant heaPla_4f74367f(
    show_T=false,
    perHWPum=perHWPum_heaPla_4f74367f,
    mHW_flow_nominal=mHW_flow_nominal_heaPla_4f74367f,
    QBoi_flow_nominal=QBoi_nominal_heaPla_4f74367f,
    mMin_flow=mMin_flow_heaPla_4f74367f,
    mBoi_flow_nominal=mBoi_flow_nominal_heaPla_4f74367f,
    dpBoi_nominal=10000,
    delT_nominal(displayUnit="degC") = 10,
    tWai=tWai_heaPla_4f74367f,
    dpSetPoi=dpSetPoi_disNet_9750fe7b,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
    "District heating plant."
    annotation (Placement(transformation(extent={{-92,-14},{-58,6}})));
    // TODO: we're currently grabbing dpSetPoi from the Network instance -- need feedback to determine if that's the proper "home" for it

  // Model dependencies

      // TimeSeries + HeatingIndirect Component Definitions
  // TODO: the components below need to be fixed!

  // parameter Modelica.SIunits.TemperatureDifference delTDisCoo_923b34cf=10
  //   "Nominal district supply and return water temperature difference";

  Modelica.Fluid.Sources.FixedBoundary preSou1(
    redeclare package Medium = MediumW,
    use_T=false,
    nPorts=1) "Pressure source" annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,80})));
  // TODO: move THeaWatSet (and its connection) into a CoolingIndirect specific template file (this component does not depend on the coupling)
    //Dehardcode

  Modelica.Blocks.Sources.RealExpression TChWSup1(y=bui1.T_aChiWat_nominal)
    "Chilled water supply temperature"
    annotation (Placement(transformation(extent={{-128,134},{-108,154}})));
      // no component definitions for heating indirect and network 2 pipe

      // TimeSeries + HeatingIndirect Component Definitions
  // TODO: the components below need to be fixed!
  parameter Modelica.SIunits.MassFlowRate mDis_flow_nominal_5e4fb651=bui1.mHeaWat_flow_nominal
    "Nominal mass flow rate of primary (district) district heating side";                                         // .*(TimeSerLoa_3f8ea75c.delTBuiCoo/delTDisCoo_5e4fb651))
  parameter Modelica.SIunits.MassFlowRate mBui_flow_nominal_5e4fb651=bui1.mHeaWat_flow_nominal
    "Nominal mass flow rate of secondary (building) district cooling side";
  // parameter Modelica.SIunits.TemperatureDifference delTDisCoo_5e4fb651=10
  //   "Nominal district supply and return water temperature difference";
  parameter Modelica.SIunits.HeatFlowRate Q_flow_nominal_5e4fb651=(bui1.QHea_flow_nominal);
  // TODO: move THeaWatSet (and its connection) into a CoolingIndirect specific template file (this component does not depend on the coupling)
  Modelica.Blocks.Sources.RealExpression THeaWatSet1(y=50 + 273.15)
    "Secondary loop (Building side) heating water setpoint temperature."
    annotation (Placement(transformation(extent={{-120,90},{-100,110}})));
    //Dehardcode

      // no component definitions for heating indirect and network 2 pipe

      Buildings.Fluid.Sensors.TemperatureTwoPort senTDisSup_efb90af4(
    redeclare final package Medium=MediumW,
    final m_flow_nominal=mHW_flow_nominal_heaPla_4f74367f)
    "District-side (primary) supply temperature sensor"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=0, origin={-40,-28})));
  // TODO: This should not be here, it is entirely plant specific and should be moved elsewhere
  // but since it requires a connect statement we must put it here for now...
  Modelica.Blocks.Sources.BooleanConstant on(k=true) "HeaPlaOn"
    annotation (Placement(transformation(extent={{-134,10},{-114,30}})));
  // TODO: This should not be here, it is entirely plant specific and should be moved elsewhere
  // but since it requires a connect statement we must put it here for now...
  Modelica.Blocks.Sources.RealExpression TDisSetHeaWat_efb90af4(each y=55 +
        273.15)
    "Distrcit side heating water supply temperature set point."
    annotation (Placement(transformation(extent={{-132,-28},{-112,-8}})));

  Fluid.Sensors.RelativePressure senRelPre(redeclare final package Medium =
        MediumW)
    "Relative pressure sensor"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=-90,origin={-52,50})));
equation
  // Connections

      // cooling indirect, timeseries coupling connection

      // spawn, ets cold water stub connections

      // heating indirect and network 2 pipe

      // cooling indirect, timeseries coupling connections
  connect(THeaWatSet1.y, heaETS1.TSetBuiSup) annotation (Line(points={{-99,100},
          {-72,100},{-72,90},{-16,90}}, color={0,0,127}));

      // spawn, ets cold water stub connections

      // heating indirect and network 2 pipe

  connect(on.y, heaPla_4f74367f.on) annotation (Line(points={{-113,20},{-98,20},
          {-98,3.77778},{-89.7333,3.77778}}, color={255,0,255}));

  connect(bui1.ports_bChiWat[1], sinChw1.ports[1]) annotation (Line(points={{0,138},
          {34,138},{34,140},{60,140}}, color={0,127,255}));
  connect(souChW1.ports[1], bui1.ports_aChiWat[1]) annotation (Line(points={{-54,140},
          {-36,140},{-36,138},{-20,138}},      color={0,127,255}));
  connect(souChW1.T_in, TChWSup1.y)
    annotation (Line(points={{-76,144},{-107,144}}, color={0,0,127}));
  connect(bui1.ports_bHeaWat[1], heaETS1.port_a2) annotation (Line(points={{0,142},
          {22,142},{22,84},{6,84}}, color={0,127,255}));
  connect(heaETS1.port_b2, bui1.ports_aHeaWat[1]) annotation (Line(points={{-14,84},
          {-34,84},{-34,142},{-20,142}},     color={0,127,255}));
  connect(TDisSetHeaWat_efb90af4.y, heaPla_4f74367f.THeaSet) annotation (Line(
        points={{-111,-18},{-96.5,-18},{-96.5,-14.4444},{-89.7333,-14.4444}},
                                                                   color={0,0,127}));
  connect(heaPla_4f74367f.port_b, senTDisSup_efb90af4.port_a) annotation (Line(
        points={{-64.8,-10.6667},{-54,-10.6667},{-54,-28},{-50,-28}},
                                                        color={0,127,255}));
  connect(preSou1.ports[1], heaETS1.port_b2)
    annotation (Line(points={{60,80},{-14,80},{-14,84}}, color={0,127,255}));
  connect(heaPla_4f74367f.port_a, heaETS1.port_b1) annotation (Line(points={{-64.8,
          0.444444},{-52,0.444444},{-52,0},{14,0},{14,96},{6,96}}, color={0,127,
          255}));
  connect(heaETS1.port_a1, senTDisSup_efb90af4.port_b) annotation (Line(points={
          {-14,96},{-14,-28},{-30,-28}}, color={0,127,255}));
  connect(senRelPre.p_rel, heaPla_4f74367f.dpMea) annotation (Line(points={{-61,50},
          {-146,50},{-146,-8.44444},{-89.7333,-8.44444}},     color={0,0,127}));
  connect(senRelPre.port_a, heaETS1.port_a1)
    annotation (Line(points={{-52,60},{-52,96},{-14,96}}, color={0,127,255}));
  connect(heaETS1.port_b1, senRelPre.port_b) annotation (Line(points={{6,96},{14,
          96},{14,24},{-52,24},{-52,40}}, color={0,127,255}));
  annotation (
    experiment(
      StopTime=3600,
      Tolerance=1e-06), Diagram(coordinateSystem(extent={{-160,-100},{100,200}})));
end DistrictEnergySystem_oneETS;
