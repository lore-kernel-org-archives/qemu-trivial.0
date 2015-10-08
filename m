Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkiOQ-0005E4-8F
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 20:52:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEdl-0008Di-7Y
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:06:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEal-0004io-2G
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:06:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44626)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZkEZn-0002r4-SW; Thu, 08 Oct 2015 13:01:56 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8440E40A5C;
	Thu,  8 Oct 2015 20:01:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id B5EE3A9A;
	Thu,  8 Oct 2015 19:52:32 +0300 (MSK)
Received: (nullmailer pid 12007 invoked by uid 1000);
	Thu, 08 Oct 2015 16:52:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 19:52:24 +0300
Message-Id: <cb157af23833ca0762125f34b3fe73cfdbac297e.1444323071.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
References: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: [Qemu-trivial] [PULL 15/19] .travis.yml: Run make check for all
	targets, not just some
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
X-List-Received-Date: Thu, 08 Oct 2015 17:20:05 -0000

From: David Gibson <david@gibson.dropbear.id.au>

ed173cb ".travis.yml: remove "make check" from main matrix" stopped running
make check for all the Travis build targets for various reasons.  It
continued to run make check on one Travis build, which builds for a big
list of all (? nearly all) our supported softmmu targets.

Unfortunately, due to a spacing / quoting error it only actually builds for
the alpha, arm, aarch64 and cris targets.  Specifically, the list of
targets is split over several lines.  Even with YAML folding, this will
leave spaces in the list, meaning $TARGETS won't have the value we need.

I had a look at the YAML spec and I couldn't quickly see a way of splitting
the list so that it doesn't end up with spaces, so this patch fixes the
problem by putting the whole list on one huge line.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .travis.yml | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 0ac170b..6ca0260 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -54,15 +54,7 @@ matrix:
   include:
     # Make check target (we only do this once)
     - env:
-        - TARGETS=alpha-softmmu,arm-softmmu,aarch64-softmmu,cris-softmmu,
-                  i386-softmmu,x86_64-softmmu,m68k-softmmu,microblaze-softmmu,
-                  microblazeel-softmmu,mips-softmmu,mips64-softmmu,
-                  mips64el-softmmu,mipsel-softmmu,or32-softmmu,ppc-softmmu,
-                  ppc64-softmmu,ppcemb-softmmu,s390x-softmmu,sh4-softmmu,
-                  sh4eb-softmmu,sparc-softmmu,sparc64-softmmu,
-                  unicore32-softmmu,unicore32-linux-user,
-                  lm32-softmmu,moxie-softmmu,tricore-softmmu,xtensa-softmmu,
-                  xtensaeb-softmmu
+        - TARGETS=alpha-softmmu,arm-softmmu,aarch64-softmmu,cris-softmmu,i386-softmmu,x86_64-softmmu,m68k-softmmu,microblaze-softmmu,microblazeel-softmmu,mips-softmmu,mips64-softmmu,mips64el-softmmu,mipsel-softmmu,or32-softmmu,ppc-softmmu,ppc64-softmmu,ppcemb-softmmu,s390x-softmmu,sh4-softmmu,sh4eb-softmmu,sparc-softmmu,sparc64-softmmu,unicore32-softmmu,unicore32-linux-user,lm32-softmmu,moxie-softmmu,tricore-softmmu,xtensa-softmmu,xtensaeb-softmmu
           TEST_CMD="make check"
       compiler: gcc
     # Debug related options
-- 
2.1.4


