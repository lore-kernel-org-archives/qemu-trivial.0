Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zeca4-0005X1-2n
	for mharc-qemu-trivial@gnu.org; Wed, 23 Sep 2015 01:27:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1Zeca2-0005UG-1c
	for qemu-trivial@nongnu.org; Wed, 23 Sep 2015 01:26:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1Zeca1-0003tE-8h
	for qemu-trivial@nongnu.org; Wed, 23 Sep 2015 01:26:57 -0400
Received: from ozlabs.org ([103.22.144.67]:38668)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1ZecZw-0003rI-QS; Wed, 23 Sep 2015 01:26:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 549FD1402D4; Wed, 23 Sep 2015 15:26:50 +1000 (AEST)
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Date: Wed, 23 Sep 2015 15:27:12 +1000
Message-Id: <1442986032-26529-1-git-send-email-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.4.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Subject: [Qemu-trivial] [PATCH] .travis.yml: Run make check for all targets,
	not just some
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
X-List-Received-Date: Wed, 23 Sep 2015 05:26:59 -0000

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
2.4.3


