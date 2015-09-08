Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZGEl-0002nB-A3
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2015 06:34:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZZGEi-0002hh-JJ
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 06:34:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZZGEe-0004UK-RV
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 06:34:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:18616)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1ZZGEZ-0004Sv-OZ; Tue, 08 Sep 2015 06:34:39 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 54A8C91DB4;
	Tue,  8 Sep 2015 10:34:39 +0000 (UTC)
Received: from dhcp-1-214.lcy.redhat.com (dhcp-1-214.lcy.redhat.com
	[10.32.224.214])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t88AYbQs017199; Tue, 8 Sep 2015 06:34:37 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  8 Sep 2015 11:34:35 +0100
Message-Id: <1441708475-27578-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH v2] gtk: avoid redefining _WIN32_WINNT macro
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
X-List-Received-Date: Tue, 08 Sep 2015 10:34:49 -0000

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

Rather than try to get MAPVK_VK_TO_VSC defined indirectly
by defining _WIN32_WINNT, instead just define it explicitly
if missing.

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 include/ui/gtk.h | 4 ----
 ui/gtk.c         | 9 +++++++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index ee6dffd..0359333 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -1,10 +1,6 @@
 #ifndef UI_GTK_H
 #define UI_GTK_H
 
-#ifdef _WIN32
-# define _WIN32_WINNT 0x0601 /* needed to get definition of MAPVK_VK_TO_VSC */
-#endif
-
 #ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
 /* Work around an -Wstrict-prototypes warning in GTK headers */
 #pragma GCC diagnostic push
diff --git a/ui/gtk.c b/ui/gtk.c
index df2a79e..80d5c20 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -104,6 +104,15 @@
 #define GDK_KEY_Pause GDK_Pause
 #endif
 
+/* Some older mingw versions lack this constant or have
+ * it conditionally defined */
+#ifdef _WIN32
+# ifndef MAPVK_VK_TO_VSC
+#  define MAPVK_VK_TO_VSC 0
+# endif
+#endif
+
+
 #define HOTKEY_MODIFIERS        (GDK_CONTROL_MASK | GDK_MOD1_MASK)
 
 static const int modifier_keycode[] = {
-- 
2.4.3


