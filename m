Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7sFv-0005B7-NW
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 19:39:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52770)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFu-00059H-4R
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:39:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFt-0002PY-EE
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:39:54 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:33636)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFp-0002Ld-9H; Mon, 08 May 2017 19:39:49 -0400
Received: by mail-qk0-x243.google.com with SMTP id o85so12375933qkh.0;
	Mon, 08 May 2017 16:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1TmHRKYqzolryi3glqFOSwDcXTPsas6OandRAW5oEN4=;
	b=rqBW/mD1f+eoIAoT3xVVfH9r53UKRNq05QZ4zgawfbEkNS5woPQm6l+oeEqEeFPImF
	E3iNJWEZVQkipwbkRuQv+2SaJR5lkRRvT4msuBQNGJ9/+7U5GcilB7CF6+h3llZn2u7j
	BfZDoChf0oCSi5vane78HyQxhzjOBOf/Sf4CJPv+51uZ9Hmh4hJQRqqSkg0UTT4QpZlw
	qJ75L6k/ndiQMYT1JXxYA+Xj+JQCBx6BG7qPM5+979uBLT/P5yX3ZSPLISwcxcYty4qd
	6+iQVjELzaZMHB/uDRA5J9qa9BVmbvPFCdwTtJ+3jy7fXC/qwPMH1pxbmn5EqZnRhC3W
	sDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=1TmHRKYqzolryi3glqFOSwDcXTPsas6OandRAW5oEN4=;
	b=KAIAeLtAsEGbpwe5oxjY628/YWW9jdHJV/hISPQd6OnUl6EancnNpj04KUOXUrnl0S
	ge2v8toDNDjTLRg2YiyHfzFzkizH/GZficlnTRI5syO9SP73tWAyF1wpnkeoZ6AM6TOS
	f+Ba+us7h7OQZSgvCOXclEbBUtrDxSARL9qBHDm8M5i0Pf21HHOw+chzKjhQmLxZQzqg
	p/5VcKFghBCw6lEL3m1lCoPIxkXInb+VW64zBNJK5ySq738Y0OF75milJW9/JxI2UoN6
	q+8GvW+HlfV4Uv0e8q+lqCuyDtCM3IvtKtZ480Iv6jk6iCrqWKRN+NP64XrRlt9AHXUL
	j2Cg==
X-Gm-Message-State: AN3rC/60onvBi91GDKQ9/iuntu3RVz7qbncONzrrHuMbFAuo+vxJNdeb
	NuG4e0ZyuB2UTg==
X-Received: by 10.55.160.88 with SMTP id j85mr30864831qke.200.1494286788859;
	Mon, 08 May 2017 16:39:48 -0700 (PDT)
Received: from localhost.localdomain ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	v64sm13556099qkg.38.2017.05.08.16.39.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 May 2017 16:39:48 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Mon,  8 May 2017 20:39:15 -0300
Message-Id: <20170508233918.9043-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170508233918.9043-1-f4bug@amsat.org>
References: <20170508233918.9043-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH 08/11] hw/sparc: use ARRAY_SIZE() macro
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
X-List-Received-Date: Mon, 08 May 2017 23:39:55 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sparc64/sun4u.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index d347b6616d..525d6f44a0 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -214,7 +214,7 @@ static void isa_irq_handler(void *opaque, int n, int level)
     qemu_irq *irqs = opaque;
     int ivec;
 
-    assert(n < 16);
+    assert(n < ARRAY_SIZE(isa_irq_to_ivec));
     ivec = isa_irq_to_ivec[n];
     EBUS_DPRINTF("Set ISA IRQ %d level %d -> ivec 0x%x\n", n, level, ivec);
     if (ivec) {
-- 
2.11.0


