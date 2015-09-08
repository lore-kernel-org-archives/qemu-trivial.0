Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZFCZ-0000H7-Qd
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2015 05:28:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZZFCT-00007L-A6
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 05:28:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZZFCN-0000tG-W2
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 05:28:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59714)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1ZZFCI-0000pq-5A; Tue, 08 Sep 2015 05:28:14 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 5DF478AE6C;
	Tue,  8 Sep 2015 09:28:13 +0000 (UTC)
Received: from dhcp-1-214.lcy.redhat.com (dhcp-1-214.lcy.redhat.com
	[10.32.224.214])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t889SATu023581; Tue, 8 Sep 2015 05:28:11 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  8 Sep 2015 10:28:08 +0100
Message-Id: <1441704488-9512-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH repost] gtk: avoid redefining _WIN32_WINNT
	macro
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
X-List-Received-Date: Tue, 08 Sep 2015 09:28:30 -0000

When building for Mingw64 target on Fedora 22 a warning
is issued about _WIN32_WINNT being redefined.

In file included from ui/gtk.c:40:0:
include/ui/gtk.h:5:0: warning: "_WIN32_WINNT" redefined
 # define _WIN32_WINNT 0x0601 /* needed to get definition of MAPVK_VK_TO_VSC */
  ^
In file included from /usr/i686-w64-mingw32/sys-root/mingw/include/crtdefs.h:10:0,
                 from /usr/i686-w64-mingw32/sys-root/mingw/include/stdio.h:9,
                 from /home/berrange/src/virt/qemu/include/qemu/fprintf-fn.h:12,
                 from /home/berrange/src/virt/qemu/include/qemu-common.h:18,
                 from ui/gtk.c:37:
/usr/i686-w64-mingw32/sys-root/mingw/include/_mingw.h:225:0: note: this is the location of the previous definition
 #define _WIN32_WINNT 0x502
 ^

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 include/ui/gtk.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index ee6dffd..7796231 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -2,7 +2,9 @@
 #define UI_GTK_H
 
 #ifdef _WIN32
-# define _WIN32_WINNT 0x0601 /* needed to get definition of MAPVK_VK_TO_VSC */
+# ifndef _WIN32_WINNT
+#  define _WIN32_WINNT 0x0601 /* needed to get definition of MAPVK_VK_TO_VSC */
+# endif
 #endif
 
 #ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
-- 
2.4.3


