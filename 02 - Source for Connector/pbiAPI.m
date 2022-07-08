section pbiAdminAPI;

// OAuth Setup

client_id = Text.FromBinary(Extension.Contents("AppID.txt"));  
client_secret = Text.FromBinary(Extension.Contents("ClientSecret.txt"));

redirect_uri = "https://oauth.powerbi.com/views/oauthredirect.html";
token_uri = "https://login.windows.net/common/oauth2/token";
authorize_uri = "https://login.windows.net/common/oauth2/authorize";
logout_uri = "https://login.microsoftonline.com/logout.srf";
resource_uri = "https://analysis.windows.net/powerbi/api";

// Static variables

api_uri = "https://api.powerbi.com/v1.0/myorg";

// Connector Window

windowWidth = 1024;
windowHeight = 1024;

// Source

[DataSource.Kind="pbiAdminAPI", Publish="pbiAdminAPI.UI"]

// SHARED Declaration 

shared pbiAdminAPI.Navigation = () as table =>

// Navigation
//** Main Navigation 

    let
        objects = #table(
            {"Name","Key","Data","ItemKind","ItemName","IsLeaf"},{
            {Extension.LoadString("GroupsAdmin"),"GroupsAdmin",GroupsNavigation(),"Folder","GroupsAdmin",false},
            {Extension.LoadString("DataflowsAdmin"),"DataflowsAdmin",DataflowsNavigation(),"Folder","DataflowsAdmin",false},
            {Extension.LoadString("DatasetsAdmin"),"DatasetsAdmin",DatasetsNavigation(),"Folder","DatasetsAdmin",false},
            {Extension.LoadString("ReportsAdmin"),"ReportsAdmin",ReportsNavigation(),"Folder","ReportsAdmin",false},
            {Extension.LoadString("AppAdmin"),"AppAdmin",AppNavigation(),"Folder","AppAdmin",false},
            {Extension.LoadString("DeploymentPipelinesAdmin"),"DeploymentPipelinesAdmin",DeploymentPipelinesNavigation(),"Folder","DeploymentPipelinesAdmin",false},
            {Extension.LoadString("DashboardsAdmin"),"DashboardsAdmin",DashboardNavigation(),"Folder","DashboardsAdmin",false},
            {Extension.LoadString("AboutTenantAdmin"),"AboutTenantAdmin",AboutTenantNavigation(),"Folder","AboutTenantAdmin",false},
            {Extension.LoadString("GatewaysAdmin"),"GatewaysAdmin",GatewaysNavigation(),"Folder","GatewaysAdmin",false},
            {Extension.LoadString("ScannerAdmin"),"ScannerAdmin",ScannerNavigation(),"Folder","ScannerAdmin",false},
            {Extension.LoadString("FunctionsAdmin"),"FunctionsAdmin",FunctionsNavigation(),"Folder","FunctionsAdmin",false}
        }),
        Navigation = Table.ToNavigationTable(objects,{"Key"},"Name","Data","ItemKind","ItemName","IsLeaf")
    in
        Navigation;

//** Parcial Navigation

GroupsNavigation = () as table => 
let
        objects = #table(
            {"Name","Key","Data","ItemKind","ItemName","IsLeaf"},{
            {Extension.LoadString("Groups"),"Groups & Workspaces",pbiAdminAPI.Groups(),"Table","Table",true}
        }),
        Navigation = Table.ToNavigationTable(objects,{"Key"},"Name","Data","ItemKind","ItemName","IsLeaf")
in
        Navigation;

DatasetsNavigation = () as table => 
let
        objects = #table(
            {"Name","Key","Data","ItemKind","ItemName","IsLeaf"},{
            {Extension.LoadString("Datasets"),"Datasets",pbiAdminAPI.Datasets(),"Table","Table",true},
            {Extension.LoadString("Refreshables"),"Refreshables",pbiAdminAPI.DatasetsRefreshables(),"Table","Table",true}
        }),
        Navigation = Table.ToNavigationTable(objects,{"Key"},"Name","Data","ItemKind","ItemName","IsLeaf")
in
        Navigation;

ReportsNavigation = () as table => 
let
        objects = #table(
            {"Name","Key","Data","ItemKind","ItemName","IsLeaf"},{
            {Extension.LoadString("Reports"),"Reports",pbiAdminAPI.Reports(),"Table","Table",true}
        }),
        Navigation = Table.ToNavigationTable(objects,{"Key"},"Name","Data","ItemKind","ItemName","IsLeaf")
in
        Navigation;

AppNavigation = () as table => 
let
        objects = #table(
            {"Name","Key","Data","ItemKind","ItemName","IsLeaf"},{
            {Extension.LoadString("Apps"),"Apps",pbiAdminAPI.Apps(),"Table","Table",true}
        }),
        Navigation = Table.ToNavigationTable(objects,{"Key"},"Name","Data","ItemKind","ItemName","IsLeaf")
in
        Navigation;

DeploymentPipelinesNavigation = () as table => 
let
        objects = #table(
            {"Name","Key","Data","ItemKind","ItemName","IsLeaf"},{
            {Extension.LoadString("DeploymentPipelines"),"DeploymentPipelines",pbiAdminAPI.DeploymentPipelines(),"Table","Table",true}
        }),
        Navigation = Table.ToNavigationTable(objects,{"Key"},"Name","Data","ItemKind","ItemName","IsLeaf")
in
        Navigation;

DashboardNavigation = () as table => 
let
        objects = #table(
            {"Name","Key","Data","ItemKind","ItemName","IsLeaf"},{
            {Extension.LoadString("Dashboards"),"Dashboards",pbiAdminAPI.Dashboards(),"Table","Table",true},
            {Extension.LoadString("Tiles"),"Tiles",pbiAdminAPI.Tiles(),"Table","Table",true}
        }),
        Navigation = Table.ToNavigationTable(objects,{"Key"},"Name","Data","ItemKind","ItemName","IsLeaf")
in
        Navigation;

GatewaysNavigation = () as table => 
let
        objects = #table(
            {"Name","Key","Data","ItemKind","ItemName","IsLeaf"},{
            {Extension.LoadString("Gateways"),"Gateways",pbiAdminAPI.Gateways(),"Table","Table",true}
        }),
        Navigation = Table.ToNavigationTable(objects,{"Key"},"Name","Data","ItemKind","ItemName","IsLeaf")
in
        Navigation;

AboutTenantNavigation = () as table => 
let
        objects = #table(
            {"Name","Key","Data","ItemKind","ItemName","IsLeaf"},{
            {Extension.LoadString("Capacities"),"Capacities",pbiAdminAPI.Capacities(),"Table","Table",true},
            {Extension.LoadString("Imports"),"Imports",pbiAdminAPI.Imports(),"Table","Table",true},
            {Extension.LoadString("AvaiableFestures"),"AvaiableFestures",pbiAdminAPI.AvaiableFeatures(),"Table","Table",true},
            {Extension.LoadString("LinkShared"),"LinkShared",pbiAdminAPI.LinkShared(),"Table","Table",true},
            {Extension.LoadString("PublishedToWeb"),"PublishedToWeb",pbiAdminAPI.PublishedToWeb(),"Table","Table",true},
            {Extension.LoadString("UnusedArtifacts"),"UnusedArtifacts",pbiAdminAPI.UnusedArtifacts(),"Table","Table",true}
        }),
        Navigation = Table.ToNavigationTable(objects,{"Key"},"Name","Data","ItemKind","ItemName","IsLeaf")
in
        Navigation;

DataflowsNavigation = () as table => 
let
        objects = #table(
            {"Name","Key","Data","ItemKind","ItemName","IsLeaf"},{
            {Extension.LoadString("Dataflows"),"Dataflows",pbiAdminAPI.Dataflows(),"Table","Table",true}
        }),
	Navigation = Table.ForceToNavigationTable(objects, {"Key"},"Name","Data","ItemKind","ItemName","IsLeaf")
in
	Navigation;

FunctionsNavigation = () as table => 
let
        objects = #table(
            {"Name","Key","Data","ItemKind","ItemName","IsLeaf"},{
            {Extension.LoadString("ArtifactAccess"),"ArtifactAccess",pbiAdminAPI.UserArtifactAccess,"Function","ArtifactAccess",true},
            {Extension.LoadString("Subscriptions"),"Subscriptions",pbiAdminAPI.Subscriptions,"Function","Subscriptions",true},
            {Extension.LoadString("Scorecards"),"Scorecards",pbiAdminAPI.Scorecards,"Function","Scorecards",true}
            }),
        Navigation = Table.ForceToNavigationTable(objects,{"Key"},"Name","Data","ItemKind","ItemName","IsLeaf")
in
        Navigation;

ScannerNavigation = () as table => 
let
        objects = #table(
            {"Name","Key","Data","ItemKind","ItemName","IsLeaf"},{
            {Extension.LoadString("ScannerAPIInfo"),"ScannerAPIInfo",pbiAdminAPI.ScannerAPIInfo,"Function","ScannerAPIInfo",true},
            {Extension.LoadString("ScannerAPIStatusAndResult"),"ScannerAPIStatusAndResult",pbiAdminAPI.ScannerAPIStatusAndResult,"Function","ScannerAPIStatusAndResult",true}
         }),
        Navigation = Table.ForceToNavigationTable(objects,{"Key"},"Name","Data","ItemKind","ItemName","IsLeaf")
in
        Navigation;

// Output generators 
// ** Generic Fucntions 

pbiAdminAPI = [
TestConnection = (dataSourcePath) =>  { "pbiAdminAPI.Navigation"},
    Authentication = [
       Aad = [
                AuthorizationUri = authorize_uri,
                Resource = resource_uri
            ]            
    ],
    Label = Extension.LoadString("DataSourceLabel") 
];

// ** Groups

[DataSource.Kind="pbiAdminAPI"]
pbiAdminAPI.Groups = () =>
    let
        apiCall = Json.Document(
            Web.Contents(
                api_uri,
                [
                    RelativePath = "admin/groups",
                    Headers = [#"Content-Type"="application/json"],
                    Query = 
                        [
                            #"$top" = "5000",
                            #"$expand" = "users,reports,dashboards,datasets,dataflows,workbooks"
                        ]
                ]
                )
            ),
        output = #table(
                    type table [
                        id = text,
                        isReadOnly = logical,
                        isOnDedicatedCapacity = logical,
                        capacityId = text,
                        capacityMigrationStatus = text,
                        #"type" = text,
                        state = text,
                        name = text,
                        users = list,
                        reports = list,
                        dashboards = list,
                        datasets = list,
                        dataflows = list,
                        workbooks = list
                    ],
                    List.Transform(
                        apiCall[value],
                        each
                            {
                                _[id]?,
                                _[isReadOnly]?,
                                _[isOnDedicatedCapacity]?,
                                _[capacityId]?,
                                _[capacityMigrationStatus]?,
                                _[#"type"]?,
                                _[state]?,
                                _[name]?,
                                _[users]?,
                                _[reports]?,
                                _[dashboards]?,
                                _[datasets]?,
                                _[dataflows]?,
                                _[workbooks]?
                            }
                    )
                )
    in
    output;

//** Datasets
//**** Table of Datasets
[DataSource.Kind="pbiAdminAPI"]
pbiAdminAPI.Datasets = () =>
    let
        apiCall = Json.Document(Web.Contents(api_uri,[RelativePath = "admin/datasets", Headers = [#"Content-Type"="application/json"]])),
        output = #table(
                    type table [
                        id = text,
                        name = text,
                        addRowsAPIEnabled = logical,
                        configuredBy = text,
                        isRefreshable = logical,
                        isEffectiveIdentityRequired = logical,
                        isEffectiveIdentityRolesRequired = logical,
                        isOnPremGatewayRequired = logical,
                        webUrl = text,
                        targetStorageMode = text,
                        createdDate = datetime,
                        createReportEmbedURL = text,
                        qnaEmbedURL = text,
                        upstreamDatasets = list
                    ],
                    List.Transform(
                        apiCall[value],
                        each
                            {
                                _[id]?,
                                _[name]?,
                                _[addRowsAPIEnabled]?,
                                _[configuredBy]?,
                                _[isRefreshable]?,
                                _[isEffectiveIdentityRequired]?,
                                _[isEffectiveIdentityRolesRequired]?,
                                _[isOnPremGatewayRequired]?,
                                _[webUrl]?,
                                _[targetStorageMode]?,
                                DateTime.From(_[createdDate]?),
                                _[createReportEmbedURL]?,
                                _[qnaEmbedURL]?,
                                _[upstreamDatasets]?
                            }
                    )
                )
    in
        output;

//**** Table of Refreshable datasets

[DataSource.Kind="pbiAdminAPI"]
pbiAdminAPI.DatasetsRefreshables = () =>
    let
        apiCall = Json.Document(Web.Contents(api_uri,[RelativePath = "admin/capacities/refreshables", Headers = [#"Content-Type"="application/json"], Query = [#"$expand"="capacity,group"]])),
        output = #table(
                    type table [
                        id = text,
                        name = text,
                        kind = text,
                        startTime = datetime,
                        endTime = datetime,
                        refreshCount = number,
                        refreshFailures = number,
                        averageDuration = number,
                        medianDuration = number,
                        refreshesPerDay = number,
                        lastRefresh = record,
                        refreshSchedule.days = list,
                        refreshSchedule.times = list,
                        refreshSchedule.enabled = logical,
                        refreshSchedule.localTimeZoneId = text,
                        refreshSchedule.notifyOption = text,
                        configuredBy = text,
                        capacity = record,
                        group = record
                    ],
                    List.Transform(
                        apiCall[value],
                        each
                            {
                                _[id]?,
                                _[name]?,
                                _[kind]?,
                                _[startTime]?,
                                _[endTime]?,
                                _[refreshCount]?,
                                _[refreshFailures]?,
                                _[averageDuration]?,
                                _[medianDuration]?,
                                _[refreshesPerDay]?,
                                _[lastRefresh]?,
                                _[refreshSchedule]?[days]?,
                                _[refreshSchedule]?[times]?,
                                _[refreshSchedule]?[enabled]?,
                                _[refreshSchedule]?[localTImeZoneId]?,
                                _[refreshSchedule]?[notifyOption]?,
                                _[configuredBy]?{0}?,
                                _[capacity]?,
                                _[group]?
                            }
                    )
                )
    in
        output;

//** Reports

[DataSource.Kind="pbiAdminAPI"]
pbiAdminAPI.Reports = () =>
    let
        apiCall = Json.Document(Web.Contents(api_uri,[RelativePath = "admin/reports", Headers = [#"Content-Type"="application/json"]])),
        output = #table(
                    type table [
                        id = text,
                        reportType = text,
                        name = text,
                        webUrl = text,
                        embedUrl = text,
                        datasetId = text,
                        createdDateTime = datetime,
                        modifiedDateTime = datetime,
                        createdBy = text,
                        modifiedBy = text
                    ],
                    List.Transform(
                        apiCall[value],
                        each
                            {
                                _[id]?,
                                _[reportType]?,
                                _[name]?,
                                _[webUrl]?,
                                _[embedUrl]?,
                                _[datasetId]?,
                                _[createdDateTime]?,
                                _[createdDateTime]?,
                                _[createdBy]?,
                                _[modifiedBy]?
                            }
                    )
                )
    in
        output;

//** Apps

[DataSource.Kind="pbiAdminAPI"]
pbiAdminAPI.Apps = () =>
    let
        apiCall = Json.Document(Web.Contents(api_uri,[RelativePath = "admin/apps", Headers = [#"Content-Type"="application/json"], Query = [#"$top"="100"]])),
        output = #table(
                    type table [
                        id = text,
                        name = text,
                        lastUpdate = datetime,
                        description = text,
                        publishedBy = text,
                        workspaceId = text
                    ],
                    List.Transform(
                        apiCall[value],
                        each
                            {
                                _[id]?,
                                _[name]?,
                                DateTime.From(_[lastUpdate]?),
                                _[description]?,
                                _[publishedBy]?,
                                _[workspaceId]?
                            }
                    )
                )
    in
        output;

//** Deployment Pipelines

[DataSource.Kind="pbiAdminAPI"]
pbiAdminAPI.DeploymentPipelines = () =>
    let
        apiCall = Json.Document(Web.Contents(api_uri,[RelativePath = "admin/pipelines", Headers = [#"Content-Type"="application/json"], Query = [#"$expand"="stages,users"]])),
        output = #table(
                    type table [
                        id = text,
                        displayName = text,
                        stages = table,
                        users = table
                    ],
                    List.Transform(
                        apiCall[value],
                        each
                            {
                                _[id]?,
                                _[displayName]?,
                                Table.AddColumn(
                                    Table.FromRecords(
                                        _[stages]?,
                                        type table [
                                            order,
                                            workspaceId,
                                            workspaceName
                                        ],
                                        MissingField.UseNull
                                    ),
                                    "Type",
                                    each
                                        if [order] = "0" then
                                            "Development"
                                        else if [order] = "1" then
                                            "Test"
                                        else
                                            "Production"
                                ),
                                Table.FromRecords(
                                    _[users]?,
                                    type table [
                                        accessRight,
                                        identifier,
                                        principalType
                                    ],
                                    MissingField.UseNull
                                )
                            }
                    )
                )
    in
        output;

//** Dashboards
//**** Dashboard
[DataSource.Kind="pbiAdminAPI"]
pbiAdminAPI.Dashboards = () =>
    let
        apiCall = Json.Document(Web.Contents(api_uri,[RelativePath = "admin/dashboards", Headers = [#"Content-Type"="application/json"]])),
        output = #table(
                    type table [
                        id = text,
                        displayName = text,
                        isReadOnly = logical,
                        webUrl = text,
                        embedUrl = text,
                        subscriptions = list
                    ],
                    List.Transform(
                        apiCall[value],
                        each
                            {
                                _[id]?,
                                _[displayName]?,
                                _[isReadOnly]?,
                                _[webUrl]?,
                                _[embedUrl]?,
                                _[subscriptions]?
                            }
                    )
                )
    in
        output;

//**** Tiles

[DataSource.Kind="pbiAdminAPI"]
pbiAdminAPI.Tiles = () =>
    let
        dashboards = pbiAdminAPI.Dashboards()[id],
        transformator =
            List.Transform(
                dashboards,
                each
                    Json.Document(
                        Web.Contents(
                            api_uri,
                            [
                                RelativePath = "admin/dashboards/" & _ & "/tiles",
                                Headers = [#"Content-Type"="application/json"]
                            ]
                        )
                    )[value]
            ),
        unitor = List.RemoveNulls(List.Union(transformator)),
        output = #table(
                    type table [
                        id = text,
                        embedUrl = text,
                        rowSpan = text,
                        colSpan = text,
                        reportId = text,
                        datasetId = text
                    ],
                    List.Transform(
                        unitor,
                        each
                            {
                                _[id]?,
                                _[embedUrl]?,
                                _[rowSpan]?,
                                _[colSpan]?,
                                _[reportId]?,
                                _[datasetId]?
                            }
                    )
                )
    in
        output;

//** Dataflows

[DataSource.Kind="pbiAdminAPI"]
pbiAdminAPI.Dataflows = () =>
    let
        apiCall = Json.Document(Web.Contents(api_uri,[RelativePath = "admin/dataflows", Headers = [#"Content-Type"="application/json"]])),
        output = #table(
                    type table [
                        objectId = text,
                        name = text,
                        description = text,
                        workspaceId = text,
                        modelUrl = text,
                        configuredBy = text,
                        users = list,
                        modifiedBy = text,
                        modifiedDateTime = datetime
                    ],
                    List.Transform(
                        apiCall[value],
                        each
                            {
                                _[objectId]?,
                                _[name]?,
                                _[description]?,
                                _[workspaceId]?,
                                _[modelUrl]?,
                                _[configuredBy]?,
                                _[users]?,
                                _[modifiedBy]?,
                                _[modifiedDateTime]?
                            }
                    )
                )
    in
    output;

//** Gateways

[DataSource.Kind="pbiAdminAPI"]
pbiAdminAPI.Gateways = () =>
    let
        apiCall =
            Json.Document(
                Web.Contents(
                    "https://api.powerbi.com/v2.0/myorg",
                        [
                            RelativePath = "gatewayclusters?$expand=permissions,memberGateways&$skip=0",
                            Headers = [
                                #"Content-Type" = "application/json"
                            ]
                        ]
                    )
                ),
        output = #table(
                    type table [
                        id = text,
                        name = text,
                        #"type" = text,
                        loadBalancingSettings = text,
                        options = record,
                        staticCapabilities = text,
                        permissions = list,
                        memberGateways = list,
                        datasources = list,
                        maxPermission = record
                    ],
                    List.Transform(
                        apiCall[value],
                        each
                            {
                                _[id]?,
                                _[name]?,
                                _[#"type"]?,
                                _[loadBalancingSettings]?,
                                _[options]?,
                                _[staticCapabilities]?,
                                _[permissions]?,
                                _[memberGateways]?,
                                _[datasources]?,
                                _[maxPermission]?
                            }
                    )
                )
            in
        output;    

//** About Tenant
//**** Capacities

[DataSource.Kind="pbiAdminAPI"]
pbiAdminAPI.Capacities = () =>
    let
        apiCall = Json.Document(Web.Contents(api_uri,[RelativePath = "admin/capacities", Headers = [#"Content-Type"="application/json"]])),
        output = #table(
                    type table [
                        id = text,
                        displayName = text,
                        admins = list,
                        sku = text,
                        state = text,
                        region = text,
                        capacityUserAccessRight = text,
                        tenantKeyId = text
                    ],
                    List.Transform(
                        apiCall[value],
                        each
                            {
                                _[id]?,
                                _[displayName]?,
                                _[admins]?,
                                _[sku]?,
                                _[state]?,
                                _[region]?,
                                _[capacityUserAccessRight]?,
                                _[tenantKeyId]?
                            }
                    )
                )
    in
    output;

//**** Imports

[DataSource.Kind="pbiAdminAPI"]
pbiAdminAPI.Imports = () =>
    let
        apiCall = Json.Document(Web.Contents(api_uri,[RelativePath = "admin/imports", Headers = [#"Content-Type"="application/json"]])),
        output = #table(
                    type table [
                        id = text,
                        importState = text,
                        createdDateTime = datetime,
                        updatedDateTime = datetime,
                        name = text,
                        connectionType = text,
                        source = text,
                        datasets = list,
                        reports = list,
                        dataflows = list
                    ],
                    List.Transform(
                        apiCall[value],
                        each
                            {
                                _[id]?,
                                _[importState]?,
                                _[createdDateTime]?,
                                _[updatedDateTime]?,
                                _[name]?,
                                _[connectionType]?,
                                _[source]?,
                                _[datasets]?,
                                _[reports]?,
                                _[dataflows]?
                            }
                    )
                )
    in
    output;

//**** Avaiable Features

[DataSource.Kind="pbiAdminAPI"]
pbiAdminAPI.AvaiableFeatures = () =>
    let
        apiCall = Json.Document(Web.Contents(api_uri,[RelativePath = "availableFeatures", Headers = [#"Content-Type"="application/json"]])),
        output = #table(
                    type table [
                        name = text,
                        state = text,
                        extendedState = text,
                        additionalInfo = record
                    ],
                    List.Transform(
                        apiCall[features],
                        each
                            {
                                _[name]?,
                                _[state]?,
                                _[extendedState]?,
                                _[additionalInfo]?
                            }
                    )
                )
    in
    output;


//**** Links Shared to Whole Organization

[DataSource.Kind="pbiAdminAPI"]
pbiAdminAPI.LinkShared = () =>
    let
        apiCall = Json.Document(Web.Contents(api_uri,[RelativePath = "admin/widelySharedArtifacts/linksSharedToWholeOrganization", Headers = [#"Content-Type"="application/json"]])),
        generator = 
            List.Buffer(
                List.Generate(
                    () =>
                        [
                            result = apiCall,
                            uri = result[ArtifactAccessEntities]?
                        ],
                        each [uri] <> null,
                        each
                            [
                                result = Json.Document(Web.Contents(uri,[Headers = [#"Content-Type"="application/json"]])),
                                uri = _[result][continuationUri]?
                            ],
                        each [result][ArtifactAccessEntities]?
                )
            ),
        unitor = List.Union(generator),
        output = #table(
                    type table [
                        artifactId = text,
                        displayName = text,
                        artifactType = text,
                        accessRight = text,
                        shareType = text,
                        sharer.emailAddress = text,
                        sharer.displayName = text,
                        sharer.identifier = text,
                        sharer.graphId = text,
                        sharer.principalType = text
                    ],
                    List.Transform(
                        List.RemoveNulls(unitor),
                        each
                            {
                                _[artifactId]?,
                                _[displayName]?,
                                _[artifactType]?,
                                _[accessRight]?,
                                _[shareType]?,
                                _[sharer]?[emailAddress]?,
                                _[sharer]?[displayName]?,
                                _[sharer]?[identifier]?,
                                _[sharer]?[graphId]?,
                                _[sharer]?[principalType]?
                            }
                    )
                )
    in
    output;

//**** Unused Artifacts
[DataSource.Kind="pbiAdminAPI"]
pbiAdminAPI.UnusedArtifacts = () =>
    let
        groups = pbiAdminAPI.Groups(),
        selector = Table.SelectRows(groups, each ([type] = "Workspace") and ([state] = "Active"))[id],
        transformator = List.Transform(
            selector,
            each
                let
                    workspaceId = _,
                    interApiCall = 
                        Json.Document(
                            Web.Contents(
                                api_uri,
                                [
                                    RelativePath = "admin/groups/"& workspaceId &"/unused", 
                                    Headers = [#"Content-Type"="application/json"]
                                ]
                            )
                        ),
                    interGenerator =
                                List.Buffer(
                                    List.Generate(
                                        () =>
                                            [
                                                result = interApiCall,
                                                uri = result[continuationUri]?
                                            ],
                                            each [uri] <> null,
                                            each
                                                [
                                                    result = Json.Document(Web.Contents(uri,[Headers = [#"Content-Type"="application/json"]])),
                                                    uri = _[result][continuationUri]?
                                                ],
                                            each [result][unusedArtifactEntities]?
                                    )
                                )
                in
                    interGenerator
        ),
        unitor = List.Union(List.RemoveNulls(List.Union(transformator))),
        output = #table(
                    type table [
                        artifactId = text,
                        displayName = text,
                        artifactType = text,
                        artifactSizeInMB = number,
                        createdDateTime = datetime,
                        lastAccessedDateTime = datetime
                    ],
                    List.Transform(
                        unitor,
                        each
                            {
                                _[artifactId]?,
                                _[displayName]?,
                                _[artifactType]?,
                                _[artifactSizeInMB]?,
                                DateTime.From(_[createdDateTime]?),
                                DateTime.From(_[lastAccessedDateTime]?)
                            }
                    )
                )
    in
    output;

//**** Reports Published to Web

[DataSource.Kind="pbiAdminAPI"]
pbiAdminAPI.PublishedToWeb = () =>
    let
        apiCall = Json.Document(Web.Contents(api_uri,[RelativePath = "admin/widelySharedArtifacts/publishedToWeb", Headers = [#"Content-Type"="application/json"]])),
        generator = 
            List.Buffer(
                List.Generate(
                    () =>
                        [
                            result = apiCall,
                            uri = result[ArtifactAccessEntities]?
                        ],
                        each [uri] <> null,
                        each
                            [
                                result = Json.Document(Web.Contents(uri,[Headers = [#"Content-Type"="application/json"]])),
                                uri = _[result][continuationUri]?
                            ],
                        each [result][ArtifactAccessEntities]?
                )
            ),
        unitor = List.Union(generator),
        output = #table(
                    type table [
                        artifactId = text,
                        displayName = text,
                        artifactType = text,
                        accessRight = text,
                        shareType = text,
                        sharer.emailAddress = text,
                        sharer.displayName = text,
                        sharer.identifier = text,
                        sharer.graphId = text,
                        sharer.principalType = text
                    ],
                    List.Transform(
                        List.RemoveNulls(unitor),
                        each
                            {
                                _[artifactId]?,
                                _[displayName]?,
                                _[artifactType]?,
                                _[accessRight]?,
                                _[shareType]?,
                                _[sharer]?[emailAddress]?,
                                _[sharer]?[displayName]?,
                                _[sharer]?[identifier]?,
                                _[sharer]?[graphId]?,
                                _[sharer]?[principalType]?
                            }
                    )
                )
    in
    output;

//** Functions Library
//**** Artifact Access
[DataSource.Kind="pbiAdminAPI"]
shared pbiAdminAPI.UserArtifactAccess = Value.ReplaceType(UserArtifactAccess, UserArtifactAccessType);
	
    UserArtifactAccessType = type function (
        optional path as ( type text meta[
        Documentation.FieldCaption = "User Identifier",
        Documentation.FieldDescription = "UPN of user or Application ID",
        Documentation.SampleValues = {"example@domain.com"}])) as table meta [                  
        Documentation.Name = "pbiAdminAPI.UserArtifactAccess",
        Documentation.LongDescription = "Returns all artifacts where user or application have access",
        Documentation.Examples = {[
            Code = "=pbiAdminAPI.UserArtifactAccess(""example@domain.com"")",
            Result = "Table with artifacts -> Columns: artifactId, displayName, artifactType, accessRight "
        ]}
    ]; 

UserArtifactAccess = (optional userIdentifier as text) =>
    let
        functionVarTester = if userIdentifier <> null and userIdentifier <> "" then
        let
        path = "admin/users/"& userIdentifier &"/artifactAccess",
        apiCall = Json.Document(Web.Contents(api_uri,[RelativePath = path, Headers = [#"Content-Type"="application/json"]])),
        generator = 
            List.Buffer(
                List.Generate(
                    () =>
                        [
                            result = apiCall,
                            uriReturn = result[continuationUri]?
                        ],
                        each [uriReturn] <> null,
                        each
                            [
                                result = Json.Document(Web.Contents(uriReturn,[Headers = [#"Content-Type"="application/json"]])),
                                uriReturn = _[result][continuationUri]?
                            ],
                        each [result][ArtifactAccessEntities]?
                )
            ),
        unitor = List.Union(generator),
        output =  #table(
                        type table [
                            artifactId = text,
                            displayName = text,
                            artifactType = text,
                            accessRight = text
                        ],
                        List.Transform(
                            List.RemoveNulls(unitor),
                            each
                                {
                                    _[artifactId]?,
                                    _[displayName]?,
                                    _[artifactType]?,
                                    _[accessRight]?
                                }
                        )
                    )
    in
    output
    else #table( type table[Response = text], {{"Please fill parameter of function."}})
    in
    functionVarTester;

//**** Subscription
[DataSource.Kind="pbiAdminAPI"]
shared pbiAdminAPI.Subscriptions = Value.ReplaceType(Subscriptions, SubscriptionsType);
	
    SubscriptionsType = type function (
        optional path as ( type text meta[
        Documentation.FieldCaption = "UPN",
        Documentation.FieldDescription = "UPN of user or Application ID",
        Documentation.SampleValues = {"example@domain.com"}])) as table meta [                  
        Documentation.Name = "pbiAdminAPI.Subscriptions",
        Documentation.LongDescription = "Returns all subscriptions that user have",
        Documentation.Examples = {[
            Code = "=pbiAdminAPI.Subscriptions(""example@domain.com"")",
            Result = "Table with Subscriptions -> Columns: id, title, artifactId, artifactDislayName, subArtifactDisplayName, artifactType, isEnabled, frequency, startDate, endDate, linkToContent, previewImage, attachmentFormat,users "
        ]}
    ];

Subscriptions = (optional userIdentifier as text) =>
    let
        functionVarTester = if userIdentifier <> null and userIdentifier <> "" then
        let 
        path = "admin/users/"& userIdentifier &"/subscriptions",
        apiCall = Json.Document(Web.Contents(api_uri,[RelativePath = path, Headers = [#"Content-Type"="application/json"]])),
        generator = 
            List.Buffer(
                        List.Generate(
                            () =>
                                [
                                    result = apiCall,
                                    uriReturn = result[continuationUri]?
                                ],
                            each [uriReturn] <> null,
                            each
                                [
                                    result = Json.Document(Web.Contents(uriReturn,[Headers = [#"Content-Type"="application/json"]])),
                                    uriReturn = _[result][continuationUri]?
                                ],
                            each [result][SubscriptionEntities]?
                        )
                    ),
        unitor = List.Union(generator),
        output =  #table(
                        type table [
                            id = text,
                            title = text,
                            artifactId = text,
                            artifactDislayName = text,
                            subArtifactDisplayName = text,
                            artifactType = text,
                            isEnabled = logical,
                            frequency = text,
                            startDate = datetime,
                            endDate = datetime,
                            linkToContent = logical,
                            previewImage = logical,
                            attachmentFormat = text,
                            users = list
                        ],
                        List.Transform(
                            List.RemoveNulls(unitor),
                            each
                                {
                                    _[id]?,
                                    _[tite]?,
                                    _[artifactId]?,
                                    _[artifactDislayName]?,
                                    _[subArtifactDisplayName]?,
                                    _[artifactType]?,
                                    _[isEnabled]?,
                                    _[frequency]?,
                                    _[startDate]?,
                                    _[endDate]?,
                                    _[linkToContent]?,
                                    _[previewImage]?,
                                    _[attachmentFormat]?,
                                    _[users]?
                                }
                        )
                    )
    in
    output
    else #table( type table[Response = text], {{"Please fill parameter of function."}})
    in
    functionVarTester;

//**** Scorecards

[DataSource.Kind="pbiAdminAPI"]
shared pbiAdminAPI.Scorecards = Value.ReplaceType(Scorecards, ScorecardsType);
	
    ScorecardsType = type function (
        optional path as ( type text meta[
        Documentation.FieldCaption = "Workspace ID",
        Documentation.FieldDescription = "Workspace ID from where you want return the Scorecards",
        Documentation.SampleValues = {"xxx-xxxx-yyxa..."}])) as table meta [                  
        Documentation.Name = "pbiAdminAPI.Scorecards",
        Documentation.LongDescription = "!!! This call can be used only on Groups where you have access !!!
        Returns all Scorecards that are in selected workspace",
        Documentation.Examples = {[
            Code = "=pbiAdminAPI.Scorecards(""xxx-xxxx-yyxa..."")",
            Result = ""
        ]}
    ];

Scorecards = (optional workspaceId as text) =>
    let
        functionVarTester = if workspaceId <> null and workspaceId <> "" then
        let
        apiCall = Json.Document(
                        Web.Contents(
                            api_uri,
                            [
                                RelativePath = "groups/" & workspaceId & "/scorecards",
                                Headers = [ #"Content-Type" = "application/json" ]
                            ]
                        )
                    ),
        output = #table(
                    type table [
                        id = text,
                        name = text,
                        contact = text,
                        lastModifiedBy = text,
                        createdTime = datetime,
                        lastModifiedTime = datetime,
                        provisioningStatus = text,
                        groupId = text,
                        datasetId = text,
                        reportId = text,
                        statuses = list,
                        permissions = text,
                        columnSettings = list
                    ],
                    List.Transform(
                        apiCall[value],
                        each
                            {
                                _[id]?,
                                _[name]?,
                                _[contact]?,
                                _[lastModifiedBy]?,
                                _[createdTime]?,
                                _[lastModifiedTime]?,
                                _[provisioningStatus]?,
                                _[groupId]?,
                                _[datasetId]?,
                                _[reportId]?,
                                _[statuses]?,
                                _[permissions]?,
                                _[columnSettings]?
                            }
                    )
                )
    in
    output
        else #table( type table[Response = text], {{"Please fill parameter of function."}})
    in
    functionVarTester;

//**** Scanner API - GET INFO()

[DataSource.Kind="pbiAdminAPI"]
shared pbiAdminAPI.ScannerAPIInfo = Value.ReplaceType(ScannerAPIInfo, ScannerAPIInfoType);
	
    ScannerAPIInfoType = type function (
        optional path as ( type text meta[
        Documentation.FieldCaption = "Workspace ID",
        Documentation.FieldDescription = "Workspace ID from where you want return the Scorecards",
        Documentation.SampleValues = {"xxx-xxxx-yyxa..."}])) as table meta [                  
        Documentation.Name = "pbiAdminAPI.ScannerAPIInfo",
        Documentation.LongDescription = "!!! This call only starts a scanning. For results of this scanning dont forget to call function for Results !!!
        Returns ONLY and ONLY ""Id"" of scanning that is required for other calls.",
        Documentation.Examples = {[
            Code = "=pbiAdminAPI.ScannerAPIInfo(""xxx-xxxx-yyxa..."")",
            Result = ""
        ]}
    ];

ScannerAPIInfo = (optional workspaceId as text) =>
    let
        functionVarTester = if workspaceId <> null and workspaceId <> "" then
        let
        apiCall = 
                    Json.Document(
                        Web.Contents(
                            "https://api.powerbi.com/v1.0/myorg/",
                            [
                                RelativePath = "admin/workspaces/getInfo?lineage=True&datasourceDetails=True&datasetSchema=True&datasetExpressions=True&getArtifactUsers=True",
                                Headers = [
                                    #"Content-Type" = "application/json"
                                ],
                                Content =
                                    Text.ToBinary(
                                        "{ ""workspaces"": [ """ & workspaceId & """]}"
                                    )
                            ]
                        )
                    ),
        output = #table(
                    type table [
                        #"Id of Scan" = text
                    ],
                    {{apiCall[id]?}}
        )
    in
    output
        else #table( type table[Response = text], {{"Please fill parameter of function."}})
    in
    functionVarTester;

//**** Scanner API - GET STATUS AND RESULTS

[DataSource.Kind="pbiAdminAPI"]
shared pbiAdminAPI.ScannerAPIStatusAndResult = Value.ReplaceType(ScannerAPIStatusAndResult, ScannerAPIStatusAndResultType);
	
    ScannerAPIStatusAndResultType = type function (
        optional path as ( type text meta[
        Documentation.FieldCaption = "Scan ID",
        Documentation.FieldDescription = "Scan ID that has been returned from function ""Scanner API - Get Info""",
        Documentation.SampleValues = {"xxx-xxxx-yyxa..."}])) as table meta [                  
        Documentation.Name = "pbiAdminAPI.ScannerAPIStatusAndResultType",
        Documentation.LongDescription = "!!! This call only starts a scanning. For results of this scanning dont forget to call function for Results !!!
        Returns ONLY and ONLY ""Id"" of scanning that is required for other calls.",
        Documentation.Examples = {[
            Code = "=pbiAdminAPI.ScannerAPIInfo(""xxx-xxxx-yyxa..."")",
            Result = ""
        ]}
    ];

ScannerAPIStatusAndResult = (optional scanId as text) =>
    let
        functionVarTester = 
            if scanId <> null and scanId <> "" 
            then
                let
                    statusCall = 
                                Json.Document(
                                    Web.Contents(
                                        "https://api.powerbi.com/v1.0/myorg",
                                        [
                                            RelativePath = "admin/workspaces/scanStatus/" & scanId,
                                            Headers = [
                                                #"Content-Type" = "application/json"
                                            ]
                                        ]
                                    )
                                )[status],
                    validationForNextSteps = 
                        if statusCall = "Succeeded" 
                        then
                            let
                                resultCall = 
                                    Json.Document(
                                        Web.Contents(
                                            "https://api.powerbi.com/v1.0/myorg",
                                            [ 
                                                RelativePath = "admin/workspaces/scanResult/" & scanId,
                                                Headers = [
                                                    #"Content-Type" = "application/json"
                                                ]
                                            ]
                                        )
                                    ),
                                resultOutput = 
                                    #table(
                                        type table [
                                            id = text,
                                            name = text,
                                            #"type" = text,
                                            state = text,
                                            isOnDedicatedCapacity = text,
                                            capacityId = text,
                                            reports = list,
                                            dashboards = list,
                                            datasets = list,
                                            dataflows = list,
                                            datamarts = list,
                                            users = list
                                        ],
                                        List.Transform(
                                            resultCall[workspaces],
                                            each
                                                {
                                                    _[id]?,
                                                    _[name]?,
                                                    _[#"type"]?,
                                                    _[state]?,
                                                    _[isOnDedicatedCapacity]?,
                                                    _[capacityId]?,
                                                    _[reports]?,
                                                    _[dashboards]?,
                                                    _[datasets]?,
                                                    _[dataflows]?,
                                                    _[datamarts]?,
                                                    _[users]?
                                                }
                                        )
                                    )
                            in
                                resultOutput
                        else #table( type table[Response = text], {{"Scan is not completed yet. Try it later."}})
                in
                validationForNextSteps
        else #table( type table[Response = text], {{"Please fill parameter of function."}})
    in
    functionVarTester;

/* UI Definition */

pbiAdminAPI.UI = [
    Beta = true,
    Category = "Power Platform",
    ButtonText = { Extension.LoadString("ButtonTitle"), Extension.LoadString("ButtonHelp") },
    SourceImage = pbiAdminAPI.Icons ,
    SourceTypeImage = pbiAdminAPI.Icons 
];

pbiAdminAPI.Icons = [
    Icon16 = { Extension.Contents("PBIADMINAPI48.png"), Extension.Contents("PBIADMINAPI48.png"), Extension.Contents("PBIADMINAPI48.png"), Extension.Contents("PBIADMINAPI32.png") },
    Icon32 = { Extension.Contents("PBIADMINAPI48.png"), Extension.Contents("PBIADMINAPI48.png"), Extension.Contents("PBIADMINAPI48.png"), Extension.Contents("PBIADMINAPI64.png") }
];

/* Navigation Tables Funcions */

Table.ToNavigationTable = (
    table as table,
    keyColumns as list,
    nameColumn as text,
    dataColumn as text,
    itemKindColumn as text,
    itemNameColumn as text,
    isLeafColumn as text
) as table =>
    let
        tableType = Value.Type(table),
        newTableType = Type.AddTableKey(tableType, keyColumns, true) meta 
        [
            NavigationTable.NameColumn = nameColumn, 
            NavigationTable.DataColumn = dataColumn,
            NavigationTable.ItemKindColumn = itemKindColumn, 
            Preview.DelayColumn = itemNameColumn, 
            NavigationTable.IsLeafColumn = isLeafColumn
        ],
        navigationTable = Value.ReplaceType(table, newTableType)
    in
        navigationTable;

Table.ForceToNavigationTable = (
    table as table,
    keyColumns as list,
    nameColumn as text,
    dataColumn as text,
    itemKindColumn as text,
    itemNameColumn as text,
    isLeafColumn as text
) as table =>
    let
        tableType = Value.Type(table),
        newTableType = Type.AddTableKey(tableType, keyColumns, true) meta 
        [
            NavigationTable.NameColumn = nameColumn, 
            NavigationTable.DataColumn = dataColumn,
            NavigationTable.ItemKindColumn = itemKindColumn, 
            NavigationTable.IsLeafColumn = isLeafColumn
        ],
        navigationTable = Value.ReplaceType(table, newTableType)
    in
        navigationTable;