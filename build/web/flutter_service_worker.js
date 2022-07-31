'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "375f94ddda43c37405d2206678b87e56",
"index.html": "b5c38d514be8c7232f7386ae275d5099",
"/": "b5c38d514be8c7232f7386ae275d5099",
"main.dart.js": "74aa34b26dee5c977a1357d977053ac6",
"jsQR.js": "06c4d5a0dd8975a781f089e8b308e5b8",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"favicon.png": "6b19d9ce6d818697c44e6a365fe87615",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "baf81abd734ae2797f8ace2d3b268343",
"assets/AssetManifest.json": "1f95b9d2e453497fc56cc506977213c8",
"assets/NOTICES": "f5d0f68b4cebbe438f75a3e421e14a5a",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/shaders/ink_sparkle.frag": "9c3e3d43b0e9c5f49d13a15aa43201e1",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/assets/images/common/footer/map_pin_brown.svg": "b61791f5da5dbd486c8e5d37a9f2b43e",
"assets/assets/images/common/footer/home.svg": "198a26ba6483a8d4373b3a1a651e1f73",
"assets/assets/images/common/footer/home_brown.svg": "fbfc0ae3a61545dfd1cd93f9b6e09ccb",
"assets/assets/images/common/footer/speech_baloon.svg": "d036b60328f9ef528f1aef53565d0a54",
"assets/assets/images/common/footer/map_pin.svg": "9f6235b7e08411cf72db9243413dc41f",
"assets/assets/images/common/footer/speech_baloon_brown.svg": "9f7a37ee04ea465c149bc52649c1b1b3",
"assets/assets/images/common/return_button.png": "d1d9621c8fe1d8efbcc2a732b9b70c09",
"assets/assets/images/common/warbler/seven_parts_length_warbler_brown.png": "f41c13d8400787cbe31386c628968954",
"assets/assets/images/common/warbler/warbler.png": "6b19d9ce6d818697c44e6a365fe87615",
"assets/assets/images/common/warbler/seven_parts_length_warbler.png": "dd5a076dd61607c63f9c3d2d7dd459ff",
"assets/assets/images/common/warbler/half_warbler.png": "30ed1be1d784acb06be8cc21d7db09e7",
"assets/assets/images/common/warbler/half_warbler.svg": "18ecdbfdff2358d8350ef06fa852e1d9",
"assets/assets/images/common/warbler/seven_parts_length_warbler.svg": "04398ca4e83a578f9d52db8c21ab6dc1",
"assets/assets/images/common/warbler/seven_parts_length_warbler_brown.svg": "ca24e9f27b60e5ec8c315321e008df94",
"assets/assets/images/common/warbler/warbler.svg": "21b425e89412bf32719bb62da4868de5",
"assets/assets/images/common/warbler/warbler_brown.png": "1de175a4cb8c9bde54ffee4ec85e2f02",
"assets/assets/images/common/warbler/warbler_brown.svg": "2b1274f1cb7f8d6cd0e01ec2fa1cc120",
"assets/assets/images/common/speech_balloon.png": "bfdd3376274eac36d650f2ef7b23a71f",
"assets/assets/images/common/orihime_bus_wide.png": "66dbda0a5277f1e28fd8eab52494025a",
"assets/assets/images/common/orihime_bus.png": "8daeeb4e8126209a23df70d880a6482f",
"assets/assets/images/common/map_sample.png": "1b89f8a4c13081d7a667ab206d3bd009",
"assets/assets/images/common/present.png": "434b2d05dbcddbe0e660cce0b2e04338",
"assets/assets/images/common/roadside_station_wide.png": "3ed4753fffdc3a8046a036f4daf8d82b",
"assets/assets/images/common/roadside_station.png": "9bfea9054119cfcb821343ee036a5230",
"assets/assets/images/common/dish.jpg": "e55a3a6178ee7ebe1d87550368c655d5",
"assets/assets/images/common/icon/qr_ic.svg": "707b10fdc9e6f03d5fb4faabf55de80d",
"assets/assets/images/common/icon/point_send.svg": "64baac90cc022239ac0809fb0acfdf66",
"assets/assets/images/common/dish_wide.png": "20bbe2b28338065abc68a34eba45cac0",
"assets/assets/images/news/news_0.png": "6fab28f278015c6339f147bc907ffaa5",
"assets/assets/images/news/news_everyone.png": "5896212d1d7383fd822be0a2ec8cd5e1",
"assets/assets/images/store/iida_fudo_waterfall.png": "8cf7b1359a42f3795cd0898b335124b2",
"assets/assets/images/store/orihime_bus.png": "8daeeb4e8126209a23df70d880a6482f",
"assets/assets/images/store/paghetti_squash.jpeg": "4b3b82adea6eacc20572d2a7cd65d506",
"assets/assets/images/store/amanomiya_burial_mouds.png": "60f68d4f36a520e04d104601edfb592b",
"assets/assets/images/store/roadside_station.png": "9bfea9054119cfcb821343ee036a5230",
"assets/assets/images/store/orimono_design_center.png": "48ff54f67c01a54c7ce8534257989e11",
"assets/assets/images/store/sakuma_okonomiyaki.png": "4ea29ef85aa839cbb176aef6650e4f2f",
"assets/assets/images/store/rengeya.png": "a72a91c815993a37536cdff287ac7f18",
"assets/assets/images/store/rice_ball%2520_replica.jpeg": "9346bae94ad0835400f7eb9849376b8e",
"assets/assets/images/store/al_plaza_sikazima.png": "5a65b80faef4b07b09c01d36736220c5",
"assets/assets/pdf/point_get.pdf": "f155de0e523118fa58b2a09cb2f78805",
"assets/assets/pdf/qr_installation.pdf": "01d6e9ecd62529dead9555587902dd8b",
"assets/assets/pdf/history.pdf": "d1a74f5fb79547e056ba9fe962e5c931",
"assets/assets/pdf/pay.pdf": "24cee403ad7cb841f0316d8b94137905",
"assets/assets/pdf/schedule.pdf": "0b1e73c2804c87d4f7dacfcb2fbfb9f0",
"assets/assets/pdf/everyone.pdf": "f81de765261593b0e31ad6406cea3864",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
