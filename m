Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRcqd-00056B-SX
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 03:34:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRcqb-0004zo-BI
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 03:34:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRcqa-0001F7-Fx
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 03:34:05 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:1639)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YRcqX-0001Ds-Ji; Sat, 28 Feb 2015 03:34:02 -0500
Received: from 172.24.2.119 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CKC39405; Sat, 28 Feb 2015 16:33:41 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 28 Feb 2015 16:33:34 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 28 Feb 2015 16:33:22 +0800
Message-ID: <1425112403-10988-2-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1425112403-10988-1-git-send-email-arei.gonglei@huawei.com>
References: <1425112403-10988-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, Wang Xin <wangxinxin.wang@huawei.com>,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	arei.gonglei@huawei.com, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH v2 1/2] qemu-char: add cyrillic characters
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
X-List-Received-Date: Sat, 28 Feb 2015 08:34:06 -0000

From: Wang Xin <wangxinxin.wang@huawei.com>

This patch adds missing cyrillic characters 'numerosign' to the VNC
keysym table, it's need by Russian keyboard. And I get the keysym from
'<X11/keysymdef.h>', the current keysym table in Qemu was generated from
it.

Signed-off-by: Wang xin <wangxinxin.wang@huawei.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
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
1.8.3.4



