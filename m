Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y0z7A-0007Jd-3J
	for mharc-qemu-trivial@gnu.org; Tue, 16 Dec 2014 15:53:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Y0z6z-00076b-MV
	for qemu-trivial@nongnu.org; Tue, 16 Dec 2014 15:53:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Y0z6q-0002Xm-L1
	for qemu-trivial@nongnu.org; Tue, 16 Dec 2014 15:52:53 -0500
Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231]:46305)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1Y0z6T-0002SY-VA; Tue, 16 Dec 2014 15:52:22 -0500
Received: by mail-pd0-f177.google.com with SMTP id ft15so14396894pdb.8
	for <multiple recipients>; Tue, 16 Dec 2014 12:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=9EIqlgPw/AtuD21VVBfwtxx8SnfRWfFM5Q4NLE5Nxxg=;
	b=n0oBiQUzKv6b1e8aHJQT3faeYt6X4YH0TSpIqZJgVbaPpr7WaLbeCJDwM7rtJMvKSp
	r4d4i8WnChk4j0FV+/Qtx/tR9CiGy+yeahpgNWBhw7ou4tbZy0bf/GTMYmc4GpKJLdgJ
	d7ltSP1FM5zt1YdjJSrQXhVyyaW1YiPsfCGJATQYinyhWXkL8n9HpTV34aYUM/fSdVYT
	YbUgfDLWmfFL3Bjmk+wnLOhJLZkRyEWZcvrJbXgR/Am9/BG2nXLwkTr/BRDD9J1FYeNf
	hzSTG+3MOMNw08tr6t1P1yfIVpuMA26469lQ9fGilx/GcgmzLjb/d8g54/dZWMiBfJJz
	VtuA==
X-Received: by 10.70.51.232 with SMTP id n8mr64561004pdo.9.1418763141104;
	Tue, 16 Dec 2014 12:52:21 -0800 (PST)
Received: from [192.168.1.103] ([223.72.65.78])
	by mx.google.com with ESMTPSA id qz7sm1866774pbb.12.2014.12.16.12.52.18
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 16 Dec 2014 12:52:19 -0800 (PST)
Message-ID: <54909B80.4030602@gmail.com>
Date: Wed, 17 Dec 2014 04:52:16 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::231
Subject: [Qemu-trivial] [PATCH] hw/net/xen_nic.c: Need free 'netdev->nic' in
 net_free() instead of net_disconnect()
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
X-List-Received-Date: Tue, 16 Dec 2014 20:53:02 -0000

net_init() and net_free() are pairs, net_connect() and net_disconnect()
are pairs. net_init() creates 'netdev->nic', so also need free it in
net_free().

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 hw/net/xen_nic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index 7a57feb..8eaa77b 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -410,10 +410,6 @@ static void net_disconnect(struct XenDevice *xendev)
         xc_gnttab_munmap(netdev->xendev.gnttabdev, netdev->rxs, 1);
         netdev->rxs = NULL;
     }
-    if (netdev->nic) {
-        qemu_del_nic(netdev->nic);
-        netdev->nic = NULL;
-    }
 }
 
 static void net_event(struct XenDevice *xendev)
@@ -427,6 +423,10 @@ static int net_free(struct XenDevice *xendev)
 {
     struct XenNetDev *netdev = container_of(xendev, struct XenNetDev, xendev);
 
+    if (netdev->nic) {
+        qemu_del_nic(netdev->nic);
+        netdev->nic = NULL;
+    }
     g_free(netdev->mac);
     return 0;
 }
-- 
1.9.3

