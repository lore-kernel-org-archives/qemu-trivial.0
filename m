Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmPH-0008G4-6r
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:05:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPC-0008DR-Fk
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPA-0007Vv-QZ
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:13 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:52739)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmP9-0007SQ-KQ; Tue, 11 Dec 2018 13:05:12 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MKuGD-1gkiuP1gRZ-00LD5k; Tue, 11 Dec 2018 19:04:20 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue, 11 Dec 2018 19:03:45 +0100
Message-Id: <20181211180352.19644-24-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:G1+Vm/+gWlFUogaEfEOlOXJUyLHwG48/g1oj+ZxrPt/Xo6ALSDp
	OZWgjVY8TWBrLhblZcpdxSTqhxr5HO3r2wqpjLccxLmSIYkVKFc/lAxLzK4g2Jb5d2HOMRk
	8USOWTAr5qBikLbpeZg+xbSEnjQR5UH5scaS4RNbS6wZwbFBHWdsq52lfGupPL4nZDkR8BN
	kSc9yWT3AnOBhGmtCUsgw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:E1aSTwYlzms=:+u9jXyTrzvkDC3h3u+jryd
	bSdcK88XuMo29HAM5/maH3+lphCRYpXSxKFoxKZp64YneULJMsKXs1FRJ9dZzct84QVb40M5a
	hunrZ7Ma4fToEpbvkyikwerp9Oulq/wjxCCrDRuJfjfEDWSYhloW9R4HXQsaYipa3FwIb1223
	A4yFhEuF4HJJrlhRsDrbFJUTXIIB1t+NfpSk7oHgmC30acukUZuNwtjGGmQ7nlYOgQiKbRvh7
	eIhNQAPAfTcvg58waqTIkyCwlZRjzcIiCHhLZxIROyfKAbOm/FQ6CTO6mR7WK0KlDbzaVSi0x
	Rjx8zmpAltN/Zdg84vQ1i49J54JamzbIa3V8YUoUNr+I45+8RzfkEglwrfacW/+/J/+N127ia
	Go5arNe9qTajHvU7u+g4EmD2+mHlRwgwZ2RytcMs9WuDP3MRQNuQWBg3D8HpkEw92TMo8xuim
	lY0WrsbrUMY0uaSo+4t8Fvva/wdCaW4q/yS2WorMfrJPQc6KbEx+gigbtMiBDkPfjYjujqbdU
	HE9nCn5a86BKTrFZWCCX6qOT8Jro62/JnhHDSQ3+UK/bKq0kx9Y6gx9a36yJ7M0093hhTtjKJ
	uWgXFunmE1uVan2+fInxbWbsztZ0kMiUYd0SINwFJchpwPFmEnL+oixC7CmTbcDg2jlznj6TS
	XCE+dB+354QZi6lffX5UdOm2xQ0li66kt6lFNrjJAdluqvip+inkazRyMpQK0tAe33CeRlSEz
	VdEM/+VemKXKhQdxhbXpz9msqaJ0j1LZUBAR0t94PvhLx7JKDjKKXKsh6O4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: [Qemu-trivial] [PULL 23/30] MAINTAINERS: Add a missing entry for
 the NVDIMM device
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
X-List-Received-Date: Tue, 11 Dec 2018 18:05:18 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20181125205000.10324-22-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4251c5edd3..84e248c013 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1498,6 +1498,7 @@ S: Maintained
 F: hw/acpi/nvdimm.c
 F: hw/mem/nvdimm.c
 F: include/hw/mem/nvdimm.h
+F: docs/nvdimm.txt
 
 e1000x
 M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
-- 
2.19.2


