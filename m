Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WKimd-0001VD-9Z
	for mharc-qemu-trivial@gnu.org; Tue, 04 Mar 2014 01:24:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKimS-0001Du-4i
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:24:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKimO-0004Bj-0Z
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:24:44 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:53905)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WKimE-00048t-Rw; Tue, 04 Mar 2014 01:24:31 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 41DBD40852;
	Tue,  4 Mar 2014 10:24:30 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B54C0666;
	Tue,  4 Mar 2014 10:16:04 +0400 (MSK)
Received: (nullmailer pid 16598 invoked by uid 1000);
	Tue, 04 Mar 2014 06:16:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  4 Mar 2014 10:16:01 +0400
Message-Id: <1393913761-16516-14-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, Anthony Liguori <aliguori@amazon.com>
Subject: [Qemu-trivial] [PULL 13/13] vl: Remove unneeded include file
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
X-List-Received-Date: Tue, 04 Mar 2014 06:24:50 -0000

From: Stefan Weil <sw@weilnetz.de>

This file does not depend on windows.h.

Cc: Anthony Liguori <aliguori@amazon.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/vl.c b/vl.c
index 1d27b34..bf61910 100644
--- a/vl.c
+++ b/vl.c
@@ -38,10 +38,6 @@
 #include <libvdeplug.h>
 #endif
=20
-#ifdef _WIN32
-#include <windows.h>
-#endif
-
 #ifdef CONFIG_SDL
 #if defined(__APPLE__) || defined(main)
 #include <SDL.h>
--=20
1.7.10.4


