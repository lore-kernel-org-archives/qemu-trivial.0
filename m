Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZpefN-0007QP-9v
	for mharc-qemu-trivial@gnu.org; Fri, 23 Oct 2015 11:54:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1ZpefK-0007PN-37
	for qemu-trivial@nongnu.org; Fri, 23 Oct 2015 11:54:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1ZpefF-0000kY-No
	for qemu-trivial@nongnu.org; Fri, 23 Oct 2015 11:54:01 -0400
Received: from [98.143.106.101] (port=43171 helo=freebsd.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1ZpefF-0000kJ-Hl
	for qemu-trivial@nongnu.org; Fri, 23 Oct 2015 11:53:57 -0400
Received: from emaste (uid 1001) (envelope-from emaste@freebsd.org) id 9ee9a
	by freebsd.org (DragonFly Mail Agent 1);
	Fri, 23 Oct 2015 11:53:56 -0400
From: Ed Maste <emaste@freebsd.org>
To: qemu-devel@nongnu.org
Date: Fri, 23 Oct 2015 11:53:55 -0400
Message-Id: <1445615635-90549-1-git-send-email-emaste@freebsd.org>
X-Mailer: git-send-email 2.4.6
In-Reply-To: <1445611173-57034-1-git-send-email-emaste@freebsd.org>
References: <1445611173-57034-1-git-send-email-emaste@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 98.143.106.101
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] tap-bsd: use user-specified tap device if it
	already exists
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
X-List-Received-Date: Fri, 23 Oct 2015 15:54:03 -0000

Acked-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Ed Maste <emaste@freebsd.org>
---
As an aside this was reviewed on FreeBSD's Phabricator here:
https://reviews.freebsd.org/D3969

Resend with Signed-off-by.

 net/tap-bsd.c | 38 +++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/net/tap-bsd.c b/net/tap-bsd.c
index 7028d9b..0103a97 100644
--- a/net/tap-bsd.c
+++ b/net/tap-bsd.c
@@ -109,8 +109,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
 
 #define PATH_NET_TAP "/dev/tap"
 
-int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
-             int vnet_hdr_required, int mq_required, Error **errp)
+static int tap_open_clone(char *ifname, int ifname_size, Error **errp)
 {
     int fd, s, ret;
     struct ifreq ifr;
@@ -126,7 +125,8 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
     ret = ioctl(fd, TAPGIFNAME, (void *)&ifr);
     if (ret < 0) {
         error_setg_errno(errp, errno, "could not get tap interface name");
-        goto error;
+        close(fd);
+        return -1;
     }
 
     if (ifname[0] != '\0') {
@@ -135,19 +135,47 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
         if (s < 0) {
             error_setg_errno(errp, errno,
                              "could not open socket to set interface name");
-            goto error;
+            close(fd);
+            return -1;
         }
         ifr.ifr_data = ifname;
         ret = ioctl(s, SIOCSIFNAME, (void *)&ifr);
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
 
+    return fd;
+}
+
+int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
+             int vnet_hdr_required, int mq_required, Error **errp)
+{
+    int fd = -1;
+
+    /* If the specified tap device already exists just use it. */
+    if (ifname[0] != '\0') {
+        char dname[100];
+        snprintf(dname, sizeof dname, "/dev/%s", ifname);
+        TFR(fd = open(dname, O_RDWR));
+        if (fd < 0 && errno != ENOENT) {
+            error_setg_errno(errp, errno, "could not open %s", dname);
+            return -1;
+        }
+    }
+
+    if (fd < 0) {
+        /* Tap device not specified or does not exist. */
+        if ((fd = tap_open_clone(ifname, ifname_size, errp)) < 0) {
+            return -1;
+        }
+    }
+
     if (*vnet_hdr) {
         /* BSD doesn't have IFF_VNET_HDR */
         *vnet_hdr = 0;
-- 
2.4.6


