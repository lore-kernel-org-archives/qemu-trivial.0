Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wpy4O-0005xg-5R
	for mharc-qemu-trivial@gnu.org; Thu, 29 May 2014 07:00:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Wpy4J-0005nR-3j
	for qemu-trivial@nongnu.org; Thu, 29 May 2014 07:00:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Wpy4I-0008Sl-Au
	for qemu-trivial@nongnu.org; Thu, 29 May 2014 07:00:19 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:48291)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Wpy4F-0008Ri-RG; Thu, 29 May 2014 07:00:15 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Wpy4F-0006hp-44; Thu, 29 May 2014 12:00:15 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 29 May 2014 12:00:15 +0100
Message-Id: <1401361215-25752-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] slirp: Remove unused zero_ethaddr[] variable
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
X-List-Received-Date: Thu, 29 May 2014 11:00:23 -0000

The zero_ethaddr[] array is never used; delete it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
clang 3.4 warns about unused const variables like this and
also about unused functions; we have over 400 such warnings
currently, of which some are simple "forgot to clean up
redundant code" like this one, some are deliberate in some
sense (usually the function/var is used in one config but not
another), and some are outright bugs. Anybody feel like wading
through them? :-)

 slirp/slirp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/slirp/slirp.c b/slirp/slirp.c
index 3fb48a4..b7f3726 100644
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
1.9.2


