Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YtBUk-00056p-1S
	for mharc-qemu-trivial@gnu.org; Fri, 15 May 2015 05:01:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YtBUh-00052v-9P
	for qemu-trivial@nongnu.org; Fri, 15 May 2015 05:01:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YtBUb-0002PD-Cs
	for qemu-trivial@nongnu.org; Fri, 15 May 2015 05:01:23 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:1061)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YtBUa-0002OP-Hg
	for qemu-trivial@nongnu.org; Fri, 15 May 2015 05:01:17 -0400
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CNU23689; Fri, 15 May 2015 17:01:02 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 15 May 2015 17:00:53 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Fri, 15 May 2015 17:00:03 +0800
Message-ID: <1431680403-5776-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-devel@nongnu.or, liang.z.li@intel.com,
	zhanghailiang <zhang.zhanghailiang@huawei.com>, quintela@redhat.com
Subject: [Qemu-trivial] [PATCH] arch_init: Clean up the duplicate variable
	'len' defining in ram_load()
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
X-List-Received-Date: Fri, 15 May 2015 09:01:24 -0000

There are two places that define 'len' variable, It's OK for compiling,
but makes it difficult for reading.

Remove the local one which defined in the inside 'while' loop.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 arch_init.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch_init.c b/arch_init.c
index 23d3feb..8918f6c 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -1593,7 +1593,6 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
             total_ram_bytes = addr;
             while (!ret && total_ram_bytes) {
                 RAMBlock *block;
-                uint8_t len;
                 char id[256];
                 ram_addr_t length;
 
-- 
1.7.12.4



