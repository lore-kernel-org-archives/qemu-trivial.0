Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuObr-0002SL-EB
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:09:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuObl-0002G7-1x
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:09:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuObg-000878-Nz
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:09:08 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44772)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuObR-0007jJ-K0; Tue, 10 Jun 2014 12:08:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 693F441247;
	Tue, 10 Jun 2014 20:08:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4C82C666;
	Tue, 10 Jun 2014 20:08:47 +0400 (MSK)
Received: (nullmailer pid 13302 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:24 +0400
Message-Id: <1402416523-13212-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 06/25] slirp: Remove unused zero_ethaddr[]
	variable
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
X-List-Received-Date: Tue, 10 Jun 2014 16:09:13 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The zero_ethaddr[] array is never used; delete it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 slirp/slirp.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/slirp/slirp.c b/slirp/slirp.c
index 6028036..35f819a 100644
--- a/slirp/slirp.c
+++ b/slirp/slirp.c
@@ -37,8 +37,6 @@ static const uint8_t special_ethaddr[ETH_ALEN] = {
     0x52, 0x55, 0x00, 0x00, 0x00, 0x00
 };
 
-static const uint8_t zero_ethaddr[ETH_ALEN] = { 0, 0, 0, 0, 0, 0 };
-
 u_int curtime;
 
 static QTAILQ_HEAD(slirp_instances, Slirp) slirp_instances =
-- 
1.7.10.4


