Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g5kyP-0001qt-N7
	for mharc-qemu-trivial@gnu.org; Fri, 28 Sep 2018 01:05:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46750)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mgaio35@gmail.com>) id 1g5Y6a-0003ac-VT
	for qemu-trivial@nongnu.org; Thu, 27 Sep 2018 11:21:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mgaio35@gmail.com>) id 1g5Y6W-0007wK-0j
	for qemu-trivial@nongnu.org; Thu, 27 Sep 2018 11:21:28 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35472)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mgaio35@gmail.com>) id 1g5Y6V-0007vI-QH
	for qemu-trivial@nongnu.org; Thu, 27 Sep 2018 11:21:23 -0400
Received: by mail-wr1-x441.google.com with SMTP id o16so3092704wrx.2
	for <qemu-trivial@nongnu.org>; Thu, 27 Sep 2018 08:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zyJU5H0FAQV3FTC9tAbps830GRiPLQKusimJkjZ8B50=;
	b=gcmQTnpjAGgUvHLgIO3xmK5T9/cw4tfh5hd1PRGtpfiuz9S2jnqHJAVFBp9dVAsUXj
	FrSgTLe9UhizjzYSPI1wJkBJ5xMaBInjPYqYKPl8TrQthwZn5hXmwK/W7keyZQX4sDdO
	Xm07FZXYTFUEDhvEgtyW/1rg+aT1QBDaMN0BewekIjlSSqhF3gX/BoqdaDJu15tJpug4
	eySk8xQBMGeS4xT4feu/fPw9yjWopaxjfXA3s9XJVCwRc/N2lL85sfa9aJj+eIOoRkfX
	v9ZxOIq6UuPY9TGyfXoolgKqbjG5S9twvYUbiZiBeU7hn6Zd8OElpZudACFxvEup3g4S
	LtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zyJU5H0FAQV3FTC9tAbps830GRiPLQKusimJkjZ8B50=;
	b=cPEuZYtYEy7Y3LlfegkUemL5o74tNRf4yzjdgsI3CRN3HeFHisEMIBKky4sHfpy2D6
	PmpwxIK5ogc3WEuuqUU1HxD6iDOMjqxyXY0d6ep1U7aYefPqPaBRnZL5jj7GTLqNg/Ny
	mTj7n+VRdX7niBvfLh3EN52hYl4YubE1mnQw2kPcV54TzzmjX/4HHc3lfFSvYxhesDbK
	b2kIWMwl8cEoKULX3a/zcBE10+kKP6hrUDtGkPy1nSJ0BgIi/7Mopyyu6P9oojT9fqbr
	c/SvqkFCiNH3M7GF13zMi5qdXGATtS0vACpdAkeGzaqRle8ASh4qBtLth90/gAgHWwX7
	nasQ==
X-Gm-Message-State: ABuFfoj8uSGF5X9+vXTMMcDi7P4iZx+QRZSqdetF9Ot9g5AakZbZiGid
	bvdpM/EwbpwDfy7J0KBjoQ==
X-Google-Smtp-Source: ACcGV629VC/SQbOXzjX9rb4eTXMqlyDkKlQuAVzu/wA//xc98cCu7gDfwQtjuLSxUzZ8I2qfbkB5Pw==
X-Received: by 2002:adf:c98d:: with SMTP id
	f13-v6mr9324817wrh.148.1538061682206; 
	Thu, 27 Sep 2018 08:21:22 -0700 (PDT)
Received: from localhost.localdomain (29.25.124.78.rev.sfr.net. [78.124.25.29])
	by smtp.gmail.com with ESMTPSA id
	f3-v6sm2663874wmf.30.2018.09.27.08.21.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Sep 2018 08:21:21 -0700 (PDT)
From: Miguel GAIO <mgaio35@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-trivial@nongnu.org,
	Miguel GAIO <mgaio35@gmail.com>
Date: Thu, 27 Sep 2018 17:19:36 +0200
Message-Id: <20180927151936.3647-1-mgaio35@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
X-Mailman-Approved-At: Fri, 28 Sep 2018 01:05:52 -0400
Subject: [Qemu-trivial] [PATCH] ohci: set effectively usb frame rate to 1kHz
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
X-List-Received-Date: Thu, 27 Sep 2018 15:21:30 -0000

USB frame rate is slightly lower than 1kHz: ie. ~950Hz.
Thus usb-audio device is not able to perform a simple audio playback
without underruns on audio backend.
eg. "-device pci-ohci,id=ohci -device usb-audio,bus=ohci.0" vs PulseAudio
backend. more than 50 underruns are observed per second.

Update ohci_sof_time computation, using QEMU_CLOCK_VIRTUAL in
ohci_usb_start(), and increment by usb_frame_time in ohci_sof()
makes USB frame rate close to 1kHz.
This way, no audio underrun are observed during audio playback.

Signed-off-by: Miguel GAIO <mgaio35@gmail.com>
---
 hw/usb/hcd-ohci.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 98da5f0f04..66656a1133 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1253,12 +1253,12 @@ static int ohci_service_ed_list(OHCIState *ohci, uint32_t head, int completion)
 /* set a timer for EOF */
 static void ohci_eof_timer(OHCIState *ohci)
 {
-    ohci->sof_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     timer_mod(ohci->eof_timer, ohci->sof_time + usb_frame_time);
 }
 /* Set a timer for EOF and generate a SOF event */
 static void ohci_sof(OHCIState *ohci)
 {
+    ohci->sof_time += usb_frame_time;
     ohci_eof_timer(ohci);
     ohci_set_interrupt(ohci, OHCI_INTR_SF);
 }
@@ -1362,6 +1362,7 @@ static int ohci_bus_start(OHCIState *ohci)
      * can meet some race conditions
      */
 
+    ohci->sof_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     ohci_eof_timer(ohci);
 
     return 1;
@@ -1476,6 +1477,9 @@ static uint32_t ohci_get_frame_remaining(OHCIState *ohci)
      * set already.
      */
     tks = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ohci->sof_time;
+    if (tks < 0) {
+        tks = 0;
+    }
 
     /* avoid muldiv if possible */
     if (tks >= usb_frame_time)
-- 
2.19.0


