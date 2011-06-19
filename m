Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QYEgq-00044a-CO
	for mharc-qemu-trivial@gnu.org; Sun, 19 Jun 2011 05:53:12 -0400
Received: from eggs.gnu.org ([140.186.70.92]:37554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1QYEgm-00043p-Fa
	for qemu-trivial@nongnu.org; Sun, 19 Jun 2011 05:53:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1QYEgl-0003JI-Gi
	for qemu-trivial@nongnu.org; Sun, 19 Jun 2011 05:53:08 -0400
Received: from fmmailgate03.web.de ([217.72.192.234]:47688)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1QYEgj-0003Ix-4z; Sun, 19 Jun 2011 05:53:05 -0400
Received: from smtp02.web.de  ( [172.20.0.184])
	by fmmailgate03.web.de (Postfix) with ESMTP id 0092F1926DCBC;
	Sun, 19 Jun 2011 11:53:03 +0200 (CEST)
Received: from [92.74.60.106] (helo=mchn199C.mchp.siemens.de)
	by smtp02.web.de with asmtp (TLSv1:AES256-SHA:256) (WEB.DE 4.110 #2)
	id 1QYEgg-0008PN-00; Sun, 19 Jun 2011 11:53:02 +0200
Message-ID: <4DFDC6FE.1080307@web.de>
Date: Sun, 19 Jun 2011 11:53:02 +0200
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
X-Enigmail-Version: 1.1.2
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Sender: jan.kiszka@web.de
X-Sender: jan.kiszka@web.de
X-Provags-ID: V01U2FsdGVkX1+2DBEzlEXEihy8Qua6qxVbCJSgMXispB9shs0Z
	rcPh5j3pStqtPEgppyIzhQkepRgNtjhdQRK6GKrj3mBg2ucx7k 44MjXIpsc=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.234
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] Align dummy display to fixed-size active
	console
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
X-List-Received-Date: Sun, 19 Jun 2011 09:53:09 -0000

From: Jan Kiszka <jan.kiszka@siemens.com>

This fixes e.g. '-vga none -monitor vc:120Cx50C'.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 console.c |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/console.c b/console.c
index 9c6addf..acd8ca1 100644
--- a/console.c
+++ b/console.c
@@ -1349,8 +1349,15 @@ static struct DisplayAllocator default_allocator = {
 static void dumb_display_init(void)
 {
     DisplayState *ds = qemu_mallocz(sizeof(DisplayState));
+    int width = 640;
+    int height = 480;
+
     ds->allocator = &default_allocator;
-    ds->surface = qemu_create_displaysurface(ds, 640, 480);
+    if (is_fixedsize_console()) {
+        width = active_console->g_width;
+        height = active_console->g_height;
+    }
+    ds->surface = qemu_create_displaysurface(ds, width, height);
     register_displaystate(ds);
 }
 
-- 
1.7.1

