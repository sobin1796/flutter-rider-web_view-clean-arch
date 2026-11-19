-keep class org.videolan.libvlc.** { *; }

# Galli's MapLibre offline plugin retains references to optional legacy
# Mapbox offline classes. The app does not use the offline-map APIs.
-dontwarn com.mapbox.mapboxsdk.Mapbox
-dontwarn com.mapbox.mapboxsdk.camera.CameraPosition
-dontwarn com.mapbox.mapboxsdk.geometry.LatLng
-dontwarn com.mapbox.mapboxsdk.geometry.LatLngBounds$Builder
-dontwarn com.mapbox.mapboxsdk.geometry.LatLngBounds
-dontwarn com.mapbox.mapboxsdk.maps.MapView
-dontwarn com.mapbox.mapboxsdk.maps.MapboxMap$OnCameraIdleListener
-dontwarn com.mapbox.mapboxsdk.maps.MapboxMap
-dontwarn com.mapbox.mapboxsdk.maps.OnMapReadyCallback
-dontwarn com.mapbox.mapboxsdk.maps.Projection
-dontwarn com.mapbox.mapboxsdk.maps.Style
-dontwarn com.mapbox.mapboxsdk.offline.OfflineManager$Companion
-dontwarn com.mapbox.mapboxsdk.offline.OfflineManager$CreateOfflineRegionCallback
-dontwarn com.mapbox.mapboxsdk.offline.OfflineManager
-dontwarn com.mapbox.mapboxsdk.offline.OfflineRegion$OfflineRegionDeleteCallback
-dontwarn com.mapbox.mapboxsdk.offline.OfflineRegion$OfflineRegionObserver
-dontwarn com.mapbox.mapboxsdk.offline.OfflineRegion
-dontwarn com.mapbox.mapboxsdk.offline.OfflineRegionDefinition
-dontwarn com.mapbox.mapboxsdk.offline.OfflineTilePyramidRegionDefinition
-dontwarn com.mapbox.mapboxsdk.snapshotter.MapSnapshotter
