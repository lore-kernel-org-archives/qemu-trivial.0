Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daYlT-0005Xf-Vc
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 22:43:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlR-0005VL-Ti
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlR-0007ws-2i
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:01 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:38139)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlO-0007vE-Bc; Wed, 26 Jul 2017 22:42:58 -0400
Received: by mail-qt0-x241.google.com with SMTP id p3so8854926qtg.5;
	Wed, 26 Jul 2017 19:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pZFKqLV1gJpCvNiT0z0fbskPW12c+hsdrqpOQ7TLt84=;
	b=oMG9IXabOUT7aAkG5DLTHFy9MIEWbel39+wHhd/Sb0KJXy+xQPui5/lmDNLO3d9z8V
	8wm6EUc1zjJVOB7xrqxzIRyMXw508O/ycF4PNk74yHad0QMLVNRR5hlKDp7MXOKDawhs
	1/ZlneWviUK/Hft4JD7jsp2C0kqqZkxU1ehl3bT1/TbCWr8K4wHWDgydlx8xeXaS/MWY
	OMPS54pJmFsi3sdDmzkzXcD1srgHciAm1un+NvBXjbeOK6+4JJg3IRW+WwZsB6ZGRy1F
	YQlk28KInx/aJY5GVlZ9ZL/oIy84AyPAQMZhZ7uBfSD8C/L34VwkYw79Ct210TEkZjX7
	ZkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=pZFKqLV1gJpCvNiT0z0fbskPW12c+hsdrqpOQ7TLt84=;
	b=swYxLtUB9hm5o0OFh1Iyi6scLzFfRjvZcV/4mb0lV61Y4DLXodawz5Oq35koDQY++s
	2G/8hFvdUN+XG3jvAyz0q7391PANTeuRHjFNDzsT3zakVloZgAVuNERLEQtdvmr8lEgh
	BVBktWSdAWOX36SoaOp3FtVN2LqXjukD55WTW7yBIdklwnQdj5/nUpbJqGfi4q+VO4NE
	x62v46A2DVa5i6XyiVRksXHhNE4vJTdv1KHC07YrqG2eCveRSIXhb/ilv00Z+ukcJHqH
	6WPEIXmTHzNwEm9bnzEW3ja3z26W906W71611WbDUUi8yFriZmBdL7clz5b1hEuEvJQM
	XbJg==
X-Gm-Message-State: AIVw112Yxsll/AYYRCLlLsORXwJKO3pfTaw8SZLhfQx/VU0c4vYN1VyH
	HPtSQq4JnDL/xw==
X-Received: by 10.237.56.73 with SMTP id j67mr4310013qte.51.1501123377873;
	Wed, 26 Jul 2017 19:42:57 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	g27sm13221147qtg.84.2017.07.26.19.42.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 19:42:57 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 26 Jul 2017 23:42:13 -0300
Message-Id: <20170727024224.22900-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170727024224.22900-1-f4bug@amsat.org>
References: <20170727024224.22900-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH for 2.10 v2 08/20] vfio/platform: fix use of
 freed memory
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
X-List-Received-Date: Thu, 27 Jul 2017 02:43:02 -0000

free the data _after_ using it.

hw/vfio/platform.c:126:29: warning: Use of memory after it is freed
        qemu_set_fd_handler(*pfd, NULL, NULL, NULL);
                            ^~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/vfio/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index 7c09deda61..da84abf4fc 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -120,11 +120,11 @@ static int vfio_set_trigger_eventfd(VFIOINTp *intp,
     *pfd = event_notifier_get_fd(intp->interrupt);
     qemu_set_fd_handler(*pfd, (IOHandler *)handler, NULL, intp);
     ret = ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irq_set);
-    g_free(irq_set);
     if (ret < 0) {
         error_report("vfio: Failed to set trigger eventfd: %m");
         qemu_set_fd_handler(*pfd, NULL, NULL, NULL);
     }
+    g_free(irq_set);
     return ret;
 }
 
-- 
2.13.3


