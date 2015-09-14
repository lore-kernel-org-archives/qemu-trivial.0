Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZbRC2-0001uk-Id
	for mharc-qemu-trivial@gnu.org; Mon, 14 Sep 2015 06:41:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1ZbRC0-0001sL-70
	for qemu-trivial@nongnu.org; Mon, 14 Sep 2015 06:41:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1ZbRBz-0006Jx-8f
	for qemu-trivial@nongnu.org; Mon, 14 Sep 2015 06:41:00 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:54047)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1ZbRBu-0006Dm-Ku; Mon, 14 Sep 2015 06:40:55 -0400
Received: from 172.24.1.47 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.1.47])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BMV76863; Mon, 14 Sep 2015 18:40:33 +0800 (CST)
Received: from localhost (10.177.25.63) by szxeml426-hub.china.huawei.com
	(10.82.67.181) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 14 Sep 2015 18:40:23 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Mon, 14 Sep 2015 18:40:10 +0800
Message-ID: <1442227210-24604-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.5.msysgit.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.25.63]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A0B0204.55F6A423.007D, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 340e0afc6af0e8e269b47b6e781a8b58
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-devel@nongnu.org,
	mst@redhat.com
Subject: [Qemu-trivial] [PATCH] piix: fix resource leak reported by Coverity
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
X-List-Received-Date: Mon, 14 Sep 2015 10:41:01 -0000

config_fd should be closed before return, or there will
be a resource leak error.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 hw/pci-host/piix.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
index 1fb71c8..7b2fbf9 100644
--- a/hw/pci-host/piix.c
+++ b/hw/pci-host/piix.c
@@ -764,6 +764,7 @@ static int host_pci_config_read(int pos, int len, uint32_t val)
     /* Access real host bridge. */
     int rc = snprintf(path, size, "/sys/bus/pci/devices/%04x:%02x:%02x.%d/%s",
                       0, 0, 0, 0, "config");
+    int ret = 0;
 
     if (rc >= size || rc < 0) {
         return -ENODEV;
@@ -775,16 +776,18 @@ static int host_pci_config_read(int pos, int len, uint32_t val)
     }
 
     if (lseek(config_fd, pos, SEEK_SET) != pos) {
-        return -errno;
+        ret = -errno;
+        goto out;
     }
     do {
         rc = read(config_fd, (uint8_t *)&val, len);
     } while (rc < 0 && (errno == EINTR || errno == EAGAIN));
     if (rc != len) {
-        return -errno;
+        ret = -errno;
     }
-
-    return 0;
+out:
+    close(config_fd);
+    return ret;
 }
 
 static int igd_pt_i440fx_initfn(struct PCIDevice *pci_dev)
-- 
1.8.3.1



