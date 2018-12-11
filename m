Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmPP-0008Vw-AG
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:05:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPJ-0008Io-Gw
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPC-0007YK-L0
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:21 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:52587)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmPB-0007Kh-Mg; Tue, 11 Dec 2018 13:05:14 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MkEdF-1hC7gy32a1-00kgSK; Tue, 11 Dec 2018 19:04:13 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue, 11 Dec 2018 19:03:37 +0100
Message-Id: <20181211180352.19644-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hiHcApws9IzJffoc1pxRRinoaudMfsfhW1t3ywAJFrHOA8nGEP4
	MxWaKdVhXX75qyjnEOYobXKqbDk+o/RKm3LudHDbS18t5X2xRAzz5g3V9mvgD6gT+A3e4wg
	UYHto1e7ma88KE5F2jW/jJIETx78rALC52fJU9q12sirw5bR17EndpRgQu5lniCA9s68q1V
	c5Bmj8t+/RfmksgCpJ0HQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YYY+XjN/npc=:8AKBQdQhynhRxe1WbMF/mG
	xIPg/J9yJATsNmbGW5TAKKDkv4Wull3vz6lPFMqedL9MVMNcx68TDSZeYeuLQtsKuktm5gbR7
	xSUaoCd01PfZCBtUqQpDS9C+YKLCxqTF5I5yVg6j59mXGPjS9mL1h79ieSu3601Mkcd/r0sLl
	/EJeoTHmFojTeHMTgPft/sCBC82Anuhs9kb2p8Pk1pUxCgxKWYIuvnLO/14G5MJ6I5k2PFIN5
	CJagPDecJehjlIE9YJ+m0KR6IGYDF8YBRWBbJJ5iDHyM0GaEAcwPKZ9KJg45gB31bonf+cv+2
	7BndSeUHHz9JoOSz5dzF3m3JD6D8V7nF71HgjSguW0FWjpkTnD1SRdJqILBtaaZL2LK0vVsTN
	pApH0h6M3ZXXtZazMLtrHtvDjFJRZCTaD6C+a0z+xk3tMJfr60qMSS5g2bKh/zCdE/rGk0u1l
	3WTm0H3QWUrJmBnT/x5aBsgYKE6T4R8kg9BYi0Emg1KTcz1+QNjXeEPbNGIMiMapdC+fxmYvE
	kCf1mdkpXj/yCbbFPFax9fKcxqe3DRkuBOAY/lMzLdznfmc6MMnVfefBqfJKj6nIkxWLYgKZR
	2oZENPPMr/TgqEAQCezL4UOnBOnShopl6cFtA4YNIMJ7m3Ys0S/ppOsgWMJi0efM/31ltc3p1
	VKeJWw6mWxMNy0REHDHpmOd7NWg6ljTQb1JO1aPyR1rfQdZPQz6Ho95j1Kmh1o/yQm+r8vNam
	dP75ufJdRb7YZZAs4SfZqEF52eGsAJ7nvV+/l7JN91dzliZ/tdukU2NEvnI=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-trivial] [PULL 15/30] MAINTAINERS: Add a missing entry for
 the Old World machines
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
X-List-Received-Date: Tue, 11 Dec 2018 18:05:23 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20181125205000.10324-9-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4b66aca933..581832b257 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -967,6 +967,7 @@ F: hw/ppc/mac_oldworld.c
 F: hw/pci-host/grackle.c
 F: hw/misc/macio/
 F: hw/intc/heathrow_pic.c
+F: include/hw/intc/heathrow_pic.h
 
 PReP
 M: Hervé Poussineau <hpoussin@reactos.org>
-- 
2.19.2


