Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1doYHq-0000aY-Uy
	for mharc-qemu-trivial@gnu.org; Sun, 03 Sep 2017 13:02:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46385)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1doYHl-0000YO-6M
	for qemu-trivial@nongnu.org; Sun, 03 Sep 2017 13:02:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <n54@gmx.com>) id 1doYHg-0004g2-MU
	for qemu-trivial@nongnu.org; Sun, 03 Sep 2017 13:02:13 -0400
Received: from mout.gmx.net ([212.227.15.15]:56326)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1doYHX-0004X3-8z; Sun, 03 Sep 2017 13:01:59 -0400
Received: from localhost.localdomain ([185.58.161.191]) by mail.gmx.com
	(mrgmx003 [212.227.17.184]) with ESMTPSA (Nemesis) id
	0M2tXS-1dWbgo1rzq-00sfaG; Sun, 03 Sep 2017 19:01:56 +0200
From: Kamil Rytarowski <n54@gmx.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,
	Kamil Rytarowski <n54@gmx.com>
Date: Sun,  3 Sep 2017 18:49:52 +0200
Message-Id: <20170903164952.26760-1-n54@gmx.com>
X-Mailer: git-send-email 2.14.1
X-Provags-ID: V03:K0:dsCmaTiXmzZ/F9py7Pez5QNiSTFT8NaJe2Kroer/2nxoFiDJ4TT
	dpx6BfYvohtJKtS/JMZwSbS4alBuPOeiAGVzcx/h5+f086B/ymcGL/1DJB+zdI+S3olKVJB
	neHNm4qahIT41BM4lK42/ZkC3A2urQD1bdDpItNfEG0G93nW4zSKdNAKiGZ3v8l0VdWPnNC
	bHD83x59Ude7pFONFI8yA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:CE7nO2cOp1M=:Pk3hECPFTzoIMAeX/F8Hum
	KoICi3eit/DAIA7o/XpjQhBBL5GjB21v8AU0EUWQiFYDtCdmWWLU3FpCnV9319uW+fHAi6ZN+
	Iy9DI7odqyszZWjUQZpF5DzpkBVW7po+8IWnvkhIwhE9IBJei2mSjYytMKkcFK3WEejLx8S6c
	ARypogcwnFaM+CA1XXZx3RRx+Ipo2l71xSnn7YGwIR+7HX56gsXy4X+XcBjK+MXx1zW2x3ZnX
	i3a0OdNj/Ykm9ALX6ZREFT35iqkAcSQtNFKLwKjn9A8nLjGnyYTkBen1DSSiE8H2Q15S9XYyh
	AyDPEq2jEN9rj9UVhSbTzzlbqJ7oF/Fe1kTvbeD6PtbXBNGym1BuLkyteYX2yXzp+j7Hfd8F8
	UESyfwcKdS5/a9JZRiNNkmPM/Kk3pvLZWl6262VBkEe9klvPzKj+vaKFdZgd+FEObl/Rl3aTs
	l9B5VJ8sGRRjoKDbunxPqLFSTJD5UhQvO3P/Rrj3Hs8vrHb0Kbawni+MdBv2UVPYx1VYEcQBs
	Q8/hIFuK/MPYxttKISa4MTmQ6cxaObNpP2JRQJQErhfcNQwLrGHxrzKH2Naf7WNuYP+KrjLt3
	Nno3QzFwSUKfNKz1rfq00tVwrS22bFUsWU6Cn7w3BQCfEFMXi9xMw1mRHHMnriOzgG8LJU1JC
	IeLFkGbgJsdGT2+unQXYhhvdqNfeYb9/6sc9e+u6SAMlyg1Uc5E6uFLiMXxMHbi2qbxLFJWC6
	8eeVOzhlW03sgyesN1QLQ50LhBCphtk/3M/IPPfwv/8MWNrEO5BnnSUOkuUCW7TcKH21iRdly
	/krCwoiUBqkZDsaFHiw99UOSTvQ1g==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.15.15
Subject: [Qemu-trivial] [PATCH] tests: Do not include lutil on SunOS
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
X-List-Received-Date: Sun, 03 Sep 2017 17:02:18 -0000

This fixes build on SmartOS (Joyent).

Patch cherry-picked from pkgsrc by jperkin (Joyent).

Signed-off-by: Kamil Rytarowski <n54@gmx.com>
---
 tests/Makefile.include | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index f08b7418f0..0e5e6cb9b8 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -810,8 +810,10 @@ tests/migration/initrd-stress.img: tests/migration/stress$(EXESUF)
 	rmdir $(INITRD_WORK_DIR)
 
 ifeq ($(CONFIG_POSIX),y)
+ifneq ($(CONFIG_SOLARIS),y)
 LIBS += -lutil
 endif
+endif
 
 # QTest rules
 
-- 
2.14.1


