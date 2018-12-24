Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gbJnL-00050b-Ax
	for mharc-qemu-trivial@gnu.org; Mon, 24 Dec 2018 01:32:55 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dongli.zhang@oracle.com>) id 1gbJnJ-0004zz-Mx
	for qemu-trivial@nongnu.org; Mon, 24 Dec 2018 01:32:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dongli.zhang@oracle.com>) id 1gbJnG-00078d-Jk
	for qemu-trivial@nongnu.org; Mon, 24 Dec 2018 01:32:53 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:55974)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dongli.zhang@oracle.com>)
	id 1gbJnG-00076Z-Aw; Mon, 24 Dec 2018 01:32:50 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id
	wBO6TJBA030524; Mon, 24 Dec 2018 06:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=from : to : cc :
	subject : date : message-id; s=corp-2018-07-02;
	bh=MPELyg8KJAlwZEnk8F+NGDmLhsOcOEXMgZTXHe4gerE=;
	b=oDJhu4t8KObFlYwrdGOoKjHI0xalG1BNaVIxU6Uy5tjE3XZKCskACZYT17pQMipVMyaX
	SPj0odpwV4UkrO0PR3WQq1LrIv4F1KaU5Pte1TcUfKLDfc7wiju/7jT7ox0wm2qLTbEy
	PzAvd0rvjqyENRIZZl3cAVNBfgw6EELLwqh8XOMpZ/mg7ni612bMltqpGuup47IsBEo6
	Xf6B/bwbsFEt+j6yIazEZ0Ft2Pnhw1+PVRul5YSb6fYAiUkyq8OsF4+s2odzSm7L/ewy
	+LDlB7Kx7p5n6s4trcFUpSQXRcTzeRu0sdyDhhLXpJ0VBRp4O02TVMs6k/qe8Nv63iOK
	qw== 
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
	by userp2130.oracle.com with ESMTP id 2phcptkpcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Dec 2018 06:32:47 +0000
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id wBO6Wj0F009197
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 24 Dec 2018 06:32:45 GMT
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id wBO6WZ5N018657;
	Mon, 24 Dec 2018 06:32:35 GMT
Received: from linux.cn.oracle.com (/10.182.70.25)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Sun, 23 Dec 2018 22:32:34 -0800
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, mjt@tls.msk.ru, armbru@redhat.com
Date: Mon, 24 Dec 2018 14:35:23 +0800
Message-Id: <1545633323-10818-1-git-send-email-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.7.4
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9116
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=943
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1812240058
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 156.151.31.86
Subject: [Qemu-trivial] [PATCH 1/1] qdev: rename qdev_create() argument to
 sync with qdev_try_create()
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
X-List-Received-Date: Mon, 24 Dec 2018 06:32:54 -0000

The second argument used by qdev_create() is typename and 'name' is very
confusing. Rename it from 'name' to 'type', which is the same used by
qdev_try_create().

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 hw/core/qdev.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 6b3cc55..1d65e8f 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -113,17 +113,17 @@ void qdev_set_parent_bus(DeviceState *dev, BusState *bus)
 /* Create a new device.  This only initializes the device state
    structure and allows properties to be set.  The device still needs
    to be realized.  See qdev-core.h.  */
-DeviceState *qdev_create(BusState *bus, const char *name)
+DeviceState *qdev_create(BusState *bus, const char *type)
 {
     DeviceState *dev;
 
-    dev = qdev_try_create(bus, name);
+    dev = qdev_try_create(bus, type);
     if (!dev) {
         if (bus) {
-            error_report("Unknown device '%s' for bus '%s'", name,
+            error_report("Unknown device '%s' for bus '%s'", type,
                          object_get_typename(OBJECT(bus)));
         } else {
-            error_report("Unknown device '%s' for default sysbus", name);
+            error_report("Unknown device '%s' for default sysbus", type);
         }
         abort();
     }
-- 
2.7.4


