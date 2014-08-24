Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLXyJ-00045u-Ba
	for mharc-qemu-trivial@gnu.org; Sun, 24 Aug 2014 09:36:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXyB-0003rK-Gn
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:36:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXy7-0006oU-Ib
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:36:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43196)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XLXxy-0006kX-Ik; Sun, 24 Aug 2014 09:36:18 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B80C0449BA;
	Sun, 24 Aug 2014 17:36:17 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 53A3A6F3;
	Sun, 24 Aug 2014 17:31:05 +0400 (MSK)
Received: (nullmailer pid 30085 invoked by uid 1000);
	Sun, 24 Aug 2014 13:31:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun, 24 Aug 2014 17:30:58 +0400
Message-Id: <1408887062-30022-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PULL 07/11] slirp/misc: Use the GLib memory
	allocation APIs
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
X-List-Received-Date: Sun, 24 Aug 2014 13:36:35 -0000

From: zhanghailiang <zhang.zhanghailiang@huawei.com>

Here we don't check the return value of malloc() which may fail.
Use the g_new() instead, which will abort the program when
there is not enough memory.

Also, use g_strdup instead of strdup and remove the unnecessary
strdup function.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Beno=C3=AEt Canet <benoit.canet@nodalink.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 slirp/misc.c         |   20 +++-----------------
 slirp/misc.h         |    4 ----
 slirp/slirp_config.h |    3 ---
 3 files changed, 3 insertions(+), 24 deletions(-)

diff --git a/slirp/misc.c b/slirp/misc.c
index b8eb74c..6543dc7 100644
--- a/slirp/misc.c
+++ b/slirp/misc.c
@@ -54,11 +54,11 @@ int add_exec(struct ex_list **ex_ptr, int do_pty, cha=
r *exec,
 	}
=20
 	tmp_ptr =3D *ex_ptr;
-	*ex_ptr =3D (struct ex_list *)malloc(sizeof(struct ex_list));
+	*ex_ptr =3D g_new(struct ex_list, 1);
 	(*ex_ptr)->ex_fport =3D port;
 	(*ex_ptr)->ex_addr =3D addr;
 	(*ex_ptr)->ex_pty =3D do_pty;
-	(*ex_ptr)->ex_exec =3D (do_pty =3D=3D 3) ? exec : strdup(exec);
+	(*ex_ptr)->ex_exec =3D (do_pty =3D=3D 3) ? exec : g_strdup(exec);
 	(*ex_ptr)->ex_next =3D tmp_ptr;
 	return 0;
 }
@@ -187,7 +187,7 @@ fork_exec(struct socket *so, const char *ex, int do_p=
ty)
 			   bptr++;
 			c =3D *bptr;
 			*bptr++ =3D (char)0;
-			argv[i++] =3D strdup(curarg);
+			argv[i++] =3D g_strdup(curarg);
 		   } while (c);
=20
                 argv[i] =3D NULL;
@@ -228,20 +228,6 @@ fork_exec(struct socket *so, const char *ex, int do_=
pty)
 }
 #endif
=20
-#ifndef HAVE_STRDUP
-char *
-strdup(str)
-	const char *str;
-{
-	char *bptr;
-
-	bptr =3D (char *)malloc(strlen(str)+1);
-	strcpy(bptr, str);
-
-	return bptr;
-}
-#endif
-
 void slirp_connection_info(Slirp *slirp, Monitor *mon)
 {
     const char * const tcpstates[] =3D {
diff --git a/slirp/misc.h b/slirp/misc.h
index ba8beb1..41a3258 100644
--- a/slirp/misc.h
+++ b/slirp/misc.h
@@ -16,10 +16,6 @@ struct ex_list {
 	struct ex_list *ex_next;
 };
=20
-#ifndef HAVE_STRDUP
-char *strdup(const char *);
-#endif
-
 #define EMU_NONE 0x0
=20
 /* TCP emulations */
diff --git a/slirp/slirp_config.h b/slirp/slirp_config.h
index 18db45c..896d802 100644
--- a/slirp/slirp_config.h
+++ b/slirp/slirp_config.h
@@ -72,9 +72,6 @@
 /* Define if you have strerror */
 #define HAVE_STRERROR
=20
-/* Define if you have strdup() */
-#define HAVE_STRDUP
-
 /* Define according to how time.h should be included */
 #define TIME_WITH_SYS_TIME 0
 #undef HAVE_SYS_TIME_H
--=20
1.7.10.4


