Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZugcU-0007g1-US
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 07:59:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugcM-0007MF-Km
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:59:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugcL-0004qL-Am
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:59:46 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44043)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZugcF-0004hJ-R7; Fri, 06 Nov 2015 07:59:39 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 29D5440DD7;
	Fri,  6 Nov 2015 15:59:39 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 7F0A8AD9;
	Fri,  6 Nov 2015 15:44:06 +0300 (MSK)
Received: (nullmailer pid 31721 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:44:01 +0300
Message-Id: <bd54a9f9435c85de190a82019faef16c5ecf8e46.1446813769.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 24/24] tap-bsd: use user-specified tap device
	if it already exists
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
X-List-Received-Date: Fri, 06 Nov 2015 12:59:52 -0000

From: Ed Maste <emaste@freebsd.org>

Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
Signed-off-by: Ed Maste <emaste@freebsd.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 net/tap-bsd.c | 38 +++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/net/tap-bsd.c b/net/tap-bsd.c
index 7028d9b..0103a97 100644
--- a/net/tap-bsd.c
+++ b/net/tap-bsd.c
@@ -109,8 +109,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet=
_hdr,
=20
 #define PATH_NET_TAP "/dev/tap"
=20
-int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
-             int vnet_hdr_required, int mq_required, Error **errp)
+static int tap_open_clone(char *ifname, int ifname_size, Error **errp)
 {
     int fd, s, ret;
     struct ifreq ifr;
@@ -126,7 +125,8 @@ int tap_open(char *ifname, int ifname_size, int *vnet=
_hdr,
     ret =3D ioctl(fd, TAPGIFNAME, (void *)&ifr);
     if (ret < 0) {
         error_setg_errno(errp, errno, "could not get tap interface name"=
);
-        goto error;
+        close(fd);
+        return -1;
     }
=20
     if (ifname[0] !=3D '\0') {
@@ -135,19 +135,47 @@ int tap_open(char *ifname, int ifname_size, int *vn=
et_hdr,
         if (s < 0) {
             error_setg_errno(errp, errno,
                              "could not open socket to set interface nam=
e");
-            goto error;
+            close(fd);
+            return -1;
         }
         ifr.ifr_data =3D ifname;
         ret =3D ioctl(s, SIOCSIFNAME, (void *)&ifr);
         close(s);
         if (ret < 0) {
             error_setg(errp, "could not set tap interface name");
-            goto error;
+            close(fd);
+            return -1;
         }
     } else {
         pstrcpy(ifname, ifname_size, ifr.ifr_name);
     }
=20
+    return fd;
+}
+
+int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
+             int vnet_hdr_required, int mq_required, Error **errp)
+{
+    int fd =3D -1;
+
+    /* If the specified tap device already exists just use it. */
+    if (ifname[0] !=3D '\0') {
+        char dname[100];
+        snprintf(dname, sizeof dname, "/dev/%s", ifname);
+        TFR(fd =3D open(dname, O_RDWR));
+        if (fd < 0 && errno !=3D ENOENT) {
+            error_setg_errno(errp, errno, "could not open %s", dname);
+            return -1;
+        }
+    }
+
+    if (fd < 0) {
+        /* Tap device not specified or does not exist. */
+        if ((fd =3D tap_open_clone(ifname, ifname_size, errp)) < 0) {
+            return -1;
+        }
+    }
+
     if (*vnet_hdr) {
         /* BSD doesn't have IFF_VNET_HDR */
         *vnet_hdr =3D 0;
--=20
2.1.4


