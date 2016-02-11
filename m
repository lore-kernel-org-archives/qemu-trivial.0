Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTqLN-0006JO-Kl
	for mharc-qemu-trivial@gnu.org; Thu, 11 Feb 2016 07:27:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqLL-0006Ee-1Z
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:27:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqLK-00006Z-53
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:27:30 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:33657)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aTqLG-00005K-7E; Thu, 11 Feb 2016 07:27:26 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 56C4D41454;
	Thu, 11 Feb 2016 15:19:05 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 74DB2A98;
	Thu, 11 Feb 2016 15:19:04 +0300 (MSK)
Received: (nullmailer pid 11199 invoked by uid 1000);
	Thu, 11 Feb 2016 12:19:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Feb 2016 15:19:03 +0300
Message-Id: <1834ed3afc578b8dbf39838cfdf27d457771a334.1455192968.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
References: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 14/14] w32: include winsock2.h before windows.h
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
X-List-Received-Date: Thu, 11 Feb 2016 12:27:32 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Recent Fedora complains while compiling ui/sdl.c:

    /usr/x86_64-w64-mingw32/sys-root/mingw/include/winsock2.h:15:2: warning: #warning Please include winsock2.h before windows.h [-Wcpp]

And with this patch we dutifully obey.

Stefan Weil:

Without that patch, windows.h will include winsock.h
(which conflicts with winsock2.h) when compiling sdl.c.

Normally we define WIN32_LEAN_AND_MEAN, and
windows.h won't include winsock.h.

include/ui/sdl2.h and ui/sdl.c undefine that macro,
so the order of the include files is important.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/sysemu/os-win32.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 400e098..fbed346 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -26,8 +26,8 @@
 #ifndef QEMU_OS_WIN32_H
 #define QEMU_OS_WIN32_H
 
-#include <windows.h>
 #include <winsock2.h>
+#include <windows.h>
 
 /* Workaround for older versions of MinGW. */
 #ifndef ECONNREFUSED
-- 
2.1.4


