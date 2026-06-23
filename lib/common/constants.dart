import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/models/social_media_content_model.dart';
import 'package:portfolio/models/work_model.dart';
import 'package:portfolio/styles/app_assets.dart';

class Constants {
  static const List<String> menuItems = ["Work", "Projects", "Resume"];

  static const int resumeMenuIndex = 2;

  static const String welcomeText = "Hello, I'm Jagan.";
  static const String welcomeTextNewLine = "Hello,\nI'm Jagan.";
  // static Description welcomeDescription = Description(
  //   text:
  //       "Mobile Developer specializing in Flutter and Android, with experience building production-grade apps for government, enterprise, and consumer use case. Focused on delivering seamless and user-friendly mobile experiences with strong expertise in state management across platforms.",
  //   highlights: [
  //     "Mobile Developer",
  //     "Flutter",
  //     "Android",
  //     "government",
  //     "enterprise",
  //     "consumer use case",
  //     "user-friendly",
  //     "state management",
  //   ],
  // );
  static Description welcomeDescription = Description(
    text:
        "Mobile Developer specializing in Flutter and Android, with 2+ years of experience delivering end-to-end mobile development for production-grade apps across government, enterprise, and consumer domains. Skilled in Clean Architecture, MVVM, and state management (BLoC, Provider, MobX), with hands-on expertise in BLE, RESTful APIs, real-time communication (MQTT, WebSocket, SSE), secure payment gateway integration, and offline-first architecture - delivering reliable, scalable mobile experiences from architecture to release.",
    highlights: [
      "Mobile Developer",
      "Flutter",
      "Android",
      "government",
      "enterprise",
      "consumer",
      "Clean Architecture",
      "MVVM",
      "BLoC",
      "Provider",
      "MobX",
      "BLE",
      "RESTful APIs",
      "MQTT",
      "WebSocket",
      "SSE",
      "secure payment gateway",
      "offline-first architecture",
    ],
  );

  static const String krishworksProjectString = "Projects @ Krishworks";
  static const String avasoftProjectString = "Projects @ AVASoft";
  static const String personalProjectString = "Personal Projects";

  static const String resumeLink =
      "https://drive.google.com/file/d/17DomtLxMpUL7y-OEnZsfYBHBt39w3q0l/view?usp=sharing";

  static List<SocialMediaContentModel> socialMediaContentModel = [
    SocialMediaContentModel(
      url: "sjagan2702@gmail.com",
      title: "Email",
      subject: "",
      body: "",
      iconPath: AppAssets.emailIcon,
    ),
    SocialMediaContentModel(
      url: "https://github.com/jagans27",
      title: "Github",
      iconPath: AppAssets.github,
    ),
    SocialMediaContentModel(
      url: "https://www.linkedin.com/in/jagans27/",
      title: "LinkedIn",
      iconPath: AppAssets.linkedin,
    ),
    // SocialMediaContentModel(
    //   url: "https://leetcode.com/JAGAN-S/",
    //   title: "Leetcode",
    //   iconPath: AppAssets.leetcode,
    // ),
    SocialMediaContentModel(
      url: "https://www.skillrack.com/faces/resume.xhtml?id=350927&key=jagan",
      title: "SkillRack",
      iconPath: AppAssets.skillRack,
    ),
  ];

  static List<WorkModel> works = [
    WorkModel(
      name: "Krishworks Technology and Research Labs Pvt. Ltd.",
      designation: "Flutter Developer",
      description: "Flutter, Android, iOS, Linux",
      start: "November 2024",
      end: "Prsent",
      url: "https://krishworkstech.com/",
    ),
    WorkModel(
      name: "AVASoft Pvt. Ltd.",
      designation: "Flutter Developer Intern",
      description: "Flutter, Android, iOS",
      url: "https://www.avasoft.com/",
      start: "February 2024",
      end: "September 2024",
    ),
  ];

  static List<ProjectModel> krishworksProjects = [
    ProjectModel(
      name: "Sugamya Bharat",
      description: [
        Description(
          text:
              "Enhanced a production-grade, real-time complaint tracking module with full localization across all Indian languages and dynamic text scaling, fully compliant with WCAG 2.1 accessibility standards.",
          highlights: [
            "real-time",
            "localization",
            "dynamic text scaling",
            "WCAG 2.1",
          ],
        ),
        Description(
          text:
              "Architected an advanced semantic tree and integrated voice & text bot capabilities to simplify access to government schemes and benefits for citizens nationwide (50K+ downloads).",
          highlights: [
            "semantic tree",
            "voice bot",
            "text bot",
            "50K+ downloads",
          ],
        ),
      ],
      technologies: ["Flutter"],
      appStoreLink:
          "https://apps.apple.com/in/app/sugamya-bharat-application/id6745538502",
      playStoreLink:
          "https://play.google.com/store/apps/details?id=com.geostat.sugamyabharatMOH&pcampaignid=web_share",
    ),
    ProjectModel(
      name: "Slato Exam",
      description: [
        Description(
          text:
              "Implemented dual Razorpay payment flows (SDK-based and custom QR-code) with SSE for secure, real-time payment confirmation, powering a coin/credit package system for students.",
          highlights: ["Razorpay", "SSE", "real-time", "payment"],
        ),
        Description(
          text:
              "Architected an offline-first data layer (Hive, background sync) enabling offline exam-taking and uninterrupted access in low-connectivity environments.",
          highlights: ["offline-first", "Hive", "background sync"],
        ),
        Description(
          text:
              "Rendered mathematical formulas and equations via custom Markdown UI for exam content (1K+ downloads).",
          highlights: ["custom Markdown UI", "1K+ downloads"],
        ),
      ],
      technologies: ["Flutter", "Razorpay"],
      playStoreLink:
          "https://play.google.com/store/apps/details?id=com.slatoapp.com",
    ),
    ProjectModel(
      name: "CustomAir",
      description: [
        Description(
          text:
              "Built a BLE-based mobile app to discover, pair, and securely bond with smart truck cabin controllers, enabling remote control of climate, lighting, secondary engine start/stop, and inverter-powered appliances.",
          highlights: ["BLE", "pairing", "bonding", "remote control"],
        ),
        Description(
          text:
              "Implemented 6-digit pairing with BLE bonding and auto-reconnect for high-reliability, low-latency connectivity, with real-time status monitoring (battery, temperature, engine state) and consolidated fault/warning reporting for fleet diagnostics.",
          highlights: [
            "auto-reconnect",
            "low-latency",
            "real-time monitoring",
            "fleet diagnostics",
          ],
        ),
      ],
      technologies: ["Flutter", "BLE"],
      appStoreLink: "https://apps.apple.com/in/app/customair/id6738407652",
      playStoreLink:
          "https://play.google.com/store/apps/details?id=com.kensho.custom_air",
    ),
    ProjectModel(
      name: "News Express",
      description: [
        Description(
          text:
              "Enhanced a shipment management app with docket upload and LRN number extraction, real-time shipment assignment to drivers, and vehicle number updates.",
          highlights: [
            "docket upload",
            "LRN extraction",
            "real-time assignment",
          ],
        ),
        Description(
          text:
              "Implemented multipart image upload for in-app camera-based delivery documentation, with a focus on a lightweight, fast, and intuitive design for end customers.",
          highlights: [
            "multipart upload",
            "in-app camera",
            "lightweight design",
          ],
        ),
      ],
      technologies: ["Flutter"],
      playStoreLink:
          "https://play.google.com/store/apps/details?id=com.nelogistics.app",
    ),
    ProjectModel(
      name: "Life Smarter",
      description: [
        Description(
          text:
              "Restructured U-Boot and kernel partition flow to enable Android OS A/B (seamless) updates, integrating RAUC for OTA management and Mender for cloud-based push deployments.",
          highlights: ["U-Boot", "A/B partition", "RAUC", "Mender", "OTA"],
        ),
        Description(
          text:
              "Designed rollback-safe mechanisms and secure update flow, achieving zero-downtime upgrades and improved fault tolerance across deployed devices.",
          highlights: [
            "rollback-safe",
            "zero-downtime",
            "fault tolerance",
            "secure update",
          ],
        ),
      ],
      technologies: ["Linux"],
    ),
    ProjectModel(
      name: "Smart Entertainment",
      description: [
        Description(
          text:
              "Built a custom Android TV launcher for hotel guest rooms with a curated app menu, local attractions carousel, and checkout-time access control.",
          highlights: ["Android TV", "curated menu", "access control"],
        ),
        Description(
          text:
              "Engineered MQTT-based on-premises app provisioning to push updates from a local server (bypassing Play Store), with locked-down settings to restrict unauthorized installs/uninstalls.",
          highlights: [
            "MQTT",
            "on-premises provisioning",
            "locked-down settings",
          ],
        ),
      ],
      technologies: ["Jetpack Compose"],
      websiteLink: "https://devicethread.com/smartentertainment.html",
    ),
    ProjectModel(
      name: "Sytrak RTLS",
      description: [
        Description(
          text:
              "Built core components of a real-time location tracking system using BLE (RSSI/AoA) and UWB triangulation with geofencing, enabling scalable indoor asset and personnel tracking.",
          highlights: ["real-time", "BLE", "UWB triangulation", "geofencing"],
        ),
      ],
      technologies: ["Linux", "BLE", "UWB"],
      websiteLink: "https://sytrak.com/",
    ),
  ];

  static List<ProjectModel> avasoftProjects = [
    ProjectModel(
      name: "Appify",
      description: [
        Description(
          text:
              "Created a Flutter screen template library with 100+ customizable templates.",
          highlights: ["Flutter", "100+ templates", "customizable"],
        ),
        Description(
          text:
              "Enabled rapid app development and seamless integration of pre-built UI components.",
          highlights: ["rapid development", "UI components", "integration"],
        ),
      ],
      technologies: ["Flutter"],
    ),
    ProjectModel(
      name: "Herse",
      description: [
        Description(
          text:
              "Implemented robust offline–online data synchronization for seamless API integration, ensuring consistent performance in low-connectivity environments.",
          highlights: [
            "offline-online sync",
            "API integration",
            "low-connectivity",
          ],
        ),
        Description(
          text:
              "Developed a connectivity module enabling efficient, real-time, high-performance data exchange between smartwatches and mobile devices.",
          highlights: ["real-time", "connectivity", "high-performance", "BLE"],
        ),
        Description(
          text:
              "Integrated in-app purchase flows for secure, frictionless transactions, AI-powered food recognition with personalized recommendations and memory-based tracking, and developed biometric and password-based authentication systems with end-to-end encryption for enhanced data security.",
          highlights: ["in-app purchase", "AI", "biometric", "encryption"],
        ),
      ],
      websiteLink: "https://herse.ai/",
      technologies: ["Flutter", "Android", "IOS", "BLE"],
    ),
  ];
  static List<ProjectModel> personalProjects = [
    ProjectModel(
      name: "SyncTasks",
      description: [
        Description(
          text:
              "Developed a task management app to boost productivity with AI-generated insights and secure biometric authentication.",
          highlights: ["AI", "biometric", "productivity"],
        ),
        Description(
          text:
              "Integrated Firebase Authentication and Hive for seamless offline storage and real-time syncing, enabling users to manage tasks anytime, anywhere.",
          highlights: ["Firebase", "Hive", "offline", "real-time sync"],
        ),
      ],
      technologies: ["Flutter", "Gemini"],
      repositoryLink: "https://github.com/jagans27/SyncTasks",
    ),
    ProjectModel(
      name: "Blind Master",
      description: [
        Description(
          text:
              "Developed an Android app to assist visually impaired users in navigating their surroundings by detecting objects and announcing them in realtime.",
          highlights: ["accessibility", "real-time", "object detection"],
        ),
        Description(
          text:
              "Built with TensorFlow Lite for fast object recognition and a clean, accessible UI, improving independent mobility and daily convenience.",
          highlights: ["TensorFlow Lite", "Jetpack Compose", "UI"],
        ),
      ],
      technologies: ["Jetpack Compose", "TensorFlow"],
      repositoryLink: "https://github.com/jagans27/Blind_Master_App",
    ),
    ProjectModel(
      name: "Track My Wheels",
      description: [
        Description(
          text:
              "Developed an Android bus tracking app with separate logins for students and drivers, enabling students to view the live location of buses on the map.",
          highlights: ["authentication", "live tracking", "Google Maps"],
        ),
        Description(
          text:
              "Implemented GPS-based real-time location sharing using Google Maps, allowing accurate and continuous bus tracking.",
          highlights: ["GPS", "real-time", "location sharing"],
        ),
      ],
      technologies: ["Jetpack Compose", "Google Map"],
      repositoryLink: "https://github.com/jagans27/Track_My_Wheels",
    ),
  ];
}
