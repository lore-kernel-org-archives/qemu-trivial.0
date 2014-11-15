Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XpaGZ-0006gL-6D
	for mharc-qemu-trivial@gnu.org; Sat, 15 Nov 2014 05:07:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XpaGR-0006PY-4N
	for qemu-trivial@nongnu.org; Sat, 15 Nov 2014 05:07:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XpaGM-0003up-Az
	for qemu-trivial@nongnu.org; Sat, 15 Nov 2014 05:07:31 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:53391)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XpaG4-0003iO-0s; Sat, 15 Nov 2014 05:07:11 -0500
Received: from 172.24.2.119 (EHLO szxeml420-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AXD50460; Sat, 15 Nov 2014 18:07:03 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml420-hub.china.huawei.com
	(10.82.67.159) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 15 Nov 2014 18:06:52 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 15 Nov 2014 18:06:42 +0800
Message-ID: <1416046008-7880-4-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
References: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020209.546725C7.0148, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 0a26a185398a7b43449d7d14a8db7f2f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: weidong.huang@huawei.com, zhang.zhanghailiang@huawei.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com, Gonglei <arei.gonglei@huawei.com>,
	pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH 3/9] qga: fix false negative argument passing
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
X-List-Received-Date: Sat, 15 Nov 2014 10:07:36 -0000

From: Gonglei <arei.gonglei@huawei.com>

Function send_response(s, &qdict->base) returns a negative number
when any faliures occured. But strerror()'s parameter cannot be
negative. Let's change the testing condition and pass '-ret' to
strerr().

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 qga/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qga/main.c b/qga/main.c
index 227f2bd..9939a2b 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -603,8 +603,8 @@ static void process_event(JSONMessageParser *parser, QList *tokens)
             error_free(err);
         }
         ret = send_response(s, QOBJECT(qdict));
-        if (ret) {
-            g_warning("error sending error response: %s", strerror(ret));
+        if (ret < 0) {
+            g_warning("error sending error response: %s", strerror(-ret));
         }
     }
 
-- 
1.7.12.4



