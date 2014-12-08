Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xxwgh-0005pr-DR
	for mharc-qemu-trivial@gnu.org; Mon, 08 Dec 2014 06:41:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xxwgb-0005dp-3v
	for qemu-trivial@nongnu.org; Mon, 08 Dec 2014 06:41:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XxwgW-000228-A7
	for qemu-trivial@nongnu.org; Mon, 08 Dec 2014 06:41:05 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:58380)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XxwgJ-0001pT-TY; Mon, 08 Dec 2014 06:40:48 -0500
Received: from 172.24.2.119 (EHLO szxeml418-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CFT01628; Mon, 08 Dec 2014 19:40:32 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml418-hub.china.huawei.com
	(10.82.67.157) with Microsoft SMTP Server id 14.3.158.1; Mon, 8 Dec 2014
	19:40:21 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 8 Dec 2014 19:40:19 +0800
Message-ID: <1418038820-9792-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org, armbru@redhat.com,
	lcapitulino@redhat.com, Gonglei <arei.gonglei@huawei.com>,
	eblake@redhat.com
Subject: [Qemu-trivial] [PATCH] qapi-schema: fix typo about
	change-vnc-password
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
X-List-Received-Date: Mon, 08 Dec 2014 11:41:10 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 qapi-schema.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index 9ffdcf8..563b4ad 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -1533,7 +1533,7 @@
 #
 # Change the VNC server password.
 #
-# @target:  the new password to use with VNC authentication
+# @password:  the new password to use with VNC authentication
 #
 # Since: 1.1
 #
-- 
1.7.12.4



