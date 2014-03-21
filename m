Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WR718-0007uw-Tk
	for mharc-qemu-trivial@gnu.org; Fri, 21 Mar 2014 17:30:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1WR70z-0007bJ-G7
	for qemu-trivial@nongnu.org; Fri, 21 Mar 2014 17:30:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1WR70t-000845-65
	for qemu-trivial@nongnu.org; Fri, 21 Mar 2014 17:30:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:30774)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>)
	id 1WR70e-0007s6-By; Fri, 21 Mar 2014 17:29:48 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2LLTlTc024689
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 21 Mar 2014 17:29:47 -0400
Received: from choo.home.annexia.org (vpn1-4-249.ams2.redhat.com [10.36.4.249])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2LLTjq8019797; Fri, 21 Mar 2014 17:29:46 -0400
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Mar 2014 21:29:37 +0000
Message-Id: <1395437377-5779-1-git-send-email-rjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	s2LLTlTc024689
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, samuel.thibault@gnu.org
Subject: [Qemu-trivial] [PATCH] backends/baum.c: Fix compilation when SDL is
	not available.
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
X-List-Received-Date: Fri, 21 Mar 2014 21:30:17 -0000

backends/baum.c: In function =E2=80=98chr_baum_init=E2=80=99:
backends/baum.c:569:64: error: missing binary operator before token "("
 #if defined(CONFIG_SDL) && SDL_COMPILEDVERSION < SDL_VERSIONNUM(2, 0, 0)
                                                                ^
backends/baum.c:598:64: error: missing binary operator before token "("
 #if defined(CONFIG_SDL) && SDL_COMPILEDVERSION < SDL_VERSIONNUM(2, 0, 0)

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
---
 backends/baum.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/backends/baum.c b/backends/baum.c
index 665107f..759003f 100644
--- a/backends/baum.c
+++ b/backends/baum.c
@@ -566,9 +566,11 @@ CharDriverState *chr_baum_init(void)
     BaumDriverState *baum;
     CharDriverState *chr;
     brlapi_handle_t *handle;
-#if defined(CONFIG_SDL) && SDL_COMPILEDVERSION < SDL_VERSIONNUM(2, 0, 0)
+#if defined(CONFIG_SDL)
+#if SDL_COMPILEDVERSION < SDL_VERSIONNUM(2, 0, 0)
     SDL_SysWMinfo info;
 #endif
+#endif
     int tty;
=20
     baum =3D g_malloc0(sizeof(BaumDriverState));
@@ -595,13 +597,15 @@ CharDriverState *chr_baum_init(void)
         goto fail;
     }
=20
-#if defined(CONFIG_SDL) && SDL_COMPILEDVERSION < SDL_VERSIONNUM(2, 0, 0)
+#if defined(CONFIG_SDL)
+#if SDL_COMPILEDVERSION < SDL_VERSIONNUM(2, 0, 0)
     memset(&info, 0, sizeof(info));
     SDL_VERSION(&info.version);
     if (SDL_GetWMInfo(&info))
         tty =3D info.info.x11.wmwindow;
     else
 #endif
+#endif
         tty =3D BRLAPI_TTY_DEFAULT;
=20
     if (brlapi__enterTtyMode(handle, tty, NULL) =3D=3D -1) {
--=20
1.8.5.3


