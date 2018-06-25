Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQrv-0002qS-5s
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:45:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrp-0002lE-T6
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:45:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrp-0008Nj-5l
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:45:13 -0400
Received: from mail-qk0-x22a.google.com ([2607:f8b0:400d:c09::22a]:43581)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrg-0008Kc-5r; Mon, 25 Jun 2018 08:45:04 -0400
Received: by mail-qk0-x22a.google.com with SMTP id j124-v6so549835qka.10;
	Mon, 25 Jun 2018 05:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uqWOl+vIVIHulXa3fbBPY58euCpO03Rrza0JJwjDkZE=;
	b=CCSKh8/wLKnXvlaUCh2a+geZg7SGGsI+P1Qk8qhob2BQW78CnFBE9UBFgPfVCucrgU
	OcIzQ7AEtbhqrfrHg3MljzmrjWzzwbQ9RmCFJZO+8CgsP89I0ItGMO9tGGlvTrqGNwHf
	LZeCF6bnR0P2vaJ1LDUBCnlfSYYDloWHz0UvdtfMDCjiU5eZQr5ObFl/SIZYT99pJI7n
	s0FKCJRQ6D2S82rbhOfilkISmsYFv6/sO+9HHDKynY/4Z4sOjC5THxC2V8diijxIgrlX
	B+7Zay91WbrQkcoRyeJ8h6KyZilxGpdhINpvdX0tF3hNVVznKvgDor+eRSa0lbozedwm
	RHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=uqWOl+vIVIHulXa3fbBPY58euCpO03Rrza0JJwjDkZE=;
	b=qSC5IbTiczcjpswycs7STQ/6uvrANpeN35ILyGUdvBN41S9wWmPZZa8oWa85qH52Jg
	xnoRhfXnO6+Q9aKQj8OWXQJ5uqg8JRmWEl6EvuKJp0Do3U8YdPZrFFuteO+JMlo60Knm
	8UtuB1T9RIOyJsECOImeySXNQvYT0HhuJmeXJN4j0WPNCgZilZyCh1WRMX0BNFBPhOcB
	biLmDPnxckGSyGlZF/dtvFTImzsUZqLEorgaOvELzZD2W4vktdR5S+wxWwbk2v7ycfUQ
	bvinBbEd2/bfwXau2V853sEn+W/k7ZfzDsqVzXLuy8zs4KTy6ieuv/Nf4bKkjBC0tbv3
	PBcw==
X-Gm-Message-State: APt69E1rop5k76RUQENd5IzabtdHJ1wnIAPsWeESksrePCMXSqP2MuCA
	YAlhui0m3RYwHyTtxrOE1M0=
X-Google-Smtp-Source: AAOMgpdArdwuLVB5NDnBcvmFMULmU7qdNsEOD6BVKCH0O+C150cv5EaCclXVPuP0ZEcdBtHi+bx7Xg==
X-Received: by 2002:ae9:f449:: with SMTP id z9-v6mr969023qkl.410.1529930703694;
	Mon, 25 Jun 2018 05:45:03 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.45.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:45:03 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 25 Jun 2018 09:42:32 -0300
Message-Id: <20180625124238.25339-41-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22a
Subject: [Qemu-trivial] [PATCH v5 40/46] cutils: Do not include
 "qemu/units.h" directly
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
X-List-Received-Date: Mon, 25 Jun 2018 12:45:17 -0000

All files using "qemu/units.h" definitions already include it directly,
we can now remove it from "qemu/cutils.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>
---
 include/qemu/cutils.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index 056e6629bb..cdb0f0db75 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -2,7 +2,6 @@
 #define QEMU_CUTILS_H
 
 #include "qemu/fprintf-fn.h"
-#include "qemu/units.h"
 
 /**
  * pstrcpy:
-- 
2.18.0


