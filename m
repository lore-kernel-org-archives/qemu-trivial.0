Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Q9tmu-0003D7-3D
	for mharc-qemu-trivial@gnu.org; Wed, 13 Apr 2011 02:42:52 -0400
Received: from eggs.gnu.org ([140.186.70.92]:44333)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bradh@frogmouth.net>) id 1Q9tms-00039w-I8
	for qemu-trivial@nongnu.org; Wed, 13 Apr 2011 02:42:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bradh@frogmouth.net>) id 1Q9tmr-0008An-N5
	for qemu-trivial@nongnu.org; Wed, 13 Apr 2011 02:42:50 -0400
Received: from ipmail06.adl2.internode.on.net ([150.101.137.129]:1537)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bradh@frogmouth.net>)
	id 1Q9tmo-00087M-8u; Wed, 13 Apr 2011 02:42:46 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AlgHABBDpU2WZXPNgWdsb2JhbACYXY0+AQEWJiXEPA6FYAQ
Received: from ppp115-205.static.internode.on.net (HELO incana)
	([150.101.115.205])
	by ipmail06.adl2.internode.on.net with ESMTP; 13 Apr 2011 16:12:34 +0930
From: Brad Hards <bradh@frogmouth.net>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Brad Hards <bradh@frogmouth.net>
Date: Wed, 13 Apr 2011 16:42:16 +1000
Message-Id: <1302676936-15215-1-git-send-email-bradh@frogmouth.net>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 150.101.137.129
Subject: [Qemu-trivial] [PATCH] Clean up after "make pdf"
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <http://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Apr 2011 06:42:51 -0000

---
 .gitignore |    3 +++
 Makefile   |    5 ++++-
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/.gitignore b/.gitignore
index 1d79680..08013fc 100644
--- a/.gitignore
+++ b/.gitignore
@@ -44,6 +44,9 @@ QMP/qmp-commands.txt
 *.ky
 *.log
 *.pdf
+*.cps
+*.fns
+*.kys
 *.pg
 *.pyc
 *.toc
diff --git a/Makefile b/Makefile
index fa93be5..dc39efd 100644
--- a/Makefile
+++ b/Makefile
@@ -163,7 +163,10 @@ distclean: clean
 	rm -f config-host.mak config-host.h* config-host.ld $(DOCS) qemu-options.texi qemu-img-cmds.texi qemu-monitor.texi
 	rm -f config-all-devices.mak
 	rm -f roms/seabios/config.mak roms/vgabios/config.mak
-	rm -f qemu-doc.info qemu-doc.aux qemu-doc.cp qemu-doc.dvi qemu-doc.fn qemu-doc.info qemu-doc.ky qemu-doc.log qemu-doc.pdf qemu-doc.pg qemu-doc.toc qemu-doc.tp qemu-doc.vr
+	rm -f qemu-doc.info qemu-doc.aux qemu-doc.cp qemu-doc.cps qemu-doc.dvi
+	rm -f qemu-doc.fn qemu-doc.fns qemu-doc.info qemu-doc.ky qemu-doc.kys
+	rm -f qemu-doc.log qemu-doc.pdf qemu-doc.pg qemu-doc.toc qemu-doc.tp
+	rm -f qemu-doc.vr
 	rm -f qemu-tech.info qemu-tech.aux qemu-tech.cp qemu-tech.dvi qemu-tech.fn qemu-tech.info qemu-tech.ky qemu-tech.log qemu-tech.pdf qemu-tech.pg qemu-tech.toc qemu-tech.tp qemu-tech.vr
 	for d in $(TARGET_DIRS) $(QEMULIBS); do \
 	rm -rf $$d || exit 1 ; \
-- 
1.7.1


