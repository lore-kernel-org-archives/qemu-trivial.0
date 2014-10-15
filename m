Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XeKVk-0005FV-0n
	for mharc-qemu-trivial@gnu.org; Wed, 15 Oct 2014 05:04:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1XeKVc-00056n-Ig
	for qemu-trivial@nongnu.org; Wed, 15 Oct 2014 05:04:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1XeKVW-0006C6-Cl
	for qemu-trivial@nongnu.org; Wed, 15 Oct 2014 05:04:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54531)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1XeKVJ-00068F-PY; Wed, 15 Oct 2014 05:04:21 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9F94Jjr025909
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 15 Oct 2014 05:04:20 -0400
Received: from Igors-MacBook-Pro.local.com (vpn-233-6.phx2.redhat.com
	[10.3.233.6])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9F94HqK010820; Wed, 15 Oct 2014 05:04:18 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 15 Oct 2014 11:04:15 +0200
Message-Id: <1413363855-31606-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH] vga: drop unused dmask16 and dmask4 to avoid
	compiler warnings
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
X-List-Received-Date: Wed, 15 Oct 2014 09:04:46 -0000

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/display/vga.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/hw/display/vga.c b/hw/display/vga.c
index 19e7f23..52eaf05 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -136,32 +136,6 @@ static const uint32_t mask16[16] = {
 #define PAT(x) cbswap_32(x)
 #endif
 
-static const uint32_t dmask16[16] = {
-    PAT(0x00000000),
-    PAT(0x000000ff),
-    PAT(0x0000ff00),
-    PAT(0x0000ffff),
-    PAT(0x00ff0000),
-    PAT(0x00ff00ff),
-    PAT(0x00ffff00),
-    PAT(0x00ffffff),
-    PAT(0xff000000),
-    PAT(0xff0000ff),
-    PAT(0xff00ff00),
-    PAT(0xff00ffff),
-    PAT(0xffff0000),
-    PAT(0xffff00ff),
-    PAT(0xffffff00),
-    PAT(0xffffffff),
-};
-
-static const uint32_t dmask4[4] = {
-    PAT(0x00000000),
-    PAT(0x0000ffff),
-    PAT(0xffff0000),
-    PAT(0xffffffff),
-};
-
 static uint32_t expand4[256];
 static uint16_t expand2[256];
 static uint8_t expand4to8[16];
-- 
1.9.3 (Apple Git-50)


