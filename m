Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVI8A-0008Rv-9j
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jul 2017 09:56:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVI87-0008P8-2r
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:56:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVI86-0000t0-8V
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:56:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54545)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dVI80-0000q6-TV; Wed, 12 Jul 2017 09:56:33 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 910BF40F6A;
	Wed, 12 Jul 2017 16:56:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 8D90BAC8;
	Wed, 12 Jul 2017 16:38:14 +0300 (MSK)
Received: (nullmailer pid 29049 invoked by uid 1000);
	Wed, 12 Jul 2017 13:38:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Li Ping <li.ping288@zte.com.cn>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 12 Jul 2017 16:38:05 +0300
Message-Id: <9bd8e9330ade42878b19a5172131087220d590d5.1499866676.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 09/13] qga-win32: Fix memory leak of device
 information set
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
X-List-Received-Date: Wed, 12 Jul 2017 13:56:41 -0000

From: Li Ping <li.ping288@zte.com.cn>

The caller of SetupDiGetClassDevs must delete the returned device informa=
tion
 set when it is no longer needed by calling SetupDiDestroyDeviceInfoList.

Signed-off-by: Li Ping <li.ping288@zte.com.cn>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qga/commands-win32.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 439d229225..6f1645747b 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -512,7 +512,7 @@ static GuestPCIAddress *get_pci_info(char *guid, Erro=
r **errp)
             } else {
                 error_setg_win32(errp, GetLastError(),
                         "failed to get device name");
-                goto out;
+                goto free_dev_info;
             }
         }
=20
@@ -560,6 +560,9 @@ static GuestPCIAddress *get_pci_info(char *guid, Erro=
r **errp)
         pci->bus =3D bus;
         break;
     }
+
+free_dev_info:
+    SetupDiDestroyDeviceInfoList(dev_info);
 out:
     g_free(buffer);
     g_free(name);
--=20
2.11.0


