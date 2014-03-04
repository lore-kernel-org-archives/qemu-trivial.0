Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WKime-0001X4-Es
	for mharc-qemu-trivial@gnu.org; Tue, 04 Mar 2014 01:24:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKimS-0001F9-Ni
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:24:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKimO-0004Bp-2x
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:24:44 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36263)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WKimE-00048y-SB; Tue, 04 Mar 2014 01:24:31 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4CB1940855;
	Tue,  4 Mar 2014 10:24:30 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7220F661;
	Tue,  4 Mar 2014 10:16:04 +0400 (MSK)
Received: (nullmailer pid 16593 invoked by uid 1000);
	Tue, 04 Mar 2014 06:16:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  4 Mar 2014 10:15:59 +0400
Message-Id: <1393913761-16516-12-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 11/13] qemu-img: Remove unneeded include files
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

There is no dependency on windows.h, and the standard include files are
already included by qemu-common.h.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-img.c |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index 78fc868..886db88 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -32,12 +32,6 @@
 #include "block/block_int.h"
 #include "block/qapi.h"
 #include <getopt.h>
-#include <stdio.h>
-#include <stdarg.h>
-
-#ifdef _WIN32
-#include <windows.h>
-#endif
=20
 typedef struct img_cmd_t {
     const char *name;
--=20
1.7.10.4


