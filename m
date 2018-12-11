Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmPN-0008Ry-1e
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:05:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPG-0008Ej-3e
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPC-0007XC-EH
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:17 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:34431)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmPA-0007Lp-UK; Tue, 11 Dec 2018 13:05:13 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N1cvQ-1hTvYg3Qls-011wMH; Tue, 11 Dec 2018 19:04:11 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue, 11 Dec 2018 19:03:34 +0100
Message-Id: <20181211180352.19644-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lNmTKr2ywOE1cNIJNjEy7hoWTYHX7lbDJsa0gfS95olnqJyILuB
	nQ117yHwTSkIBbkgbz8C73oCfSm5sTzd6AfC+yJYFbIOxXZR06ICfQWxJxeYyFzJG0IHhuR
	y/01HdbFzQ5C1vF70BLSYPBBEj5NkOLnxDmTwTzCkXgPAu9DTIoDfkiL3KnTdzADbl/bUql
	JJ4YtdWbQ9M1UjyXUzwAg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aMfdCdaoduo=:XtIt5uJxuzVGkQh1nF3VaM
	mJ2B/IBytXlRKdYFWdt4fB9Ui4bUOF/exRa7D50QrYNKoi9u9Y1XnkIloxT7c+ANqkKiPrOjq
	zgnZNYdwVZyTa91oI5uiYwxEZ7XmzTd2uEswYQ3B2CAdtw8iOlBQjkR4K1t4Arsfn1NSsgE0z
	Ht8mHzSLneo7PFt+DpKpzZoD0D7m/c4z5FM+pMSG7wKhxKIxY4AXSZtuqjQyPZmFUSRAr3SZe
	cPKWu6N85dUdu8zUZGIBu93hcpRFjIBLzVxYoeFBozRaQ1sjhHSZqj7zGoc42EAVw0IWRX+0M
	QBWqoWjjuVL3h2Dxe/CnKdEw+J5w/B5cLo85Du17t/lqL0rTR5+RKQZv08wt/+B1aNpkewmpc
	jaBGlkUMZ72GJCazON0FvJjgKusRTXtC/WdWBwRIgKNVW5jBIct0t95B/xVNdPQLjYF5ifMDO
	yKV8ZTZsfAa5wLDdApI0TXn+G3PRhqK7YB2DpYnjiBELYTAq2bCKD7GAn72r12fNPON8V+DSN
	J5wL0/zgxF9aMJPxLeBiEyPyCFocjcTT5Nd6JCJ3bKn92WSD5et3P3uAH5coEI9muMO4Lv5RD
	QJpzt0j3QkNLtFVkcG4kgGZiSjGzBXf9+KliCdGlG3+h7YRnn3+kOsgqC74zqKOlIDXLSuEJ4
	R4R/R5pLRzqBy1ZJxWbtNcN/w3+8XSDbsamK9MV59eh2JK60DFUsXX6R01KUD1+WI5sBagRFJ
	cxs/2aVQEdSLWgYyyXOsq5ibFFIdIm4jz2KmBszOqSBvjlDRyxcwxBgPIw8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL 12/30] MAINTAINERS: Add missing entries for
 the Xilinx ZynqMP machine
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
X-List-Received-Date: Tue, 11 Dec 2018 18:05:24 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20181125205000.10324-5-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index edc88164c3..b32cd139a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -741,6 +741,9 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/xlnx*.c
 F: include/hw/*/xlnx*.h
+F: include/hw/ssi/xilinx_spips.h
+F: hw/display/dpcd.c
+F: include/hw/display/dpcd.h
 
 ARM ACPI Subsystem
 M: Shannon Zhao <shannon.zhaosl@gmail.com>
-- 
2.19.2


