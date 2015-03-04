Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTDNi-0000ZY-1g
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 12:46:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTDNc-0000NL-5w
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:46:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTDNb-0004HG-As
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:46:44 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:39248)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTDNS-0004CU-7r; Wed, 04 Mar 2015 12:46:34 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 99673408AA;
	Wed,  4 Mar 2015 20:46:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 3354E984;
	Wed,  4 Mar 2015 20:07:12 +0300 (MSK)
Received: (nullmailer pid 17538 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:44 +0300
Message-Id: <9dd9fd786afa0e5d03d47627b4fe26db7a4e1f02.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Wang Xin <wangxinxin.wang@huawei.com>,
	Gonglei <arei.gonglei@huawei.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 27/47] qemu-char: add cyrillic characters
	'numerosign' to VNC keysyms
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
X-List-Received-Date: Wed, 04 Mar 2015 17:46:45 -0000

From: Wang Xin <wangxinxin.wang@huawei.com>

This patch adds missing cyrillic character 'numerosign' to the VNC
keysym table, it's needed by Russian keyboard. And I get the keysym from
'<X11/keysymdef.h>', the current keysym table in Qemu was generated from
it.

Signed-off-by: Wang xin <wangxinxin.wang@huawei.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 ui/vnc_keysym.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ui/vnc_keysym.h b/ui/vnc_keysym.h
index 1dc039f..7fa2bc1 100644
--- a/ui/vnc_keysym.h
+++ b/ui/vnc_keysym.h
@@ -404,6 +404,7 @@ static const name2keysym_t name2keysym[]={
 {"breve",                         0x01a2},  /* U+02D8 BREVE */
 {"caron",                         0x01b7},  /* U+02C7 CARON */
 {"Ccaron",                        0x01c8},  /* U+010C LATIN CAPITAL LETTER C WITH CARON */
+{"numerosign",                    0x06b0},  /* U+2116 NUMERO SIGN */
 {"Cyrillic_a",                    0x06c1},  /* U+0430 CYRILLIC SMALL LETTER A */
 {"Cyrillic_A",                    0x06e1},  /* U+0410 CYRILLIC CAPITAL LETTER A */
 {"Cyrillic_be",                   0x06c2},  /* U+0431 CYRILLIC SMALL LETTER BE */
-- 
2.1.4


