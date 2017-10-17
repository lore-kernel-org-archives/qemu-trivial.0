Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4SMC-0007lI-9I
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 09:56:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <James.Hogan@mips.com>) id 1e4RlH-0002E6-OX
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 09:18:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <James.Hogan@mips.com>) id 1e4RlD-0002Pa-KH
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 09:18:23 -0400
Received: from 20pmail.ess.barracuda.com ([64.235.150.246]:43752)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <James.Hogan@mips.com>)
	id 1e4RlD-0002Ot-Ec; Tue, 17 Oct 2017 09:18:19 -0400
Received: from MIPSMAIL01.mipstec.com (mailrelay.mips.com [12.201.5.28]) by
	mx28.ess.sfj.cudaops.com (version=TLSv1.2
	cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
	Tue, 17 Oct 2017 13:18:02 +0000
Received: from jhogan-linux.mipstec.com (192.168.154.110) by
	MIPSMAIL01.mipstec.com (10.20.43.31) with Microsoft SMTP Server (TLS)
	id 14.3.361.1; Tue, 17 Oct 2017 06:17:09 -0700
From: James Hogan <james.hogan@mips.com>
To: <qemu-devel@nongnu.org>
CC: James Hogan <james.hogan@mips.com>, James Hogan <jhogan@kernel.org>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	<qemu-trivial@nongnu.org>
Date: Tue, 17 Oct 2017 14:17:08 +0100
Message-ID: <20171017131708.1892-1-james.hogan@mips.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.154.110]
X-BESS-ID: 1508246279-637138-905-421345-11
X-BESS-VER: 2017.12-r1710102214
X-BESS-Apparent-Source-IP: 12.201.5.28
X-BESS-Outbound-Spam-Score: 0.20
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.186054
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.20 BSF_SC7_SA298e         META: Custom Rule SA298e 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.20 using account:ESS59374 scores of
	KILL_LEVEL=7.0 tests=BSF_SC7_SA298e, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 64.235.150.246
X-Mailman-Approved-At: Tue, 17 Oct 2017 09:56:31 -0400
Subject: [Qemu-trivial] [PATCH] Update James Hogan's email address
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
X-List-Received-Date: Tue, 17 Oct 2017 13:18:27 -0000

From: James Hogan <jhogan@kernel.org>

Update my imgtec.com email address to my kernel.org one in MAINTAINERS
as MIPS will soon no longer be part of Imagination Technologies, and add
a mapping in .mailcap so get_maintainer.pl reports the right address.

Signed-off-by: James Hogan <jhogan@kernel.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 28defa1b2c57..5aec1bdf9f7d 100644
--- a/.mailmap
+++ b/.mailmap
@@ -8,6 +8,7 @@ Aurelien Jarno <aurelien@aurel32.net> aurel32 <aurel32@c046a42c-6fe2-441c-8c8c-7
 Blue Swirl <blauwirbel@gmail.com> blueswir1 <blueswir1@c046a42c-6fe2-441c-8c8c-71466251a162>
 Edgar E. Iglesias <edgar.iglesias@gmail.com> edgar_igl <edgar_igl@c046a42c-6fe2-441c-8c8c-71466251a162>
 Fabrice Bellard <fabrice@bellard.org> bellard <bellard@c046a42c-6fe2-441c-8c8c-71466251a162>
+James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
 Jocelyn Mayer <l_indien@magic.fr> j_mayer <j_mayer@c046a42c-6fe2-441c-8c8c-71466251a162>
 Paul Brook <paul@codesourcery.com> pbrook <pbrook@c046a42c-6fe2-441c-8c8c-71466251a162>
 Thiemo Seufer <ths@networkno.de> ths <ths@c046a42c-6fe2-441c-8c8c-71466251a162>
diff --git a/MAINTAINERS b/MAINTAINERS
index 9522d1b621bd..b01f5c46ef83 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -284,7 +284,7 @@ S: Maintained
 F: target/arm/kvm.c
 
 MIPS
-M: James Hogan <james.hogan@imgtec.com>
+M: James Hogan <jhogan@kernel.org>
 S: Maintained
 F: target/mips/kvm.c
 
-- 
2.14.1


