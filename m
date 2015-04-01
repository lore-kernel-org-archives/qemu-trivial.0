Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YdNOo-00036d-BC
	for mharc-qemu-trivial@gnu.org; Wed, 01 Apr 2015 14:29:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44456)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1YdNOl-00035i-Mu
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 14:29:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1YdNOh-0005Vj-NX
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 14:29:55 -0400
Received: from [98.143.106.101] (port=54409 helo=freebsd.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1YdNOh-0005VW-Hb
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 14:29:51 -0400
Received: from emaste (uid 1001) (envelope-from emaste@freebsd.org) id 9dc82
	by freebsd.org (DragonFly Mail Agent 1);
	Wed, 01 Apr 2015 13:58:45 -0400
From: Ed Maste <emaste@freebsd.org>
To: qemu-devel@nongnu.org
Date: Wed,  1 Apr 2015 13:58:38 -0400
Message-Id: <1427911118-21905-1-git-send-email-emaste@freebsd.org>
X-Mailer: git-send-email 2.2.2
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 98.143.106.101
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] Use $(MAKE) for recursive make
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
X-List-Received-Date: Wed, 01 Apr 2015 18:29:56 -0000

On BSDs "make" is typically BSD make, while "gmake" is GNU make.

Signed-off-by: Ed Maste <emaste@freebsd.org>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 88bce56..ee40397 100644
--- a/Makefile
+++ b/Makefile
@@ -331,8 +331,8 @@ distclean: clean
 	rm -rf $$d || exit 1 ; \
         done
 	rm -Rf .sdk
-	if test -f pixman/config.log; then make -C pixman distclean; fi
-	if test -f dtc/version_gen.h; then make $(DTC_MAKE_ARGS) clean; fi
+	if test -f pixman/config.log; then $(MAKE) -C pixman distclean; fi
+	if test -f dtc/version_gen.h; then $(MAKE) $(DTC_MAKE_ARGS) clean; fi
 
 KEYMAPS=da     en-gb  et  fr     fr-ch  is  lt  modifiers  no  pt-br  sv \
 ar      de     en-us  fi  fr-be  hr     it  lv  nl         pl  ru     th \
-- 
2.2.2


