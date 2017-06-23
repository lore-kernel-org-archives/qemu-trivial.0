Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dOGBl-0000z7-Mk
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jun 2017 00:27:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <li.ping288@zte.com.cn>) id 1dOFAE-00058x-UT
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 23:21:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <li.ping288@zte.com.cn>) id 1dOFAA-0004yD-7J
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 23:21:42 -0400
Received: from mxhk.zte.com.cn ([63.217.80.70]:39196)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <li.ping288@zte.com.cn>) id 1dOFA9-0004oa-K5
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 23:21:38 -0400
X-scanvirus: By SEG_CYREN AntiVirus Engine
X-scanresult: CLEAN
X-MAILFROM: <li.ping288@zte.com.cn>
X-RCPTTO: <qemu-devel@nongnu.org>
X-FROMIP: 10.30.3.20
X-SEG-Scaned: 1
X-Received: unknown,10.30.3.20,20170623111357
Received: from unknown (HELO mse01.zte.com.cn) (10.30.3.20)
	by localhost with (AES256-SHA encrypted) SMTP;
	23 Jun 2017 03:13:57 -0000
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id v5N3IPoH079683;
	Fri, 23 Jun 2017 11:18:25 +0800 (GMT-8)
	(envelope-from li.ping288@zte.com.cn)
Received: from localhost.localdomain ([10.74.120.79])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2017062311183030-2120679 ;
	Fri, 23 Jun 2017 11:18:30 +0800 
From: Li Ping <li.ping288@zte.com.cn>
To: mdroth@linux.vnet.ibm.com
Cc: marcandre.lureau@redhat.com, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Li Ping <li.ping288@zte.com.cn>
Date: Fri, 23 Jun 2017 11:17:43 +0800
Message-Id: <1498187863-4937-1-git-send-email-li.ping288@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2017-06-23 11:18:30,
	Serialize by Router on notes_smtp/zte_ltd(Release 8.5.3FP6|November 21,
	2013) at 2017-06-23 11:18:10
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn v5N3IPoH079683
X-HQIP: 127.0.0.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x [fuzzy]
X-Received-From: 63.217.80.70
X-Mailman-Approved-At: Fri, 23 Jun 2017 00:27:20 -0400
Subject: [Qemu-trivial] [PATCH RESEND] QEMU Guest Agent: Fix memory leak of
 device information set
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
X-List-Received-Date: Fri, 23 Jun 2017 03:21:43 -0000

The caller of SetupDiGetClassDevs must delete the returned device informati=
on
 set when it is no longer needed by calling SetupDiDestroyDeviceInfoList.

Signed-off-by: Li Ping <li.ping288@zte.com.cn>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 qga/commands-win32.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 439d229..6f16457 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -512,7 +512,7 @@ static GuestPCIAddress *get=5Fpci=5Finfo(char *guid, Er=
ror **errp)
             } else {
                 error=5Fsetg=5Fwin32(errp, GetLastError(),
                         "failed to get device name");
-                goto out;
+                goto free=5Fdev=5Finfo;
             }
         }
=20
@@ -560,6 +560,9 @@ static GuestPCIAddress *get=5Fpci=5Finfo(char *guid, Er=
ror **errp)
         pci->bus =3D bus;
         break;
     }
+
+free=5Fdev=5Finfo:
+    SetupDiDestroyDeviceInfoList(dev=5Finfo);
 out:
     g=5Ffree(buffer);
     g=5Ffree(name);
--=20
1.8.3.1



