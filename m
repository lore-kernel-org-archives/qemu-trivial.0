Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9TJa-0003o9-31
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 04:21:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9TJU-0003i9-BA
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:21:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9TJS-0004XH-24
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:21:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58624)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9TJO-0004WW-1E; Sun, 05 Jun 2016 04:21:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0F86940916;
	Sun,  5 Jun 2016 11:21:26 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 39143B36;
	Sun,  5 Jun 2016 10:43:40 +0300 (MSK)
Received: (nullmailer pid 1151 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:07 +0300
Message-Id: <b317072fad75f45a5e1dae8cd804e853991f17c6.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 30/52] qga: Remove unnecessary glib.h includes
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Jun 2016 08:21:45 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Remove glib.h includes, as it is provided by osdep.h.

This commit was created with scripts/clean-includes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qga/channel-posix.c             | 1 -
 qga/channel-win32.c             | 1 -
 qga/channel.h                   | 1 -
 qga/commands-posix.c            | 1 -
 qga/commands-win32.c            | 1 -
 qga/commands.c                  | 1 -
 qga/guest-agent-command-state.c | 1 -
 qga/main.c                      | 1 -
 qga/service-win32.c             | 1 -
 9 files changed, 9 deletions(-)

diff --git a/qga/channel-posix.c b/qga/channel-posix.c
index 63458c6..bb65d8b 100644
--- a/qga/channel-posix.c
+++ b/qga/channel-posix.c
@@ -1,5 +1,4 @@
 #include "qemu/osdep.h"
-#include <glib.h>
 #include <termios.h>
 #include "qapi/error.h"
 #include "qemu/sockets.h"
diff --git a/qga/channel-win32.c b/qga/channel-win32.c
index 68168d1..21f9dee 100644
--- a/qga/channel-win32.c
+++ b/qga/channel-win32.c
@@ -1,5 +1,4 @@
 #include "qemu/osdep.h"
-#include <glib.h>
 #include <windows.h>
 #include <io.h>
 #include "qga/guest-agent-core.h"
diff --git a/qga/channel.h b/qga/channel.h
index 3704ea9..ae8cf0f 100644
--- a/qga/channel.h
+++ b/qga/channel.h
@@ -12,7 +12,6 @@
 #ifndef QGA_CHANNEL_H
 #define QGA_CHANNEL_H
 
-#include <glib.h>
 
 typedef struct GAChannel GAChannel;
 
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index f0057f5..eaef7be 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -12,7 +12,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include <sys/ioctl.h>
 #include <sys/wait.h>
 #include <dirent.h>
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index d76327f..c1a8588 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -12,7 +12,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include <wtypes.h>
 #include <powrprof.h>
 #include <winsock2.h>
diff --git a/qga/commands.c b/qga/commands.c
index 3144464..50fd26a 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "qga/guest-agent-core.h"
 #include "qga-qmp-commands.h"
 #include "qapi/qmp/qerror.h"
diff --git a/qga/guest-agent-command-state.c b/qga/guest-agent-command-state.c
index 20b9b22..4de229c 100644
--- a/qga/guest-agent-command-state.c
+++ b/qga/guest-agent-command-state.c
@@ -10,7 +10,6 @@
  * See the COPYING file in the top-level directory.
  */
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "qga/guest-agent-core.h"
 
 struct GACommandState {
diff --git a/qga/main.c b/qga/main.c
index c5527821..4c3b2c7 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -11,7 +11,6 @@
  * See the COPYING file in the top-level directory.
  */
 #include "qemu/osdep.h"
-#include <glib.h>
 #include <getopt.h>
 #include <glib/gstdio.h>
 #ifndef _WIN32
diff --git a/qga/service-win32.c b/qga/service-win32.c
index 7243758..fd434e3 100644
--- a/qga/service-win32.c
+++ b/qga/service-win32.c
@@ -11,7 +11,6 @@
  * See the COPYING file in the top-level directory.
  */
 #include "qemu/osdep.h"
-#include <glib.h>
 #include <windows.h>
 #include "qga/service-win32.h"
 
-- 
2.1.4


