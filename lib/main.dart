import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kmsgx/google/protobuf/empty.pb.dart';

import 'src/generated/generated/kmsgxPkgDbTeam/kmsgx_pkg_db_team.pb.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teams List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Teams List'),
    );
  }
}

class AppwriteConfig {
  final String domainUrl;
  final String? projectId;
  final String? functionId;
  final String? usersTeamsBucketId;

  const AppwriteConfig({
    this.domainUrl = "",
    this.projectId,
    this.functionId,
    this.usersTeamsBucketId,
  });

  Map<String, dynamic> toMap() {
    return {
      'domainUrl': domainUrl,
      'projectId': projectId,
      'functionId': functionId,
      'usersTeamsBucketId': usersTeamsBucketId,
    };
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Reply_Team_List _teams = Reply_Team_List();
  bool _loading = false;
  Client? _client;
  late Account _account;
  late Databases _databases;
  late Functions _functions;
  late Storage _storage;
  late String _functionId = "";
  late String _projectId = "";
  late String _domainUrl = "";
  late String _databaseId = "";
  late String _usersCollectionId = "";
  late String _usersTeamsBucketId = "";

  // Current loged User Session information
  late Map<String, dynamic> _userSessionInfo = {};

  @override
  void initState() {
    super.initState();
    setState(() {
      _loading = true;
    });
    AppwriteConfig awConfig = AppwriteConfig(
        domainUrl: "https://fra.cloud.appwrite.io/v1",
        functionId: "684343a9003570f197cc",
        projectId: "67ec7d3a002677dbcf65",
        usersTeamsBucketId: "id_bucket_users_teams");

    initAppWrite(awConfig);

    _checkSessions().then((session) async {
      if (session.isEmpty) {
        // if session is empty then call to perfom login
        loginWithEmailPassword().then((session) async {
          if (session.isNotEmpty) {
            await _onFetchTeams();
          } else {
            setState(() {
              _loading = false;
            });
          }
        }).onError((error, stackStress) {
          print("error => $error \nstackStress => $stackStress");
          setState(() {
            _loading = false;
          });
        });
      } else {
        await _onFetchTeams();
      }
    });
  }

  void initAppWrite(AppwriteConfig config) {
    _client = Client()
      ..setEndpoint(config.domainUrl)
      ..setProject(config.projectId)
      ..setSelfSigned(status: true); // for development only

    // setting up the appwrite domainUrl id
    _domainUrl = config.domainUrl;
    // setting up the appwrite project id
    _projectId = config.projectId ?? "";
    // setting up the appwrite function id
    _functionId = config.functionId ?? "";
    // setting up the appwrite storage users & teams bucket id
    _usersTeamsBucketId = config.usersTeamsBucketId ?? "";

    _account = Account(_client!);
    _databases = Databases(_client!);
    _functions = Functions(_client!);
    _storage = Storage(_client!);
  }

  Future<Map<String, dynamic>> loginWithEmailPassword() async {
    await _account
        .createEmailPasswordSession(
            email: "test@myuser.com", password: "0987654321")
        .then((session) async {
      // set the session information
      await _setUserSessionInfo(session);
    }).catchError((error) {
      print("loginWithEmailPassword Error: $error");
    });

    return _userSessionInfo;
  }

  // to check whether the session exist or not
  Future<Map<String, dynamic>> _checkSessions() async {
    // "current" indicated active login/signup _userSessionInfo
    await _account
        .getSession(sessionId: "current")
        .then((Session session) async {
      // set the session information
      await _setUserSessionInfo(session);
    }).catchError((error) {
      _userSessionInfo = {};
      print("_checkSessions Error: $error");
    });

    return _userSessionInfo;
  }

  // common method to handle session information
  Future<void> _setUserSessionInfo(Session session) async {
    // get curret logged in user information
    User user = await _account.get();

    print("\nUser:: \n${user.toMap()}\n");
    print("\nSession:: \n${session.toMap()}\n");

    _userSessionInfo = {
      'userId': session.userId,
      'sessionId': session.$id,
      'sessionExpirationDate': session.expire,
      'provider': session.providerUid,
      'name': user.name,
      'email': user.email,
    };
  }

  // Mock API call: replace with your actual API logic
  Future<Reply_Team_List> getUserGroups() async {
    Request_Team_List requestTeamList = Request_Team_List(empty: Empty());

    Uint8List? replyUint8List =
        await sendByteData(requestTeamList.writeToBuffer());
    print("replyTeamList :: $replyUint8List");

    Reply_Team_List replayTeamList = Reply_Team_List();

    if ((replyUint8List?.isNotEmpty ?? false)) {
      replayTeamList.mergeFromBuffer(replyUint8List!);
    }

    return replayTeamList;
  }

  _onFetchTeams() async {
    if (_userSessionInfo.isEmpty) {
      setState(() {
        _loading = false;
      });
      return;
    }

    try {
      Reply_Team_List teams = await getUserGroups();
      setState(() {
        _teams = teams;
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Future<Uint8List?> sendByteData(Uint8List byteData) async {
    Uint8List? responseData;

    // execute the function with the provided byte data
    // and return the response in byte data
    // execute for '/kmsgx' in backend cloud function
    await _functions
        .createExecution(
      functionId: _functionId,
      headers: {
        'Content-Type': 'application/octet-stream',
      },
      path: '/kmsgx',
      method: ExecutionMethod.pOST,
      body: String.fromCharCodes(byteData),
    )
        .then(
      (Execution execution) {
        print('Function executed successfully: ${execution.responseBody}');
        // if it is not UnAuthorized response then responseData with byte data
        if (!execution.responseBody.contains('UnAuthorized')) {
          // codeUnits will return the LIST<int> data
          responseData = Uint8List.fromList(execution.responseBody.codeUnits);
        }
      },
    ).onError((error, stackTrace) {
      print("error, stackTrace :: \n$error, \n $stackTrace");
    });

    return responseData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _userSessionInfo.isEmpty
              ? const Center(
                  child: Text(
                      'Please add valid config for appwrite & login details of user in Code!'))
              : _teams.teamInfo.isNotEmpty
                  ? const Center(
                      child: Text(
                          'No teams found. Tap the button to fetch teams.'))
                  : ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: _teams.teamInfo.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            title: Text(_teams.teamInfo[index].friendlyName),
                          ),
                        );
                      },
                    ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _onFetchTeams,
        label: const Text('Fetch Teams'),
        icon: const Icon(Icons.api),
      ),
    );
  }
}
