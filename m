Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XyES6-00006j-Ff
	for mharc-qemu-trivial@gnu.org; Tue, 09 Dec 2014 01:39:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XyERz-0008U8-Al
	for qemu-trivial@nongnu.org; Tue, 09 Dec 2014 01:39:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XyERr-0000lY-V6
	for qemu-trivial@nongnu.org; Tue, 09 Dec 2014 01:39:11 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:53942)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XyERr-0000kB-3b; Tue, 09 Dec 2014 01:39:03 -0500
Received: from 172.24.2.119 (EHLO szxeml406-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CFU81196; Tue, 09 Dec 2014 14:38:51 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml406-hub.china.huawei.com
	(10.82.67.93) with Microsoft SMTP Server id 14.3.158.1; Tue, 9 Dec 2014
	14:38:42 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Tue, 9 Dec 2014 14:38:37 +0800
Message-ID: <1418107117-9892-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, peter.huangpeng@huawei.com,
	qemu-devel@nongnu.org, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH] qmp-command.hx: add missing docs for
	migration capabilites
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
X-List-Received-Date: Tue, 09 Dec 2014 06:39:17 -0000

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 qmp-commands.hx | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/qmp-commands.hx b/qmp-commands.hx
index 718dd92..4f0b36e 100644
--- a/qmp-commands.hx
+++ b/qmp-commands.hx
@@ -3184,6 +3184,9 @@ migrate-set-capabilities
 Enable/Disable migration capabilities
 
 - "xbzrle": XBZRLE support
+- "rdma-pin-all": pin all pages when use of RDMA during migration
+- "auto-converge": throttle down guest to help convergence of migration
+- "zero-blocks": compress zero blocks during block migration
 
 Arguments:
 
@@ -3208,6 +3211,9 @@ Query current migration capabilities
 
 - "capabilities": migration capabilities state
          - "xbzrle" : XBZRLE state (json-bool)
+         - "rdma-pin-all" : RDMA Pin Page state (json-bool)
+         - "auto-converge" : Auto Converge state (json-bool)
+         - "zero-blocks" : Zero Blocks state (json-bool)
 
 Arguments:
 
-- 
1.7.12.4



