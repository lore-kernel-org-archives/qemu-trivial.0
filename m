Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grtF5-00074x-N3
	for mharc-qemu-trivial@gnu.org; Thu, 07 Feb 2019 18:38:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41921)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1grtF4-00074r-4m
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 18:38:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <n54@gmx.com>) id 1grtF2-0004PN-FT
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 18:38:02 -0500
Received: from mout.gmx.net ([212.227.17.22]:60497)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1grtF1-0004Oj-Mq; Thu, 07 Feb 2019 18:37:59 -0500
Received: from localhost.localdomain ([89.71.135.231]) by mail.gmx.com
	(mrgmx103 [212.227.17.174]) with ESMTPSA (Nemesis) id
	0M7Y9j-1h4dAc1qP1-00xIks; Fri, 08 Feb 2019 00:37:45 +0100
From: Kamil Rytarowski <n54@gmx.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, yu.ning@intel.com,
	asanchez@kryptoslogic.com, pbonzini@redhat.com,
	Kamil Rytarowski <n54@gmx.com>
Date: Fri,  8 Feb 2019 00:37:04 +0100
Message-Id: <20190207233704.29978-1-n54@gmx.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:u4/XddqsPBpzhxSklkIvcmHPNs+8PNJ55ScLQc6Nbk4Wze834hJ
	Tr2MTCKuds+/Fhl02qSJrv+t5RC4H1T1EUcdqi11OJhzhpLlNhaAUzV1A/gcEYYXqR3LgJp
	Sk7oriKNVHY6Eia+poS0pW04CgzjtVHfYpRYuYNFm6GuXXB9fAY+hjeuY3eKhD8aVjEZwQJ
	vyKB6YnvY7JrdCc/ZmLoA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:obsfOKjzCoI=:TW1gqegAYUgxGIdejSagAx
	nAcbbhrcySuVppKoAjQi44HmhmpYzKHI4QBQoPhsKFbLr21dsBGtwBK6uNpAKCMfWiuDocKk/
	GtXmiDvFn/L68ivqAZJhXlIgqUxkTeml9M12nU+92BEqU7bEx7Jpmkgss8bgJ/9UuXQNG4IRk
	dYCW77tR+mBOY+nBsYZuXkkrGdyisQYJI/ckC98rZ8yEOlSCjG6CaFfQKo45DzlQcGvlIZcI6
	NWNbLfQ9ULSoXVr8896XEsmO3F9KQM/GrPccVd/b7en6qGjKvJyBU1V43e0GabFQaj81Wa/NM
	Fgjm3+b7jpF3CV87+zZTDxkcR12X7V0hNBbBE7CEGJ/XBHgN7dS7JI0MO2pkFozZArXC05vSz
	EOSFyXSWBX89Y7bESNrj3W9J8QGMh/39XFLZP8l1Sl1qdqCWlns+649eTq6vtZLO0iAVFniEK
	inu8vPZqGAg7iKdJq8/rBTvtwIK5QoGVRmMbh13Xayr6Hwu5c4J4+fC/AgIBZq1ccz5F5qiOK
	a67aT1IiDkjeAJYx4y9PARxx/AV7I3pjvPNztxHLM3tBXUJFsEY7WBYEkZpPov7KvKHwM1cbu
	FngRd9aD4Ek6xLGs53as2qBCFZFgH2Bz30S2SEnDcvFXVTyTnuDICJ1hIBwADBAeQEUB4Hsp2
	rFmNV2/IgUazV5ygzIa+zK/cbiiACEmn+z2xR9hzakdBTShfEQPe+Ax/qcJx2i5L9pwSNPNaz
	ZX1B0UxW3qwBCbQna7aHr+62Ivj8HvAMBfVzS+mVrL2PdF9u7O7pEKsjtZecblcW3O3/WDxiF
	C54mT1ftA6AtCDao/d9XVO2RLAAPci40t9EQSaRpin8QcPMxRBZ5ubVzkFOX6umK0bLVVzJ9q
	VDDPgyTLcoUplmTAXdCCvMZ8I2MhW7Wfb8iDvpVkA=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.22
Subject: [Qemu-trivial] [PATCH] configure: Add HAX support in NetBSD
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
X-List-Received-Date: Thu, 07 Feb 2019 23:38:02 -0000

The NetBSD support in Intel HAXM has beem merged upstream and is functional.

Signed-off-by: Kamil Rytarowski <n54@gmx.com>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index b18281c61f..89b889072d 100755
--- a/configure
+++ b/configure
@@ -819,6 +819,7 @@ DragonFly)
 ;;
 NetBSD)
   bsd="yes"
+  hax="yes"
   make="${MAKE-gmake}"
   audio_drv_list="oss try-sdl"
   audio_possible_drivers="oss sdl"
-- 
2.20.1


