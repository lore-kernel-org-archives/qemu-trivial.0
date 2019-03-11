Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3QL8-0005RO-Md
	for mharc-qemu-trivial@gnu.org; Mon, 11 Mar 2019 15:11:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h3QL6-0005PD-Uw
	for qemu-trivial@nongnu.org; Mon, 11 Mar 2019 15:11:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h3QL6-0003Y9-8p
	for qemu-trivial@nongnu.org; Mon, 11 Mar 2019 15:11:56 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:49325)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h3QL2-0003SY-Ix; Mon, 11 Mar 2019 15:11:52 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1Mgek6-1gZaEQ1tJk-00h8LM; Mon, 11 Mar 2019 20:11:38 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Laszlo Ersek <lersek@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>
Date: Mon, 11 Mar 2019 20:11:26 +0100
Message-Id: <20190311191128.30562-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190311191128.30562-1-laurent@vivier.eu>
References: <20190311191128.30562-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+/7vQYnWzSBZpyc21fQiaX1NhoLlLObmbxfRYYgeqZRGWk36tgV
	uqMOEowoEasOPODlDJiBTw+tR6WUCf+fyZXmNlY9e5oyUKe22dyBK4OLZhzn3Zo4KZQfOlk
	+fdtjIaWkjTrpvIISRhXJevtyrK33at/n6TB91gCQp3FayzXxtG4q49X1y9O9bKkvqKx1Yt
	Vp3llgE7QHshWl8f+1cLw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RNrBHDC5rY8=:St7pIStrAkgi2QCwDbggJT
	qYwJYS+FveRoBPtFRZb3coEVATExAKb3A9MCbMSXTRq3au8uoROztW7Q0Z7UY8U5XP95VaLxR
	woQ86ZqWbDnH3f8lvL45AVpDuCNWnUuUlrlzKNs9hT182XwKuFFCRqWOIn6f7Agi72/8VCN8v
	/fQkWesBktCIkN1I3iBKzalYTCiF791yfpIaLxfFl6eyyEaRG0+JUMvtUtOKokpwudEqTgv+a
	znDIz79DmvbunB8RNuG1sHiO9FbMxL5UsD3MJgRFruA54df+/35HJo/UUW+UaIL2BhGFP/hl7
	qSCo++ALCP2f0GifbS9hlMxTdoVrRvi/XDrNk6LJLYTou8uSoD+SzGuWttnmOusG8IB9jfqUE
	XOalJQIFqzUKK6wNu3jwIJpogQZ0TWQcBocK1VTT7P3znJtqGVLF74mV5UP6KFofsmhI27EhB
	n2yb4ZG1cS0UBSBEc2bdqEKNy8eNDg1Lz27lpUNfL8vgqqaoUVp7IR2boGjrpLrGFaxoaK9yL
	fc18OeCgqYIhKbl7OgLLGoHAYbfTgCIpuadcrLV8+GD4ZiReO2C+ZTB+D2Z2fuwWHgccT5gnK
	xqKZXufG5FzapSKRRxBEYzcTsdkSRlxTNOwIA4jF3kxZKVKKOfqN/8OZ8Ij56fwSS2N1QCKGa
	5Iz83ZLspo6UPruZ+tqsmZeB4AbWRJULSjwpjfRZGjp/txF2g/Ue4yzzmfAtGLUsLv8IBsYUl
	vlxrExVSx+PT0rL+ZHZNLRwhOcOezQll1GElg+qQaXZTD69wpI5vhXeisIY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
Subject: [Qemu-trivial] [PULL 3/5] hw/i386: Remove unused include
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
X-List-Received-Date: Mon, 11 Mar 2019 19:11:57 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190308013222.12524-3-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/acpi/piix4.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 8fd25a59269a..7b98121070f6 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -28,7 +28,6 @@
 #include "sysemu/sysemu.h"
 #include "qapi/error.h"
 #include "qemu/range.h"
-#include "hw/nvram/fw_cfg.h"
 #include "exec/address-spaces.h"
 #include "hw/acpi/piix4.h"
 #include "hw/acpi/pcihp.h"
-- 
2.20.1


