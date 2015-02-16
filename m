Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YNCsO-0006Td-Hm
	for mharc-qemu-trivial@gnu.org; Sun, 15 Feb 2015 23:01:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YNCsM-0006O4-00
	for qemu-trivial@nongnu.org; Sun, 15 Feb 2015 23:01:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YNCsL-0005Dv-9A
	for qemu-trivial@nongnu.org; Sun, 15 Feb 2015 23:01:37 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:42413)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YNCsD-00059U-1q; Sun, 15 Feb 2015 23:01:29 -0500
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CJO77383; Mon, 16 Feb 2015 12:01:27 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 16 Feb 2015 12:01:16 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 16 Feb 2015 12:00:58 +0800
Message-ID: <1424059258-11024-3-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1424059258-11024-1-git-send-email-arei.gonglei@huawei.com>
References: <1424059258-11024-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, Wang Xin <wangxinxin.wang@huawei.com>,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	Gonglei <arei.gonglei@huawei.com>, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH 2/2] qemu-char: add cyrillic key 'numerosign'
	to Russian keymap
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
X-List-Received-Date: Mon, 16 Feb 2015 04:01:38 -0000

From: Wang Xin <wangxinxin.wang@huawei.com>

'numerosign' is the numbersign key of Russian keyboard layout, we
get this key with press 'shift + 3'. It's missing in current
Russian keymap file, this patch fix it.

signed-off-by: Wang Xin <wangxinxin.wang@huawei.com>
signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 pc-bios/keymaps/ru | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pc-bios/keymaps/ru b/pc-bios/keymaps/ru
index b3e7d24..9432945 100644
--- a/pc-bios/keymaps/ru
+++ b/pc-bios/keymaps/ru
@@ -5,6 +5,7 @@ exclam 0x02 shift
 at 0x03 shift
 quotedbl 0x03 shift altgr
 numbersign 0x04 shift
+numerosign 0x04 shift
 dollar 0x05 shift
 asterisk 0x05 shift altgr
 percent 0x06 shift
-- 
1.8.3.4



