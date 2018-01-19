# Rename the package
grep -rl --exclude-dir="*.git" 'nodomain.freeyourgadget.gadgetbridge' ./Gadgetbridge | xargs sed -i s^'nodomain.freeyourgadget.gadgetbridge'^'ee.aegrel.gadgetbridge'^g
# Update the SDK
grep -rl --exclude-dir="*.git" 'targetSdkVersion 25' ./Gadgetbridge | xargs sed -i s^'targetSdkVersion 25'^'targetSdkVersion 27'^g
grep -rl --exclude-dir="*.git" 'compileSdkVersion 25' ./Gadgetbridge | xargs sed -i s^'compileSdkVersion 25'^'compileSdkVersion 27'^g
# Update the build tools to match SDK
grep -rl --exclude-dir="*.git" "buildToolsVersion '26.0.2'" ./Gadgetbridge | xargs sed -i s^"buildToolsVersion '26.0.2'"^"buildToolsVersion '27.0.3'"^g
# Update support libraries to match SDK
grep -rl --exclude-dir="*.git" ":25.4.0" ./Gadgetbridge | xargs sed -i s^":25.4.0"^":27.0.2"^g
# Update gradle version
grep -rl --exclude-dir="*.git" "gradle:3.0.1" ./Gadgetbridge | xargs sed -i s^"gradle:3.0.1"^"gradle:3.1.0-alpha08"^g

# Fix a bug with deprecated APIs
grep -rl --exclude-dir="*.git" "import android.support.v7.app.NotificationCompat;" ./Gadgetbridge | xargs sed -i s^"import android.support.v7.app.NotificationCompat;"^"import android.support.v4.app.NotificationCompat;"^g
grep -rl --exclude-dir="*.git" "public class NotificationListener extends NotificationListenerService" ./Gadgetbridge | xargs sed -i s^"public class NotificationListener extends NotificationListenerService"^"import static android.support.v4.media.app.NotificationCompat.MediaStyle.getMediaSession;\n\npublic class NotificationListener extends NotificationListenerService"^g
grep -rl --exclude-dir="*.git" "MediaSessionCompat.Token mediaSession = NotificationCompat.getMediaSession(notification);" ./Gadgetbridge | xargs sed -i s^"MediaSessionCompat.Token mediaSession = NotificationCompat.getMediaSession(notification);"^"MediaSessionCompat.Token mediaSession = getMediaSession(notification);"^g

# Rename folders
mv ./Gadgetbridge/app/src/main/java/nodomain/freeyourgadget ./Gadgetbridge/app/src/main/java/nodomain/aegrel
mv ./Gadgetbridge/app/src/main/java/nodomain ./Gadgetbridge/app/src/main/java/ee
