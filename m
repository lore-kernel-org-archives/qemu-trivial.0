Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QSL38-0000HC-N2
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jun 2011 23:27:50 -0400
Received: from eggs.gnu.org ([140.186.70.92]:40273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QSL36-0000Gh-Du
	for qemu-trivial@nongnu.org; Thu, 02 Jun 2011 23:27:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QSL35-0001yL-H4
	for qemu-trivial@nongnu.org; Thu, 02 Jun 2011 23:27:48 -0400
Received: from mail-vx0-f173.google.com ([209.85.220.173]:33497)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1QSL32-0001xf-HC; Thu, 02 Jun 2011 23:27:44 -0400
Received: by vxb37 with SMTP id 37so1285156vxb.4
	for <multiple recipients>; Thu, 02 Jun 2011 20:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=8Mr8KA+EBFmtyq1kbbktNg2dtjgdhGvM+hTyDgldQ2I=;
	b=WWFceY46JiFhBEYMP1Iijx4RzWp7VXBXJGz1fu2yFFiqSgdS9+2fQky04tdNn543MD
	JM/UM4yGFF3Umy4cLtX7p2svDJyFGo+AbnHJmuj50yn+LDS/0eRNrwDEpLQiKeWRCoeN
	UHVWBl6uSa+R7XrJTSgzwCtS+zJIjR4PH/Dzc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=oOEDaTU1TTOGXIoXznhjamIYEGo/O/cHAm39JpQdsxfQgBZxbWMWXfEXfJuEgVHez2
	Wrrt+walrzPqWoIhCl6BXO4FUzS1tfBfoTybX8uPmfa1UKFhdQA/6aRlRw/6gsgRR2Xh
	rPoPZUS30HWtS81RhCGkLE75XbiRku3Q2GWQE=
Received: by 10.52.100.3 with SMTP id eu3mr1983487vdb.31.1307071663472;
	Thu, 02 Jun 2011 20:27:43 -0700 (PDT)
Received: from localhost.localdomain (modemcable055.201-23-96.mc.videotron.ca
	[96.23.201.55])
	by mx.google.com with ESMTPS id bt2sm413250vdc.0.2011.06.02.20.27.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Jun 2011 20:27:42 -0700 (PDT)
From: Alexandre Raymond <cerbere@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  2 Jun 2011 23:26:49 -0400
Message-Id: <1307071609-1165-1-git-send-email-cerbere@gmail.com>
X-Mailer: git-send-email 1.7.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.220.173
Cc: qemu-trivial@nongnu.org, Alexandre Raymond <cerbere@gmail.com>
Subject: [Qemu-trivial] [PATCH] Fix compilation warning due to missing
	header for sigaction (followup)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Jun 2011 03:27:50 -0000

This patch removes all references to signal.h when qemu-common.h is included
as they become redundant.

Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
---
 audio/audio_pt_int.c  |    2 --
 audio/sdlaudio.c      |    1 -
 block/raw-posix.c     |    2 --
 bsd-user/syscall.c    |    1 -
 darwin-user/signal.c  |    3 ---
 exec.c                |    1 -
 linux-user/signal.c   |    1 -
 net/tap.c             |    1 -
 posix-aio-compat.c    |    1 -
 qemu-char.c           |    1 -
 qemu-progress.c       |    1 -
 savevm.c              |    1 -
 target-i386/helper.c  |    1 -
 target-ppc/helper.c   |    1 -
 target-sparc/helper.c |    1 -
 ui/curses.c           |    1 -
 ui/sdl.c              |    4 ----
 usb-bsd.c             |    1 -
 usb-linux.c           |    1 -
 19 files changed, 0 insertions(+), 26 deletions(-)

diff --git a/audio/audio_pt_int.c b/audio/audio_pt_int.c
index 908c569..9a9c306 100644
--- a/audio/audio_pt_int.c
+++ b/audio/audio_pt_int.c
@@ -6,8 +6,6 @@
 #include "audio_int.h"
 #include "audio_pt_int.h"
 
-#include <signal.h>
-
 static void GCC_FMT_ATTR(3, 4) logerr (struct audio_pt *pt, int err,
                                        const char *fmt, ...)
 {
diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index a847aa9..d24daa5 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -32,7 +32,6 @@
 #elif defined(__OpenBSD__) || defined(__FreeBSD__) || defined(__DragonFly__)
 #include <pthread.h>
 #endif
-#include <signal.h>
 #endif
 
 #define AUDIO_CAP "sdl"
diff --git a/block/raw-posix.c b/block/raw-posix.c
index 6b72470..9a72a17 100644
--- a/block/raw-posix.c
+++ b/block/raw-posix.c
@@ -43,7 +43,6 @@
 
 #ifdef __sun__
 #define _POSIX_PTHREAD_SEMANTICS 1
-#include <signal.h>
 #include <sys/dkio.h>
 #endif
 #ifdef __linux__
@@ -53,7 +52,6 @@
 #include <linux/fd.h>
 #endif
 #if defined (__FreeBSD__) || defined(__FreeBSD_kernel__)
-#include <signal.h>
 #include <sys/disk.h>
 #include <sys/cdio.h>
 #endif
diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index eb1cdf2..d4d039a 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -31,7 +31,6 @@
 #include <sys/syscall.h>
 #include <sys/param.h>
 #include <sys/sysctl.h>
-#include <signal.h>
 #include <utime.h>
 
 #include "qemu.h"
diff --git a/darwin-user/signal.c b/darwin-user/signal.c
index 4862018..e2adca3 100644
--- a/darwin-user/signal.c
+++ b/darwin-user/signal.c
@@ -21,7 +21,6 @@
 #include <string.h>
 #include <stdarg.h>
 #include <unistd.h>
-#include <signal.h>
 #include <errno.h>
 #include <sys/ucontext.h>
 
@@ -32,8 +31,6 @@
 #undef uc_link
 #endif
 
-#include <signal.h>
-
 #include "qemu.h"
 #include "qemu-common.h"
 
diff --git a/exec.c b/exec.c
index 8529390..bb8334c 100644
--- a/exec.c
+++ b/exec.c
@@ -36,7 +36,6 @@
 #include "qemu-timer.h"
 #if defined(CONFIG_USER_ONLY)
 #include <qemu.h>
-#include <signal.h>
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
 #include <sys/param.h>
 #if __FreeBSD_version >= 700104
diff --git a/linux-user/signal.c b/linux-user/signal.c
index c7a375f..11b25be 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -21,7 +21,6 @@
 #include <string.h>
 #include <stdarg.h>
 #include <unistd.h>
-#include <signal.h>
 #include <errno.h>
 #include <assert.h>
 #include <sys/ucontext.h>
diff --git a/net/tap.c b/net/tap.c
index b8cd252..1f26dc9 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -27,7 +27,6 @@
 
 #include "config-host.h"
 
-#include <signal.h>
 #include <sys/ioctl.h>
 #include <sys/stat.h>
 #include <sys/wait.h>
diff --git a/posix-aio-compat.c b/posix-aio-compat.c
index f3cc868..c4116e3 100644
--- a/posix-aio-compat.c
+++ b/posix-aio-compat.c
@@ -17,7 +17,6 @@
 #include <unistd.h>
 #include <errno.h>
 #include <time.h>
-#include <signal.h>
 #include <string.h>
 #include <stdlib.h>
 #include <stdio.h>
diff --git a/qemu-char.c b/qemu-char.c
index 5e04a20..fb13b28 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -35,7 +35,6 @@
 
 #include <unistd.h>
 #include <fcntl.h>
-#include <signal.h>
 #include <time.h>
 #include <errno.h>
 #include <sys/time.h>
diff --git a/qemu-progress.c b/qemu-progress.c
index 8ebe8ef..5f1b8df 100644
--- a/qemu-progress.c
+++ b/qemu-progress.c
@@ -26,7 +26,6 @@
 #include "osdep.h"
 #include "sysemu.h"
 #include <stdio.h>
-#include <signal.h>
 
 struct progress_state {
     float current;
diff --git a/savevm.c b/savevm.c
index f4ff1a1..939845c 100644
--- a/savevm.c
+++ b/savevm.c
@@ -23,7 +23,6 @@
  */
 #include <unistd.h>
 #include <fcntl.h>
-#include <signal.h>
 #include <time.h>
 #include <errno.h>
 #include <sys/time.h>
diff --git a/target-i386/helper.c b/target-i386/helper.c
index 89df997..ca4ec08 100644
--- a/target-i386/helper.c
+++ b/target-i386/helper.c
@@ -21,7 +21,6 @@
 #include <stdio.h>
 #include <string.h>
 #include <inttypes.h>
-#include <signal.h>
 
 #include "cpu.h"
 #include "exec-all.h"
diff --git a/target-ppc/helper.c b/target-ppc/helper.c
index 4700632..cf2a368 100644
--- a/target-ppc/helper.c
+++ b/target-ppc/helper.c
@@ -21,7 +21,6 @@
 #include <stdio.h>
 #include <string.h>
 #include <inttypes.h>
-#include <signal.h>
 
 #include "cpu.h"
 #include "exec-all.h"
diff --git a/target-sparc/helper.c b/target-sparc/helper.c
index b2d4d70..e9b42d0 100644
--- a/target-sparc/helper.c
+++ b/target-sparc/helper.c
@@ -21,7 +21,6 @@
 #include <stdio.h>
 #include <string.h>
 #include <inttypes.h>
-#include <signal.h>
 
 #include "cpu.h"
 #include "exec-all.h"
diff --git a/ui/curses.c b/ui/curses.c
index 82bc614..d29b6cf 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -24,7 +24,6 @@
 #include <curses.h>
 
 #ifndef _WIN32
-#include <signal.h>
 #include <sys/ioctl.h>
 #include <termios.h>
 #endif
diff --git a/ui/sdl.c b/ui/sdl.c
index 14a62d9..f2bd4a0 100644
--- a/ui/sdl.c
+++ b/ui/sdl.c
@@ -28,10 +28,6 @@
 #include <SDL.h>
 #include <SDL_syswm.h>
 
-#ifndef _WIN32
-#include <signal.h>
-#endif
-
 #include "qemu-common.h"
 #include "console.h"
 #include "sysemu.h"
diff --git a/usb-bsd.c b/usb-bsd.c
index 9bab6e3..c1bcc4a 100644
--- a/usb-bsd.c
+++ b/usb-bsd.c
@@ -39,7 +39,6 @@
 #else
 #include <bus/usb/usb.h>
 #endif
-#include <signal.h>
 
 /* This value has maximum potential at 16.
  * You should also set hw.usb.debug to gain
diff --git a/usb-linux.c b/usb-linux.c
index baa6574..fcfa09e 100644
--- a/usb-linux.c
+++ b/usb-linux.c
@@ -37,7 +37,6 @@
 
 #include <dirent.h>
 #include <sys/ioctl.h>
-#include <signal.h>
 
 #include <linux/usbdevice_fs.h>
 #include <linux/version.h>
-- 
1.7.5


