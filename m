Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1qE1-0002Qq-6x
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 03:44:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c1qDz-0002Pe-E2
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 03:44:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c1qDy-0007HH-ML
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 03:44:43 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:24966)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1c1qDt-0007Et-Uc; Wed, 02 Nov 2016 03:44:38 -0400
Received: from 172.24.1.137 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.1.137])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DPZ22824; Wed, 02 Nov 2016 15:44:29 +0800 (CST)
Received: from localhost (10.177.24.212) by SZXEML429-HUB.china.huawei.com
	(10.82.67.184) with Microsoft SMTP Server id 14.3.235.1; Wed, 2 Nov 2016
	15:44:19 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <eblake@redhat.com>, <armbru@redhat.com>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, zhanghailiang
	<zhang.zhanghailiang@huawei.com>
Date: Wed, 2 Nov 2016 15:44:12 +0800
Message-ID: <1478072652-9884-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 2.7.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.24.212]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: [Qemu-trivial] [PATCH v2] qapi-schema: clarify 'colo' state for
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
X-List-Received-Date: Wed, 02 Nov 2016 07:44:44 -0000

VM can not get into colo state unless users enable 'x-colo'
capability for migration, Here it is necessary to clarify
this.

Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
v2:
- Clarify colo state for RunState too as Eric suggested.
---
 qapi-schema.json | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index 5dc96af..04f5aab 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -176,8 +176,9 @@
 #
 # @guest-panicked: guest has been panicked as a result of guest OS panic
 #
-# @colo: guest is paused to save/restore VM state under colo checkpoint (since
-# 2.8)
+# @colo: guest is paused to save/restore VM state under colo checkpoint,
+#        VM can not get into this state unless colo capability is enabled
+#        for migration. (since 2.8)
 ##
 { 'enum': 'RunState',
   'data': [ 'debug', 'inmigrate', 'internal-error', 'io-error', 'paused',
@@ -462,7 +463,8 @@
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



