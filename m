Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIW71-0004Lf-7x
	for mharc-qemu-trivial@gnu.org; Tue, 15 May 2018 05:19:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fIW6y-0004HD-AQ
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 05:19:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fIW6x-0001Yx-Af
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 05:19:12 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34952 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fIW6t-0001VX-Al; Tue, 15 May 2018 05:19:07 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB68541AE7D2;
	Tue, 15 May 2018 09:19:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-49.ams2.redhat.com
	[10.36.116.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 731AB112D18E;
	Tue, 15 May 2018 09:19:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id F3F4D3F122; Tue, 15 May 2018 11:19:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Peter Wu <peter@lekensteyn.nl>
Date: Tue, 15 May 2018 11:19:01 +0200
Message-Id: <20180515091901.27774-11-kraxel@redhat.com>
In-Reply-To: <20180515091901.27774-1-kraxel@redhat.com>
References: <20180515091901.27774-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 15 May 2018 09:19:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 15 May 2018 09:19:06 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PULL 10/10] gtk: disable the F10 menubar key
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

From: Peter Wu <peter@lekensteyn.nl>

The F10 key is used in various applications, disable it unconditionally
(do not limit it to grab mode). Note that this property is deprecated
and might be removed in the future (GTK+ commit b082fb598d).

Fixes: https://bugs.launchpad.net/qemu/+bug/1726910
Signed-off-by: Peter Wu <peter@lekensteyn.nl>
Message-id: 20180510230739.28459-2-peter@lekensteyn.nl
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/ui/gtk.c b/ui/gtk.c
index ef6ca7179e..dbce970dc4 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2321,6 +2321,8 @@ static GtkWidget *gd_create_menu_view(GtkDisplayState *s)
 
 static void gd_create_menus(GtkDisplayState *s)
 {
+    GtkSettings *settings;
+
     s->accel_group = gtk_accel_group_new();
     s->machine_menu = gd_create_menu_machine(s);
     s->view_menu = gd_create_menu_view(s);
@@ -2336,6 +2338,10 @@ static void gd_create_menus(GtkDisplayState *s)
 
     g_object_set_data(G_OBJECT(s->window), "accel_group", s->accel_group);
     gtk_window_add_accel_group(GTK_WINDOW(s->window), s->accel_group);
+
+    /* Disable the default "F10" menu shortcut. */
+    settings = gtk_widget_get_settings(s->window);
+    g_object_set(G_OBJECT(settings), "gtk-menu-bar-accel", "", NULL);
 }
 
 
-- 
2.9.3


