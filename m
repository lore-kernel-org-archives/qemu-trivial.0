Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIW73-0004Og-OA
	for mharc-qemu-trivial@gnu.org; Tue, 15 May 2018 05:19:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48689)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fIW6y-0004H8-70
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 05:19:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fIW6v-0001Xg-LX
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 05:19:12 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34836 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fIW6q-0001TF-1c; Tue, 15 May 2018 05:19:04 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8356141AE7C6;
	Tue, 15 May 2018 09:19:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-49.ams2.redhat.com
	[10.36.116.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6335D215CDA7;
	Tue, 15 May 2018 09:19:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id BA43D3EC01; Tue, 15 May 2018 11:19:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>
Date: Tue, 15 May 2018 11:18:54 +0200
Message-Id: <20180515091901.27774-4-kraxel@redhat.com>
In-Reply-To: <20180515091901.27774-1-kraxel@redhat.com>
References: <20180515091901.27774-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 15 May 2018 09:19:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 15 May 2018 09:19:03 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PULL 03/10] ui/gtk: Only try to initialize EGL/X11
 if GtkGlArea failed
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
X-List-Received-Date: Tue, 15 May 2018 09:19:13 -0000

From: Tomeu Vizoso <tomeu.vizoso@collabora.com>

The commit referenced below changed the logic by causing the gtk-egl
backend to be initialized regardless of whether GtkGlArea initialization
succeeded. This causes eglInitialize to crash in Wayland systems without
XWayland.

This patch restores the previous logic.

Fixes: 4c70280592f5 ("ui/gtk: use GtkGlArea on wayland only")
Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-id: 20180507134237.14996-1-tomeu.vizoso@collabora.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 9e5390f2c2..568c9563ce 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2484,7 +2484,7 @@ static void early_gtk_display_init(DisplayOptions *opts)
         if (GDK_IS_WAYLAND_DISPLAY(gdk_display_get_default())) {
             gtk_use_gl_area = true;
             gtk_gl_area_init();
-        }
+        } else
 #endif
         {
             gtk_egl_init();
-- 
2.9.3


