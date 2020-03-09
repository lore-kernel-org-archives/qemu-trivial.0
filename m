Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBK2T-0007sw-Tl
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2020 11:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33269)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK2P-0007d4-5m
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:09:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK2O-0007eE-3m
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:09:49 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:37311)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK2G-0007Ya-Dt; Mon, 09 Mar 2020 11:09:40 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MHX3X-1j7DR62up7-00DXxH; Mon, 09 Mar 2020 16:09:01 +0100
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
Subject: [PULL 08/33] vl: Add missing "hw/boards.h" include
Date: Mon,  9 Mar 2020 16:08:12 +0100
Message-Id: <20200309150837.3193387-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0Fkei+2Tt1Tdpv8J++VfECwShiRaK3eOrGgS7RSiid7DnfG9jQ7
 wiHY6j6PhMpnumCxFjkerbQ6HhAkUIKw8m/a4HZ5tawrCyfvCwH/sIX4hE+dC1Vpy+nOc0N
 byu+c+a91Nu3kUNh7/b4Yk29kfjlPSmrpewB5Q3haXNQTbDp+d8d4r8D2YtenHl9zffWqsS
 ML/O7o0l0ZYVKQz3xBAvg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Mzwa1rvCDwA=:pXKJSSDa+HrCXHL1s9xszf
 nEicKRMDuoRr4cPdjnIc6z0BFL42vaQLcNKyUQkvI/yO4SC4TmUUtWb2bld/im6rsttBxn7Rh
 lBuyX7He+FQbPQisrwdwLV7PiUWwA8R9fAdnegTI9n9qKT16KeXUdeo1dXe0rFHfjrOJl9KFc
 ralgwx9UNhcki3/lBeFJyrmmnc8ZRIUsXS1SxBwdx/+j6HMQkjrbPuqTMdG8RNTgU61rqP7mF
 k4tfaXmcek85v7eptBqp/eKu4NzENr98JlfbTgI8ipZhYpI0vrbwJOzpivvABI2yOMPgWH/en
 ysBGNhYGfF5tsJHmVj5LVWsb3rP5fawdbh12tlQ0cL9MTRi1DiVozkKQ6yKEy9XmhbwWOeDWX
 3XnT5Zs9+Fs+CISWGhQSmRlTFE0ojs3umaM406SKRF6CTLt42PuphAj3zmBCEZv8LIr15TUt4
 ARwLh/gk3TiXEZ06ogccC9KXYksdgoFgx/1B6YQZVflxeDmshtFbU1XNxjAzqyEmnwHXnGIKD
 cZNYUTFij5dXOjVRlDMbD7IDTNYYctyJuyQBoAMb8bh3NiGY9gV04npEtaXC8wwUJOKae2SSf
 mgi4PCcwq0lEpCfooRz4jEdc/61O8zW26OGn3GJPjhiMVAIPAmiL3nEORipsSTLES/wfOqf/N
 o/Aq+wjOANi9v9vPzx1b9ASiDxFF+q3vV325XIK0nQHy04+VYhQ3X8lPzpfhp5TRPLgEnq3Ov
 IN8r2GHKYl08xclBMj74s0nBqIvpXRH++/rJB5QuaA9AqIFp5cccoyn4S0TBrSL/2sDu/BvsX
 vXLm3Ues3mv+FEn7D8J25OrjuUb+m4vQizwd4ZoWNxtBDgqxyfs6+W5T1hGJshO228LVf7l
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
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
X-List-Received-Date: Mon, 09 Mar 2020 15:09:50 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

vl.c calls machine_usb() declared in "hw/boards.h". Include it.

This fixes (when modifying unrelated headers):

  vl.c:1283:10: error: implicit declaration of function 'machine_usb' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
      if (!machine_usb(current_machine)) {
           ^
  vl.c:1283:10: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
  vl.c:1283:22: error: use of undeclared identifier 'current_machine'
      if (!machine_usb(current_machine)) {
                       ^

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200228114649.12818-2-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 softmmu/vl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5549f4b61986..ff2685dff845 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu/units.h"
+#include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu-version.h"
-- 
2.24.1


