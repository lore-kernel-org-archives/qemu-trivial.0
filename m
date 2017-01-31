Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cYNLS-0003Wq-Jl
	for mharc-qemu-trivial@gnu.org; Mon, 30 Jan 2017 20:34:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48101)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cYNLQ-0003Vy-Mj
	for qemu-trivial@nongnu.org; Mon, 30 Jan 2017 20:34:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cYNLP-0000Ap-Qs
	for qemu-trivial@nongnu.org; Mon, 30 Jan 2017 20:34:52 -0500
Received: from mail-it0-x243.google.com ([2607:f8b0:4001:c0b::243]:35201)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <skiver.cloud.yzy@gmail.com>)
	id 1cYNLJ-00007B-MH; Mon, 30 Jan 2017 20:34:45 -0500
Received: by mail-it0-x243.google.com with SMTP id 203so17516042ith.2;
	Mon, 30 Jan 2017 17:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/WoOAvoZpEB9DDqG3oVUz0AWWSAGQ28XlBekhxBcGAM=;
	b=NApDDhWfQtdVbzw1lhA2N+PR+mV+HI9ZfWZtt0zgJNRl7g2dLwjE8bfvOz7Nm+5nrG
	mPgP7D4j7cfdbjpoeI3ZHVbuV3kC9KhlV9R6UgilmQIbMfqsqSwcDPtOjFZkwXl3xjNV
	KxmHzp4rbtO72/KMrnwEyrdUvjs5IrZ6q1nGV876UguiN78JXF0hs+3uw16vvswkzIeZ
	xldDUBAXwtFz+Cobz3BF4qazVdUx7Zd2zGzgGAtMSEBeeNDuuEkatdD+DomR2EG9G2Oc
	aLXWGAWNPYqIvl97Ox4MYHuCmSkTEkZxAfCGdLz314g6EmF6UQCWUlENOfocxgLkezZH
	HFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/WoOAvoZpEB9DDqG3oVUz0AWWSAGQ28XlBekhxBcGAM=;
	b=mu/naOQiVAEdh5SHx/7ksbKqRfCUuTCHST2k+x6IMXSXNrgwlxt+4JfqFaYMDVBdG6
	cIitv9nFEYuC7kFNNRerO9qvnP5iPgOZbg2myklh7utDVoQNGV+zdSweVEaBFcad2wSI
	BsWzj26TplqqvaCD3vfQB8zEQlgv/azhh+04xPcrbUZqQkuHPiwZNHbRuLaWZLhol7Le
	Z4E4p5QUPzVKnJaZHydKbiKP+Q2Qx4AGS0mygqti+ClFSZOb7g1sXLRzFWM57W7uTYSd
	xvw00HozRfhZl0pFVEk1rHKGC4lbe4mLNUDSu3urfCrchOhTwpwVxZIBajjXPOARRL+d
	ZPXQ==
X-Gm-Message-State: AIkVDXLbWqZ3MmE2oyFLeiCrPfgZIn6/UWjX6hSys8RTnXdeTodV40YPyN1hoQnz3MnOmA==
X-Received: by 10.84.216.89 with SMTP id f25mr35180261plj.6.1485826484634;
	Mon, 30 Jan 2017 17:34:44 -0800 (PST)
Received: from yzy-ge62-2qd.DHCP (v133-130-103-189.a02c.g.tyo1.static.cnode.io.
	[133.130.103.189]) by smtp.gmail.com with ESMTPSA id
	u75sm35855751pgc.31.2017.01.30.17.34.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Jan 2017 17:34:44 -0800 (PST)
From: Ziyue Yang <skiver.cloud.yzy@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Anthony Liguori <aliguori@us.ibm.com>, Thomas Huth <thuth@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Ziyue Yang <yzylivezh@hotmail.com>,
	Ziyue Yang <skiver.cloud.yzy@gmail.com>
Date: Tue, 31 Jan 2017 09:32:15 +0800
Message-Id: <1485826335-15686-1-git-send-email-skiver.cloud.yzy@gmail.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c0b::243
Subject: [Qemu-trivial] [PATCH] ui/gtk.c: add ctrl-alt-= support for zoom in
 acceleration
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
X-List-Received-Date: Tue, 31 Jan 2017 01:34:53 -0000

From: Ziyue Yang <yzylivezh@hotmail.com>

Solving wishlist item at
https://bugs.launchpad.net/qemu/+bug/1656710
by accepting Ctrl-Alt-= as an additional zoom-in acceleration.

Using gtk_accel_group_connect to support multiple accelerations
triggering a single menu item since that gtk_accel_map_add_entry
seems to support only one acceleration. A wrapper function
gd_accel_zoom_in is added to support gtk_accel_group_connect's
callback activities.

Signed-off-by: Ziyue Yang <skiver.cloud.yzy@gmail.com>
---
 ui/gtk.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/ui/gtk.c b/ui/gtk.c
index bdd831c..3be9f33 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -105,6 +105,7 @@
 #define GDK_KEY_g GDK_g
 #define GDK_KEY_q GDK_q
 #define GDK_KEY_plus GDK_plus
+#define GDK_KEY_equal GDK_equal
 #define GDK_KEY_minus GDK_minus
 #define GDK_KEY_Pause GDK_Pause
 #define GDK_KEY_Delete GDK_Delete
@@ -1325,6 +1326,12 @@ static void gd_menu_zoom_in(GtkMenuItem *item, void *opaque)
     gd_update_windowsize(vc);
 }
 
+static void gd_accel_zoom_in(void *opaque)
+{
+    GtkDisplayState *s = opaque;
+    gtk_menu_item_activate(GTK_MENU_ITEM(s->zoom_in_item));
+}
+
 static void gd_menu_zoom_out(GtkMenuItem *item, void *opaque)
 {
     GtkDisplayState *s = opaque;
@@ -2092,6 +2099,8 @@ static GtkWidget *gd_create_menu_view(GtkDisplayState *s)
                                  "<QEMU>/View/Zoom In");
     gtk_accel_map_add_entry("<QEMU>/View/Zoom In", GDK_KEY_plus,
                             HOTKEY_MODIFIERS);
+    gtk_accel_group_connect(s->accel_group, GDK_KEY_equal, HOTKEY_MODIFIERS, 0,
+            g_cclosure_new_swap(G_CALLBACK(gd_accel_zoom_in), s, NULL));
     gtk_menu_shell_append(GTK_MENU_SHELL(view_menu), s->zoom_in_item);
 
     s->zoom_out_item = gtk_menu_item_new_with_mnemonic(_("Zoom _Out"));
-- 
2.7.4


