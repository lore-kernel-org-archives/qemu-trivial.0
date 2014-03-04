Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WKiwM-0004bm-LL
	for mharc-qemu-trivial@gnu.org; Tue, 04 Mar 2014 01:34:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKiwE-0004KG-2O
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:34:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKiw9-0007jV-U7
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:34:49 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56980)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WKivv-0007dU-RC; Tue, 04 Mar 2014 01:34:31 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C7B0940855;
	Tue,  4 Mar 2014 10:34:30 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 14131669;
	Tue,  4 Mar 2014 10:16:05 +0400 (MSK)
Received: (nullmailer pid 16596 invoked by uid 1000);
	Tue, 04 Mar 2014 06:16:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  4 Mar 2014 10:16:00 +0400
Message-Id: <1393913761-16516-13-git-send-email-mjt@msgid.tls.msk.ru>
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
Subject: [Qemu-trivial] [PULL 12/13] qga: Remove unneeded include file
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
X-List-Received-Date: Tue, 04 Mar 2014 06:34:56 -0000

From: Stefan Weil <sw@weilnetz.de>

This file does not depend on windows.h.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qga/main.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/qga/main.c b/qga/main.c
index cfca291..d838c3e 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -35,7 +35,6 @@
 #ifdef _WIN32
 #include "qga/service-win32.h"
 #include "qga/vss-win32.h"
-#include <windows.h>
 #endif
 #ifdef __linux__
 #include <linux/fs.h>
--=20
1.7.10.4


