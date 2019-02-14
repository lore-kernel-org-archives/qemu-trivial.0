Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guEZ1-0002VF-2R
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 05:48:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYs-0002Ky-GH
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYn-0002rF-UK
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:10 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:57421)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guEYi-0002Vk-IO; Thu, 14 Feb 2019 05:48:00 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N8oKc-1h6zsz3YhS-015q5Y; Thu, 14 Feb 2019 11:47:48 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org, libvir-list@redhat.com,
	"Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 14 Feb 2019 11:47:15 +0100
Message-Id: <20190214104717.3543-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214104717.3543-1-laurent@vivier.eu>
References: <20190214104717.3543-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:J7mRyDYOD38Kb3OrYj08T2sfYhUIjMhl4UqoH6czZ6hT9NXGNtt
	kqXDpIeez85B2GBLctlGjNTnGUOcTE7p0VADhje7S+yvOebE9THy/yajPyR9zjRE+UXC4yk
	7CrrF8kLILUsfRSr/Bn8xDBRbNU3KL7yu4nVPJ4K4KRx0cvSZoXJ0OcqMHX3SJQu1EBKRmG
	eTu7l4QVztPUdmGdjXiNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rISYavrEtlY=:tpboYl/9rmZkb376tj8du/
	o5WeGRlCXorHltLufOp7j1P7cYCigSHkirttjVuBhh6OiQRqG1WW2xfK6K929BZXTVx0FA9TT
	PTSRXWVP1CwhR6IFgH1+qros9O7igXeiqK1ThH4RipccdhYJVIYHIdO/GK8VWNw0334fbWAT8
	CcXV/iQoB6qNavh66Osz2f9FHL8rIRbL2+mdwiXskxZqPwflEVWkMCb13nMPlXnqO8JALA4Qc
	+ZIjcleMJcxVGB9OkunACDGkocLlv+fiHGBjYRmB5CP6M8H3Q1AxkYprjIw3EhlTUgiO43OEP
	AB2WCjwox3A+INJ3CDjrTFlXXlzoOuPDiJDeYNpp4HF7jrTktxTxNWsUek3BSzDC13StPJPx+
	PYV14Q53wpCpWCu1hIy/Sv6cLyq9qIbZ7SjTZTwF3frqs6loe0ISesDQBO3/WXasFiPZpjDSQ
	mhmOQrt4TsmYYCUTmVd1avjCVJiZLAlt6MrovXXuLWTRndbD63mdkeq97kUAGpoDIvEiJPMPL
	D7X9iBvheEaS+dq9pJj3ksrrjUhQvO4T+xId4xau9YU26R+NkVMldPzQV6slfegbXDV/HMXDa
	PkkyowGwBLl4Z8IvQgfEGJ4OMtVYPrmKm6dH0ljFXMXzmPo+eCPB7zCf6M6+fBJyEBcfdfI6B
	56Kd0tc1FmKDT9PJWFWOPE3M9hfgHVVilFHeCkFqB9u7p6RLkOHRJl1gSv5egDc5CJRfZQWrF
	UMWhdIAczpMkHsoeKd4/lrTccP1QGk8nThhCtEW07xgXkRkPo2kDZhAOhJo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL 12/14] hw/dma/i8257: Use qemu_log_mask(UNIMP)
 instead of fprintf
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
X-List-Received-Date: Thu, 14 Feb 2019 10:48:13 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Avoid to clutter stdout until explicitly requested (with -d unimp):

  $ qemu-system-mips64el -M fulong2e -bios pmon_2e.bin
  dma: command df not supported
  dma: command df not supported
  dma: command df not supported
  dma: command df not supported

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20190212145322.30974-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/dma/i8257.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/dma/i8257.c b/hw/dma/i8257.c
index 52675e97c9e7..3e1f13a4aaf4 100644
--- a/hw/dma/i8257.c
+++ b/hw/dma/i8257.c
@@ -26,6 +26,7 @@
 #include "hw/isa/isa.h"
 #include "hw/dma/i8257.h"
 #include "qemu/main-loop.h"
+#include "qemu/log.h"
 #include "trace.h"
 
 #define I8257(obj) \
@@ -185,7 +186,8 @@ static void i8257_write_cont(void *opaque, hwaddr nport, uint64_t data,
     switch (iport) {
     case 0x00:                  /* command */
         if ((data != 0) && (data & CMD_NOT_SUPPORTED)) {
-            dolog("command %"PRIx64" not supported\n", data);
+            qemu_log_mask(LOG_UNIMP, "%s: cmd 0x%02"PRIx64" not supported\n",
+                          __func__, data);
             return;
         }
         d->command = data;
-- 
2.20.1


