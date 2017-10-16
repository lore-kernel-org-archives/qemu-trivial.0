Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4CNi-0006Lt-Jq
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 16:53:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4CNe-0006IB-LD
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:53:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4CNd-0004ge-S7
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:52:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36727)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1e4CNZ-0004cC-KO; Mon, 16 Oct 2017 16:52:53 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6AC7C40D0A;
	Mon, 16 Oct 2017 23:52:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4E0A3AF8;
	Mon, 16 Oct 2017 23:33:44 +0300 (MSK)
Received: (nullmailer pid 12317 invoked by uid 1000);
	Mon, 16 Oct 2017 20:33:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 16 Oct 2017 23:33:31 +0300
Message-Id: <70857ad6212276dcda364e36b30258222bdb31bc.1508185933.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
References: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
References: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 04/14] ui/gtk: Fix deprecation of
 vte_terminal_copy_clipboard
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
X-List-Received-Date: Mon, 16 Oct 2017 20:53:01 -0000

From: Anthony PERARD <anthony.perard@citrix.com>

vte_terminal_copy_clipboard() is deprecated in VTE 0.50.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 ui/gtk.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/ui/gtk.c b/ui/gtk.c
index 5bd87c265a..342e96fbe9 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1702,7 +1702,12 @@ static void gd_menu_copy(GtkMenuItem *item, void *opaque)
     GtkDisplayState *s = opaque;
     VirtualConsole *vc = gd_vc_find_current(s);
 
+#if VTE_CHECK_VERSION(0, 50, 0)
+    vte_terminal_copy_clipboard_format(VTE_TERMINAL(vc->vte.terminal),
+                                       VTE_FORMAT_TEXT);
+#else
     vte_terminal_copy_clipboard(VTE_TERMINAL(vc->vte.terminal));
+#endif
 }
 
 static void gd_vc_adjustment_changed(GtkAdjustment *adjustment, void *opaque)
-- 
2.11.0


