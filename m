Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e1vjM-0004sw-Rs
	for mharc-qemu-trivial@gnu.org; Tue, 10 Oct 2017 10:42:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55201)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=449813866=anthony.perard@citrix.com>)
	id 1e1vjF-0004lW-F0
	for qemu-trivial@nongnu.org; Tue, 10 Oct 2017 10:41:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=449813866=anthony.perard@citrix.com>)
	id 1e1vjE-0002ZL-NL
	for qemu-trivial@nongnu.org; Tue, 10 Oct 2017 10:41:53 -0400
Received: from smtp02.citrix.com ([66.165.176.63]:29524)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <prvs=449813866=anthony.perard@citrix.com>)
	id 1e1vjA-0002SR-2y; Tue, 10 Oct 2017 10:41:48 -0400
X-IronPort-AV: E=Sophos;i="5.42,505,1500940800"; d="scan'208";a="451628672"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-trivial@nongnu.org>, "Daniel P. Berrange" <berrange@redhat.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Date: Tue, 10 Oct 2017 11:24:18 +0100
Message-ID: <20171010102418.13487-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171009150231.GN2954@redhat.com>
References: <20171009150231.GN2954@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.63
Subject: [Qemu-trivial] [PATCH] ui/gtk: Fix deprecation of
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
X-List-Received-Date: Tue, 10 Oct 2017 14:41:59 -0000

vte_terminal_copy_clipboard() is deprecated in VTE 0.50.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
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
Anthony PERARD


