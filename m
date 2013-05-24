Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ufi3N-00081q-G4
	for mharc-qemu-trivial@gnu.org; Thu, 23 May 2013 22:48:25 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Ufi3F-0007jK-Kv
	for qemu-trivial@nongnu.org; Thu, 23 May 2013 22:48:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Ufi37-0007ux-TS
	for qemu-trivial@nongnu.org; Thu, 23 May 2013 22:48:17 -0400
Received: from [222.73.24.84] (port=23201 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1Ufi2w-0007ZD-3i; Thu, 23 May 2013 22:47:58 -0400
X-IronPort-AV: E=Sophos;i="4.87,731,1363104000"; 
   d="scan'208";a="7351282"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 24 May 2013 10:45:01 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r4O2lkEl002230;
	Fri, 24 May 2013 10:47:50 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013052410462854-1495796 ;
	Fri, 24 May 2013 10:46:28 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 May 2013 10:47:34 +0800
Message-Id: <1369363654-7063-5-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1369363654-7063-1-git-send-email-lig.fnst@cn.fujitsu.com>
References: <1369363654-7063-1-git-send-email-lig.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/05/24 10:46:28,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/05/24 10:46:30
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: Paolo Bonzini <pbonzini@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>, liguang <lig.fnst@cn.fujitsu.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Qemu-trivial] [PATCH 4/4] debugcon: use fprintf(stderr...) instead
	of printf
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
X-List-Received-Date: Fri, 24 May 2013 02:48:24 -0000

suggested by Andreas F=C3=A4rber <afaerber@suse.de>

Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
---
 hw/char/debugcon.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
index 3b0637d..be20ede 100644
--- a/hw/char/debugcon.c
+++ b/hw/char/debugcon.c
@@ -55,7 +55,8 @@ static void debugcon=5Fioport=5Fwrite(void *opaque, hwadd=
r addr, uint64=5Ft val,
     unsigned char ch =3D val;
=20
 #ifdef DEBUG=5FDEBUGCON
-    printf(" [debugcon: write addr=3D0x%04" HWADDR=5FPRIx " val=3D0x%02" P=
RIx64 "]\n", addr, val);
+    fprintf(stderr, " [debugcon: write addr=3D0x%04" HWADDR=5FPRIx
+            " val=3D0x%02" PRIx64 "]\n", addr, val);
 #endif
=20
     qemu=5Fchr=5Ffe=5Fwrite(s->chr, &ch, 1);
@@ -67,7 +68,7 @@ static uint64=5Ft debugcon=5Fioport=5Fread(void *opaque, =
hwaddr addr, unsigned width)
     DebugconState *s =3D opaque;
=20
 #ifdef DEBUG=5FDEBUGCON
-    printf("debugcon: read addr=3D0x%04" HWADDR=5FPRIx "\n", addr);
+    fprintf(stderr, "debugcon: read addr=3D0x%04" HWADDR=5FPRIx "\n", addr=
);
 #endif
=20
     return s->readback;
--=20
1.7.2.5

=

