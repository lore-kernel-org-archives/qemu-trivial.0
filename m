Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FWr-0007ds-A0
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:14:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FWl-0007Ym-2y
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:14:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FWk-00059Q-5i
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:14:35 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:47582)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FWf-00056d-Mx; Mon, 16 Oct 2017 20:14:29 -0400
Received: by mail-qk0-x244.google.com with SMTP id m189so28870qke.4;
	Mon, 16 Oct 2017 17:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=K7Il9e4gdvfd5CEL77iu9A6C8SdwX5vWI0pDwfAhw3g=;
	b=Ais4fNr3f7bPeiPdWLQqD3j6ZCJSRHbLdoV70Le5gQKYs8x4myXbR8TgDfDgNjNEz7
	nyKYwijn31pUGrD+gnJrzU/22y3/h56m7GSyDQX+QO/nAYfmtXl3smexhcsBglPjE+f+
	ylNumLCidoDpP1JglrdDXrAuRdAMPXdKUGa1Iw4c1LWn42vMG//txJEe5tQTm8dsEbyw
	mfofEBjtBBjwpiSQxohq8gQcbDIRB6vOhx3ATd0ih1eR/ZKKyDl07gkkqsEyDboMrAjf
	GuDGPxxykbQicsetdMNH+n0uFqpeVT12g/Q1fQDlaj32Z2ap8eLFquPzAFdqLmMQ8i/J
	EJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=K7Il9e4gdvfd5CEL77iu9A6C8SdwX5vWI0pDwfAhw3g=;
	b=Ks2kRyzqMcGOemicIwL5IXOgp4D/Tnb0gysaXJifXVYZ1d2OPTzOarhf+gkcditSoP
	vpPgM19aiX0v4wMz5hYNsIGrA2J+CahtZVjlkEm6wEFo03VDUpXvswCpcRa2jp0aZJiZ
	B5b15Vjn4NH2T4TZo8kpSIySP7ohn2pAvUaxHDBjjHTJoRcXJP8PE1TBF/DutuEE9kbP
	tjQ5lugStog1lftwzccTkjwKo+UtPPKjORFCOSbpCMbSD4ZyLZlCgMvwx6I1qnxMhtR2
	LmnQkEzHbtnaldQlg8hrRL1xXoRwDP00APP/hWMASJKYRg6Dh3bnMzU/U8qX9EkdUXVF
	iHgA==
X-Gm-Message-State: AMCzsaXW+kZhRqiYtfczUGTWV1eNfxAeNbWOhNeiPz6yXCQuEobOfAcn
	lXwZjcWK8NFztUcCW1+3a00=
X-Google-Smtp-Source: ABhQp+TkumlCxOVnd/zjCPfq1UfQEgM0AXblqhpRRoosd2gMcekzkMZJVwU9DdALQsR0oOKmM5NODg==
X-Received: by 10.55.127.66 with SMTP id a63mr9641332qkd.90.1508199269088;
	Mon, 16 Oct 2017 17:14:29 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.14.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:14:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>, Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Eduardo Otubo <otubo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:12:08 -0300
Message-Id: <20171017001209.32276-39-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v2 38/39] hw/dma/i82374: avoid multiple
 creations on the same ISA bus
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
X-List-Received-Date: Tue, 17 Oct 2017 00:14:38 -0000

$ ./ppc64-softmmu/qemu-system-ppc64 -S -machine 40p,accel=tcg -device i82374
qemu-system-ppc64: -device i82374: DMA already initialized on ISA bus

Reported-by: Eduardo Otubo <otubo@redhat.com>
Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/dma/i82374.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
index 6c0f975df0..280e64f0fa 100644
--- a/hw/dma/i82374.c
+++ b/hw/dma/i82374.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/isa/isa.h"
 
 #define TYPE_I82374 "i82374"
@@ -117,13 +118,19 @@ static const MemoryRegionPortio i82374_portio_list[] = {
 static void i82374_realize(DeviceState *dev, Error **errp)
 {
     I82374State *s = I82374(dev);
+    ISABus *isa_bus = isa_bus_from_device(ISA_DEVICE(dev));
+
+    if (isa_bus->dma[0] || isa_bus->dma[1]) {
+        error_setg(errp, "DMA already initialized on ISA bus");
+        return;
+    }
 
     portio_list_init(&s->port_list, OBJECT(s), i82374_portio_list, s,
                      "i82374");
     portio_list_add(&s->port_list, isa_address_space_io(&s->parent_obj),
                     s->iobase);
 
-    DMA_init(isa_bus_from_device(ISA_DEVICE(dev)), 1);
+    DMA_init(isa_bus, 1);
     memset(s->commands, 0, sizeof(s->commands));
 }
 
-- 
2.15.0.rc0


