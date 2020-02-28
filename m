Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7e7C-0008A2-K1
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 06:47:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41248)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7e79-00082a-GI
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7e76-0001Hg-4j
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:29 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26751
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7e75-0001HO-P1
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582890447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HcSl9tYPSfjtJ+NOfqsYRSXGvzeBOGmRpnqHEMwcJn8=;
 b=XDeZf28kYIGoxy4pG0EropZLszb0LOm3CmM1Rz2hxxQAbT9SzzVHyPp3pOhoUBntSrSP+Y
 PxwlXfPV4yAbsHvmIUCdTQ+qwycti3Vf7HFVg4Lc6Hnw5pOSFo74zxLityy8/eU39P/RJn
 IrnXlPWFR8MekQViCLgvkJNRggKKplE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-tcyzzgHEP86lzZXiVkpEAQ-1; Fri, 28 Feb 2020 06:47:25 -0500
X-MC-Unique: tcyzzgHEP86lzZXiVkpEAQ-1
Received: by mail-wm1-f72.google.com with SMTP id q20so25689wmg.1
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 03:47:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z3tIZiyEES4D3l4DiwJs/XjoxuErI+/O6hJWeBZfg4c=;
 b=oSBhlST0w+ZcRfab4n4UfAM34g3l53ivu/Yaktb3TtR0h9dH08IO3BNARaFfRl1+SX
 lawHctnXo3rSOAKP0u+gQd/x/jHTvPxV4mHtTph4kolWCke2VoeFQXc0OrvBt+6Dj6xB
 JwXEkXf6uKzs5rJw7qi460MJECWNOld+IO13ZUmcjhLJdEi5eaniYTP2dGp5glrKoQ2W
 V4Sp2HfVwSoFBQjBRLRMzf4+GFtY2M+qRS8NkNvzDYYFz/pDH+Y/oAWRnt+Q+NQKpvUE
 6mnDp8VbTqNqu+zqYmd1gTtcp1pu1wEHiAknjxaJwR4TZmExb1Er/H7E2XGdnwukf/8T
 KZLQ==
X-Gm-Message-State: APjAAAVCVPxwwkTvBOvc0gIusXc/u740B80d+bXql/CTLzBajAMBQTyM
 DKYSekWd6RObOtqh1e2Anw6RtlW0imJ+xFvFIFxFNdEK2lZgbZTGJoM8qIF5D6KXh3fBLb4lEcQ
 Z5wtrfanUL+Stz1l2KQ==
X-Received: by 2002:a1c:8041:: with SMTP id b62mr3826741wmd.76.1582890444563; 
 Fri, 28 Feb 2020 03:47:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqxU73H7mG32Ur+dSO5v+mK7xHg68/d9LWskB3pliSHUYr4inqpSvplnJ/QjyOkGPSYi9yvE+g==
X-Received: by 2002:a1c:8041:: with SMTP id b62mr3826732wmd.76.1582890444345; 
 Fri, 28 Feb 2020 03:47:24 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id f1sm12392933wro.85.2020.02.28.03.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 03:47:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:nSeries)
Subject: [PATCH v2 04/18] hw/timer: Remove unused "ui/console.h" header
Date: Fri, 28 Feb 2020 12:46:35 +0100
Message-Id: <20200228114649.12818-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200228114649.12818-1-philmd@redhat.com>
References: <20200228114649.12818-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Feb 2020 11:47:32 -0000

The timer models don't need anything from "ui/console.h".
Remove it.

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/rtc/twl92230.c | 1 -
 hw/timer/hpet.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/rtc/twl92230.c b/hw/rtc/twl92230.c
index 63bd13d2ca..d0011be89e 100644
--- a/hw/rtc/twl92230.c
+++ b/hw/rtc/twl92230.c
@@ -27,7 +27,6 @@
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
 #include "sysemu/sysemu.h"
-#include "ui/console.h"
 #include "qemu/bcd.h"
 #include "qemu/module.h"
=20
diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 8dbcbdca16..4f30dd50a4 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -27,7 +27,6 @@
 #include "qemu/osdep.h"
 #include "hw/i386/pc.h"
 #include "hw/irq.h"
-#include "ui/console.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
--=20
2.21.1


