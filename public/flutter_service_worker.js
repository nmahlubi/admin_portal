'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "5ff97bd257459285e446290cd75c0ab9",
"index.html": "49f7f39a32a17b71e6676715fd00e3a2",
"/": "49f7f39a32a17b71e6676715fd00e3a2",
"main.dart.js": "2944b2a6c21622c817aa5ef56dd53246",
"favicon.png": "8c074988c053a791b40e5072119b75c6",
"icons/Icon-192.png": "9685e6fed6e593582b659cdd3908052c",
"icons/Icon-512.png": "af0d3b07fc15a7cabdeafb9a20b4a95d",
"manifest.json": "224f56c057052ea41763cc7a6f6b756a",
"assets/AssetManifest.json": "f89880ec958b17fe756f9afcf00a8896",
"assets/NOTICES": "7011121e63ddf155421e71bf0bee6958",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/assets/images/user_avatar.png": "fbf5c808c7e5db8fe73afa12af1eeb0c",
"assets/assets/images/minion.jpg": "f7bc02187c5ea3fcaff6e248526e1c94",
"assets/assets/images/person.png": "3d8b4b60a6c544040b849a924985e7a9",
"assets/assets/images/image_placeholder.png": "7179385e9acb3bca35bb016ff3ca4159",
"assets/assets/images/user.png": "3e35e34c05a79cdccce8e6c9666c899d",
"assets/assets/images/loading.gif": "17e5eeb6eeb00dff6eee2e38f0623f27",
"assets/assets/images/background.png": "c42fd32d872ae4c3b854600f80f0ea1e",
"assets/assets/images/person_blue.png": "b9685a5c720938af2113283dcb61e222",
"assets/assets/images/live_connected_logo.png": "cf41dffb19754b698f3eb16bb4ab6de8",
"assets/assets/icons/add.png": "215dcd373c97e263eb1a062505a1fa0c",
"assets/assets/icons/messaging_alert.png": "d8dae27f1ad1979620c79d9a3479b1c0",
"assets/assets/icons/check.png": "97fbd4aa6a0e1592b19d20dc41ac26f3",
"assets/assets/icons/home_plain.png": "ddf576cc66250765eacc4498e763babe",
"assets/assets/icons/messaging_alerts.png": "684cae06461ec2bb948ae9a0d369be62",
"assets/assets/icons/group.png": "37caced95cfdd89e095c2ae99f7e81be",
"assets/assets/icons/milestones.png": "01ef714d3455c537246c325c91d5a377",
"assets/assets/icons/pin_secondary.png": "046187e61a616b5b03a850e1191ed9fa",
"assets/assets/icons/my_account.png": "3e49b1da088b05fd3013ed1de626bd45",
"assets/assets/icons/pin_live_location.png": "ce50b7b51d39dd70d46752a1b0066f96",
"assets/assets/icons/back_arrow.png": "3c74cfa0270acb3e2a26ee8b7ebdbb5e",
"assets/assets/icons/inbox.png": "96c33016b056402912003e5cd3337551",
"assets/assets/icons/community.png": "fc44126e498d08e3d726cba3d703eba3",
"assets/assets/icons/cancel.png": "88a532db15058b43777b53fe11c75ff6",
"assets/assets/icons/alert.png": "e218fc5b736c5b35cc13e11409603add",
"assets/assets/icons/home.png": "44d4fe717b8f0549a4b9c95e2b16b07d",
"assets/assets/icons/track.png": "22792ebe1fcd0c09f2a13b974159bafb",
"assets/assets/icons/children.png": "3de8271e56e339d390ee1cc407b7481e",
"assets/assets/icons/repeat.png": "34a4828817f9e54dd1f1532f55163210",
"assets/assets/icons/pin_primary.png": "695f2fe3c2c49e1b2970e0774c49f94d",
"assets/assets/icons/apple.png": "7e002fdec6b39a77a89f9d253203650e",
"assets/assets/icons/menu.png": "b6d4b389ba7c948ba3213565c26122fc",
"assets/assets/icons/password.png": "0c219a0d0e385c2d9aaa18f33e0ffde9",
"assets/assets/icons/schedule.png": "8c061e4d79e2029aa2a77a4a13a1d627",
"assets/assets/icons/call.png": "14ba209637559ecb5a4b88d61cb28833",
"assets/assets/icons/delete.png": "bd63d3f68bd603658aaecaed023d3fb3",
"assets/assets/icons/sent.png": "cd87fe2d6a8be0c5f94fa02781950b00",
"assets/assets/icons/home_menu.png": "90afa38fabdea76ac7dc31887519d5a5",
"assets/assets/icons/edit.png": "1fc1ffd5c0d1df1b848ec1b5de3f8116",
"assets/assets/icons/accept.png": "e219e8c1b8c0c531a4f77e9f0e75230e",
"assets/assets/icons/google.png": "0eb8078198b32ac9d48f60dc38d16bc3",
"assets/assets/icons/facebook.png": "3bb1ac581908303db47d52eaf6f5d42b",
"assets/assets/icons/my_account_plain.png": "8231b5379acafdeba68ea34d754a4e36",
"assets/assets/icons/camera.png": "57a9b506ad240ec59e315e30bdc86f03",
"assets/assets/icons/banking.png": "f72a944b21c62ce7838d30df85269c27",
"assets/assets/icons/message.png": "82d035aa3381e36bfb25ba7df663197e",
"assets/assets/icons/refresh.png": "ec47b74c98ebc5e8d429d58010bd77b1",
".idea/vcs.xml": "f990e6d29e03715a04983dd2f51d3595",
".idea/workspace.xml": "34a529c5898634f503f86d9c0fe8151d",
".idea/modules.xml": "1eb3b065c55895e347308e50cd717dee",
".idea/web.iml": "c9bd9f053e6a09728e39aac3967676f1",
".idea/misc.xml": "5324b724c63c57f0a0b172b45fafc6c4"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
