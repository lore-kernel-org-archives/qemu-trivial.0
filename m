Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmOX-0007eB-6s
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:04:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmOS-0007ZE-IM
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:04:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmOR-00074E-OA
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:04:28 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:58687)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmOO-00071H-EQ; Tue, 11 Dec 2018 13:04:24 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1M7ehh-1gXZjS2jtd-00863E; Tue, 11 Dec 2018 19:04:11 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue, 11 Dec 2018 19:03:35 +0100
Message-Id: <20181211180352.19644-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lvD+MeUZfC+MeHDxIHnfke6StyDByBJVwC8reP2nbmXefVFk8po
	KR3LY/vVFf/MU+nu+o0X3Nm7EB/LTT8OxxSEhGVUU9ypZZ/pNIiHFT1QszvPsAjsgbYz1Ll
	rxLeFi0S+q2E/el2JF+bGVu42vtrL4R1h75uC276ZKcdlDsDihS47JZ5eCjfiD318eDXrBJ
	lNV36SWPIVqa8t1T22XVg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:b5YZ99VioFc=:WLjwB7BNLFa15GVVW5UoMV
	IMsYlPOW4cK2Bb1S0x5TQsFf0XcGwr/dwCEzQCI8+Z7itXNWoNRbaAw5PcO9RPvY1vIPio+bR
	n5v5b3TVF64BqK0rz7IENfypQiQn1Zq4utl1cAGRA0+o2TdZcJu2dHkq47fMCSsTJsD7/dp7d
	JihMvq3sbHX6v5+jgM5KkxXuN/59UgwIRA0jr4YEbaXC5soeWsF1YppLHkyVV1/HqVPGv9TZJ
	f5niaD0trLw/wtkEu+vOxbtTjAo6+FNNQ5HPat7AOUikCGrxJorbDYwobVF1x1FnO++ptFjjW
	t5TumVYGJGcJqGU8yzw6u1ja//h3k75u08aEJqImnGbSZzjaFHoUTlF08pVpCbQyo4ks+VUUc
	L4NveONAiLs77kXEPKZfixt5QYbTPW9ZDINSO5ubhVVN97FDTeFTHt04agfpl3kGhgAw0P55J
	zYiWNoOL0EZSDgCjN9S/zoO4AoL/hPGIB82H3ExiA2Km2mBJfTjswCBc3CoiIge5NYlpr+u5f
	Ez4vn4eVr/LiY0DL+13almDlk22avK2ZyJ42e3tx46IpNKrUeXcrl55moScbrYBwXHa6NndIa
	OjHViQKBOpNZrxDvFo9a4L189OHvUnUfD5DRj9b6u3u9cTrrwpqGSalKSsjZpd3qdW2gibYud
	WAPM1Z1V+siuhhWywBsIka8q6ZBqEwjImZz2BcXEjOqcAMDysxQZuLYb1KUHWHRDvvHRBB9ZH
	iTx9psCzI+vxdTqBlnKN43Eepr5mFJLlPD4lk3hXbSidWL1nzi1W953ZmG8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 13/30] MAINTAINERS: Add missing entries for
 the Jazz machine
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
X-List-Received-Date: Tue, 11 Dec 2018 18:04:29 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefan Markovic <smarkovic@wavecomp.com>
Message-Id: <20181125205000.10324-6-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b32cd139a7..5c20fed4d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -865,6 +865,8 @@ M: Hervé Poussineau <hpoussin@reactos.org>
 R: Stefan Markovic <smarkovic@wavecomp.com>
 S: Maintained
 F: hw/mips/mips_jazz.c
+F: hw/display/jazz_led.c
+F: hw/dma/rc4030.c
 
 Malta
 M: Aurelien Jarno <aurelien@aurel32.net>
-- 
2.19.2


