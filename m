Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YNCsO-0006TB-B0
	for mharc-qemu-trivial@gnu.org; Sun, 15 Feb 2015 23:01:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YNCsL-0006NE-Fq
	for qemu-trivial@nongnu.org; Sun, 15 Feb 2015 23:01:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YNCsK-0005Dg-M1
	for qemu-trivial@nongnu.org; Sun, 15 Feb 2015 23:01:37 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:30984)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YNCsD-00058d-5b; Sun, 15 Feb 2015 23:01:30 -0500
Received: from 172.24.2.119 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BBZ37090; Mon, 16 Feb 2015 12:01:23 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 16 Feb 2015 12:01:16 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 16 Feb 2015 12:00:57 +0800
Message-ID: <1424059258-11024-2-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1424059258-11024-1-git-send-email-arei.gonglei@huawei.com>
References: <1424059258-11024-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.54E16B93.0153, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: fb1cd8b798e78c6f5d5bea66d1488732
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, Wang Xin <wangxinxin.wang@huawei.com>,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	Gonglei <arei.gonglei@huawei.com>, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH 1/2] qemu-char: add cyrillic characters
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
X-List-Received-Date: Mon, 16 Feb 2015 04:01:38 -0000

From: Wang Xin <wangxinxin.wang@huawei.com>

This patch adds missing cyrillic characters 'numerosign' to the VNC
keysym table, it's need by Russian keyboard. And I get the keysym from
'<X11/keysymdef.h>', the current keysym table in Qemu was generated from
it.

signed-off-by: Wang xin <wangxinxin.wang@huawei.com>
signed-off-by: Gonglei <arei.gonglei@huawei.com>
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



