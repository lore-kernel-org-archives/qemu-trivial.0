Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V2OLo-0003fP-VS
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jul 2013 12:25:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1V2OLl-0003UM-5b
	for qemu-trivial@nongnu.org; Thu, 25 Jul 2013 12:25:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1V2OLj-0003xi-GY
	for qemu-trivial@nongnu.org; Thu, 25 Jul 2013 12:25:08 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:47105
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1V2OLe-0003li-Cx; Thu, 25 Jul 2013 12:25:02 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id D1FF8183DE7; Thu, 25 Jul 2013 18:24:59 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Thu, 25 Jul 2013 18:24:58 +0200
Message-Id: <1374769498-22383-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] Makefile: Remove some more files when
	cleaning
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
X-List-Received-Date: Thu, 25 Jul 2013 16:25:11 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 Makefile |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 29f1043..80aeb18 100644
--- a/Makefile
+++ b/Makefile
@@ -237,7 +237,8 @@ clean:
 	find . -name '*.[oda]' -type f -exec rm -f {} +
 	find . -name '*.l[oa]' -type f -exec rm -f {} +
 	rm -f $(TOOLS) $(HELPERS-y) qemu-ga TAGS cscope.* *.pod *~ */*~
-	rm -Rf .libs
+	rm -f fsdev/*.pod
+	rm -rf .libs */.libs
 	rm -f qemu-img-cmds.h
 	@# May not be present in GENERATED_HEADERS
 	rm -f trace/generated-tracers-dtrace.dtrace*
@@ -262,6 +263,7 @@ qemu-%.tar.bz2:
 distclean: clean
 	rm -f config-host.mak config-host.h* config-host.ld $(DOCS) qemu-options.texi qemu-img-cmds.texi qemu-monitor.texi
 	rm -f config-all-devices.mak config-all-disas.mak
+	rm -f po/*.mo
 	rm -f roms/seabios/config.mak roms/vgabios/config.mak
 	rm -f qemu-doc.info qemu-doc.aux qemu-doc.cp qemu-doc.cps qemu-doc.dvi
 	rm -f qemu-doc.fn qemu-doc.fns qemu-doc.info qemu-doc.ky qemu-doc.kys
-- 
1.7.10.4


