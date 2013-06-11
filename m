Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmGxG-000898-Cl
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 01:17:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UmGxD-00088D-Er
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 01:17:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UmGxC-0004m4-AW
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 01:17:11 -0400
Received: from [222.73.24.84] (port=61213 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UmGxB-0004gW-WC; Tue, 11 Jun 2013 01:17:10 -0400
X-IronPort-AV: E=Sophos;i="4.87,842,1363104000"; 
   d="scan'208";a="7517744"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 11 Jun 2013 13:14:09 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r5B5H2oA030066;
	Tue, 11 Jun 2013 13:17:02 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013061113151127-2018033 ;
	Tue, 11 Jun 2013 13:15:11 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 11 Jun 2013 13:15:16 +0800
Message-Id: <1370927720-4348-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/06/11 13:15:11,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/06/11 13:15:11,
	Serialize complete at 2013/06/11 13:15:11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: liguang <lig.fnst@cn.fujitsu.com>
Subject: [Qemu-trivial] [PATCH 1/5] vnc: pass bool pararmeter for vnc_connect
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
X-List-Received-Date: Tue, 11 Jun 2013 05:17:13 -0000

type last parameter of vnc_connect if bool,
so pass 'false' instead of '0' for it.

Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
---
 ui/vnc.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index dfc7459..7d22660 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3283,7 +3283,7 @@ void vnc_display_open(DisplayState *ds, const char *display, Error **errp)
         if (csock < 0) {
             goto fail;
         }
-        vnc_connect(vs, csock, 0, 0);
+        vnc_connect(vs, csock, 0, false);
     } else {
         /* listen for connects */
         char *dpy;
@@ -3345,5 +3345,5 @@ void vnc_display_add_client(DisplayState *ds, int csock, int skipauth)
 {
     VncDisplay *vs = vnc_display;
 
-    vnc_connect(vs, csock, skipauth, 0);
+    vnc_connect(vs, csock, skipauth, false);
 }
-- 
1.7.2.5


