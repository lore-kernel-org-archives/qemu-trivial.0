Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VJncK-0004GC-0K
	for mharc-qemu-trivial@gnu.org; Wed, 11 Sep 2013 12:50:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1VJncH-0004BJ-22
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 12:50:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1VJncF-0006Vg-UO
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 12:50:09 -0400
Received: from
	1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa
	([2001:8b0:1d0::1]:43741 helo=mnementh.archaic.org.uk)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1VJncD-0006C9-8g; Wed, 11 Sep 2013 12:50:05 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1VJnc5-0002MD-8K; Wed, 11 Sep 2013 17:49:57 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 11 Sep 2013 17:49:57 +0100
Message-Id: <1378918197-9036-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>,
	Fam Zheng <famz@redhat.com>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] ui/Makefile.objs: delete unnecessary cocoa.o
	dependency
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
X-List-Received-Date: Wed, 11 Sep 2013 16:50:10 -0000

Delete an unnecessary dependency for cocoa.o; we already have
a general rule that tells Make that we can build a .o file
from a .m source using an ObjC compiler, so this specific
rule is unnecessary. Further, it is using the dubious construct
"$(SRC_PATH)/$(obj)" to get at the source directory, which will
break when $(obj) is redefined as part of the preparation for
per-object library support.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This needs to go in before Fam's patchset for modules
can be applied, either via a cocoa maintainer queue or via
-trivial or just as a first patch on the front of Fam's
patches if they would otherwise be being held up by this.

 ui/Makefile.objs | 2 --
 1 file changed, 2 deletions(-)

diff --git a/ui/Makefile.objs b/ui/Makefile.objs
index 6ddc0de..f33be47 100644
--- a/ui/Makefile.objs
+++ b/ui/Makefile.objs
@@ -17,6 +17,4 @@ common-obj-$(CONFIG_GTK) += gtk.o x_keymap.o
 
 $(obj)/sdl.o $(obj)/sdl_zoom.o: QEMU_CFLAGS += $(SDL_CFLAGS) 
 
-$(obj)/cocoa.o: $(SRC_PATH)/$(obj)/cocoa.m
-
 $(obj)/gtk.o: QEMU_CFLAGS += $(GTK_CFLAGS) $(VTE_CFLAGS)
-- 
1.7.11.4


