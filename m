Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7sFq-00054x-1p
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 19:39:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFm-00050x-JL
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:39:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFl-0002ID-Va
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:39:46 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:36032)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFf-0002Gz-Du; Mon, 08 May 2017 19:39:39 -0400
Received: by mail-qk0-x243.google.com with SMTP id y128so12358025qka.3;
	Mon, 08 May 2017 16:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8uwheOKeCmRV5mhltlebMjCFz4+QILRrZD9M22Zm3DQ=;
	b=G+WyYT+hF/su3788alV9IXXX/Fe29q7Xu5NVEKXM78HVi25ymQdw7DLHVnO0KH33tB
	VCS2MzmMmXbYBgZ6NMdIjiNp0JYvlnrPh/76TL/V/h3Mm1Ux0L45MJOC35HJfZQts18O
	ZbjPd/PSHnmL7mFEplX5kwl+yw8QvvLSGWzGuJJrRy8t+RLrPZDmLWNz6J+1A2wSfcLe
	g0Rc6aF149zg4WR0s3c2106FdAwCOHB7CzC0KBrNfzp4yKzh0B/6G6JKIXk+JNuOSN3L
	zLd3F00ew5Y0bcym69Rsd8VbDQgtgqZ6mMGakLQXo+87r62zVbRt9GxKUNS2JcDHPF+2
	nwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=8uwheOKeCmRV5mhltlebMjCFz4+QILRrZD9M22Zm3DQ=;
	b=TnWsbN5u1JoYiuLpRBijEbkYDZkyHsKEB6tAayeCVyqO6vruX8FeR2lKCDcMfIii0L
	CLOqoYKUSRFgMGrNBZzYy3xzBR7ENtsrRQUy+yOWVpl9uxO5aNGN5NSfcTzwUvEGbBgE
	zE8c10fTLlswEewhPhP+r9lKfHfcLzVXzb8K7LadweiWrUiJdT9EkGsZJ6pXbzuQFYuB
	KJQuYmiYpxT8lmuKpGsdTL6yPEoCm15az0h/j73aQsdpUnxcQDVZZpg6RiqhhYcsI/Zn
	udYBKwUkXhEzd3KWFTwRO9F8o7N3OZ9t2wFOAgZGdTWVdqOdIAQcMcAm1nkm/p1wRLJX
	4xoQ==
X-Gm-Message-State: AODbwcB9YZfrPaWkhJtMkA0GdH0fOS+V9/+jCkTRx7qKndva8aOA3PU5
	KDXVMN7RrYRGCFL9190+Mw==
X-Received: by 10.233.235.12 with SMTP id b12mr27564519qkg.75.1494286778753;
	Mon, 08 May 2017 16:39:38 -0700 (PDT)
Received: from localhost.localdomain ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	v64sm13556099qkg.38.2017.05.08.16.39.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 May 2017 16:39:38 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Mon,  8 May 2017 20:39:11 -0300
Message-Id: <20170508233918.9043-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170508233918.9043-1-f4bug@amsat.org>
References: <20170508233918.9043-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH 04/11] ide/ahci: add missing includes
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
X-List-Received-Date: Mon, 08 May 2017 23:39:47 -0000

qemu/include/hw/ide/ahci.h:260:16: error: field ‘sglist’ has incomplete type
     QEMUSGList sglist;
                ^~~~~~
/qemu/include/hw/ide/ahci.h:272:5: error: unknown type name ‘IDEDMA’
     IDEDMA dma;
     ^~~~~~
qemu/include/hw/ide/ahci.h:273:5: error: unknown type name ‘IDEBus’
     IDEBus port;
     ^~~~~~
qemu/include/hw/ide/ahci.h:305:15: error: field ‘parent_obj’ has incomplete type
     PCIDevice parent_obj;
               ^~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/ide/ahci.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/hw/ide/ahci.h b/include/hw/ide/ahci.h
index 0ca7c65820..293f9ebcd0 100644
--- a/include/hw/ide/ahci.h
+++ b/include/hw/ide/ahci.h
@@ -25,6 +25,8 @@
 #define HW_IDE_AHCI_H
 
 #include "hw/sysbus.h"
+#include "hw/ide/internal.h"
+#include "sysemu/dma.h"
 
 #define AHCI_MEM_BAR_SIZE         0x1000
 #define AHCI_MAX_PORTS            32
-- 
2.11.0


