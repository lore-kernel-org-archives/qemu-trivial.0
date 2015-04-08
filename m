Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YfvcI-0005fX-26
	for mharc-qemu-trivial@gnu.org; Wed, 08 Apr 2015 15:26:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cmchao@gmail.com>) id 1YfuL2-0001hx-B0
	for qemu-trivial@nongnu.org; Wed, 08 Apr 2015 14:04:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cmchao@gmail.com>) id 1YfuKz-0001MJ-93
	for qemu-trivial@nongnu.org; Wed, 08 Apr 2015 14:04:32 -0400
Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234]:35994)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cmchao@gmail.com>)
	id 1YfuKx-0001K0-73; Wed, 08 Apr 2015 14:04:27 -0400
Received: by pdea3 with SMTP id a3so123245482pde.3;
	Wed, 08 Apr 2015 11:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=M3tus+4psLTTpQM2Pe38ZVuFa4PdCLfM8YxY41tlbeA=;
	b=idk7JE+zQ07FIvd837uz17ZW+5S5VjRgL7ADzLECqaOE1u29WVjx8AtMZE7Ykbdt7I
	FnJpbdXmSlcRYLjgjGCGswEekWhRtkYavo2cI4UfNRYzE/O9jQXBkxUUmu7DEcku0IuO
	Yu8Qi48ZaWKzvtJu9FEsrxwQ4dvczbzNr+iJ+3Fl7NS3gR0dzoGzgdq4H7oroR9YcZQU
	kKrB0AJgKSYKy9BpQpQY6CaYmx7QNd3k5+cdr7gce2QQSnhFktn8XeddCy01DcJqIMFi
	Gz0ys8bw7SQ1lslnUMgaOsO7+JGYsVRVyv73XVsCHpUIZb+iXWU8CVMIBNAH4S2mnbj1
	LEKQ==
X-Received: by 10.70.49.77 with SMTP id s13mr41033438pdn.120.1428516266559;
	Wed, 08 Apr 2015 11:04:26 -0700 (PDT)
Received: from localhost.localdomain (118-167-152-188.dynamic.hinet.net.
	[118.167.152.188])
	by mx.google.com with ESMTPSA id w1sm11968593pdp.25.2015.04.08.11.04.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Apr 2015 11:04:25 -0700 (PDT)
From: Chih-Min Chao <cmchao@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  9 Apr 2015 02:04:13 +0800
Message-Id: <1428516254-23054-5-git-send-email-cmchao@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1428516254-23054-1-git-send-email-cmchao@gmail.com>
References: <1428516254-23054-1-git-send-email-cmchao@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::234
X-Mailman-Approved-At: Wed, 08 Apr 2015 15:26:23 -0400
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com,
	Chih-Min Chao <cmchao@gmail.com>
Subject: [Qemu-trivial] [PATCH 4/5] ui/console : remove 'struct' from
	'typedef struct' type
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
X-List-Received-Date: Wed, 08 Apr 2015 18:04:33 -0000

Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
---
 ui/console.c       | 4 ++--
 ui/spice-display.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index b15ca87..d8d268c 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -269,7 +269,7 @@ void graphic_hw_invalidate(QemuConsole *con)
     }
 }
 
-static void ppm_save(const char *filename, struct DisplaySurface *ds,
+static void ppm_save(const char *filename, DisplaySurface *ds,
                      Error **errp)
 {
     int width = pixman_image_get_width(ds->image);
@@ -1535,7 +1535,7 @@ void dpy_text_update(QemuConsole *con, int x, int y, int w, int h)
 void dpy_text_resize(QemuConsole *con, int w, int h)
 {
     DisplayState *s = con->ds;
-    struct DisplayChangeListener *dcl;
+    DisplayChangeListener *dcl;
 
     if (!qemu_console_is_visible(con)) {
         return;
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 1644185..6767d08 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -715,7 +715,7 @@ static void display_update(DisplayChangeListener *dcl,
 }
 
 static void display_switch(DisplayChangeListener *dcl,
-                           struct DisplaySurface *surface)
+                           DisplaySurface *surface)
 {
     SimpleSpiceDisplay *ssd = container_of(dcl, SimpleSpiceDisplay, dcl);
     qemu_spice_display_switch(ssd, surface);
-- 
1.9.1


