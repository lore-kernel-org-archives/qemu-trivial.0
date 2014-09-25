Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XX5e3-0006ZF-N2
	for mharc-qemu-trivial@gnu.org; Thu, 25 Sep 2014 05:47:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XX5dx-0006Oy-4T
	for qemu-trivial@nongnu.org; Thu, 25 Sep 2014 05:47:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XX5ds-0004HV-Bb
	for qemu-trivial@nongnu.org; Thu, 25 Sep 2014 05:47:21 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:56177)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XX5df-000496-3f; Thu, 25 Sep 2014 05:47:03 -0400
Received: from 172.24.2.119 (EHLO szxeml418-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AUV43907; Thu, 25 Sep 2014 17:46:43 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml418-hub.china.huawei.com
	(10.82.67.157) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 25 Sep 2014 17:46:35 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 25 Sep 2014 17:46:23 +0800
Message-ID: <1411638384-5844-4-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1411638384-5844-1-git-send-email-arei.gonglei@huawei.com>
References: <1411638384-5844-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020207.5423E484.017C, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: bc4c6a8547c935a9ad06ed2b88537dba
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: peter.maydell@linaro.org, weidong.huang@huawei.com, qemu-trivial@nongnu.org,
	luonengjun@huawei.com, mjt@tls.msk.ru, armbru@redhat.com,
	peter.huangpeng@huawei.com, Gonglei <arei.gonglei@huawei.com>,
	pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH 3/4] osdep: convert fprintf to error_report
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
X-List-Received-Date: Thu, 25 Sep 2014 09:47:26 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 util/osdep.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/util/osdep.c b/util/osdep.c
index b2bd154..7f6e483 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -401,9 +401,9 @@ void fips_set_state(bool requested)
 #endif /* __linux__ */
 
 #ifdef _FIPS_DEBUG
-    fprintf(stderr, "FIPS mode %s (requested %s)\n",
-	    (fips_enabled ? "enabled" : "disabled"),
-	    (requested ? "enabled" : "disabled"));
+    error_report("FIPS mode %s (requested %s)",
+                 (fips_enabled ? "enabled" : "disabled"),
+                 (requested ? "enabled" : "disabled"));
 #endif
 }
 
@@ -428,7 +428,7 @@ int socket_init(void)
     ret = WSAStartup(MAKEWORD(2, 2), &Data);
     if (ret != 0) {
         err = WSAGetLastError();
-        fprintf(stderr, "WSAStartup: %d\n", err);
+        error_report("WSAStartup: %d", err);
         return -1;
     }
     atexit(socket_cleanup);
-- 
1.7.12.4



