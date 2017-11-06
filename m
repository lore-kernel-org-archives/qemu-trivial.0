Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eBkZ5-00012b-0f
	for mharc-qemu-trivial@gnu.org; Mon, 06 Nov 2017 11:47:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Yongbok.Kim@mips.com>) id 1eBjzU-00011E-Is
	for qemu-trivial@nongnu.org; Mon, 06 Nov 2017 11:11:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Yongbok.Kim@mips.com>) id 1eBjzQ-00049z-Vc
	for qemu-trivial@nongnu.org; Mon, 06 Nov 2017 11:11:12 -0500
Received: from 19pmail.ess.barracuda.com ([64.235.154.231]:40800)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Yongbok.Kim@mips.com>)
	id 1eBjzQ-00047V-Lo; Mon, 06 Nov 2017 11:11:08 -0500
Received: from MIPSMAIL01.mipstec.com (mailrelay.mips.com [12.201.5.28]) by
	mx1411.ess.rzc.cudaops.com (version=TLSv1.2
	cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
	Mon, 06 Nov 2017 16:10:43 +0000
Received: from ubuntu1404.mipstec.com (192.168.40.32) by
	MIPSMAIL01.mipstec.com (10.20.43.31) with Microsoft SMTP Server (TLS)
	id 14.3.361.1; Mon, 6 Nov 2017 08:08:07 -0800
From: Yongbok Kim <yongbok.kim@mips.com>
To: <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, James Hogan
	<james.hogan@imgtec.com>, Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier
	<laurent@vivier.eu>, <qemu-trivial@nongnu.org>, Yongbok Kim
	<yongbok.kim@imgtec.com>
Date: Mon, 6 Nov 2017 16:07:43 +0000
Message-ID: <20171106160744.14399-3-yongbok.kim@mips.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171106160744.14399-1-yongbok.kim@mips.com>
References: <20171106160744.14399-1-yongbok.kim@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.40.32]
X-BESS-ID: 1509984637-452059-3076-940420-7
X-BESS-VER: 2017.12.1-r1710261623
X-BESS-Apparent-Source-IP: 12.201.5.28
X-BESS-Outbound-Spam-Score: 0.20
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.186636
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
X-Received-From: 64.235.154.231
X-Mailman-Approved-At: Mon, 06 Nov 2017 11:47:57 -0500
Subject: [Qemu-trivial] [PULL v2 2/3] MAINTAINERS: Update James Hogan's
 email address
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
X-List-Received-Date: Mon, 06 Nov 2017 16:11:18 -0000

From: James Hogan <james.hogan@imgtec.com>

Update my imgtec.com email address to my kernel.org one in MAINTAINERS
as MIPS will soon no longer be part of Imagination Technologies, and add
a mapping in .mailcap so get_maintainer.pl reports the right address.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
[Yongbok Kim:
  Updated message subject]
Signed-off-by: Yongbok Kim <yongbok.kim@imgtec.com>
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 28defa1..5aec1bd 100644
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
index 44aa71e..abbf2b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -285,7 +285,7 @@ S: Maintained
 F: target/arm/kvm.c
 
 MIPS
-M: James Hogan <james.hogan@imgtec.com>
+M: James Hogan <jhogan@kernel.org>
 S: Maintained
 F: target/mips/kvm.c
 
-- 
2.4.5


