Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1azjzc-0003LW-1f
	for mharc-qemu-trivial@gnu.org; Mon, 09 May 2016 08:08:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1azjzZ-0003DQ-0V
	for qemu-trivial@nongnu.org; Mon, 09 May 2016 08:08:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1azjzU-0004cU-8K
	for qemu-trivial@nongnu.org; Mon, 09 May 2016 08:08:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1azjzN-0004WZ-J0; Mon, 09 May 2016 08:08:41 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EAF836265B;
	Mon,  9 May 2016 12:08:40 +0000 (UTC)
Received: from localhost (ovpn-112-46.ams2.redhat.com [10.36.112.46])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u49C8ctE003467; Mon, 9 May 2016 08:08:40 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: marc.mari.barcelo@gmail.com, Paolo Bonzini <pbonzini@redhat.com>,
	jsnow@redhat.com, Jan Vesely <jano.vesely@gmail.com>,
	qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>
Date: Mon,  9 May 2016 13:07:57 +0100
Message-Id: <1462795687-25698-14-git-send-email-stefanha@redhat.com>
In-Reply-To: <1462795687-25698-1-git-send-email-stefanha@redhat.com>
References: <1462795687-25698-1-git-send-email-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 09 May 2016 12:08:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 13/23] configure: Check if struct fsxattr
 is available from linux header
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
X-List-Received-Date: Mon, 09 May 2016 12:08:55 -0000

From: Jan Vesely <jano.vesely@gmail.com>

Fixes build failure with --enable-xfsctl and
new linux headers (>=3D4.5) and older xfsprogs(<4.5):
In file included from /usr/include/xfs/xfs.h:38:0,
                 from /var/tmp/portage/app-emulation/qemu-2.5.0-r1/work/q=
emu-2.5.0/block/raw-posix.c:97:
/usr/include/xfs/xfs_fs.h:42:8: error: redefinition of =E2=80=98struct fs=
xattr=E2=80=99
 struct fsxattr {
        ^
In file included from /var/tmp/portage/app-emulation/qemu-2.5.0-r1/work/q=
emu-2.5.0/block/raw-posix.c:60:0:
/usr/include/linux/fs.h:155:8: note: originally defined here
 struct fsxattr {

This is really a bug in the system headers, but we can work around it
by defining HAVE_FSXATTR in the QEMU headers if linux/fs.h provides
the struct, so that xfs_fs.h doesn't try to define it as well.

CC: qemu-trivial@nongnu.org
CC: Markus Armbruster <armbru@redhat.com>
CC: Peter Maydell <peter.maydell@linaro.org>
CC: Stefan Weil <sw@weilnetz.de>
Tested-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Jan Vesely <jano.vesely@gmail.com>
[PMM: adjusted commit message, comments]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/configure b/configure
index ab54f3c..c37fc5f 100755
--- a/configure
+++ b/configure
@@ -4494,6 +4494,21 @@ if test "$fortify_source" !=3D "no"; then
 fi
=20
 ##########################################
+# check if struct fsxattr is available via linux/fs.h
+
+have_fsxattr=3Dno
+cat > $TMPC << EOF
+#include <linux/fs.h>
+struct fsxattr foo;
+int main(void) {
+  return 0;
+}
+EOF
+if compile_prog "" "" ; then
+    have_fsxattr=3Dyes
+fi
+
+##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
=20
@@ -5160,6 +5175,14 @@ fi
 if test "$have_ifaddrs_h" =3D "yes" ; then
     echo "HAVE_IFADDRS_H=3Dy" >> $config_host_mak
 fi
+
+# Work around a system header bug with some kernel/XFS header
+# versions where they both try to define 'struct fsxattr':
+# xfs headers will not try to redefine structs from linux headers
+# if this macro is set.
+if test "$have_fsxattr" =3D "yes" ; then
+    echo "HAVE_FSXATTR=3Dy" >> $config_host_mak
+fi
 if test "$vte" =3D "yes" ; then
   echo "CONFIG_VTE=3Dy" >> $config_host_mak
   echo "VTE_CFLAGS=3D$vte_cflags" >> $config_host_mak
--=20
2.5.5


