Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1Rzw-0003Rg-QE
	for mharc-qemu-trivial@gnu.org; Tue, 01 Nov 2016 01:52:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c1Rzu-0003QV-AC
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 01:52:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c1Rzq-00070C-6a
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 01:52:34 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:4705)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c1Rzp-0006wu-Ok
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 01:52:30 -0400
Received: from 172.24.1.137 (EHLO SZXEML423-HUB.china.huawei.com)
	([172.24.1.137])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CKQ93506; Tue, 01 Nov 2016 13:52:23 +0800 (CST)
Received: from localhost (10.177.24.212) by SZXEML423-HUB.china.huawei.com
	(10.82.67.154) with Microsoft SMTP Server id 14.3.235.1; Tue, 1 Nov 2016
	13:52:14 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <eblake@redhat.com>
CC: <armbru@redhat.com>, <qemu-trivial@nongnu.org>, zhanghailiang
	<zhang.zhanghailiang@huawei.com>
Date: Tue, 1 Nov 2016 13:51:51 +0800
Message-ID: <1477979511-15460-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 2.7.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.24.212]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: [Qemu-trivial] [PATCH] qapi-schema: clarify 'colo' state for
 MigrationStatus
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
X-List-Received-Date: Tue, 01 Nov 2016 05:52:35 -0000

VM can not get into colo state unless users enable 'x-colo'
capability for migration, Here it is necessary to clarify
this.

Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 qapi-schema.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index 8a7b527..d580169 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -462,7 +462,8 @@
 #
 # @failed: some error occurred during migration process.
 #
-# @colo: VM is in the process of fault tolerance. (since 2.8)
+# @colo: VM is in the process of fault tolerance, VM can not get into this
+#        state unless colo capability is enabled for migration. (since 2.8)
 #
 # Since: 2.3
 #
-- 
1.8.3.1



