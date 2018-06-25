Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQpp-0000rs-7J
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:43:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQpn-0000rE-PH
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQpn-0007QJ-1A
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:07 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:44057)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQpk-0007PX-PI; Mon, 25 Jun 2018 08:43:04 -0400
Received: by mail-qt0-x243.google.com with SMTP id 92-v6so7286011qta.11;
	Mon, 25 Jun 2018 05:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=j6CqAxNTNqVw81Wnn61HPIr4uVr6dhnmtty1+UveJNg=;
	b=pL6KtTs45tQA7NU0xE4CWBokUISslrZQZE9ubE8rXU8xINe3SbYKQL2rZum3ZvCiOu
	/niXL9uz6cTek/s/feZ6yHbxzugj+Wo8ZHOYh9ErXEQZchiupESGmdIr2lnpssxM17qv
	SpprxqMAcPsdNGObPJssOYBvNr8GPnDwytObwJ5T4vjd+D+yB+xw4hhWLxSgTvU1Zj2g
	HVg1G94m199edng43ejwnTtynz8EumLx5NGlFqQKikvKsLkZUIge5C7cwNvtFb3QIyPi
	7TWMAJYe55p/DXrwGTWWkkAWaVhhuIVZ/O2JcEnlWKG0tKasxa5EOrWCVqov9llX+TaK
	SfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=j6CqAxNTNqVw81Wnn61HPIr4uVr6dhnmtty1+UveJNg=;
	b=CU68uim5ftBiV1WbCRGsU5a16iNYZM8F8ER1W6L4OfSrn7T3LkrzpnADTLBpQKHKRK
	w8inn7tRtNnxSEMNWdHbyMuMFP1KG8R4sjW3CJkdPsSlCm9feN25YhNFWVqYB3Lgylkn
	K8teqBTujcoAS0gs4bvA9FXf0K2eCOInlghU29Kgg1HiXRuI/s9nk6u9Yf6L56w8qtre
	Gy2vQDFHUCpXuUaUTuYtu/57NYu5i8c8M7164xX82Xw2OwusyAmGdbu+iFV9nuydBeLa
	aoK6nB24Uj4lr5/bNqEBR/dFwh6dLzW/YtgtdoIiPpz4EAi0zzFy82zw3AoCkO/sBUhS
	MbXA==
X-Gm-Message-State: APt69E1AkjmD5uPt5MtUC3fMPybOSC5FxRxkueRPhxs6UlqBTtDAQeNE
	K1Z7rEzKYctbhpm2sDzxqcA=
X-Google-Smtp-Source: ADUXVKIolTAG3wMZSonZH13ZaKn0viO8RkTwyYtGmW8tSMQwHCvwJezHs+KN+hPIuEv0YvgLoT1Cqg==
X-Received: by 2002:ac8:5393:: with SMTP id
	x19-v6mr10343274qtp.402.1529930584224; 
	Mon, 25 Jun 2018 05:43:04 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.43.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:43:03 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 25 Jun 2018 09:41:53 -0300
Message-Id: <20180625124238.25339-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v5 01/46] include: Add IEC binary prefixes in
 "qemu/units.h"
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
X-List-Received-Date: Mon, 25 Jun 2018 12:43:08 -0000

Loosely based on 076b35b5a56.

Suggested-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu/units.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 include/qemu/units.h

diff --git a/include/qemu/units.h b/include/qemu/units.h
new file mode 100644
index 0000000000..692db3fbb2
--- /dev/null
+++ b/include/qemu/units.h
@@ -0,0 +1,20 @@
+/*
+ * IEC binary prefixes definitions
+ *
+ * Copyright (C) 2015 Nikunj A Dadhania, IBM Corporation
+ * Copyright (C) 2018 Philippe Mathieu-Daudé <f4bug@amsat.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef QEMU_UNITS_H
+#define QEMU_UNITS_H
+
+#define KiB     (INT64_C(1) << 10)
+#define MiB     (INT64_C(1) << 20)
+#define GiB     (INT64_C(1) << 30)
+#define TiB     (INT64_C(1) << 40)
+#define PiB     (INT64_C(1) << 50)
+#define EiB     (INT64_C(1) << 60)
+
+#endif
-- 
2.18.0


