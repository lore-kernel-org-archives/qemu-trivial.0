Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V0b-0002C5-2c
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:46:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0W-00027n-7Z
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0S-0003Sd-I1
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:20 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:49709)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0Q-0003Ps-KI; Tue, 17 Oct 2017 12:46:14 -0400
Received: by mail-qk0-x243.google.com with SMTP id q83so2837629qke.6;
	Tue, 17 Oct 2017 09:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=id9tjcUM09cNEgTmRhpO9COHWdOdMJH7AJE9y014LDk=;
	b=U8B5KMMTpN0UQVNU0FpxFjPbY+rJEhXauuYAJSpAGk1LlDtuNCv1uMvP4S/7nwedGl
	w+WBwJQCcmJp8sM+iQ5gwYrgS88we726dYMhERTZCLU8yeN4D5f+0SA6zhAyRfCp5r12
	tvBCxCuzvR7K3BGhZ98U6jdNZiijLikOXnf9g2eoMHsUX/0gT2bqaexHcuXs/YuialXa
	a+NGClAS3/bpkaGFJ5luDXQJhcd2hYrteFK/OCJsQxiGewoQ1A25guai74VQTEypnIaP
	HvBXI1L34piQt4Lk9Uuw97a5tGEi5F1kOkDaJjsrNNCI2Dbariu4pNXsoM6JzCWeV7iZ
	9HHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=id9tjcUM09cNEgTmRhpO9COHWdOdMJH7AJE9y014LDk=;
	b=F9GqhXfVNr/mDK1+wVQ+SnGeTfwmh2qNMx6r3uyqqjkKg4iMQjbujOh+4Rbbc3YXHo
	zSNleJfLqZrDmvmbLDcUGTAk6/XxrjRB8Fpu2qF0xv5A0iLVJ1EQEFDYINkdrnrO2PKQ
	pjz9N6hMQvWSfQGhnduGlr1o9NyFjKLsmznG5Gmkw7P5VlfadcS1Cj+ZRQyA8Rhty1t/
	Bo6YFHywp+flalqkpVvn3xjKh3OCK35iY5n4YIQRb+Oc9EpilSzPp0X6cupPKJc3hzWP
	vB5z0P0ewBU/3CYHVG2fyMlmMMK2TSj1XYCtB0cHaQibS32mEOrVrNLyu6uNjBi5m2cK
	2B/w==
X-Gm-Message-State: AMCzsaXcWcnVCWdnz6xrcBN5eYWmeJc5HYuqQilk3Bm1mLAGLHA8bh7B
	SNaX5PymW0u5Dd9FdGf/uoidoinq
X-Google-Smtp-Source: ABhQp+TVMX9f1J5J+0pNDFm+FYABEXtRUev1naFo4CwvL6ytXLz0i0fESOo206UczmQkLjfUBPTwAQ==
X-Received: by 10.55.214.201 with SMTP id p70mr19637844qkl.21.1508258774084;
	Tue, 17 Oct 2017 09:46:14 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.46.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:46:13 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:05 -0300
Message-Id: <20171017164426.25277-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v3 21/42] hw/misc/pvpanic: remove unused
 #include
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
X-List-Received-Date: Tue, 17 Oct 2017 16:46:24 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/pvpanic.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index 2b1e9a6450..3a0e4ba828 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -13,14 +13,11 @@
  */
 
 #include "qemu/osdep.h"
-#include "qapi/qmp/qobject.h"
-#include "qapi/qmp/qjson.h"
 #include "sysemu/sysemu.h"
 #include "qemu/log.h"
 
 #include "hw/nvram/fw_cfg.h"
 #include "hw/i386/pc.h"
-#include "qapi-event.h"
 
 /* The bit of supported pv event */
 #define PVPANIC_F_PANICKED      0
-- 
2.15.0.rc0


