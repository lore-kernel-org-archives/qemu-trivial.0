Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi6D-0000VR-Jm
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:28:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6B-0000Tc-Sk
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6B-0004yj-1w
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:55 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:35752)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi67-0004wI-LM; Mon, 24 Jul 2017 14:28:51 -0400
Received: by mail-qk0-x243.google.com with SMTP id k2so3225250qkf.2;
	Mon, 24 Jul 2017 11:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=D0eU/e1OvdEUWI9GKpUGvB63Pm/ycvAQCEHQZFTxTPo=;
	b=L+VQc3Og5nCDQFxkgi5btjuIGT1qBAVsrXUxlarz8TQV8IJT2BzjSqT3wzwEIp/emy
	/j+TtuAoOJ1jWwLNYAOxtoSqQJJelVJOqTnf08uOtrzF73c5JxqSFJYnhiKjXOcX9jxe
	9mKQ+crlp8QHNqFG1ZToKknsmiP28HkbWokjF/hUuFSFigX2X/75bNC5Rb4xJmaw9G8S
	lhoq/Cvk90yLXDchyPtQWEuXgyE8mHNn90F15RuqjFh5IYNe13EB3leXSdaXkMKcytZ3
	Gu79iVkr6AgZ2BcekQmNahTFOlKuViMOwmD2bEqxEbvf+dTob3RgCJ0Q00p5aZJINx3Z
	8TFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=D0eU/e1OvdEUWI9GKpUGvB63Pm/ycvAQCEHQZFTxTPo=;
	b=NjgI/58yF508lycrFc+1QspSwKdqKPbodKW4ilZpzbjHw0A7riHj36qOl/T7vJ25md
	mvO/CxRtENKOY42/d8h/Kyda9Vs0GQ/3c5x8mhLpk852pT8XgOHkYXwUoL6/MMtVyZpi
	McCZknBLwwjERtAOZc9CH2NanQRsUgEx/qnYOtGeqH059z0o3eI/9Fqiy6N4MR/F+AcZ
	acsX4p0KcGurQriRHo/n09F9GEZIjO7HkEc6ve1v0mlei2mQHmIeZ8ncdVMvDRXg26Vh
	IJv1eBddVjF0eqbjCE7K83tE27zr4nlqsOQYbdj0XI8KdTMK4BsBfbn3jex30m70uO6L
	vx5w==
X-Gm-Message-State: AIVw111pIV16BYupPvym0bbIY8u9EhDPhSrJ+M/E/f6cdtzrUrpZI/6d
	wf36tFthhRDy7w==
X-Received: by 10.55.20.144 with SMTP id 16mr20124607qku.51.1500920931218;
	Mon, 24 Jul 2017 11:28:51 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.28.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:28:50 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 24 Jul 2017 15:27:30 -0300
Message-Id: <20170724182751.18261-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH for 2.10 14/35] vfio/ccw: fix incorrect
 malloc() size
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
X-List-Received-Date: Mon, 24 Jul 2017 18:28:56 -0000

Since sizeof(struct vfio_irq_info) < sizeof(struct vfio_irq_set) a heap overflow
never occured. Still, let's use the correct size.

hw/vfio/ccw.c:170:16: warning: Cast a region whose size is not a multiple of the destination type size
    irq_info = g_malloc0(sizeof(*irq_set));
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/vfio/ccw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 12d0262336..8d97b53e77 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -168,7 +168,7 @@ static void vfio_ccw_register_io_notifier(VFIOCCWDevice *vcdev, Error **errp)
         return;
     }
 
-    argsz = sizeof(*irq_set);
+    argsz = sizeof(*irq_info);
     irq_info = g_malloc0(argsz);
     irq_info->index = VFIO_CCW_IO_IRQ_INDEX;
     irq_info->argsz = argsz;
-- 
2.13.3


