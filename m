Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3QLC-0005TR-MY
	for mharc-qemu-trivial@gnu.org; Mon, 11 Mar 2019 15:12:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h3QL9-0005Re-7C
	for qemu-trivial@nongnu.org; Mon, 11 Mar 2019 15:12:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h3QL8-0003aZ-FE
	for qemu-trivial@nongnu.org; Mon, 11 Mar 2019 15:11:59 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:35411)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h3QL4-0003VY-PP; Mon, 11 Mar 2019 15:11:55 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1Mk0FS-1gf3rg2hGi-00kRiS; Mon, 11 Mar 2019 20:11:40 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Laszlo Ersek <lersek@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Date: Mon, 11 Mar 2019 20:11:28 +0100
Message-Id: <20190311191128.30562-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190311191128.30562-1-laurent@vivier.eu>
References: <20190311191128.30562-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:O3d1O9PL+YJpFY83VOHpBzFgNXCjBqdqt5u3eRlfFznZeVE4Mlj
	oDJK6z3/pDMNuDsD+XYt2iCmUtD74mO5x3QW1vnY2aE8QZgDVPMcbHIqpUYYXWnjz7Sro3j
	6ZVm7Jq75cNNMdVY4dQwmSRUolGai6eeMg44TUhUDyvgOZVDxkysynOH9iXWtyA2Tf9pYjU
	dz4Re0AjxR7R4lR3m0XFA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5O++kXf8Qqo=:y2vymZd5uMYCXpFpD4lpnS
	DVp24k4XUpqgwNrfiUl8aX72EIKjvsVTDe84jVPp1Ks2V7ffOXwDi7S/6Zs5ooNseQ54pqwfQ
	eyKV/yyHnVsahhdo6FWvpqw1bMNq4BWha/5wEnC8bfOG0ZHu5jn+91vMOJTKtOMaXemY21AxH
	CtnOiuz+H8amg2BgN18BpdpANFzmu39Q+l5XVSP7WYjPcq/1rWGa0LdJGEDQ+HMoI+lomxfzV
	673qH4C5ANUzx/b64hNtXJsewOxPJ1V7ELUKrWTP/niCnNKjl/9/yy61zd/u9FbRgm4qqtw7o
	vwFALaxaYtiPXsyGK5VbM338xRnZ97rtKhapRDCGiirYQrbM+MBCAduQB8BDkIB2TMiVo8GHb
	PCSEcydy9NBSiGqP+Bkf698d6ZRHQwy7ZJpl7JVU3d4HE0rMAMjHThsFECkM4N/9xifbdYhmx
	gAp6itDjtdsHodXiF9MMK91+Xmjorx3GXFBzSF/k8ZLEpcUZKepbz0Q8Oaqk+2LuLQdEV5XZ2
	Hs+rzMJD+4QhwiCeKd+uQNJSmE364CRITKATAC066+B7opTHtINr3ZSztCxwz8fcB4yjPirL5
	9fI8afEJXrHYYLZIFu75IbWVpMr5HRC7ep9KyDJgtlBck+MoM/G2ysnQKrrIX83xl+tDn6yBK
	F1sQDUC47hloQRcnOJZhQQeQpkq9qkIxHYDNMGHz1+O9qTiimaTr0eGek70V2+GPGXAWT5z0y
	V6/bxdwQPRaXJB00Vsw0ZxAwu4Fc9BzHeOxS/zgNvasbx2Lka1xGTLeuDvY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: [Qemu-trivial] [PULL 5/5] hw/nvram/fw_cfg: Use the ldst API
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
X-List-Received-Date: Mon, 11 Mar 2019 19:12:01 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The load/store API eases code review.

Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190309181920.30553-3-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/nvram/fw_cfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 13aab122889d..5c3a46ce6f2a 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -85,7 +85,7 @@ static char *read_splashfile(char *filename, gsize *file_sizep,
     }
 
     /* check magic ID */
-    filehead = ((content[0] & 0xff) + (content[1] << 8)) & 0xffff;
+    filehead = lduw_le_p(content);
     if (filehead == 0xd8ff) {
         file_type = JPG_FILE;
     } else if (filehead == 0x4d42) {
@@ -96,7 +96,7 @@ static char *read_splashfile(char *filename, gsize *file_sizep,
 
     /* check BMP bpp */
     if (file_type == BMP_FILE) {
-        bmp_bpp = (content[28] + (content[29] << 8)) & 0xffff;
+        bmp_bpp = lduw_le_p(&content[28]);
         if (bmp_bpp != 24) {
             goto error;
         }
-- 
2.20.1


