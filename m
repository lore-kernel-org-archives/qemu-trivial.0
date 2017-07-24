Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi67-0000K9-Qb
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:28:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50358)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi65-0000G8-5g
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi64-0004uS-Dw
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:49 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:37455)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi62-0004sv-ES; Mon, 24 Jul 2017 14:28:46 -0400
Received: by mail-qt0-x242.google.com with SMTP id d10so1059506qtb.4;
	Mon, 24 Jul 2017 11:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5OpfPPEOYzhm/3tPM2HzXllTxulVPNmJ+4qRtkXYT18=;
	b=LH1LyckG0thoj7kk1jByhH65uJaTFa/dd5yM04+yckzcIzd7bbnQP0/P8t15DJ1XpZ
	hb9i8eLB5u8O1MukSyIdqyZOh/SdfMm8wV46fXPzRSbuOnC4nQ8vc5NMwgPUwzFo+hCI
	zvPphIxQMQkoELrbPF3PACwjvlLkPXIvIYbuiO8xnhzXurHdaTDAoNJroxwwr3ixdqYu
	FA9VOQxPP4+bZjdTEvSSLd7QdD/qPMpNArieqTjwsdlngE2Jn0dPm2ACIVA/viU4ba4g
	DQyj2V/uKRFmqfB003YiCM8ataX1nzc+9g1L930Srkmh3P01Z1ZYa4Erea3KGb+GVL8m
	gEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=5OpfPPEOYzhm/3tPM2HzXllTxulVPNmJ+4qRtkXYT18=;
	b=YN91gQjpaLUc0Zx+YBkUc8xBANWL6bSSZVAKSlC2dDEH5qorKX6DS2QvPNAYkZEjRB
	16PChFDNuBW/30l4B/4IZ1pHgy98AfwWt9aYAVs6Pem0/59Gp9ODLkIT7cgBQgoZArzs
	sIjcksnv6UmrjTZrkeiuOyHy12gaKh7boryz6JoJ66fvvD8qEY2f1ipfO6XWpmOeHFGc
	a5x8eGmRNXYuP37dBbqn6WW1WnPSdj1SjZeoglqHdhGs2WQuvjnahyQqKK7SUtjcvSnJ
	0fR/kniYlPtktvCZbDtG1UjWqLSD4B0tZdCwZ2QeRXGqjGiMALURml00pMb6yN0TBanw
	rKBQ==
X-Gm-Message-State: AIVw113Ub1BIKsklcJbiQjexCjhmjJLTRqoCxhdaXZ68wvc5diuRYu8D
	dE/JOrOTvNJMxA==
X-Received: by 10.200.52.138 with SMTP id w10mr21720259qtb.77.1500920925897;
	Mon, 24 Jul 2017 11:28:45 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.28.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:28:45 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 24 Jul 2017 15:27:28 -0300
Message-Id: <20170724182751.18261-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH for 2.10 12/35] vfio/platform: fix use of
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
X-List-Received-Date: Mon, 24 Jul 2017 18:28:50 -0000

free the data _after_ using it.

hw/vfio/platform.c:126:29: warning: Use of memory after it is freed
        qemu_set_fd_handler(*pfd, NULL, NULL, NULL);
                            ^~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


