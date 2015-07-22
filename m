Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZHyDI-0003q3-Ju
	for mharc-qemu-trivial@gnu.org; Wed, 22 Jul 2015 13:53:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36040)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1ZHyDF-0003jF-K1
	for qemu-trivial@nongnu.org; Wed, 22 Jul 2015 13:53:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1ZHyDB-0008QX-Uv
	for qemu-trivial@nongnu.org; Wed, 22 Jul 2015 13:53:49 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:37654)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1ZHyD1-0008O8-MX; Wed, 22 Jul 2015 13:53:35 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id BAA2117F6D6; Wed, 22 Jul 2015 19:53:32 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Date: Wed, 22 Jul 2015 19:53:30 +0200
Message-Id: <1437587610-26433-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.221.198.45
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developer <qemu-devel@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH for-2.4] vl: Fix compiler warning for builds
	without VLC
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
X-List-Received-Date: Wed, 22 Jul 2015 17:53:50 -0000

This regression was caused by commit 70b94331.

  CC    vl.o
vl.c: In function =E2=80=98select_display=E2=80=99:
vl.c:2064:12: error: unused variable =E2=80=98err=E2=80=99 [-Werror=3Dunu=
sed-variable]
     Error *err =3D NULL;
            ^
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index 5856396..0adbbd6 100644
--- a/vl.c
+++ b/vl.c
@@ -2061,7 +2061,6 @@ static void select_vgahw (const char *p)
=20
 static DisplayType select_display(const char *p)
 {
-    Error *err =3D NULL;
     const char *opts;
     DisplayType display =3D DT_DEFAULT;
=20
@@ -2130,6 +2129,7 @@ static DisplayType select_display(const char *p)
     } else if (strstart(p, "vnc", &opts)) {
 #ifdef CONFIG_VNC
         if (*opts =3D=3D '=3D') {
+            Error *err =3D NULL;
             if (vnc_parse(opts + 1, &err) =3D=3D NULL) {
                 error_report_err(err);
                 exit(1);
--=20
2.1.4


