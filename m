Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9SqZ-0001P8-Hr
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 03:51:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9SqT-0001HI-2f
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:51:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9SqR-0005Yd-49
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:51:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51792)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9SqN-0005XR-Jt; Sun, 05 Jun 2016 03:51:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7859140914;
	Sun,  5 Jun 2016 10:51:26 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 53F3CAF0;
	Sun,  5 Jun 2016 10:43:35 +0300 (MSK)
Received: (nullmailer pid 1117 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: James Clarke <jrtc27@jrtc27.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:42:51 +0300
Message-Id: <7ab889b9032fa132b2015bb50741eb74207d3392.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 14/52] Fix linking relocatable objects on Sparc
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Jun 2016 07:51:46 -0000

From: James Clarke <jrtc27@jrtc27.com>

On Sparc, gcc implicitly passes --relax to the linker, but -r is
incompatible with this. Therefore, if --no-relax is supported, it should
be passed to the linker.

Signed-off-by: James Clarke <jrtc27@jrtc27.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 13 +++++++++++++
 rules.mak |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index b5aab72..360b7a5 100755
--- a/configure
+++ b/configure
@@ -4526,6 +4526,18 @@ if compile_prog "" "" ; then
     have_fsxattr=yes
 fi
 
+#################################################
+# Sparc implicitly links with --relax, which is
+# incompatible with -r. It does no harm to give
+# it on other platforms too.
+
+cat > $TMPC << EOF
+int foo(void) { return 0; }
+EOF
+if compile_prog "" "-nostdlib -Wl,-r -Wl,--no-relax"; then
+  LD_REL_FLAGS="-Wl,--no-relax"
+fi
+
 ##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
@@ -5529,6 +5541,7 @@ else
 fi
 echo "LDFLAGS=$LDFLAGS" >> $config_host_mak
 echo "LDFLAGS_NOPIE=$LDFLAGS_NOPIE" >> $config_host_mak
+echo "LD_REL_FLAGS=$LD_REL_FLAGS" >> $config_host_mak
 echo "LIBS+=$LIBS" >> $config_host_mak
 echo "LIBS_TOOLS+=$libs_tools" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
diff --git a/rules.mak b/rules.mak
index 4a8f464..dca5718 100644
--- a/rules.mak
+++ b/rules.mak
@@ -95,7 +95,7 @@ module-common.o: CFLAGS += $(DSO_OBJ_CFLAGS)
 	$(if $(findstring /,$@),$(call quiet-command,cp $@ $(subst /,-,$@), "  CP    $(subst /,-,$@)"))
 
 
-LD_REL := $(CC) -nostdlib -Wl,-r
+LD_REL := $(CC) -nostdlib -Wl,-r $(LD_REL_FLAGS)
 
 %.mo:
 	$(call quiet-command,$(LD_REL) -o $@ $^,"  LD -r $(TARGET_DIR)$@")
-- 
2.1.4


