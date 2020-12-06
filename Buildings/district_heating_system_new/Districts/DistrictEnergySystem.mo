within Buildings.district_heating_system_new.Districts;
model DistrictEnergySystem
  extends Modelica.Icons.Example;
  // District Parameters
  package MediumW=Buildings.Media.Water
    "Source side medium";
  package MediumA=Buildings.Media.Air
    "Load side medium";

  // Models

      // time series load
  Experimental.DHC.Loads.Examples.BaseClasses.BuildingTimeSeriesHE     bui2(
    filNam=
        "modelica://Buildings/Resources/Data/Experimental/DHC/Loads/Examples/SwissResidential_20190916.mos",
    T_aHeaWat_nominal=323.15,
    delTAirCoo=6,
    delTAirHea=20,
    nPorts_aChiWat=1,
    nPorts_bHeaWat=1,
    nPorts_aHeaWat=1,
    nPorts_bChiWat=1)
    "Building model integrating multiple time series thermal zones."
    annotation (Placement(transformation(extent={{-20,120},{0,140}})));

      // cooling indirect instance
  district_heating_system_new.Substations.HeatingIndirect heaETS2(
    allowFlowReversal1=false,
    allowFlowReversal2=false,
    show_T=true,
    redeclare package Medium = MediumW,
    mDis_flow_nominal=mDis_flow_nominal_923b34cf,
    mBui_flow_nominal=mBui_flow_nominal_923b34cf,
    dpValve_nominal=6000,
    dp1_nominal=500,
    dp2_nominal=500,
    use_Q_flow_nominal=true,
    Q_flow_nominal=Q_flow_nominal_923b34cf,
    T_a1_nominal=57 + 273.15,
    T_a2_nominal=45 + 273.15,
    eta=0.8,
    k=0.1,
    Ti=30,
    yMax=1,
    yCon_start=1,
    reverseActing=true)
    annotation (Placement(transformation(extent={{-20,50},{0,70}})));

      // TODO: move these components into a single component
  Buildings.Fluid.Sources.Boundary_pT souChW1(
    redeclare package Medium = MediumW,
    use_T_in=true,
    nPorts=1) "Chilled water supply" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,170})));
  Buildings.Fluid.Sources.Boundary_pT sinChw2(redeclare package Medium =
        MediumW, nPorts=1)
                 "Chilled water sink" annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,128})));

    constant Integer nBui_disNet_9750fe7b=2;
  parameter Modelica.SIunits.MassFlowRate mDis_flow_nominal_disNet_9750fe7b=sum(
       {heaETS2.mDis_flow_nominal,heaETS1.mDis_flow_nominal})
    "Nominal mass flow rate of the distribution pump";
  parameter Modelica.SIunits.MassFlowRate mCon_flow_nominal_disNet_9750fe7b[
    nBui_disNet_9750fe7b]={heaETS2.mDis_flow_nominal,heaETS1.mDis_flow_nominal}
    "Nominal mass flow rate in each connection line";
  parameter Modelica.SIunits.PressureDifference dpDis_nominal_disNet_9750fe7b[nBui_disNet_9750fe7b](
    each min=0,
    each displayUnit="Pa")=1/2 .* cat(
    1,
    {dp_nominal_disNet_9750fe7b*0.1},
    fill(
      dp_nominal_disNet_9750fe7b*0.9/(nBui_disNet_9750fe7b-1),
      nBui_disNet_9750fe7b-1))
    "Pressure drop between each connected building at nominal conditions (supply line)";
  parameter Modelica.SIunits.PressureDifference dp_nominal_disNet_9750fe7b=dpSetPoi_disNet_9750fe7b+nBui_disNet_9750fe7b*7000
    "District network pressure drop";
  // NOTE: this differential pressure setpoint is currently utilized by plants elsewhere
  parameter Modelica.SIunits.Pressure dpSetPoi_disNet_9750fe7b=30000
    "Differential pressure setpoint";

  Buildings.Experimental.DHC.Loads.Validation.BaseClasses.Distribution2Pipe disNet_9750fe7b(
    redeclare final package Medium=MediumW,
    final nCon=nBui_disNet_9750fe7b,
    iConDpSen=2,
    final mDis_flow_nominal=1.1*mDis_flow_nominal_disNet_9750fe7b,
    final mCon_flow_nominal=mCon_flow_nominal_disNet_9750fe7b,
    final allowFlowReversal=false,
    dpDis_nominal=dpDis_nominal_disNet_9750fe7b)
    "Distribution network."
    annotation (Placement(transformation(extent={{-18,-16},{10,-4}})));

      // time series load
  Experimental.DHC.Loads.Examples.BaseClasses.BuildingTimeSeriesHE bui1(
    filNam=
        "modelica://Buildings/Resources/Data/Experimental/DHC/Loads/Examples/SwissResidential_20190916.mos",
    T_aHeaWat_nominal=323.15,
    delTAirCoo=6,
    delTAirHea=20,
    nPorts_bChiWat=1,
    nPorts_aChiWat=1,
    nPorts_bHeaWat=1,
    nPorts_aHeaWat=1)
    "Building model integrating multiple time series thermal zones."
    annotation (Placement(transformation(extent={{-20,162},{0,182}})));

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
    T_a1_nominal=57 + 273.15,
    T_a2_nominal=44 + 273.15,
    eta=0.8,
    k=0.1,
    Ti=30,
    yMax=0.8,
    yCon_start=0.80,
    reverseActing=true)
    annotation (Placement(transformation(extent={{-20,80},{0,100}})));

      // TODO: move these components into a single component
  Buildings.Fluid.Sources.Boundary_pT souChW2(
    redeclare package Medium = MediumW,
    use_T_in=true,
    nPorts=1) "Chilled water supply" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,130})));
  Buildings.Fluid.Sources.Boundary_pT sinChw1(redeclare package Medium =
        MediumW, nPorts=1) "Chilled water sink" annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,168})));

  parameter Modelica.SIunits.MassFlowRate mHW_flow_nominal_heaPla_4f74367f=mBoi_flow_nominal_heaPla_4f74367f*heaPla_4f74367f.numBoi
    "Nominal heating water mass flow rate";
  parameter Modelica.SIunits.MassFlowRate mBoi_flow_nominal_heaPla_4f74367f=QBoi_nominal_heaPla_4f74367f/(4200*heaPla_4f74367f.delT_nominal)
    "Nominal heating water mass flow rate";
  parameter Modelica.SIunits.Power QBoi_nominal_heaPla_4f74367f=Q_flow_nominal_heaPla_4f74367f/heaPla_4f74367f.numBoi
    "Nominal heating capaciaty";
  parameter Modelica.SIunits.HeatFlowRate Q_flow_nominal_heaPla_4f74367f=1.2* sum({bui1.QHea_flow_nominal,bui2.QHea_flow_nominal})
    "Heating load";
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
    delT_nominal(displayUnit="degC") = 5,
    tWai=tWai_heaPla_4f74367f,
    dpSetPoi=dpSetPoi_disNet_9750fe7b,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
    "District heating plant."
    annotation (Placement(transformation(extent={{-92,-14},{-70,0}})));
    // TODO: we're currently grabbing dpSetPoi from the Network instance -- need feedback to determine if that's the proper "home" for it

  // Model dependencies

      // TimeSeries + HeatingIndirect Component Definitions
  // TODO: the components below need to be fixed!
  parameter Modelica.SIunits.MassFlowRate mDis_flow_nominal_923b34cf=bui2.mHeaWat_flow_nominal
    "Nominal mass flow rate of primary (district) district heating side";                                         // .*(TimeSerLoa_57d02d29.delTBuiCoo/delTDisCoo_923b34cf))
  parameter Modelica.SIunits.MassFlowRate mBui_flow_nominal_923b34cf=bui2.mHeaWat_flow_nominal
    "Nominal mass flow rate of secondary (building) district cooling side";
  // parameter Modelica.SIunits.TemperatureDifference delTDisCoo_923b34cf=10
  //   "Nominal district supply and return water temperature difference";
  parameter Modelica.SIunits.HeatFlowRate Q_flow_nominal_923b34cf=(bui2.QHea_flow_nominal);
  Modelica.Fluid.Sources.FixedBoundary preSou1(
    redeclare package Medium = MediumW,
    use_T=false,
    nPorts=1) "Pressure source" annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,80})));
  // TODO: move THeaWatSet (and its connection) into a CoolingIndirect specific template file (this component does not depend on the coupling)
  Modelica.Blocks.Sources.RealExpression THeaWatSet2(y=50 + 273.15)
    "Secondary loop (Building side) heating water setpoint temperature."
    annotation (Placement(transformation(extent={{-100,60},{-80,80}})));
    //Dehardcode

  Modelica.Blocks.Sources.RealExpression TChWSup1(y=bui1.T_aChiWat_nominal)
    "Chilled water supply temperature"
    annotation (Placement(transformation(extent={{-128,162},{-108,182}})));
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
  Modelica.Fluid.Sources.FixedBoundary preSou2(
    redeclare package Medium = MediumW,
    use_T=false,
    nPorts=1) "Pressure source" annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,40})));
  // TODO: move THeaWatSet (and its connection) into a CoolingIndirect specific template file (this component does not depend on the coupling)
  Modelica.Blocks.Sources.RealExpression THeaWatSet1(y=50 + 273.15)
    "Secondary loop (Building side) heating water setpoint temperature."
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    //Dehardcode

  Modelica.Blocks.Sources.RealExpression TChWSup2(y=bui2.T_aChiWat_nominal)
    "Chilled water supply temperature"
    annotation (Placement(transformation(extent={{-128,120},{-108,140}})));

      // no component definitions for heating indirect and network 2 pipe

      Buildings.Fluid.Sensors.TemperatureTwoPort senTDisSup_efb90af4(
    redeclare final package Medium=MediumW,
    final m_flow_nominal=mHW_flow_nominal_heaPla_4f74367f)
    "District-side (primary) supply temperature sensor"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=0, origin={-40,-28})));
  // TODO: This should not be here, it is entirely plant specific and should be moved elsewhere
  // but since it requires a connect statement we must put it here for now...
  Modelica.Blocks.Sources.BooleanConstant boi_On(k=true)
    "Total heating water pump mass flow rate"
    annotation (Placement(transformation(extent={{-134,10},{-114,30}})));
  // TODO: This should not be here, it is entirely plant specific and should be moved elsewhere
  // but since it requires a connect statement we must put it here for now...
  Modelica.Blocks.Sources.RealExpression TDisSetHeaWat_efb90af4(each y=57 + 273.15)
    "Distrcit side heating water supply temperature set point."
    annotation (Placement(transformation(extent={{-132,-28},{-112,-8}})));

equation
  // Connections

      // cooling indirect, timeseries coupling connection
  connect(THeaWatSet2.y, heaETS2.TSetBuiSup) annotation (Line(points={{-79,70},{
          -72,70},{-72,60},{-22,60}}, color={0,0,127}));

      // spawn, ets cold water stub connections

      // heating indirect and network 2 pipe

      // cooling indirect, timeseries coupling connections
  connect(THeaWatSet1.y, heaETS1.TSetBuiSup) annotation (Line(points={{-79,90},{
          -22,90}},                     color={0,0,127}));

      // spawn, ets cold water stub connections

      // heating indirect and network 2 pipe

  connect(boi_On.y, heaPla_4f74367f.on) annotation (Line(points={{-113,20},{-98,
          20},{-98,-1.55556},{-90.5333,-1.55556}}, color={255,0,255}));

  connect(bui1.ports_bChiWat[1], sinChw1.ports[1]) annotation (Line(points={{0,166},
          {34,166},{34,168},{60,168}}, color={0,127,255}));
  connect(souChW1.ports[1], bui1.ports_aChiWat[1]) annotation (Line(points={{-60,170},
          {-48,170},{-48,166},{-20,166}},      color={0,127,255}));
  connect(souChW2.ports[1], bui2.ports_aChiWat[1]) annotation (Line(points={{-60,130},
          {-46,130},{-46,124},{-20,124}},      color={0,127,255}));
  connect(souChW1.T_in, TChWSup1.y)
    annotation (Line(points={{-82,174},{-96,174},{-96,172},{-107,172}},
                                                    color={0,0,127}));
  connect(souChW2.T_in, TChWSup2.y)
    annotation (Line(points={{-82,134},{-94,134},{-94,130},{-107,130}},
                                                    color={0,0,127}));
  connect(bui1.ports_bHeaWat[1], heaETS1.port_a2) annotation (Line(points={{0,170},
          {22,170},{22,84},{0,84}}, color={0,127,255}));
  connect(heaETS1.port_b2, bui1.ports_aHeaWat[1]) annotation (Line(points={{-20,
          84},{-34,84},{-34,170},{-20,170}}, color={0,127,255}));
  connect(bui2.ports_bHeaWat[1], heaETS2.port_a2) annotation (Line(points={{0,128},
          {18,128},{18,54},{0,54}}, color={0,127,255}));
  connect(bui2.ports_aHeaWat[1], heaETS2.port_b2) annotation (Line(points={{-20,
          128},{-42,128},{-42,54},{-20,54}}, color={0,127,255}));
  connect(heaPla_4f74367f.port_a, disNet_9750fe7b.port_bDisRet) annotation (
      Line(points={{-74.4,-3.88889},{-28,-3.88889},{-28,-13.6},{-18,-13.6}},
                                                             color={0,127,255}));
  connect(disNet_9750fe7b.dp, heaPla_4f74367f.dpMea) annotation (Line(points={{10.7,
          -8.2},{26,-8.2},{26,-48},{-110,-48},{-110,-10.1111},{-90.5333,
          -10.1111}},          color={0,0,127}));
  connect(TDisSetHeaWat_efb90af4.y, heaPla_4f74367f.THeaSet) annotation (Line(
        points={{-111,-18},{-96.5,-18},{-96.5,-14.3111},{-90.5333,-14.3111}},
                                                                   color={0,0,127}));
  connect(heaPla_4f74367f.port_b, senTDisSup_efb90af4.port_a) annotation (Line(
        points={{-74.4,-11.6667},{-54,-11.6667},{-54,-28},{-50,-28}},
                                                        color={0,127,255}));
  connect(senTDisSup_efb90af4.port_b, disNet_9750fe7b.port_aDisSup) annotation (
     Line(points={{-30,-28},{-24,-28},{-24,-10},{-18,-10}}, color={0,127,255}));
  connect(heaETS2.port_b2, preSou2.ports[1])
    annotation (Line(points={{-20,54},{-20,40},{60,40}}, color={0,127,255}));
  connect(preSou1.ports[1], heaETS1.port_b2)
    annotation (Line(points={{60,80},{-20,80},{-20,84}}, color={0,127,255}));
  connect(bui2.ports_bChiWat[1], sinChw2.ports[1]) annotation (Line(points={{0,124},
          {30,124},{30,128},{60,128}}, color={0,127,255}));
  connect(disNet_9750fe7b.ports_bCon[1], heaETS1.port_a1) annotation (Line(
        points={{-9.6,-4},{-12,-4},{-12,14},{-28,14},{-28,96},{-20,96}}, color={
          0,127,255}));
  connect(heaETS1.port_b1, disNet_9750fe7b.ports_aCon[1]) annotation (Line(
        points={{0,96},{12,96},{12,10},{7.2,10},{7.2,-4}}, color={0,127,255}));
  connect(heaETS2.port_a1, disNet_9750fe7b.ports_bCon[2]) annotation (Line(
        points={{-20,66},{-30,66},{-30,10},{-15.2,10},{-15.2,-4}}, color={0,127,
          255}));
  connect(heaETS2.port_b1, disNet_9750fe7b.ports_aCon[2]) annotation (Line(
        points={{0,66},{12,66},{12,14},{1.6,14},{1.6,-4}}, color={0,127,255}));
    // ,
  annotation (
    experiment(
      StopTime=86400,
      __Dymola_Algorithm="Cvode",
      Tolerance=1e-06), Diagram(coordinateSystem(extent={{-160,-100},{100,200}})));
end DistrictEnergySystem;
