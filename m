Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7gpd-0006NA-JH
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jun 2015 05:18:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z7gpb-0006KV-9m
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 05:18:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z7gpa-0003CO-Fa
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 05:18:55 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:19937)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Z7gpT-00039g-9f; Wed, 24 Jun 2015 05:18:47 -0400
Received: from 172.24.2.119 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BID19940; Wed, 24 Jun 2015 17:18:38 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml426-hub.china.huawei.com
	(10.82.67.181) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 24 Jun 2015 17:18:27 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 24 Jun 2015 17:18:17 +0800
Message-ID: <1435137497-11972-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.558A75F0.0056, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 01bbc1d90e2815f966b704eda8998419
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	kraxel@redhat.com, armbru@redhat.com
Subject: [Qemu-trivial] [PATCH v2] ossaudio: fix memory leak
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
X-List-Received-Date: Wed, 24 Jun 2015 09:18:56 -0000

From: Gonglei <arei.gonglei@huawei.com>

Variable "conf" going out of scope leaks the storage
it points to in line 856.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
v2:
 using an better way to avoid memory leak. (Markus) 
---
 audio/ossaudio.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index 11e76a1..94b473b 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -848,14 +848,11 @@ static OSSConf glob_conf = {
 
 static void *oss_audio_init (void)
 {
-    OSSConf *conf = g_malloc(sizeof(OSSConf));
-    *conf = glob_conf;
-
-    if (access(conf->devpath_in, R_OK | W_OK) < 0 ||
-        access(conf->devpath_out, R_OK | W_OK) < 0) {
+    if (access(glob_conf.devpath_in, R_OK | W_OK) < 0 ||
+        access(glob_conf.devpath_out, R_OK | W_OK) < 0) {
         return NULL;
     }
-    return conf;
+    return g_memdup(&glob_conf, sizeof(glob_conf));
 }
 
 static void oss_audio_fini (void *opaque)
-- 
1.7.12.4



