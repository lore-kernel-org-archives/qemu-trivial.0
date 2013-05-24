Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ufi3I-0007ow-0R
	for mharc-qemu-trivial@gnu.org; Thu, 23 May 2013 22:48:20 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Ufi3B-0007Z4-BT
	for qemu-trivial@nongnu.org; Thu, 23 May 2013 22:48:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Ufi35-0007t5-Mi
	for qemu-trivial@nongnu.org; Thu, 23 May 2013 22:48:13 -0400
Received: from [222.73.24.84] (port=11419 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1Ufi2v-0007U9-SM; Thu, 23 May 2013 22:47:58 -0400
X-IronPort-AV: E=Sophos;i="4.87,731,1363104000"; 
   d="scan'208";a="7351281"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 24 May 2013 10:44:59 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r4O2lkEk002230;
	Fri, 24 May 2013 10:47:49 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013052410462785-1495795 ;
	Fri, 24 May 2013 10:46:27 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 May 2013 10:47:33 +0800
Message-Id: <1369363654-7063-4-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1369363654-7063-1-git-send-email-lig.fnst@cn.fujitsu.com>
References: <1369363654-7063-1-git-send-email-lig.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/05/24 10:46:27,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/05/24 10:46:28
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: Paolo Bonzini <pbonzini@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>, liguang <lig.fnst@cn.fujitsu.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Qemu-trivial] [PATCH 3/4] debugcon: fix compiler warning when open
	DEBUG_DEBUGCON
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
X-List-Received-Date: Fri, 24 May 2013 02:48:18 -0000

compiler warnings:
  CC    hw/char/debugcon.o
hw/char/debugcon.c: In function =E2=80=98debugcon=5Fioport=5Fwrite=E2=80=99:
hw/char/debugcon.c:58: warning: format =E2=80=98%02x=E2=80=99 expects type =
=E2=80=98unsigned int=E2=80=99, but argument 3 has type =E2=80=98uint64=5Ft=
=E2=80=99
hw/char/debugcon.c: In function =E2=80=98debugcon=5Fioport=5Fread=E2=80=99:
hw/char/debugcon.c:70: warning: format =E2=80=98%04x=E2=80=99 expects type =
=E2=80=98unsigned int=E2=80=99, but argument 2 has type =E2=80=98hwaddr=E2=
=80=99

Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
---
 hw/char/debugcon.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
index 52fa0ab..3b0637d 100644
--- a/hw/char/debugcon.c
+++ b/hw/char/debugcon.c
@@ -55,7 +55,7 @@ static void debugcon=5Fioport=5Fwrite(void *opaque, hwadd=
r addr, uint64=5Ft val,
     unsigned char ch =3D val;
=20
 #ifdef DEBUG=5FDEBUGCON
-    printf(" [debugcon: write addr=3D0x%04" HWADDR=5FPRIx " val=3D0x%02x]\=
n", addr, val);
+    printf(" [debugcon: write addr=3D0x%04" HWADDR=5FPRIx " val=3D0x%02" P=
RIx64 "]\n", addr, val);
 #endif
=20
     qemu=5Fchr=5Ffe=5Fwrite(s->chr, &ch, 1);
@@ -67,7 +67,7 @@ static uint64=5Ft debugcon=5Fioport=5Fread(void *opaque, =
hwaddr addr, unsigned width)
     DebugconState *s =3D opaque;
=20
 #ifdef DEBUG=5FDEBUGCON
-    printf("debugcon: read addr=3D0x%04x\n", addr);
+    printf("debugcon: read addr=3D0x%04" HWADDR=5FPRIx "\n", addr);
 #endif
=20
     return s->readback;
--=20
1.7.2.5

=

