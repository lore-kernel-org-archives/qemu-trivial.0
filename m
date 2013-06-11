Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmGxY-0008Uk-3o
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 01:17:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UmGxW-0008SV-2s
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 01:17:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UmGxV-0004pG-9v
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 01:17:30 -0400
Received: from [222.73.24.84] (port=22781 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UmGxU-0004p9-VU; Tue, 11 Jun 2013 01:17:29 -0400
X-IronPort-AV: E=Sophos;i="4.87,842,1363104000"; 
   d="scan'208";a="7517748"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 11 Jun 2013 13:14:34 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r5B5HQNG030080;
	Tue, 11 Jun 2013 13:17:27 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013061113153612-2018043 ;
	Tue, 11 Jun 2013 13:15:36 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 11 Jun 2013 13:15:17 +0800
Message-Id: <1370927720-4348-2-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1370927720-4348-1-git-send-email-lig.fnst@cn.fujitsu.com>
References: <1370927720-4348-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/06/11 13:15:36,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/06/11 13:15:36,
	Serialize complete at 2013/06/11 13:15:36
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: liguang <lig.fnst@cn.fujitsu.com>
Subject: [Qemu-trivial] [PATCH 2/5] vnc: pass bool parameter for
	vnc_listen_read
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
X-List-Received-Date: Tue, 11 Jun 2013 05:17:31 -0000

Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
---
 ui/vnc.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 7d22660..1a8b940 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2889,13 +2889,13 @@ static void vnc_listen_read(void *opaque, bool websocket)
 
 static void vnc_listen_regular_read(void *opaque)
 {
-    vnc_listen_read(opaque, 0);
+    vnc_listen_read(opaque, false);
 }
 
 #ifdef CONFIG_VNC_WS
 static void vnc_listen_websocket_read(void *opaque)
 {
-    vnc_listen_read(opaque, 1);
+    vnc_listen_read(opaque, true);
 }
 #endif /* CONFIG_VNC_WS */
 
-- 
1.7.2.5


