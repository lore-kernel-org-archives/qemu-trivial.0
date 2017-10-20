Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e5irn-0001Yv-RG
	for mharc-qemu-trivial@gnu.org; Fri, 20 Oct 2017 21:46:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Paul.Burton@mips.com>) id 1e5gbu-000761-0H
	for qemu-trivial@nongnu.org; Fri, 20 Oct 2017 19:21:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Paul.Burton@mips.com>) id 1e5gbt-00089i-0B
	for qemu-trivial@nongnu.org; Fri, 20 Oct 2017 19:21:49 -0400
Received: from 20pmail.ess.barracuda.com ([64.235.154.233]:32918)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Paul.Burton@mips.com>)
	id 1e5gbn-00081X-RA; Fri, 20 Oct 2017 19:21:44 -0400
Received: from MIPSMAIL01.mipstec.com (mailrelay.mips.com [12.201.5.28]) by
	mx1411.ess.rzc.cudaops.com (version=TLSv1.2
	cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
	Fri, 20 Oct 2017 23:21:19 +0000
Received: from pburton-laptop.mipstec.com (10.20.1.8) by mips01.mipstec.com
	(10.20.43.31) with Microsoft SMTP Server id 14.3.361.1; Fri, 20 Oct 2017
	16:20:28 -0700
From: Paul Burton <paul.burton@mips.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, Yongbok Kim
	<yongbok.kim@mips.com>
CC: Paul Burton <paul.burton@imgtec.com>, Laurent Vivier <laurent@vivier.eu>, 
	Michael Tokarev <mjt@tls.msk.ru>, Yongbok Kim <yongbok.kim@imgtec.com>
Date: Fri, 20 Oct 2017 16:21:14 -0700
Message-ID: <20171020232114.5475-1-paul.burton@mips.com>
X-Mailer: git-send-email 2.14.2
MIME-Version: 1.0
Content-Type: text/plain
X-BESS-ID: 1508541678-452059-5270-740115-9
X-BESS-VER: 2017.12.1-r1709122024
X-BESS-Apparent-Source-IP: 12.201.5.28
X-BESS-Outbound-Spam-Score: 1.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.186159
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MAILTO_TO_SPAM_ADDR    META: Includes a link 
	to a likely spammer email 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	1.00 BSF_SC0_SA620b         META: Custom Rule SA620b 
X-BESS-Outbound-Spam-Status: SCORE=1.00 using account:ESS59374 scores of
	KILL_LEVEL=7.0 tests=MAILTO_TO_SPAM_ADDR, BSF_BESS_OUTBOUND,
	BSF_SC0_SA620b
X-BESS-BRTS-Status: 1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 64.235.154.233
X-Mailman-Approved-At: Fri, 20 Oct 2017 21:46:22 -0400
Subject: [Qemu-trivial] [PATCH] Update Paul Burton's email address
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Oct 2017 23:21:54 -0000

From: Paul Burton <paul.burton@imgtec.com>

Update my email address from paul.burton@imgtec.com to
paul.burton@mips.com, since MIPS will soon no longer be a part of
Imagination Technologies & as such the @imgtec.com address will soon
cease to function.

A mapping is added in .mailmap such that git reports the new @mips.com
address, and get_maintainer.pl in turn reports it when examining git
history. Whilst here add a mapping for my also-defunct
paul@archlinuxmips.org email address too.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Michael Tokarev <mjt@tls.msk.ru>
Cc: Yongbok Kim <yongbok.kim@imgtec.com>
Cc: Yongbok Kim <yongbok.kim@mips.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
---
 .mailmap    | 2 ++
 MAINTAINERS | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 28defa1b2c..dda7e3fa5f 100644
--- a/.mailmap
+++ b/.mailmap
@@ -10,6 +10,8 @@ Edgar E. Iglesias <edgar.iglesias@gmail.com> edgar_igl <edgar_igl@c046a42c-6fe2-
 Fabrice Bellard <fabrice@bellard.org> bellard <bellard@c046a42c-6fe2-441c-8c8c-71466251a162>
 Jocelyn Mayer <l_indien@magic.fr> j_mayer <j_mayer@c046a42c-6fe2-441c-8c8c-71466251a162>
 Paul Brook <paul@codesourcery.com> pbrook <pbrook@c046a42c-6fe2-441c-8c8c-71466251a162>
+Paul Burton <paul.burton@mips.com> <paul.burton@imgtec.com>
+Paul Burton <paul.burton@mips.com> <paul@archlinuxmips.org>
 Thiemo Seufer <ths@networkno.de> ths <ths@c046a42c-6fe2-441c-8c8c-71466251a162>
 malc <av1474@comtv.ru> malc <malc@c046a42c-6fe2-441c-8c8c-71466251a162>
 # There is also a:
diff --git a/MAINTAINERS b/MAINTAINERS
index 12175425a7..0a400c57c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -642,7 +642,7 @@ S: Odd Fixes
 F: hw/mips/mips_fulong2e.c
 
 Boston
-M: Paul Burton <paul.burton@imgtec.com>
+M: Paul Burton <paul.burton@mips.com>
 S: Maintained
 F: hw/core/loader-fit.c
 F: hw/mips/boston.c
-- 
2.14.2


