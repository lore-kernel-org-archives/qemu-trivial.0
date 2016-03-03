Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1abPoX-0003gu-LX
	for mharc-qemu-trivial@gnu.org; Thu, 03 Mar 2016 04:44:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1abPoT-0003ZS-JE
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 04:44:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1abPoS-0005rb-RF
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 04:44:53 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:19918)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1abPoQ-0005p5-Iy; Thu, 03 Mar 2016 04:44:51 -0500
Received: from 172.24.1.50 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.1.50])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DCN05927; Thu, 03 Mar 2016 17:44:29 +0800 (CST)
Received: from localhost (10.177.18.62) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.235.1; Thu, 3 Mar 2016
	17:43:53 +0800
From: Gonglei <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 3 Mar 2016 17:43:41 +0800
Message-ID: <1456998223-12356-5-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 2.6.3.windows.1
In-Reply-To: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
References: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.18.62]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.56D8077F.0116, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: a82fb1052eaf704b7b765166df35e53d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>
Subject: [Qemu-trivial] [PATCH 4/6] hostmem-file: fix memory leak
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
X-List-Received-Date: Thu, 03 Mar 2016 09:44:54 -0000

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 backends/hostmem-file.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index fd59482..217f858 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -51,11 +51,14 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     error_setg(errp, "-mem-path not supported on this host");
 #else
     if (!memory_region_size(&backend->mr)) {
+        gchar *path;
         backend->force_prealloc = mem_prealloc;
+        path = object_get_canonical_path(OBJECT(backend));
         memory_region_init_ram_from_file(&backend->mr, OBJECT(backend),
-                                 object_get_canonical_path(OBJECT(backend)),
+                                 path,
                                  backend->size, fb->share,
                                  fb->mem_path, errp);
+        g_free(path);
     }
 #endif
 }
-- 
1.8.5.2



