Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c3ix2-0003Ju-4e
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2016 07:23:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1c3iwz-0003IR-Nq
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2016 07:22:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1c3iwy-0008Ux-MU
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2016 07:22:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35418)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1c3iwu-0008SL-4k; Mon, 07 Nov 2016 07:22:52 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2474CC057FAD;
	Mon,  7 Nov 2016 12:22:50 +0000 (UTC)
Received: from localhost (ovpn-116-23.phx2.redhat.com [10.3.116.23])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA7CMhJH025704; Mon, 7 Nov 2016 07:22:45 -0500
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, mjt@tls.msk.ru, qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Mon,  7 Nov 2016 16:22:38 +0400
Message-Id: <20161107122238.32205-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 07 Nov 2016 12:22:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] build-sys: remove libtool left-over
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
X-List-Received-Date: Mon, 07 Nov 2016 12:22:59 -0000

Libtool support was removed in commit e999ee44349, there is a few
left-over.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 Makefile      | 6 ++----
 Makefile.objs | 1 -
 .gitignore    | 2 --
 configure     | 2 --
 4 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 474cc5e..97dcbdd 100644
--- a/Makefile
+++ b/Makefile
@@ -231,12 +231,10 @@ ALL_SUBDIRS=3D$(TARGET_DIRS) $(patsubst %,pc-bios/%=
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
index 3d7848c..b630cd7 100644
--- a/.gitignore
+++ b/.gitignore
@@ -82,8 +82,6 @@
 *.d
 !/scripts/qemu-guest-agent/fsfreeze-hook.d
 *.o
-*.lo
-*.la
 *.pc
 .libs
 .sdk
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


