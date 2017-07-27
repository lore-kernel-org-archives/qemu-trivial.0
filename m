Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daYlY-0005bu-Vk
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 22:43:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlT-0005Xc-TS
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlT-0007zN-4b
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:03 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:33265)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlR-0007wi-3X; Wed, 26 Jul 2017 22:43:01 -0400
Received: by mail-qk0-x242.google.com with SMTP id d145so14634290qkc.0;
	Wed, 26 Jul 2017 19:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=H23FVpCid9feWmXmb1T5ujJgbQv1GZZHSHDMEKnXeao=;
	b=iaMyEI9TNPviiXHLXDgUP8W+8hqRz42yKEK84Yi7QUutoc26tGY2gBXF700gsoQEsF
	33g8hbgvHFOa7J/7EnBjr9iwEA8h/a66r5TxLCCb05fLrWnPRbnVdBXyvEqsKgMBV4Xx
	Ynz8OcZ0qgAEV1WvNgxHqiQNcnnCFWYfNl2pCDDDw1t2HhcMMGFvroxrgyskoSDrFGPs
	WWPcQyFdYBGhg1oaP5qSwN8oP97aLBDj4SwbAatBsez00SYpVcTgl81j8ZaqG5a9ArYl
	SQyzOMJtpo5j1zO+zmBOJWH1XNbJtnMqNtTezQEzFJ4lCA+hLkdJMz0lkTTk3XiBgV4F
	r7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=H23FVpCid9feWmXmb1T5ujJgbQv1GZZHSHDMEKnXeao=;
	b=HXzCcssrrKnjRm04yifLVvsOIvPlwVXp2Lhfy6j3/Km+60IRNd0n+bScl8TLla62J+
	jKdIJP5oSZ9r1Exgga1St5jysk9t14hRL2J/TNCf01SXqboOqQBng7aP+ZlIfaUax/om
	9c6A8j8QScvul2ycr4xCHEMs9qv+WOTISqKODZVXLXm7TC/U1slklGjBc3raT2axiwvh
	vucvEiIXSN8w3kT872NRKOUsUwyJy7U4+lDKsFQggbae03pR5sq+bFWJpZeDFknrR/BZ
	lemxgzI318zI6V2Z9wHb5CZqo2UWiqZ5EH4+hCFsc34G/ctrQ+YcLqKguEK65002KJUU
	KDIw==
X-Gm-Message-State: AIVw113NLSmSVYjn4jKl87bvIaGYIxs0Gh3mT+IiYCDncxYtKA2gLHAS
	xwP+WVZF/Ii++w==
X-Received: by 10.55.146.133 with SMTP id u127mr3771975qkd.17.1501123380615;
	Wed, 26 Jul 2017 19:43:00 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	g27sm13221147qtg.84.2017.07.26.19.42.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 19:43:00 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 26 Jul 2017 23:42:14 -0300
Message-Id: <20170727024224.22900-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170727024224.22900-1-f4bug@amsat.org>
References: <20170727024224.22900-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH for 2.10 v2 09/20] vfio/pci: fix use of freed
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
X-List-Received-Date: Thu, 27 Jul 2017 02:43:07 -0000

hw/vfio/pci.c:308:29: warning: Use of memory after it is freed
        qemu_set_fd_handler(*pfd, NULL, NULL, vdev);
                            ^~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
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


