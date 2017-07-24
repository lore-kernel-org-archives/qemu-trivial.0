Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi6C-0000Tm-2E
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:28:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi69-0000Rv-UB
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi66-0004vw-Qb
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:53 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:34205)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi64-0004uf-TO; Mon, 24 Jul 2017 14:28:48 -0400
Received: by mail-qt0-x243.google.com with SMTP id i19so2261220qte.1;
	Mon, 24 Jul 2017 11:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6db8O8rUvq+dHdRRjGRWbj4pl1d1APVvxTg8Ajne3GE=;
	b=U+TPXkImdmSSfweG9kANIqTE50nC0VAiaUJkNJG/AgFJWwq+rurNyr7qTq3doUIakR
	Rh3sUsXPywO4UmPGrEYIniSgfvmLmVq2v9B0oQkeYQh2VH1CmlGNjB4BPwb8cJ2DwocX
	rnIzpIsrDOhO0Y4HiFI6b2mziFuj+HM84LJkIE9EJ6YF/fjjY/O05gnKFWbTrV8v6aEf
	VsLUCPqEMHs3GH9xbBTFzTYIOqhl6BkZC1AwUs01qaOMsGoXy/6VA0kB+xOkzxPQhu6i
	dYw15d3r2RE62G03HiiVsY/Y+5ojvUboDM4USr4Cq+gpAt7RD4OaQUVWr09WQtgbTe4r
	Iz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=6db8O8rUvq+dHdRRjGRWbj4pl1d1APVvxTg8Ajne3GE=;
	b=MH7py7pbKMSA1v1b+8Uu+GF4Jz1V/STpGXa/wImLNAF45khOCdei6oijPjGNhmVrzG
	bK7CFoZ79TlS2rr181LgQr0ekYWv6dejdSbUvULM9zax4oR9y9DBuQGwDg66Yx8IYjuW
	tRsi2ER0Ya2W7H2HEC4MhqUiOi+eAekvzEMpSO6edXcZuYcOhT1Q+fnQ0rFo26WxwM4N
	6bnl2FaEcypjCDxzKECQYw5xAGe88EP7JozZt3SsRDviP5/baiLwRJpz6sChdbmrywMZ
	KQUnZQTExQRJH/K/9rkbID1TP8oj+OQq/ixPJ7D2iZXe5fgjNhCySPQHTwbrg/RDluH/
	YKeg==
X-Gm-Message-State: AIVw111g1G2EZgt5UJQ0Y/+v/yAGpoPlwOhVoXL5pxThrKtATyazxii2
	FSnPVEFZFwqY4Q==
X-Received: by 10.237.63.162 with SMTP id s31mr17926589qth.206.1500920928449; 
	Mon, 24 Jul 2017 11:28:48 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.28.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:28:47 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 24 Jul 2017 15:27:29 -0300
Message-Id: <20170724182751.18261-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH for 2.10 13/35] vfio/pci: fix use of freed
 memory
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
X-List-Received-Date: Mon, 24 Jul 2017 18:28:55 -0000

hw/vfio/pci.c:308:29: warning: Use of memory after it is freed
        qemu_set_fd_handler(*pfd, NULL, NULL, vdev);
                            ^~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/vfio/pci.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index d4051cb951..31e1edf447 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -257,7 +257,7 @@ static void vfio_intx_update(PCIDevice *pdev)
 static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
 {
     uint8_t pin = vfio_pci_read_config(&vdev->pdev, PCI_INTERRUPT_PIN, 1);
-    int ret, argsz;
+    int ret, argsz, retval = 0;
     struct vfio_irq_set *irq_set;
     int32_t *pfd;
     Error *err = NULL;
@@ -302,12 +302,12 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
     qemu_set_fd_handler(*pfd, vfio_intx_interrupt, NULL, vdev);
 
     ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_SET_IRQS, irq_set);
-    g_free(irq_set);
     if (ret) {
         error_setg_errno(errp, -ret, "failed to setup INTx fd");
         qemu_set_fd_handler(*pfd, NULL, NULL, vdev);
         event_notifier_cleanup(&vdev->intx.interrupt);
-        return -errno;
+        retval = -errno;
+        goto cleanup;
     }
 
     vfio_intx_enable_kvm(vdev, &err);
@@ -319,7 +319,10 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
 
     trace_vfio_intx_enable(vdev->vbasedev.name);
 
-    return 0;
+cleanup:
+    g_free(irq_set);
+
+    return retval;
 }
 
 static void vfio_intx_disable(VFIOPCIDevice *vdev)
-- 
2.13.3


