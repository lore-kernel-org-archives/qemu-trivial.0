Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBK36-0000VO-EJ
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2020 11:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33926)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK30-0000Pa-BG
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:10:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK2z-00086Q-8r
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:10:26 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:38419)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK2m-0007yY-As; Mon, 09 Mar 2020 11:10:12 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1My3AX-1jYBjR1Hm3-00zVGb; Mon, 09 Mar 2020 16:09:06 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Helge Deller <deller@gmx.de>,
 qemu-trivial@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 10/33] hw/i386/ioapic_internal: Remove unused
 "hw/i386/ioapic.h" header
Date: Mon,  9 Mar 2020 16:08:14 +0100
Message-Id: <20200309150837.3193387-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:u3cPHvNvPGZ71fbGyaPeuOYlBQ264xiRTyGLhSmLmH67HijXfLa
 Y/qoXbhDzpPStZaVi8UaZJHHsBWYEYYo4GbKgMgSUSzEmvFukXni5rNTb74DFo151g7oIxi
 dpsTu61sW3Wtu1cntATyfaBQ1zSOTP7c5tLLEKT6h+m28jrS6w/F4c2ae0QzxhHS0Y8rfUr
 AyJ0kIDUuVP4xkFH2c3WA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MIrVBrtyA2c=:o3LjRP0DEiWUwk9amWDB/8
 LvmxIIbSkJi+oVil9V4+sj2po18yeoP0ZdBYcJlNUkLUMRusu6NlHxNG5g8xnz4/N5Lw5/UDa
 U/AMdA1HG++9XdJPUIB9EpzeYICB2F/Fn7CWl1tn1NJGyP0BpyNAqAZczbqLMwrwJy1SnPx8R
 N2HwHd8deHULP2tzUO4d8gATrp65MeKWmt0vGxN9S9ZEPe7C5EZJBjt3Z+vkb3g8fof2O8u4m
 3yg6Qqrp+9qcGm4Q7QDSZvYDrdFF3gA2Hm47Cx5dB6AtfCIvsKQKzMEDDcIzoYWCrTtx4Hh0j
 ZjsPA/+hNVp2YS4SMbbvySVyskubCOYgfBB2CISmX0mWoD0jeLQfZ0DsjT8TtQWuQ+wGDH76c
 4Ivo+aQVKcF06BSUQ94OVN3FFSjqYzKQzRWXsS2gDJmqR1WXoB8evoS7rRPnQW9xRPq5AGARd
 O9jNqsfg2G29v0fT01Xw/G+tfTtzt/dU7LchYctnZDOW/P+Iyibl4ST6ddi7lQFL/ql03EOj/
 Gz/EGXp/w4+kUrqQL9PLZ3awYU8oiHN04Pt+P66bekr6sD5mMVQcrlKAaqvJ5zpo/eaI9Ueaf
 De+tPClMoGMYg/IswaS6fmezKptwNOafBN3/k8Ok9/xH+qT/qZ8FDazpaVxdZzJmfRzwaq5Ig
 ab1CkZwoL4MRqEyyZfm5Ft1nHArvR51vRVVXK5+dfua2MUPc5Pf2mkjSEYWsJVT+i7UyjBlAJ
 1q24dxVpAGwkYWMLrTCKofEcI9QsrXdjMrBOke77JtOVixNNzkjnakYzV21DUN4cYfymwENXe
 X2Dzz+hOuA0iTrV6ryhcNjZXva4icWSW+jk08jK6NRIw6UbreyCqETJeWugpaSh2c4RnfqX
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Mar 2020 15:10:27 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The "ioapic_internal.h" does not use anything from
"hw/i386/ioapic.h", remove it.

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200228114649.12818-4-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/i386/ioapic_internal.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/i386/ioapic_internal.h
index d46c87c51030..fe06938bda47 100644
--- a/include/hw/i386/ioapic_internal.h
+++ b/include/hw/i386/ioapic_internal.h
@@ -23,7 +23,6 @@
 #define QEMU_IOAPIC_INTERNAL_H
 
 #include "exec/memory.h"
-#include "hw/i386/ioapic.h"
 #include "hw/sysbus.h"
 #include "qemu/notify.h"
 
-- 
2.24.1


