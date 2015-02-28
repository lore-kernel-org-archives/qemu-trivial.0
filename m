Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRctE-0008IO-10
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 03:36:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRctB-0008Di-QV
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 03:36:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRctA-0002Nx-BV
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 03:36:45 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:60633)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YRct5-0002Kw-AX; Sat, 28 Feb 2015 03:36:39 -0500
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHU76020; Sat, 28 Feb 2015 16:36:21 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml431-hub.china.huawei.com
	(10.82.67.208) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 28 Feb 2015 16:33:34 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 28 Feb 2015 16:33:23 +0800
Message-ID: <1425112403-10988-3-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1425112403-10988-1-git-send-email-arei.gonglei@huawei.com>
References: <1425112403-10988-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, Wang Xin <wangxinxin.wang@huawei.com>,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	arei.gonglei@huawei.com, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH v2 2/2] qemu-char: add cyrillic key
	'numerosign' to Russian keymap
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
X-List-Received-Date: Sat, 28 Feb 2015 08:36:46 -0000

From: Wang Xin <wangxinxin.wang@huawei.com>

numero sign is the number sign key of Russian keyboard layout, we
get this key with press 'shift + 3'. It's missing in current
Russian keymap file, this patch fix it.
As number sign is not exsit in Russian keyboard layout[1][2], this
patch also remove the 'numbersign' from Russian keymap.

[1] http://en.wikipedia.org/wiki/Keyboard_layout#Russian
[2] http://kbd-intl.narod.ru/english/layouts

Signed-off-by: Wang Xin <wangxinxin.wang@huawei.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
v2->v1:
  Remove the key 'numbersign' from Russian keymap.
---
 pc-bios/keymaps/ru | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pc-bios/keymaps/ru b/pc-bios/keymaps/ru
index b3e7d24..8f652d5 100644
--- a/pc-bios/keymaps/ru
+++ b/pc-bios/keymaps/ru
@@ -4,7 +4,7 @@ map 0x419
 exclam 0x02 shift
 at 0x03 shift
 quotedbl 0x03 shift altgr
-numbersign 0x04 shift
+numerosign 0x04 shift
 dollar 0x05 shift
 asterisk 0x05 shift altgr
 percent 0x06 shift
-- 
1.8.3.4



