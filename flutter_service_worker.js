'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "888483df48293866f9f41d3d9274a779",
"assets/FontManifest.json": "5f1ecdf6bdd7ebbc764ceaca457ae7b1",
"assets/packages/flutter_breakpoints/assets/demo.gif": "855dc91376ba541f079c96ca7ffa1de6",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/assets/images/avatar.png": "fa57088eaee3e82bb32a84349b87ca18",
"assets/assets/images/sugamya_bharat_app_logo.png": "fde33f76952c506f6f0badc06d730b35",
"assets/assets/icons/website_icon.svg": "68b9b6626167177afa05c74385f8c92b",
"assets/assets/icons/email_icon.svg": "8ee8278b64415eff75b95ee3f5fb6bc1",
"assets/assets/icons/arrow_up_right_icon.svg": "b1147128d253ae938aaab0513969b0ca",
"assets/assets/icons/leetcode_icon.svg": "cab2bfd8e45e2b174b38f5612d4abfeb",
"assets/assets/icons/playstore_icon.svg": "87c823c087f799cfff80356da2087f72",
"assets/assets/icons/copyright_icon.svg": "81ec8e34b4be2a66d6b5efb5ac4e8039",
"assets/assets/icons/appstore_icon.svg": "7c7a45e4d3fc7c02a188264d16094632",
"assets/assets/icons/skillrack_icon.svg": "9c9891399d31b6e30cdd431a0f01354e",
"assets/assets/icons/github_icon.svg": "66833644f431d43e34ab6cf289515ef7",
"assets/assets/icons/flutter_icon.svg": "7efe79bc8b815cfb2353e50ffee97ff8",
"assets/assets/icons/code_branch_icon.svg": "0fc33c8d43737efe8d9c71a5a4c87e69",
"assets/assets/icons/linkedin_icon.svg": "de66cf8ca8ab535b611b27c3cb2f9058",
"assets/assets/lotties/not_found_lottie.json": "e8e93c5dbb8bd238d3b1c666056d21ff",
"assets/assets/fonts/airbnb_cereal/airbnb_cereal-ExtraBold.ttf": "0a0cbe1eca15f71b7187b38b1173eb98",
"assets/assets/fonts/airbnb_cereal/airbnb_cereal-Black.ttf": "4395b29d9210bd75051ebce1e66e186d",
"assets/assets/fonts/airbnb_cereal/airbnb_cereal-Light.ttf": "1f9c7d320137974038c2f1a7300a1577",
"assets/assets/fonts/airbnb_cereal/airbnb_cereal-Medium.ttf": "d9fb3054e00c65841121da81c48e4fb1",
"assets/assets/fonts/airbnb_cereal/airbnb_cereal-Book.ttf": "86b15ac031e0507ad790afafd9adf7f7",
"assets/assets/fonts/airbnb_cereal/airbnb_cereal-Bold.ttf": "c94c29feb80b02db176028d16fc634d2",
"assets/AssetManifest.bin.json": "bcd386648081fcc0bf16184a628ca38b",
"assets/fonts/MaterialIcons-Regular.otf": "08e44edcafaf2f3596c30f961040d083",
"assets/AssetManifest.bin": "7d5d47e077e1bc13278e0c5e9f656e2d",
"assets/NOTICES": "2386e1eea20e8acf0844e6d60818e55c",
"assets/AssetManifest.json": "4c7ff2f7bfe4ca50790a9a63bd0fd313",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"flutter_bootstrap.js": "db4ec9fa5b706276f7384bcb57440d41",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"index.html": "4ef39ffb237ced747d5d3fd60850da44",
"/": "4ef39ffb237ced747d5d3fd60850da44",
"main.dart.js": "a38f51112dc0e4395864baa90dff0348",
"favicon.png": "ad5271c300542665963f2569dbdf5f02",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55",
"version.json": "009c9e65172e010890f7f65fde438006"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
