Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WEeIW-0007FA-G2
	for mharc-qemu-trivial@gnu.org; Sat, 15 Feb 2014 07:24:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeIP-000721-Fi
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:24:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeIK-0000DS-Cr
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:24:37 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46215)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WEeI5-0000Aa-GK; Sat, 15 Feb 2014 07:24:17 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4154C41C2E;
	Sat, 15 Feb 2014 16:24:16 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4AD7B640;
	Sat, 15 Feb 2014 16:18:23 +0400 (MSK)
Received: (nullmailer pid 21837 invoked by uid 1000);
	Sat, 15 Feb 2014 12:18:22 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Feb 2014 16:18:18 +0400
Message-Id: <1392466700-21770-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 08/10] vl: trim includes
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
X-List-Received-Date: Sat, 15 Feb 2014 12:24:42 -0000

Over time, lots of stuff moved from vl.c into separate
files.  But include statements has never been cleaned,
and they continue to carry lots of anymore-unused stuff.

Remove includes which are not relevant for vl.c anymore.
Apparently there are more includes like this, because
many are included from qemu-common.h and the like, or,
for example, I don't see were we use win32-specific
stuff in vl.c (so that maybe #include <windows.h> might
be removed too).

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c |   52 +---------------------------------------------------
 1 file changed, 1 insertion(+), 51 deletions(-)

diff --git a/vl.c b/vl.c
index a7c3f8e..316de54 100644
--- a/vl.c
+++ b/vl.c
@@ -27,64 +27,13 @@
 #include <time.h>
 #include <errno.h>
 #include <sys/time.h>
-#include <zlib.h>
-#include "qemu/bitmap.h"
 
-/* Needed early for CONFIG_BSD etc. */
 #include "config-host.h"
 
-#ifndef _WIN32
-#include <libgen.h>
-#include <sys/times.h>
-#include <sys/wait.h>
-#include <termios.h>
-#include <sys/mman.h>
-#include <sys/ioctl.h>
-#include <sys/resource.h>
-#include <sys/socket.h>
-#include <netinet/in.h>
-#include <net/if.h>
-#include <arpa/inet.h>
-#include <dirent.h>
-#include <netdb.h>
-#include <sys/select.h>
-
-#ifdef CONFIG_BSD
-#include <sys/stat.h>
-#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__)
-#include <sys/sysctl.h>
-#else
-#include <util.h>
-#endif
-#else
-#ifdef __linux__
-#include <malloc.h>
-
-#include <linux/ppdev.h>
-#include <linux/parport.h>
-#endif
-
 #ifdef CONFIG_SECCOMP
 #include "sysemu/seccomp.h"
 #endif
 
-#ifdef __sun__
-#include <sys/stat.h>
-#include <sys/ethernet.h>
-#include <sys/sockio.h>
-#include <netinet/arp.h>
-#include <netinet/in_systm.h>
-#include <netinet/ip.h>
-#include <netinet/ip_icmp.h> // must come after ip.h
-#include <netinet/udp.h>
-#include <netinet/tcp.h>
-#include <net/if.h>
-#include <syslog.h>
-#include <stropts.h>
-#endif
-#endif
-#endif
-
 #if defined(CONFIG_VDE)
 #include <libvdeplug.h>
 #endif
@@ -135,6 +84,7 @@ int main(int argc, char **argv)
 #include "exec/gdbstub.h"
 #include "qemu/timer.h"
 #include "sysemu/char.h"
+#include "qemu/bitmap.h"
 #include "qemu/cache-utils.h"
 #include "sysemu/blockdev.h"
 #include "hw/block/block.h"
-- 
1.7.10.4


