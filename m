Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WgKNp-0008Gf-Hd
	for mharc-qemu-trivial@gnu.org; Fri, 02 May 2014 16:48:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WgKNn-0008ED-Rd
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 16:48:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WgKNm-0007OS-Qn
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 16:48:35 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:57709)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1WgKNl-0007Nl-2e; Fri, 02 May 2014 16:48:33 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id D0412180133; Fri,  2 May 2014 22:48:30 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri,  2 May 2014 22:48:30 +0200
Message-Id: <1399063710-3920-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH] ui: Add missing 'static' attribute
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
X-List-Received-Date: Fri, 02 May 2014 20:48:36 -0000

There was already a forward declaration using 'static',
but the attribute was missing in the implementation.

This fixes a warning from the static code analysis (smatch).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 ui/console.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/console.c b/ui/console.c
index e057755..34d1eaa 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1407,7 +1407,7 @@ void dpy_gfx_replace_surface(QemuConsole *con,
     qemu_free_displaysurface(old_surface);
 }
 
-void dpy_refresh(DisplayState *s)
+static void dpy_refresh(DisplayState *s)
 {
     DisplayChangeListener *dcl;
 
-- 
1.7.10.4


