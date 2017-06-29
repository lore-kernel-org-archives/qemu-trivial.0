Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dQb9w-0003ZA-HF
	for mharc-qemu-trivial@gnu.org; Thu, 29 Jun 2017 11:15:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQb9t-0003VK-Qa
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 11:15:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQb9s-00044I-VA
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 11:15:05 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:33780)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQb9p-00042z-7v; Thu, 29 Jun 2017 11:15:01 -0400
Received: by mail-qt0-x243.google.com with SMTP id c20so11639715qte.0;
	Thu, 29 Jun 2017 08:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TBcOzC3fSMGU0CAI6ZfycbOrHX5CpJ4PzPGdEGJZDTc=;
	b=Tt+1OizrjgJ2SGvr4IyxZaqlW7elCUnMKV5sl/PjTSiesR4BpxtejiDI30tOamr26Z
	wuC3U8CNesUCd9YWdO7SNYgKxVAXVGymWka1q2KAkvffpGFvSOdwJhe1pXrQo6Lup9ZK
	Fb08Gum58ugSYiSeiFlkxjm2+0gvkW1FWt6ZnGlMAxN1pA9bxe9e0yUhFhOUSWOYyMRC
	mU0O41AQpb2s4d0SUz2zSN4uhVVFWbbKOdsIK3LkuOoTl8QMmpLuWohWdqTa0CkhnPLJ
	O3zUDediRda2tfeQ9H2FDeLUfbpzzqErDsUpxGpx4vbBdxTcXmo7ZcbcVhYF9DiZ/Tii
	mbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=TBcOzC3fSMGU0CAI6ZfycbOrHX5CpJ4PzPGdEGJZDTc=;
	b=dROMc5whJquKfOksgtI0iedRJSwszTLrIrVxbe5QH9mVBSQusXFLgnVlSxwIBFUwJy
	5m8K4KYbJf3MkP0e9pi3G8lkuJjwQi0mTgR4lmBlPCqkQWcNfkGXMMlVsQWIy4vhVmAx
	9uQxgCo0y5o8alkt0QlWk2GfBv0OgXoNOv9itWoiFkjdYTLMWsGeGjB+kmzg9hiiaZ46
	HE8cL/njufVS+7RGY5TtpJyAFGmXen1Qt6yBSzcD5DJpeE5iAk8r8oEQjCTTmGDoS+3t
	E2alg1Ts7d8AZu1Tf3QuXsS6xrOrQxIoPS0a7X5VMPy3JzAnJtdOE6svVWXeRUcqRAfX
	JInw==
X-Gm-Message-State: AKS2vOxzMY5ZaelKHdyorIfqT+df4dgO72l6xbtexzlDaWrTEiZNkW6F
	FaYUDb8X4WOygReM+UKMTQ==
X-Received: by 10.237.55.129 with SMTP id j1mr19186196qtb.152.1498749300551;
	Thu, 29 Jun 2017 08:15:00 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id y6sm934585qka.55.2017.06.29.08.14.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Jun 2017 08:14:59 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Thu, 29 Jun 2017 12:14:51 -0300
Message-Id: <20170629151451.23453-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v3] hw/unimp: add missing include
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
X-List-Received-Date: Thu, 29 Jun 2017 15:15:06 -0000

inlined create_unimplemented_device() calls sysbus_mmio_map_overlap().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
---

This is a patch from my previous series "various easy cleanups".

v3:
- Add Eric Blake R-b

v2:
- Address review feedback from Eric Blake

v1:
- Add missing include.

 include/hw/misc/unimp.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/hw/misc/unimp.h b/include/hw/misc/unimp.h
index 3462d85836..52e068ec3e 100644
--- a/include/hw/misc/unimp.h
+++ b/include/hw/misc/unimp.h
@@ -8,6 +8,8 @@
 #ifndef HW_MISC_UNIMP_H
 #define HW_MISC_UNIMP_H
 
+#include "hw/sysbus.h"
+
 #define TYPE_UNIMPLEMENTED_DEVICE "unimplemented-device"
 
 /**
-- 
2.13.1


