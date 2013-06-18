Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uoq8S-0002Q0-MM
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jun 2013 03:15:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UomuG-00030t-EF
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 23:48:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UomuF-0000sS-F2
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 23:48:32 -0400
Received: from [222.73.24.84] (port=51134 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UomuE-0000sH-SO; Mon, 17 Jun 2013 23:48:31 -0400
X-IronPort-AV: E=Sophos;i="4.87,886,1363104000"; 
   d="scan'208";a="7584440"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 18 Jun 2013 11:45:34 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r5I3mSgQ016507;
	Tue, 18 Jun 2013 11:48:28 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013061811462636-2222885 ;
	Tue, 18 Jun 2013 11:46:26 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 18 Jun 2013 11:45:34 +0800
Message-Id: <1371527137-16949-2-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1371527137-16949-1-git-send-email-lig.fnst@cn.fujitsu.com>
References: <1371527137-16949-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/06/18 11:46:26,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/06/18 11:46:26,
	Serialize complete at 2013/06/18 11:46:26
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
X-Mailman-Approved-At: Tue, 18 Jun 2013 03:15:22 -0400
Cc: liguang <lig.fnst@cn.fujitsu.com>
Subject: [Qemu-trivial] [PATCH v2 2/5] vnc: boolize 'skipauth'
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
X-List-Received-Date: Tue, 18 Jun 2013 03:48:33 -0000

suggested by Michael Tokarev <mjt@tls.msk.ru>

Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
---
 include/ui/console.h |    2 +-
 ui/vnc.c             |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index f1d79f9..98edf41 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -314,7 +314,7 @@ void cocoa_display_init(DisplayState *ds, int full_screen);
 /* vnc.c */
 void vnc_display_init(DisplayState *ds);
 void vnc_display_open(DisplayState *ds, const char *display, Error **errp);
-void vnc_display_add_client(DisplayState *ds, int csock, int skipauth);
+void vnc_display_add_client(DisplayState *ds, int csock, bool skipauth);
 char *vnc_display_local_addr(DisplayState *ds);
 #ifdef CONFIG_VNC
 int vnc_display_password(DisplayState *ds, const char *password);
diff --git a/ui/vnc.c b/ui/vnc.c
index 1a8b940..3b43e00 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2771,7 +2771,7 @@ static void vnc_refresh(DisplayChangeListener *dcl)
     }
 }
 
-static void vnc_connect(VncDisplay *vd, int csock, int skipauth, bool websocket)
+static void vnc_connect(VncDisplay *vd, int csock, bool skipauth, bool websocket)
 {
     VncState *vs = g_malloc0(sizeof(VncState));
     int i;
@@ -3341,7 +3341,7 @@ fail:
 #endif /* CONFIG_VNC_WS */
 }
 
-void vnc_display_add_client(DisplayState *ds, int csock, int skipauth)
+void vnc_display_add_client(DisplayState *ds, int csock, bool skipauth)
 {
     VncDisplay *vs = vnc_display;
 
-- 
1.7.2.5


