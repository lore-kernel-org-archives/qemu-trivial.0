Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c40TL-0004co-Iq
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2016 02:05:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1c40TJ-0004bS-Op
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2016 02:05:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1c40TI-0004nQ-Jx
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2016 02:05:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38532)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1c40TD-0004mI-Vi; Tue, 08 Nov 2016 02:05:24 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1BC0319CF46;
	Tue,  8 Nov 2016 07:05:22 +0000 (UTC)
Received: from localhost (ovpn-116-23.phx2.redhat.com [10.3.116.23])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA875JNu005828; Tue, 8 Nov 2016 02:05:20 -0500
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, mjt@tls.msk.ru, qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Tue,  8 Nov 2016 11:05:13 +0400
Message-Id: <20161108070513.30274-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 08 Nov 2016 07:05:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCHv2] build-sys: remove libtool left-over
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
X-List-Received-Date: Tue, 08 Nov 2016 07:05:30 -0000

Libtool support was removed in commit e999ee44349, there is a few
left-over.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---

v2:
 - remove .pc and .libs from gitignore
 - some libtool removal in make clean rule

 Makefile      | 9 +++------
 Makefile.objs | 1 -
 .gitignore    | 4 ----
 configure     | 2 --
 4 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index a84582c..56f3a94 100644
--- a/Makefile
+++ b/Makefile
@@ -236,12 +236,10 @@ ALL_SUBDIRS=3D$(TARGET_DIRS) $(patsubst %,pc-bios/%=
, $(ROMS))
=20
 recurse-all: $(SUBDIR_RULES) $(ROMSUBDIR_RULES)
=20
-$(BUILD_DIR)/version.o: $(SRC_PATH)/version.rc config-host.h | $(BUILD_D=
IR)/version.lo
+$(BUILD_DIR)/version.o: $(SRC_PATH)/version.rc config-host.h
 	$(call quiet-command,$(WINDRES) -I$(BUILD_DIR) -o $@ $<,"RC","version.o=
")
-$(BUILD_DIR)/version.lo: $(SRC_PATH)/version.rc config-host.h
-	$(call quiet-command,$(WINDRES) -I$(BUILD_DIR) -o $@ $<,"RC","version.l=
o")
=20
-Makefile: $(version-obj-y) $(version-lobj-y)
+Makefile: $(version-obj-y)
=20
 ######################################################################
 # Build libraries
@@ -363,10 +361,9 @@ clean:
 	rm -f config.mak op-i386.h opc-i386.h gen-op-i386.h op-arm.h opc-arm.h =
gen-op-arm.h
 	rm -f qemu-options.def
 	rm -f *.msi
-	find . \( -name '*.l[oa]' -o -name '*.so' -o -name '*.dll' -o -name '*.=
mo' -o -name '*.[oda]' \) -type f -exec rm {} +
+	find . \( -name '*.so' -o -name '*.dll' -o -name '*.mo' -o -name '*.[od=
a]' \) -type f -exec rm {} +
 	rm -f $(filter-out %.tlb,$(TOOLS)) $(HELPERS-y) qemu-ga TAGS cscope.* *=
.pod *~ */*~
 	rm -f fsdev/*.pod
-	rm -rf .libs */.libs
 	rm -f qemu-img-cmds.h
 	rm -f ui/shader/*-vert.h ui/shader/*-frag.h
 	@# May not be present in GENERATED_HEADERS
diff --git a/Makefile.objs b/Makefile.objs
index 06f74b8..0d7acd4 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -97,7 +97,6 @@ common-obj-y +=3D disas/
 ######################################################################
 # Resource file for Windows executables
 version-obj-$(CONFIG_WIN32) +=3D $(BUILD_DIR)/version.o
-version-lobj-$(CONFIG_WIN32) +=3D $(BUILD_DIR)/version.lo
=20
 ######################################################################
 # tracing
diff --git a/.gitignore b/.gitignore
index 3d7848c..e43c304 100644
--- a/.gitignore
+++ b/.gitignore
@@ -82,10 +82,6 @@
 *.d
 !/scripts/qemu-guest-agent/fsfreeze-hook.d
 *.o
-*.lo
-*.la
-*.pc
-.libs
 .sdk
 *.gcda
 *.gcno
diff --git a/configure b/configure
index fd6f898..3194a98 100755
--- a/configure
+++ b/configure
@@ -28,8 +28,6 @@ TMPB=3D"qemu-conf"
 TMPC=3D"${TMPDIR1}/${TMPB}.c"
 TMPO=3D"${TMPDIR1}/${TMPB}.o"
 TMPCXX=3D"${TMPDIR1}/${TMPB}.cxx"
-TMPL=3D"${TMPDIR1}/${TMPB}.lo"
-TMPA=3D"${TMPDIR1}/lib${TMPB}.la"
 TMPE=3D"${TMPDIR1}/${TMPB}.exe"
 TMPMO=3D"${TMPDIR1}/${TMPB}.mo"
=20
--=20
2.10.0


