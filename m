Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b5Ef1-0002IR-4l
	for mharc-qemu-trivial@gnu.org; Tue, 24 May 2016 11:54:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5Eey-0002Gh-Kr
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 11:54:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5Eex-0003kc-9u
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 11:54:20 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57219)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5Eex-0003kJ-2x
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 11:54:19 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5ECH-0002yK-U7; Tue, 24 May 2016 16:24:41 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-trivial@nongnu.org
Date: Tue, 24 May 2016 16:24:38 +0100
Message-Id: <1464103479-26913-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1464103479-26913-1-git-send-email-peter.maydell@linaro.org>
References: <1464103479-26913-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH 3/4] qga: Remove unnecessary glib.h includes
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
X-List-Received-Date: Tue, 24 May 2016 15:54:21 -0000

Remove glib.h includes, as it is provided by osdep.h.

This commit was created with scripts/clean-includes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
index 2ae3725..2ae149b 100644
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
1.9.1


