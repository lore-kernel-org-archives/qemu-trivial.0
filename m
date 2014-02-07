Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WBgmp-0002iL-5y
	for mharc-qemu-trivial@gnu.org; Fri, 07 Feb 2014 03:27:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WBgmj-0002aE-0V
	for qemu-trivial@nongnu.org; Fri, 07 Feb 2014 03:27:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WBgme-0001BK-5L
	for qemu-trivial@nongnu.org; Fri, 07 Feb 2014 03:27:40 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:53681)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WBgmT-00018n-U4; Fri, 07 Feb 2014 03:27:26 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8AE2F40CB1;
	Fri,  7 Feb 2014 12:27:20 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6E87F63B;
	Fri,  7 Feb 2014 12:27:20 +0400 (MSK)
Received: (nullmailer pid 24095 invoked by uid 1000);
	Fri, 07 Feb 2014 08:27:20 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  7 Feb 2014 12:27:19 +0400
Message-Id: <1391761639-24060-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH] vl: trim includes
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
X-List-Received-Date: Fri, 07 Feb 2014 08:27:46 -0000

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
index cd89090..c5c7228 100644
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


