Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7Cb3-0001PL-AA
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 21:01:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z7Cb1-0001Nn-2R
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 21:01:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z7Cax-0000gf-R0
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 21:01:51 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:59953)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Z7Cax-0000a4-2a; Mon, 22 Jun 2015 21:01:47 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CPV43028; Tue, 23 Jun 2015 09:01:34 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 23 Jun 2015 09:01:23 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 23 Jun 2015 09:01:10 +0800
Message-ID: <1435021270-7768-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH] ossaudio: fix memory leak
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
X-List-Received-Date: Tue, 23 Jun 2015 01:01:52 -0000

From: Gonglei <arei.gonglei@huawei.com>

Variable "conf" going out of scope leaks the storage
it points to in line 856.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 audio/ossaudio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index 11e76a1..7dbe333 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -853,6 +853,7 @@ static void *oss_audio_init (void)
 
     if (access(conf->devpath_in, R_OK | W_OK) < 0 ||
         access(conf->devpath_out, R_OK | W_OK) < 0) {
+        g_free(conf);
         return NULL;
     }
     return conf;
-- 
1.7.12.4



