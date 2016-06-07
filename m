Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bAIqb-00059i-UQ
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jun 2016 11:23:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bAIqW-00052L-HP
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 11:23:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bAIqU-0005nx-Ei
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 11:23:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51905)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bAIqO-0005mr-IH; Tue, 07 Jun 2016 11:23:04 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8CB2F40C46;
	Tue,  7 Jun 2016 18:23:01 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 5EF22ADB;
	Tue,  7 Jun 2016 18:23:00 +0300 (MSK)
Received: (nullmailer pid 29055 invoked by uid 1000);
	Tue, 07 Jun 2016 15:23:00 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: James Clarke <jrtc27@jrtc27.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue,  7 Jun 2016 18:22:56 +0300
Message-Id: <6969ec6cfd1293efd16bf9c7c7063b44bc6880ce.1465312856.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465312856.git.mjt@msgid.tls.msk.ru>
References: <cover.1465312856.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 14/51] Fix linking relocatable objects on Sparc
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
X-List-Received-Date: Tue, 07 Jun 2016 15:23:17 -0000

From: James Clarke <jrtc27@jrtc27.com>

On Sparc, gcc implicitly passes --relax to the linker, but -r is
incompatible with this. Therefore, if --no-relax is supported, it should
be passed to the linker.

Signed-off-by: James Clarke <jrtc27@jrtc27.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 21 +++++++++++++++++++++
 rules.mak |  2 +-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 6d01d96..3ad0b63 100755
--- a/configure
+++ b/configure
@@ -31,6 +31,7 @@ TMPCXX="${TMPDIR1}/${TMPB}.cxx"
 TMPL="${TMPDIR1}/${TMPB}.lo"
 TMPA="${TMPDIR1}/lib${TMPB}.la"
 TMPE="${TMPDIR1}/${TMPB}.exe"
+TMPMO="${TMPDIR1}/${TMPB}.mo"
 
 rm -f config.log
 
@@ -4526,6 +4527,25 @@ if compile_prog "" "" ; then
     have_fsxattr=yes
 fi
 
+#################################################
+# Sparc implicitly links with --relax, which is
+# incompatible with -r, so --no-relax should be
+# given. It does no harm to give it on other
+# platforms too.
+
+# Note: the prototype is needed since QEMU_CFLAGS
+#       contains -Wmissing-prototypes
+cat > $TMPC << EOF
+extern int foo(void);
+int foo(void) { return 0; }
+EOF
+if ! compile_object ""; then
+  error_exit "Failed to compile object file for LD_REL_FLAGS test"
+fi
+if do_cc -nostdlib -Wl,-r -Wl,--no-relax -o $TMPMO $TMPO; then
+  LD_REL_FLAGS="-Wl,--no-relax"
+fi
+
 ##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
@@ -5529,6 +5549,7 @@ else
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


