import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/models/social_media_content_model.dart';
import 'package:portfolio/models/work_model.dart';
import 'package:portfolio/styles/app_assets.dart';

class Constants {
  static const List<String> menuItems = ["Work", "Projects", "Resume"];

  static const int resumeMenuIndex = 2;

  static const String welcomeText = "Hello, I'm Jagan.";
  static const String welcomeTextNewLine = "Hello,\nI'm Jagan.";
  static Description welcomeDescription = Description(
    text:
        "Mobile Developer specializing in Flutter and Android, with experience building production-grade apps for government, enterprise, and consumer use case. Focused on delivering seamless and user-friendly mobile experiences with strong expertise in state management across platforms.",
    highlights: [
      "Mobile Developer",
      "Flutter",
      "Android",
      "government",
      "enterprise",
      "consumer use case",
      "user-friendly",
      "state management",
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
              "Enhanced a production-grade, real-time complaint-tracking module with full localization across Indian languages and dynamic text scaling, ensuring accessibility compliance.",
          highlights: [
            "real-time",
            "localization",
            "dynamic text scaling",
            "accessibility",
          ],
        ),
        Description(
          text:
              "Architected an advanced semantic tree and integrated voice & text bot capabilities to simplify user engagement and improve access to government schemes and benefits, fully compliant with WCAG 2.1 standards.",
          highlights: ["semantic tree", "voice bot", "text bot", "WCAG 2.1"],
        ),
      ],
      technologies: ["Flutter"],
      appStoreLink:
          "https://apps.apple.com/in/app/sugamya-bharat-application/id6745538502",
      playStoreLink:
          "https://play.google.com/store/apps/details?id=com.geostat.sugamyabharatMOH&pcampaignid=web_share",
    ),
    ProjectModel(
      name: "CustomAir",
      description: [
        Description(
          text:
              "Engineered secure BLE communication with bonding and auto-reconnect mechanisms, ensuring high-reliability, low-latency connectivity for smart truck systems.",
          highlights: ["BLE", "bonding", "auto-reconnect", "low-latency"],
        ),
        Description(
          text:
              "Designed and developed a mobile interface enabling real-time automation, monitoring, and control of cabin environments and onboard utilities, optimizing operational efficiency across fleets.",
          highlights: ["real-time", "automation", "monitoring", "control"],
        ),
      ],
      technologies: ["Flutter", "BLE"],
      appStoreLink: "https://apps.apple.com/in/app/customair/id6738407652",
      playStoreLink:
          "https://play.google.com/store/apps/details?id=com.kensho.custom_air&pcampaignid=web_share",
    ),
    ProjectModel(
      name: "TechieTeacher",
      description: [
        Description(
          text:
              "Implemented a teacher-driven, MQTT-powered real-time content synchronization system, enabling interactive lessons, task distribution, and scalable classroom experiences.",
          highlights: [
            "MQTT",
            "real-time",
            "content synchronization",
            "interactive",
          ],
        ),
        Description(
          text:
              "Ensured low-latency page navigation across all connected student tablets, delivering seamless and synchronized learning experiences.",
          highlights: ["low-latency", "scalability", "synchronization"],
        ),
      ],
      technologies: ["Android", "MQTT"],
      playStoreLink:
          "https://play.google.com/store/apps/details?id=com.krishworks.techieteacher&pcampaignid=web_share",
    ),
    ProjectModel(
      name: "SmartEntertainment",
      description: [
        Description(
          text:
              "Developed a custom Android TV launcher with MQTT-based on premises application provisioning and secure OTA update pipeline.",
          highlights: ["Android TV", "MQTT", "OTA update"],
        ),
        Description(
          text:
              "Enabled zero-downtime guest lifecycle management (onboarding/offboarding) and low-latency hotel content broadcasting.",
          highlights: ["zero-downtime", "low-latency", "guest lifecycle"],
        ),
        Description(
          text:
              "Provided controlled access to third-party entertainment platforms and locked-down native system settings for enhanced security and operational control.",
          highlights: ["access control", "security", "system control"],
        ),
      ],
      technologies: ["Jetpack Compose"],
      websiteLink: "https://devicethread.com/smartentertainment.html",
    ),
    ProjectModel(
      name: "Life Smarter",
      description: [
        Description(
          text:
              "Architected an Android OS A/B (seamless) partition update system leveraging RAUC for OTA management and Mender for cloud-based push deployments.",
          highlights: ["Android OS", "A/B partition", "RAUC", "Mender", "OTA"],
        ),
        Description(
          text:
              "Designed rollback-safe mechanisms and a secure update flow to ensure zero downtime system upgrades, fault tolerance, and uninterrupted device operation.",
          highlights: [
            "rollback",
            "zero downtime",
            "fault tolerance",
            "secure update",
          ],
        ),
      ],
      technologies: ["Linux"],
    ),
    ProjectModel(
      name: "Sytrak RTLS",
      description: [
        Description(
          text:
              "Developed a real-time location tracking engine using BLE(RSSI and AOA) and UWB triangulation, providing accurate asset and personnel tracking in complex indoor environments.",
          highlights: ["real-time", "BLE", "UWB triangulation", "indoor"],
        ),
        Description(
          text:
              "Implemented a scalable architecture for seamless integration with existing infrastructure, enabling efficient deployment and management of RTLS across large facilities.",
          highlights: ["scalable architecture", "integration", "deployment"],
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
