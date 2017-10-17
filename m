Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V0V-00026M-2Q
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:46:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0S-00023L-EM
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0R-0003RX-LN
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:16 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:44432)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0M-0003Np-Au; Tue, 17 Oct 2017 12:46:10 -0400
Received: by mail-qk0-x243.google.com with SMTP id r64so2846886qkc.1;
	Tue, 17 Oct 2017 09:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=99iKmIqlXnTuP5F8/tUJPGMUeGCX1paUzqbbgtVSTbA=;
	b=MfAAA3768UkqlRWL+gVehFrw7TVebqRMif1qymVCtg9xkzfWcYC+WE9bY2yE24VNgj
	UYm0+n5OJtakaQlYdXiP6hGCzNEuWvdsBSovDUMObpSjpYQSs/GwpsM7a9K76XEc8Y5v
	h6SRzm7KbkYi9bt2UBg097S1DI+4BM+QtR3ysX52Xi82T93y2qoT4u0NTxI0fYEgRQCJ
	vC1uCoFXXgsRkvv8CjXTpHWjseCy9x/e53L26hxDzlE6yh7Ms2vFOpg1sexXWsyVmXCN
	JXdeIcz2DddXM5uGFsFfE+gN5ZaoDIRiFcKW5PBp7+Y0cV+cD759/V8gZZjwPe/fJWwt
	BuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=99iKmIqlXnTuP5F8/tUJPGMUeGCX1paUzqbbgtVSTbA=;
	b=Je3U2y7fyxG3Rybq5wWN+UzA7uol5KpS15++B+5cFMo3jf/AVH7L6i+5Mr1UI1gAx4
	+aZvSY3YbH2toHgFOsMdaaAoWNh+cxnYl4u4GjoAVsBkvMkBZHszHPjHKef/kXJFdsHl
	sZTiHnbn0MzrynX43ptJEOCFazHzTn4NmcH6HQ4BcVsoSk+Fvsi8TjZrlMTy4XamFCUB
	d9SAru1REctYi/f+RwhxXl7KhFpJOjN7s5ysVdsA+zMcoIL/1/Cekze4HsmneZMqnWr2
	HE1YJ4YjjMvzPslc1oqePnYA1tCKREqNrgfejiPIhfhAQPCSwI8Qpr+jUUdAKxng2cA/
	r0ZQ==
X-Gm-Message-State: AMCzsaVBrE9rnZ5Hf368CE4VgcOqjoC2vzQpIXWWNhf1d0poX/f7AGGD
	EaKlsSv9bUDBGWc+FJe+xb4=
X-Google-Smtp-Source: ABhQp+Qetu7m5kNrC0K9JD+RCc+YXbVR0OzULKWWBokQZYv+avvX4kzaGyt8w7bk33qQx3vcJi7fHw==
X-Received: by 10.55.149.70 with SMTP id x67mr19640532qkd.62.1508258769821;
	Tue, 17 Oct 2017 09:46:09 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.46.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:46:09 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:03 -0300
Message-Id: <20171017164426.25277-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v3 19/42] numa: remove unused #include
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
X-List-Received-Date: Tue, 17 Oct 2017 16:46:17 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 numa.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/numa.c b/numa.c
index 100a67febf..ebc553b5d9 100644
--- a/numa.c
+++ b/numa.c
@@ -29,7 +29,6 @@
 #include "qemu/bitmap.h"
 #include "qom/cpu.h"
 #include "qemu/error-report.h"
-#include "include/exec/cpu-common.h" /* for RAM_ADDR_FMT */
 #include "qapi-visit.h"
 #include "qapi/opts-visitor.h"
 #include "hw/boards.h"
-- 
2.15.0.rc0


