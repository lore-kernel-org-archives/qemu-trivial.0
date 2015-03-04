Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTE0K-0002Tz-L5
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 13:26:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTE0H-0002KY-Ed
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 13:26:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTE0G-00023G-BZ
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 13:26:41 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:51125)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTE0A-00020n-1W; Wed, 04 Mar 2015 13:26:34 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BC3C9408CE;
	Wed,  4 Mar 2015 21:26:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 78E3595C;
	Wed,  4 Mar 2015 20:07:09 +0300 (MSK)
Received: (nullmailer pid 17540 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:45 +0300
Message-Id: <b297c126c44b65dde9b2e200fb06902286572ce8.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Wang Xin <wangxinxin.wang@huawei.com>,
	Gonglei <arei.gonglei@huawei.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 28/47] qemu-char: add cyrillic key
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
X-List-Received-Date: Wed, 04 Mar 2015 18:26:42 -0000

From: Wang Xin <wangxinxin.wang@huawei.com>

numero sign is the number sign key of Russian keyboard layout, we
get this key with 'shift + 3'. It's missing in current Russian keymap file,
this patch fixes it.
As number sign does not exsit in Russian keyboard layout[1][2], this
patch also removes the 'numbersign' from Russian keymap.

[1] http://en.wikipedia.org/wiki/Keyboard_layout#Russian
[2] http://kbd-intl.narod.ru/english/layouts

Signed-off-by: Wang Xin <wangxinxin.wang@huawei.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


