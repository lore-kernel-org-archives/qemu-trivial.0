Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmOM-0007TL-Sd
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:04:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmOK-0007RR-Qa
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:04:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmOG-0006wt-SW
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:04:20 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:53459)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmOG-0006w5-Fr; Tue, 11 Dec 2018 13:04:16 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MvsyF-1hLRdB2xnD-00stx4; Tue, 11 Dec 2018 19:04:06 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Date: Tue, 11 Dec 2018 19:03:29 +0100
Message-Id: <20181211180352.19644-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pPAph6NW+a/KlKIlzraVwsFkptN0vrBxUkYqsrH9qZ4gG0/jj5m
	22p9HTGI/ytG2tZaEF8+E/fN164wslHcJpo/owhBHwlXg3eVQkoR8Xx3+3w8uorrKq5Z/nY
	loCzsyiqhuCeeKR0Fid5DawQEZbhQCnrjWeSpksRLxkz0xIZXtdAU1lXKHYpwW5xGxW0yl1
	bUA1wbIfvAbei1oMFZ8QQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3QbK7vwcThs=:rqMjZLORT7VW4gozCRrNiJ
	4sqht8wer4YcN+AHg90drM8rcglKjtnZ8FXFCO6XLo4RmYa5+h6u4e0czNfbULeBGKP8HiC05
	0oGJd3ralWGTQy6MbTE0kBoZhbLmBC5ZVMFhHk0sQXgtvfWhUA6vGnOc3s3kvIYS28cjJ2ZnB
	ZlpjZb2tTt3UyxCwueFkOU6AjURjakkJVrw1woymAKK25cuSL5uOzC6aLnJKtSzXdVKpnmFI3
	6mv9Dx9hctKaw04VbZu9idouKgUCL8OshVzvaw8KTDVb43MmcKRbdDUYhSfBx6TwEOwIqb4bA
	VeJNrScOt1YDp3eLU4FyPwq6oMVAHYbrmRYu17V5KZ3wMuDkrBhZvmcW2bEb4PHY40I1h8xKc
	ZeZxIQShJkSHneYDDkbv1bT8lrGHTpEWDXgnpz62/4QIkkM/z96ODpk4lBSsSAtxv6poU1mkh
	n4+aMJCK9K2AtOHtl/WCxrMh4y4QNdE27FxJm+NxjsB+/ZthRAa4oMmwxiYGDnB3dChkijzNh
	tdBPbi84oA5TRGV6cOMoj3P9nSPy9UgS4JO7KTdA0uPeNYhWZIm5KCwKJcnzOvPgHoUjDp4bV
	YjNBvgkobx7fneP7yAYQcK2fO6vwsaBS0kmv2QuGdjJubsRjkv7556gKoJZ48MMOLdlstbBim
	gWoUiM1qxg7Ru1qX1A4/DX/D8TgP7cW5XxlI48nLXBrkSF93kRuvqQ3uCso0DOZoKnLec8geJ
	XZQkhdv+kSOz+ZyyHRi7wlHNi9rJY5MHDD6NNw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-trivial] [PULL 07/30] MAINTAINERS: Add missing hw/pci-host
 entries
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
X-List-Received-Date: Tue, 11 Dec 2018 18:04:21 -0000

From: Thomas Huth <thuth@redhat.com>

Bonito belongs to Fulong-2E, Sabre belongs to Sun4u, and Mac-Newworld
and Mips-Boston were missing the header files.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Acked-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <1542891760-13937-1-git-send-email-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 63effdc473..059c775a06 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -885,7 +885,7 @@ R: Stefan Markovic <smarkovic@wavecomp.com>
 S: Odd Fixes
 F: hw/mips/mips_fulong2e.c
 F: hw/isa/vt82c686.c
-
+F: hw/pci-host/bonito.c
 F: include/hw/isa/vt82c686.h
 
 Boston
@@ -895,6 +895,7 @@ S: Maintained
 F: hw/core/loader-fit.c
 F: hw/mips/boston.c
 F: hw/pci-host/xilinx-pcie.c
+F: include/hw/pci-host/xilinx-pcie.h
 
 OpenRISC Machines
 -----------------
@@ -947,6 +948,7 @@ F: hw/nvram/mac_nvram.c
 F: include/hw/misc/macio/
 F: include/hw/misc/mos6522.h
 F: include/hw/ppc/mac_dbdma.h
+F: include/hw/pci-host/uninorth.h
 
 Old World
 M: David Gibson <david@gibson.dropbear.id.au>
@@ -1038,6 +1040,8 @@ M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
 S: Maintained
 F: hw/sparc64/sun4u.c
 F: pc-bios/openbios-sparc64
+F: hw/pci-host/sabre.c
+F: include/hw/pci-host/sabre.h
 
 Sun4v
 M: Artyom Tarasenko <atar4qemu@gmail.com>
-- 
2.19.2


