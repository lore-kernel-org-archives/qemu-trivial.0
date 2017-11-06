Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eBkZ4-00012L-Re
	for mharc-qemu-trivial@gnu.org; Mon, 06 Nov 2017 11:47:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Yongbok.Kim@mips.com>) id 1eBjzU-00010j-2w
	for qemu-trivial@nongnu.org; Mon, 06 Nov 2017 11:11:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Yongbok.Kim@mips.com>) id 1eBjzP-00049I-Vd
	for qemu-trivial@nongnu.org; Mon, 06 Nov 2017 11:11:12 -0500
Received: from 19pmail.ess.barracuda.com ([64.235.150.244]:58893)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Yongbok.Kim@mips.com>)
	id 1eBjzP-00047k-Ol; Mon, 06 Nov 2017 11:11:07 -0500
Received: from MIPSMAIL01.mipstec.com (mailrelay.mips.com [12.201.5.28]) by
	mx2.ess.sfj.cudaops.com (version=TLSv1.2
	cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
	Mon, 06 Nov 2017 16:10:46 +0000
Received: from ubuntu1404.mipstec.com (192.168.40.32) by
	MIPSMAIL01.mipstec.com (10.20.43.31) with Microsoft SMTP Server (TLS)
	id 14.3.361.1; Mon, 6 Nov 2017 08:08:42 -0800
From: Yongbok Kim <yongbok.kim@mips.com>
To: <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Paul Burton
	<paul.burton@imgtec.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Tokarev <mjt@tls.msk.ru>, Yongbok Kim <yongbok.kim@imgtec.com>,
	<qemu-trivial@nongnu.org>
Date: Mon, 6 Nov 2017 16:07:44 +0000
Message-ID: <20171106160744.14399-4-yongbok.kim@mips.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171106160744.14399-1-yongbok.kim@mips.com>
References: <20171106160744.14399-1-yongbok.kim@mips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [192.168.40.32]
X-BESS-ID: 1509984634-298553-1542-293672-6
X-BESS-VER: 2017.12-r1710252241
X-BESS-Apparent-Source-IP: 12.201.5.28
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.186636
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MAILTO_TO_SPAM_ADDR    META: Includes a link 
	to a likely spammer email 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS59374 scores of
	KILL_LEVEL=7.0 tests=MAILTO_TO_SPAM_ADDR, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 64.235.150.244
X-Mailman-Approved-At: Mon, 06 Nov 2017 11:47:57 -0500
Subject: [Qemu-trivial] [PULL v2 3/3] MAINTAINERS: Update Paul Burton's
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
X-List-Received-Date: Mon, 06 Nov 2017 16:11:13 -0000

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
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
[Yongbok Kim:
  Updated message subject]
Signed-off-by: Yongbok Kim <yongbok.kim@imgtec.com>
---
 .mailmap    | 2 ++
 MAINTAINERS | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 5aec1bd..ee81ac8 100644
--- a/.mailmap
+++ b/.mailmap
@@ -11,6 +11,8 @@ Fabrice Bellard <fabrice@bellard.org> bellard <bellard@c0=
46a42c-6fe2-441c-8c8c-7
 James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
 Jocelyn Mayer <l_indien@magic.fr> j_mayer <j_mayer@c046a42c-6fe2-441c-8c8c=
-71466251a162>
 Paul Brook <paul@codesourcery.com> pbrook <pbrook@c046a42c-6fe2-441c-8c8c-=
71466251a162>
+Paul Burton <paul.burton@mips.com> <paul.burton@imgtec.com>
+Paul Burton <paul.burton@mips.com> <paul@archlinuxmips.org>
 Thiemo Seufer <ths@networkno.de> ths <ths@c046a42c-6fe2-441c-8c8c-71466251=
a162>
 malc <av1474@comtv.ru> malc <malc@c046a42c-6fe2-441c-8c8c-71466251a162>
 # There is also a:
diff --git a/MAINTAINERS b/MAINTAINERS
index abbf2b4..0cd4d02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -642,7 +642,7 @@ S: Odd Fixes
 F: hw/mips/mips_fulong2e.c
=20
 Boston
-M: Paul Burton <paul.burton@imgtec.com>
+M: Paul Burton <paul.burton@mips.com>
 S: Maintained
 F: hw/core/loader-fit.c
 F: hw/mips/boston.c
--=20
2.4.5


