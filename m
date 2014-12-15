Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y0Sl8-0006fX-Vz
	for mharc-qemu-trivial@gnu.org; Mon, 15 Dec 2014 05:20:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1Y0Sl0-0006ZW-3n
	for qemu-trivial@nongnu.org; Mon, 15 Dec 2014 05:20:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1Y0Skr-0000FJ-K1
	for qemu-trivial@nongnu.org; Mon, 15 Dec 2014 05:20:02 -0500
Received: from e06smtp11.uk.ibm.com ([195.75.94.107]:46220)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1Y0Skr-0000F9-79
	for qemu-trivial@nongnu.org; Mon, 15 Dec 2014 05:19:53 -0500
Received: from /spool/local
	by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Mon, 15 Dec 2014 10:19:52 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp11.uk.ibm.com (192.168.101.141) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 15 Dec 2014 10:19:48 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com
	(d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 8C1471B08049; 
	Mon, 15 Dec 2014 10:20:11 +0000 (GMT)
Received: from d06av09.portsmouth.uk.ibm.com (d06av09.portsmouth.uk.ibm.com
	[9.149.37.250])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id sBFAJmGl52428816; Mon, 15 Dec 2014 10:19:48 GMT
Received: from d06av09.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id sBFAJm8J014231; Mon, 15 Dec 2014 03:19:48 -0700
Received: from oc7435384737.ibm.com (dyn-9-152-224-21.boeblingen.de.ibm.com
	[9.152.224.21])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id sBFAJlQw014216; Mon, 15 Dec 2014 03:19:47 -0700
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Mon, 15 Dec 2014 11:19:46 +0100
Message-Id: <1418638786-29872-1-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 14121510-0005-0000-0000-00000275C9FF
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.107
Subject: [Qemu-trivial] [PATCH] Makefile: Remove config.status and
	common.env during 'make distclean'
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
X-List-Received-Date: Mon, 15 Dec 2014 10:20:10 -0000

config.status and tests/qemu-iotests/common.env are generated files
that should be deleted during 'make distclean'.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
---
 Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index f505202..6817c6f 100644
--- a/Makefile
+++ b/Makefile
@@ -313,8 +313,8 @@ qemu-%.tar.bz2:
 
 distclean: clean
 	rm -f config-host.mak config-host.h* config-host.ld $(DOCS) qemu-options.texi qemu-img-cmds.texi qemu-monitor.texi
-	rm -f config-all-devices.mak config-all-disas.mak
-	rm -f po/*.mo
+	rm -f config-all-devices.mak config-all-disas.mak config.status
+	rm -f po/*.mo tests/qemu-iotests/common.env
 	rm -f roms/seabios/config.mak roms/vgabios/config.mak
 	rm -f qemu-doc.info qemu-doc.aux qemu-doc.cp qemu-doc.cps qemu-doc.dvi
 	rm -f qemu-doc.fn qemu-doc.fns qemu-doc.info qemu-doc.ky qemu-doc.kys
-- 
1.7.1


