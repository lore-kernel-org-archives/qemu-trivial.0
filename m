Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ws0K4-0005eO-Oi
	for mharc-qemu-trivial@gnu.org; Tue, 03 Jun 2014 21:49:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sam.bobroff@au1.ibm.com>) id 1Ws08p-0001gf-AA
	for qemu-trivial@nongnu.org; Tue, 03 Jun 2014 21:37:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sam.bobroff@au1.ibm.com>) id 1Ws08f-0007uP-E3
	for qemu-trivial@nongnu.org; Tue, 03 Jun 2014 21:37:23 -0400
Received: from e23smtp04.au.ibm.com ([202.81.31.146]:54862)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sam.bobroff@au1.ibm.com>) id 1Ws08e-0007tw-M4
	for qemu-trivial@nongnu.org; Tue, 03 Jun 2014 21:37:13 -0400
Received: from /spool/local
	by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <sam.bobroff@au1.ibm.com>;
	Wed, 4 Jun 2014 11:37:07 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
	by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 4 Jun 2014 11:37:05 +1000
Received: from d23relay04.au.ibm.com (d23relay04.au.ibm.com [9.190.234.120])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id C1253357804F;
	Wed,  4 Jun 2014 11:37:04 +1000 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
	by d23relay04.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	s541L8aB8716512; Wed, 4 Jun 2014 11:21:08 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	s541b4Zn015092; Wed, 4 Jun 2014 11:37:04 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.190.163.12])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	s541b479015089; Wed, 4 Jun 2014 11:37:04 +1000
Received: from ocelot.ozlabs.ibm.com (haven.au.ibm.com [9.190.164.82])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2DE15A010D;
	Wed,  4 Jun 2014 11:37:04 +1000 (EST)
From: Sam Bobroff <sam.bobroff@au1.ibm.com>
To: qemu-devel@nongnu.org
Date: Wed,  4 Jun 2014 11:37:03 +1000
Message-Id: <1513018f45cbc2dfff157d5df1dc86246cf08843.1401845262.git.sam.bobroff@au1.ibm.com>
X-Mailer: git-send-email 1.7.10.4
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 14060401-9264-0000-0000-000006393164
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 202.81.31.146
X-Mailman-Approved-At: Tue, 03 Jun 2014 21:48:58 -0400
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/1] Makefile: Correct path in stripping tool
	binaries
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
X-List-Received-Date: Wed, 04 Jun 2014 01:37:32 -0000

Allow "make install" to handle tool binaries that reside in
sub-directories.

Without this patch "make install" will fail if it needs to strip
a tool binary (e.g. debugging is not enabled) that is installed
from a subdirectory. An example is fsdev/virtfs-proxy-helper.

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
 Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d830483..9c23265 100644
--- a/Makefile
+++ b/Makefile
@@ -380,7 +380,7 @@ install-datadir install-localstatedir
 ifneq ($(TOOLS),)
 	$(INSTALL_PROG) $(TOOLS) "$(DESTDIR)$(bindir)"
 ifneq ($(STRIP),)
-	$(STRIP) $(TOOLS:%="$(DESTDIR)$(bindir)/%")
+	$(STRIP) $(foreach T,$(TOOLS),"$(DESTDIR)$(bindir)/$(notdir $T)")
 endif
 endif
 ifneq ($(CONFIG_MODULES),)
-- 
1.7.10.4


