within Buildings.district_heating_system_new.Districts;
model DistrictEnergySystem_1
  extends Modelica.Icons.Example;
  // District Parameters
  package MediumW=Buildings.Media.Water
    "Source side medium";
  package MediumA=Buildings.Media.Air
    "Load side medium";

  // Models

      // time series load
  district_heating_system_new.Loads.B5a6b99ec37f4de7f94020090.building bui1(
    filNam="modelica://Buildings/Resources/Data/Experimental/DHC/Loads/Examples/SwissResidential_20190916.mos",
    have_pum=true,
    T_aHeaWat_nominal=323.15,
    delTBuiCoo=5,
    nPorts_aChiWat=1,
    nPorts_bHeaWat=1,
    nPorts_aHeaWat=1,
    nPorts_bChiWat=1)
    "Building model integrating multiple time series thermal zones."
    annotation (Placement(transformation(extent={{-20,120},{0,140}})));
  district_heating_system_new.Loads.B5a6b99ec37f4de7f94020090.building bui2(
    filNam="modelica://Buildings/Resources/Data/Experimental/DHC/Loads/Examples/SwissResidential_20190916.mos",
    have_pum=true,
    T_aHeaWat_nominal=323.15,
    delTBuiCoo=5,
    nPorts_bChiWat=1,
    nPorts_aChiWat=1,
    nPorts_bHeaWat=1,
    nPorts_aHeaWat=1)
    "Building model integrating multiple time series thermal zones."
    annotation (Placement(transformation(extent={{-20,162},{0,182}})));

  district_heating_system_new.Loads.B5a6b99ec37f4de7f94020090.building bui3(
    filNam="modelica://Buildings/Resources/Data/Experimental/DHC/Loads/Examples/SwissResidential_20190916.mos",
    have_pum=true,
    T_aHeaWat_nominal=323.15,
    delTBuiCoo=5,
    nPorts_bChiWat=1,
    nPorts_aChiWat=1,
    nPorts_bHeaWat=1,
    nPorts_aHeaWat=1)
    "Building model integrating multiple time series thermal zones."
    annotation (Placement(transformation(extent={{-22,296},{-2,316}})));

  district_heating_system_new.Loads.B5a6b99ec37f4de7f94020090.building bui4(
    filNam="modelica://Buildings/Resources/Data/Experimental/DHC/Loads/Examples/SwissResidential_20190916.mos",
    have_pum=true,
    T_aHeaWat_nominal=323.15,
    delTBuiCoo=5,
    nPorts_bChiWat=1,
    nPorts_aChiWat=1,
    nPorts_bHeaWat=1,
    nPorts_aHeaWat=1)
    "Building model integrating multiple time series thermal zones."
    annotation (Placement(transformation(extent={{-26,456},{-6,476}})));

  district_heating_system_new.Loads.B5a6b99ec37f4de7f94020090.building bui5(
        filNam="modelica://Buildings/Resources/Data/Experimental/DHC/Loads/Examples/SwissResidential_20190916.mos",
        have_pum=true,
        T_aHeaWat_nominal=323.15,
        delTBuiCoo=5,
        nPorts_bChiWat=1,
        nPorts_aChiWat=1,
        nPorts_bHeaWat=1,
        nPorts_aHeaWat=1)
        "Building model integrating multiple time series thermal zones."
        annotation (Placement(transformation(extent={{-32,604},{-12,624}})));

  Loads.B5a6b99ec37f4de7f94020090.building bui6(
    filNam="modelica://Buildings/Resources/Data/Experimental/DHC/Loads/Examples/SwissResidential_20190916.mos",
    have_pum=true,
    T_aHeaWat_nominal=323.15,
    delTBuiCoo=5,
    nPorts_bChiWat=1,
    nPorts_aChiWat=1,
    nPorts_bHeaWat=1,
    nPorts_aHeaWat=1)
    "Building model integrating multiple time series thermal zones."
     annotation (Placement(transformation(extent={{-24,744},{-4,764}})));

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
    T_a1_nominal=56 + 273.15,
    T_a2_nominal=42 + 273.15,
    k=0.5,
    Ti=30,
    reverseActing=true)
    annotation (Placement(transformation(extent={{-20,80},{0,100}})));
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
    T_a1_nominal=56 + 273.15,
    T_a2_nominal=42 + 273.15,
    k=0.5,
    Ti=30,
    reverseActing=true)
    annotation (Placement(transformation(extent={{-20,50},{0,70}})));
  district_heating_system_new.Substations.HeatingIndirect heaETS3(
    allowFlowReversal1=false,
    allowFlowReversal2=false,
    show_T=true,
    redeclare package Medium = MediumW,
    mDis_flow_nominal=mDis_flow_nominal_3,
    mBui_flow_nominal=mBui_flow_nominal_3,
    dpValve_nominal=6000,
    dp1_nominal=500,
    dp2_nominal=500,
    use_Q_flow_nominal=true,
    Q_flow_nominal=Q_flow_nominal_3,
    T_a1_nominal=56 + 273.15,
    T_a2_nominal=42 + 273.15,
    k=0.5,
    Ti=30,
    reverseActing=true)
    annotation (Placement(transformation(extent={{-22,236},{-2,256}})));

  district_heating_system_new.Substations.HeatingIndirect heaETS4(
    allowFlowReversal1=false,
    allowFlowReversal2=false,
    show_T=true,
    redeclare package Medium = MediumW,
    mDis_flow_nominal=mDis_flow_nominal_4,
    mBui_flow_nominal=mBui_flow_nominal_4,
    dpValve_nominal=6000,
    dp1_nominal=500,
    dp2_nominal=500,
    use_Q_flow_nominal=true,
    Q_flow_nominal=Q_flow_nominal_4,
    T_a1_nominal=56 + 273.15,
    T_a2_nominal=42 + 273.15,
    k=0.5,
    Ti=30,
    reverseActing=true)
    annotation (Placement(transformation(extent={{-26,374},{-6,394}})));

  district_heating_system_new.Substations.HeatingIndirect heaETS5(
    allowFlowReversal1=false,
    allowFlowReversal2=false,
    show_T=true,
    redeclare package Medium = MediumW,
    mDis_flow_nominal=mDis_flow_nominal_5,
    mBui_flow_nominal=mBui_flow_nominal_5,
    dpValve_nominal=6000,
    dp1_nominal=500,
    dp2_nominal=500,
    use_Q_flow_nominal=true,
    Q_flow_nominal=Q_flow_nominal_5,
    T_a1_nominal=56 + 273.15,
    T_a2_nominal=42 + 273.15,
    k=0.5,
    Ti=30,
    reverseActing=true)
    annotation (Placement(transformation(extent={{-32,522},{-12,542}})));
  district_heating_system_new.Substations.HeatingIndirect heaETS6(
    allowFlowReversal1=false,
    allowFlowReversal2=false,
    show_T=true,
    redeclare package Medium = MediumW,
    mDis_flow_nominal=mDis_flow_nominal_6,
    mBui_flow_nominal=mBui_flow_nominal_6,
    dpValve_nominal=6000,
    dp1_nominal=500,
    dp2_nominal=500,
    use_Q_flow_nominal=true,
    Q_flow_nominal=Q_flow_nominal_6,
    T_a1_nominal=56 + 273.15,
    T_a2_nominal=42 + 273.15,
    k=0.5,
    Ti=30,
    reverseActing=true)
    annotation (Placement(transformation(extent={{-30,664},{-10,684}})));

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

    constant Integer nBui_disNet_9750fe7b=6;
  parameter Modelica.SIunits.MassFlowRate mDis_flow_nominal_disNet_9750fe7b=sum(
                           {heaETS1.mDis_flow_nominal,
                            heaETS2.mDis_flow_nominal,
                            heaETS3.mDis_flow_nominal,
                            heaETS4.mDis_flow_nominal,
                            heaETS5.mDis_flow_nominal,
                            heaETS6.mDis_flow_nominal})
    "Nominal mass flow rate of the distribution pump";
  parameter Modelica.SIunits.MassFlowRate mCon_flow_nominal_disNet_9750fe7b[
    nBui_disNet_9750fe7b]={ heaETS1.mDis_flow_nominal,
                            heaETS2.mDis_flow_nominal,
                            heaETS3.mDis_flow_nominal,
                            heaETS4.mDis_flow_nominal,
                            heaETS5.mDis_flow_nominal,
                            heaETS6.mDis_flow_nominal}
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
  parameter Modelica.SIunits.Pressure dpSetPoi_disNet_9750fe7b=50000
    "Differential pressure setpoint";

  Buildings.Experimental.DHC.Loads.Validation.BaseClasses.Distribution2Pipe disNet(
    redeclare final package Medium = MediumW,
    final nCon=nBui_disNet_9750fe7b,
    final mDis_flow_nominal=mDis_flow_nominal_disNet_9750fe7b,
    final mCon_flow_nominal=mCon_flow_nominal_disNet_9750fe7b,
    final allowFlowReversal=false,
    dpDis_nominal=dpDis_nominal_disNet_9750fe7b) "Distribution network."
    annotation (Placement(transformation(extent={{-18,-16},{10,-4}})));

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
  parameter Modelica.SIunits.HeatFlowRate Q_flow_nominal_heaPla_4f74367f= 1.2*sum({bui1.QHea_flow_nominal,
                                                                                  bui2.QHea_flow_nominal,
                                                                                  bui3.QHea_flow_nominal,
                                                                                  bui4.QHea_flow_nominal,
                                                                                  bui5.QHea_flow_nominal,
                                                                                  bui6.QHea_flow_nominal})
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
    perHWPum=perHWPum_heaPla_4f74367f,
    mHW_flow_nominal=mHW_flow_nominal_heaPla_4f74367f,
    dpHW_nominal=dpHW_nominal_heaPla_4f74367f,
    QBoi_flow_nominal=QBoi_nominal_heaPla_4f74367f,
    mMin_flow=mMin_flow_heaPla_4f74367f,
    mBoi_flow_nominal=mBoi_flow_nominal_heaPla_4f74367f,
    dpBoi_nominal=10000,
    delT_nominal(displayUnit="degC") = 10,
    tWai=tWai_heaPla_4f74367f,
    dpSetPoi=dpSetPoi_disNet_9750fe7b,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
    "District heating plant."
    annotation (Placement(transformation(extent={{-92,-14},{-72,6}})));
    // TODO: we're currently grabbing dpSetPoi from the Network instance -- need feedback to determine if that's the proper "home" for it

  // Model dependencies

  // TimeSeries + HeatingIndirect Component Definitions
  // TODO: the components below need to be fixed!
  parameter Modelica.SIunits.MassFlowRate mDis_flow_nominal_923b34cf=bui1.disFloHea.m_flow_nominal
    "Nominal mass flow rate of primary (district) district heating side";
  parameter Modelica.SIunits.MassFlowRate mBui_flow_nominal_923b34cf=bui1.disFloHea.m_flow_nominal
    "Nominal mass flow rate of secondary (building) district cooling side";
  parameter Modelica.SIunits.MassFlowRate mDis_flow_nominal_3=bui3.disFloHea.m_flow_nominal
    "Nominal mass flow rate of primary (district) district heating side";
  parameter Modelica.SIunits.MassFlowRate mDis_flow_nominal_4=bui4.disFloHea.m_flow_nominal
    "Nominal mass flow rate of primary (district) district heating side";
  parameter Modelica.SIunits.MassFlowRate mDis_flow_nominal_5=bui5.disFloHea.m_flow_nominal
    "Nominal mass flow rate of primary (district) district heating side";
   parameter Modelica.SIunits.MassFlowRate mDis_flow_nominal_6=bui6.disFloHea.m_flow_nominal
    "Nominal mass flow rate of primary (district) district heating side";
  // parameter Modelica.SIunits.TemperatureDifference delTDisCoo_923b34cf=10
  //   "Nominal district supply and return water temperature difference";
  parameter Modelica.SIunits.MassFlowRate mDis_flow_nominal_5e4fb651=bui2.disFloHea.m_flow_nominal
    "Nominal mass flow rate of primary (district) district heating side";
  parameter Modelica.SIunits.MassFlowRate mBui_flow_nominal_5e4fb651=bui2.disFloHea.m_flow_nominal
    "Nominal mass flow rate of secondary (building) district cooling side";
  parameter Modelica.SIunits.MassFlowRate mBui_flow_nominal_3=bui3.disFloHea.m_flow_nominal
    "Nominal mass flow rate of secondary (building) district cooling side";
  parameter Modelica.SIunits.MassFlowRate mBui_flow_nominal_4=bui4.disFloHea.m_flow_nominal
    "Nominal mass flow rate of secondary (building) district cooling side";
  parameter Modelica.SIunits.MassFlowRate mBui_flow_nominal_5=bui5.disFloHea.m_flow_nominal
    "Nominal mass flow rate of secondary (building) district cooling side";
   parameter Modelica.SIunits.MassFlowRate mBui_flow_nominal_6=bui6.disFloHea.m_flow_nominal
    "Nominal mass flow rate of secondary (building) district cooling side";
  parameter Modelica.SIunits.HeatFlowRate Q_flow_nominal_5e4fb651=(bui2.QHea_flow_nominal);
  parameter Modelica.SIunits.HeatFlowRate Q_flow_nominal_923b34cf=(bui1.QHea_flow_nominal);
  parameter Modelica.SIunits.HeatFlowRate Q_flow_nominal_3=(bui3.QHea_flow_nominal);
  parameter Modelica.SIunits.HeatFlowRate Q_flow_nominal_4=(bui4.QHea_flow_nominal);
  parameter Modelica.SIunits.HeatFlowRate Q_flow_nominal_5=(bui5.QHea_flow_nominal);
  parameter Modelica.SIunits.HeatFlowRate Q_flow_nominal_6=(bui6.QHea_flow_nominal);

  // TODO: move THeaWatSet (and its connection) into a CoolingIndirect specific template file (this component does not depend on the coupling)
  Modelica.Blocks.Sources.RealExpression THeaWatSet2(y=50 + 273.15)
    "Secondary loop (Building side) heating water setpoint temperature."
    annotation (Placement(transformation(extent={{-140,40},{-120,60}})));
    //Dehardcode

  Modelica.Blocks.Sources.RealExpression TChWSup1(y=bui1.terUniCoo.T_aChiWat_nominal)
    "Chilled water supply temperature"
    annotation (Placement(transformation(extent={{-140,160},{-120,180}})));
      // no component definitions for heating indirect and network 2 pipe

      // TimeSeries + HeatingIndirect Component Definitions
  // TODO: the components below need to be fixed!

  // TODO: move THeaWatSet (and its connection) into a CoolingIndirect specific template file (this component does not depend on the coupling)
  Modelica.Blocks.Sources.RealExpression THeaWatSet1(y=50 + 273.15)
    "Secondary loop (Building side) heating water setpoint temperature."
    annotation (Placement(transformation(extent={{-140,80},{-120,100}})));
    //Dehardcode

  Modelica.Blocks.Sources.RealExpression TChWSup2(y=bui2.terUniCoo.T_aChiWat_nominal)
    "Chilled water supply temperature"
    annotation (Placement(transformation(extent={{-140,120},{-120,140}})));

      // no component definitions for heating indirect and network 2 pipe

      Buildings.Fluid.Sensors.TemperatureTwoPort senTDisSup_efb90af4(
    redeclare final package Medium=MediumW,
    final m_flow_nominal=mHW_flow_nominal_heaPla_4f74367f)
    "District-side (primary) supply temperature sensor"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=0, origin={-40,-28})));
  // TODO: This should not be here, it is entirely plant specific and should be moved elsewhere
  // but since it requires a connect statement we must put it here for now...
  Modelica.Blocks.Sources.BooleanConstant mPum_flow_efb90af4(
    k=true)
    "Total heating water pump mass flow rate"
    annotation (Placement(transformation(extent={{-140,10},{-120,30}})));
  // TODO: This should not be here, it is entirely plant specific and should be moved elsewhere
  // but since it requires a connect statement we must put it here for now...
  Modelica.Blocks.Sources.RealExpression TDisSetHeaWat_efb90af4(
    each y=55+273.15)
    "Distrcit side heating water supply temperature set point."
    annotation (Placement(transformation(extent={{-140,-40},{-120,-20}})));

  Fluid.Sources.Boundary_pT           souChW3(
    redeclare package Medium = MediumW,
    use_T_in=true,
    nPorts=1) "Chilled water supply" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,310})));

  Fluid.Sources.Boundary_pT           sinChw3(redeclare package Medium =
        MediumW, nPorts=1) "Chilled water sink" annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,310})));
  Modelica.Blocks.Sources.RealExpression TChWSup3(y=bui3.terUniCoo.T_aChiWat_nominal)
    "Chilled water supply temperature"
    annotation (Placement(transformation(extent={{-142,300},{-122,320}})));

  Fluid.Sources.Boundary_pT  souChW4(
    redeclare package Medium = MediumW,
    use_T_in=true,
    nPorts=1) "Chilled water supply" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,470})));

  Fluid.Sources.Boundary_pT sinChw4(redeclare package Medium =
        MediumW, nPorts=1) "Chilled water sink" annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,470})));
  Modelica.Blocks.Sources.RealExpression TChWSup4(y=bui4.terUniCoo.T_aChiWat_nominal)
    "Chilled water supply temperature"
    annotation (Placement(transformation(extent={{-140,460},{-120,480}})));

  Fluid.Sources.Boundary_pT           souChW5(
    redeclare package Medium = MediumW,
    use_T_in=true,
    nPorts=1) "Chilled water supply" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-76,610})));

  Fluid.Sources.Boundary_pT           sinChw5(redeclare package Medium =
        MediumW, nPorts=1) "Chilled water sink" annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,610})));
  Modelica.Blocks.Sources.RealExpression TChWSup5(y=bui5.terUniCoo.T_aChiWat_nominal)
    "Chilled water supply temperature"
    annotation (Placement(transformation(extent={{-140,604},{-120,624}})));

  Fluid.Sources.Boundary_pT souChW6(
    redeclare package Medium = MediumW,
    use_T_in=true,
    nPorts=1) "Chilled water supply" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-74,752})));

  Fluid.Sources.Boundary_pT  sinChw6(
    redeclare package Medium = MediumW,
    nPorts=1) "Chilled water sink" annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,750})));
  Modelica.Blocks.Sources.RealExpression TChWSup6(y=bui6.terUniCoo.T_aChiWat_nominal)
    "Chilled water supply temperature"
    annotation (Placement(transformation(extent={{-142,740},{-122,760}})));
  Modelica.Fluid.Sources.FixedBoundary preSou1(
    redeclare package Medium = MediumW,
    use_T=false,
    nPorts=1) "Pressure source" annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,72})));
  Modelica.Fluid.Sources.FixedBoundary preSou5(
    redeclare package Medium = MediumW,
    use_T=false,
    nPorts=1) "Pressure source" annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,510})));
  Modelica.Fluid.Sources.FixedBoundary preSou6(
    redeclare package Medium = MediumW,
    use_T=false,
    nPorts=1) "Pressure source" annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,650})));
  Modelica.Fluid.Sources.FixedBoundary preSou2(
    redeclare package Medium = MediumW,
    use_T=false,
    nPorts=1) "Pressure source" annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={72,30})));
  Modelica.Fluid.Sources.FixedBoundary preSou4(
    redeclare package Medium = MediumW,
    use_T=false,
    nPorts=1) "Pressure source" annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,370})));
  Modelica.Fluid.Sources.FixedBoundary preSou3(
    redeclare package Medium = MediumW,
    use_T=false,
    nPorts=1) "Pressure source" annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,230})));

  Modelica.Blocks.Sources.RealExpression THeaWatSet3(y=50 + 273.15)
    "Secondary loop (Building side) heating water setpoint temperature."
    annotation (Placement(transformation(extent={{-140,240},{-120,260}})));
  Modelica.Blocks.Sources.RealExpression THeaWatSet4(y=50 + 273.15)
    "Secondary loop (Building side) heating water setpoint temperature."
    annotation (Placement(transformation(extent={{-140,380},{-120,400}})));
  Modelica.Blocks.Sources.RealExpression THeaWatSet5(y=50 + 273.15)
    "Secondary loop (Building side) heating water setpoint temperature."
    annotation (Placement(transformation(extent={{-142,520},{-122,540}})));
  Modelica.Blocks.Sources.RealExpression THeaWatSet6(y=50 + 273.15)
    "Secondary loop (Building side) heating water setpoint temperature."
    annotation (Placement(transformation(extent={{-140,660},{-120,680}})));
equation
  // Connections

      // cooling indirect, timeseries coupling connection
  connect(THeaWatSet2.y, heaETS2.TSetBuiSup) annotation (Line(points={{-119,50},
          {-72,50},{-72,60},{-22,60}},color={0,0,127}));

      // spawn, ets cold water stub connections

      // heating indirect and network 2 pipe

      // cooling indirect, timeseries coupling connections
  connect(THeaWatSet1.y, heaETS1.TSetBuiSup) annotation (Line(points={{-119,90},
          {-22,90}},                    color={0,0,127}));

      // spawn, ets cold water stub connections

      // heating indirect and network 2 pipe

  connect(mPum_flow_efb90af4.y,heaPla_4f74367f.on)
    annotation (Line(points={{-119,20},{-98,20},{-98,4},{-94,4}},   color={255,0,255}));

  connect(bui2.ports_bChiWat[1], sinChw1.ports[1]) annotation (Line(points={{0,166},
          {34,166},{34,168},{60,168}}, color={0,127,255}));
  connect(souChW1.ports[1], bui2.ports_aChiWat[1]) annotation (Line(points={{-60,170},
          {-36,170},{-36,166},{-20,166}},      color={0,127,255}));
  connect(souChW2.ports[1], bui1.ports_aChiWat[1]) annotation (Line(points={{-60,130},
          {-38,130},{-38,124},{-20,124}},      color={0,127,255}));
  connect(souChW1.T_in, TChWSup1.y)
    annotation (Line(points={{-82,174},{-94,174},{-94,170},{-119,170}},
                                                    color={0,0,127}));
  connect(souChW2.T_in, TChWSup2.y)
    annotation (Line(points={{-82,134},{-102,134},{-102,130},{-119,130}},
                                                    color={0,0,127}));
  connect(bui2.ports_bHeaWat[1], heaETS1.port_a2) annotation (Line(points={{0,170},
          {22,170},{22,84},{0,84}}, color={0,127,255}));
  connect(heaETS1.port_b2, bui2.ports_aHeaWat[1]) annotation (Line(points={{-20,
          84},{-34,84},{-34,170},{-20,170}}, color={0,127,255}));
  connect(bui1.ports_bHeaWat[1], heaETS2.port_a2) annotation (Line(points={{0,128},
          {18,128},{18,54},{0,54}}, color={0,127,255}));
  connect(bui1.ports_aHeaWat[1], heaETS2.port_b2) annotation (Line(points={{-20,
          128},{-42,128},{-42,54},{-20,54}}, color={0,127,255}));
  connect(heaPla_4f74367f.port_a, disNet.port_bDisRet) annotation (Line(points={
          {-72,1},{-28,1},{-28,-13.6},{-18,-13.6}}, color={0,127,255}));
  connect(disNet.dp, heaPla_4f74367f.dpMea) annotation (Line(points={{10.7,-8.2},
          {26,-8.2},{26,-48},{-160,-48},{-160,-7},{-94,-7}},
        color={0,0,127}));
  connect(TDisSetHeaWat_efb90af4.y, heaPla_4f74367f.THeaSet) annotation (Line(
        points={{-119,-30},{-112,-30},{-112,-12.4},{-94,-12.4}},   color={0,0,127}));
  connect(heaPla_4f74367f.port_b, senTDisSup_efb90af4.port_a) annotation (Line(
        points={{-72,-9},{-54,-9},{-54,-28},{-50,-28}}, color={0,127,255}));
  connect(senTDisSup_efb90af4.port_b, disNet.port_aDisSup) annotation (Line(
        points={{-30,-28},{-24,-28},{-24,-10},{-18,-10}}, color={0,127,255}));
  connect(preSou1.ports[1], heaETS1.port_b2)
    annotation (Line(points={{60,72},{-20,72},{-20,84}}, color={0,127,255}));
  connect(bui1.ports_bChiWat[1], sinChw2.ports[1]) annotation (Line(points={{0,124},
          {30,124},{30,128},{60,128}}, color={0,127,255}));
  connect(bui3.ports_bChiWat[1],sinChw3. ports[1]) annotation (Line(points={{-2,300},
          {32,300},{32,310},{60,310}}, color={0,127,255}));
  connect(souChW3.ports[1],bui3. ports_aChiWat[1]) annotation (Line(points={{-60,310},
          {-38,310},{-38,300},{-22,300}},      color={0,127,255}));
  connect(souChW3.T_in,TChWSup3. y)
    annotation (Line(points={{-82,314},{-100,314},{-100,310},{-121,310}},
                                                    color={0,0,127}));
  connect(bui3.ports_bHeaWat[1],heaETS3. port_a2) annotation (Line(points={{-2,304},
          {20,304},{20,240},{-2,240}},
                                    color={0,127,255}));
  connect(heaETS3.port_b2,bui3. ports_aHeaWat[1]) annotation (Line(points={{-22,240},
          {-36,240},{-36,304},{-22,304}},    color={0,127,255}));
  connect(preSou3.ports[1],heaETS3. port_b2)
    annotation (Line(points={{60,230},{-22,230},{-22,240}},
                                                         color={0,127,255}));
  connect(bui4.ports_bChiWat[1],sinChw4. ports[1]) annotation (Line(points={{-6,460},
          {28,460},{28,470},{60,470}}, color={0,127,255}));
  connect(souChW4.ports[1],bui4. ports_aChiWat[1]) annotation (Line(points={{-60,470},
          {-42,470},{-42,460},{-26,460}},      color={0,127,255}));
  connect(souChW4.T_in,TChWSup4. y)
    annotation (Line(points={{-82,474},{-100,474},{-100,470},{-119,470}},
                                                    color={0,0,127}));
  connect(bui4.ports_bHeaWat[1],heaETS4. port_a2) annotation (Line(points={{-6,464},
          {16,464},{16,378},{-6,378}},
                                    color={0,127,255}));
  connect(heaETS4.port_b2,bui4. ports_aHeaWat[1]) annotation (Line(points={{-26,378},
          {-40,378},{-40,464},{-26,464}},    color={0,127,255}));
  connect(preSou4.ports[1],heaETS4. port_b2)
    annotation (Line(points={{60,370},{-26,370},{-26,378}},
                                                         color={0,127,255}));
  connect(bui5.ports_bChiWat[1],sinChw5. ports[1]) annotation (Line(points={{-12,608},
          {22,608},{22,610},{60,610}}, color={0,127,255}));
  connect(souChW5.ports[1],bui5. ports_aChiWat[1]) annotation (Line(points={{-66,610},
          {-48,610},{-48,608},{-32,608}},      color={0,127,255}));
  connect(souChW5.T_in,TChWSup5. y)
    annotation (Line(points={{-88,614},{-119,614}}, color={0,0,127}));
  connect(bui5.ports_bHeaWat[1],heaETS5. port_a2) annotation (Line(points={{-12,612},
          {10,612},{10,526},{-12,526}},
                                    color={0,127,255}));
  connect(heaETS5.port_b2,bui5. ports_aHeaWat[1]) annotation (Line(points={{-32,526},
          {-46,526},{-46,612},{-32,612}},    color={0,127,255}));
  connect(preSou5.ports[1],heaETS5. port_b2)
    annotation (Line(points={{60,510},{-32,510},{-32,526}},
                                                         color={0,127,255}));
  connect(bui6.ports_bChiWat[1],sinChw6. ports[1]) annotation (Line(points={{-4,748},
          {24,748},{24,750},{60,750}}, color={0,127,255}));
  connect(souChW6.ports[1],bui6. ports_aChiWat[1]) annotation (Line(points={{-64,752},
          {-46,752},{-46,748},{-24,748}},      color={0,127,255}));
  connect(souChW6.T_in,TChWSup6. y)
    annotation (Line(points={{-86,756},{-102,756},{-102,750},{-121,750}},
                                                    color={0,0,127}));
  connect(bui6.ports_bHeaWat[1],heaETS6. port_a2) annotation (Line(points={{-4,752},
          {12,752},{12,668},{-10,668}},
                                    color={0,127,255}));
  connect(heaETS6.port_b2,bui6. ports_aHeaWat[1]) annotation (Line(points={{-30,668},
          {-44,668},{-44,752},{-24,752}},    color={0,127,255}));
  connect(preSou6.ports[1],heaETS6. port_b2)
    annotation (Line(points={{60,650},{-30,650},{-30,668}},
                                                         color={0,127,255}));
  connect(disNet.ports_bCon[1], heaETS1.port_a1) annotation (Line(points={{-7.73333,
          -4},{-12,-4},{-12,28},{-28,28},{-28,96},{-20,96}}, color={0,127,255}));
  connect(disNet.ports_bCon[2], heaETS2.port_a1) annotation (Line(points={{-9.6,-4},
          {-9.6,28},{-28,28},{-28,66},{-20,66}},      color={0,127,255}));
  connect(disNet.ports_bCon[3], heaETS3.port_a1) annotation (Line(points={{
          -11.4667,-4},{-11.4667,24},{-28,24},{-28,252},{-22,252}},
                                                           color={0,127,255}));
  connect(disNet.ports_bCon[4], heaETS4.port_a1) annotation (Line(points={{
          -13.3333,-4},{-12,-4},{-12,28},{-32,28},{-32,390},{-26,390}},
                                                               color={0,127,255}));
  connect(disNet.ports_bCon[5], heaETS5.port_a1) annotation (Line(points={{-15.2,
          -4},{-15.2,20},{-36,20},{-36,538},{-32,538}}, color={0,127,255}));
  connect(disNet.ports_bCon[6], heaETS6.port_a1) annotation (Line(points={{
          -17.0667,-4},{-17.0667,34},{-38,34},{-38,680},{-30,680}},
                                                           color={0,127,255}));
  connect(heaETS6.port_b1, disNet.ports_aCon[6]) annotation (Line(points={{-10,680},
          {4,680},{4,-4},{-0.266667,-4}}, color={0,127,255}));
  connect(heaETS5.port_b1, disNet.ports_aCon[5]) annotation (Line(points={{-12,538},
          {1.6,538},{1.6,-4}}, color={0,127,255}));
  connect(heaETS4.port_b1, disNet.ports_aCon[4]) annotation (Line(points={{-6,390},
          {3.46667,390},{3.46667,-4}}, color={0,127,255}));
  connect(heaETS3.port_b1, disNet.ports_aCon[3]) annotation (Line(points={{-2,252},
          {5.33333,252},{5.33333,-4}}, color={0,127,255}));
  connect(heaETS1.port_b1, disNet.ports_aCon[1]) annotation (Line(points={{0,96},
          {9.06667,96},{9.06667,-4}}, color={0,127,255}));
  connect(heaETS2.port_b1, disNet.ports_aCon[2])
    annotation (Line(points={{0,66},{7.2,66},{7.2,-4}}, color={0,127,255}));
  connect(preSou2.ports[1], heaETS2.port_b2)
    annotation (Line(points={{62,30},{-20,30},{-20,54}}, color={0,127,255}));
  connect(THeaWatSet3.y, heaETS3.TSetBuiSup) annotation (Line(points={{-119,250},
          {-62,250},{-62,246},{-24,246}}, color={0,0,127}));
  connect(THeaWatSet4.y, heaETS4.TSetBuiSup) annotation (Line(points={{-119,390},
          {-63.5,390},{-63.5,384},{-28,384}}, color={0,0,127}));
  connect(THeaWatSet5.y, heaETS5.TSetBuiSup) annotation (Line(points={{-121,530},
          {-65.5,530},{-65.5,532},{-34,532}}, color={0,0,127}));
  connect(THeaWatSet6.y, heaETS6.TSetBuiSup) annotation (Line(points={{-119,670},
          {-68,670},{-68,674},{-32,674}}, color={0,0,127}));
    annotation (Placement(transformation(extent={{-30,746},{-10,766}})),
    experiment(
      StopTime=86400,
      Interval=3600,
      Tolerance=1e-06), Diagram(coordinateSystem(extent={{-220,-100},{180,780}})));
end DistrictEnergySystem_1;
