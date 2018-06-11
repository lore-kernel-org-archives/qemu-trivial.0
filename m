Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBQk-0004Y2-Cp
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:15:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBQg-0004Uk-On
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:15:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBQf-0002Jo-Sj
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:15:30 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:34821)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBQd-0002Hz-IQ; Sun, 10 Jun 2018 21:15:27 -0400
Received: by mail-qt0-x244.google.com with SMTP id s9-v6so18863770qtg.2;
	Sun, 10 Jun 2018 18:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BTVCmLBIzAQs2Xn/yJmNLX7DQneA5MVNx58ZgswTROc=;
	b=MfCmF95VJID497RFK9WqX6uJd4J8M4Ftlrbs5sIEuzfvUCIEh3IR3yKpgYkd/MM4uU
	aMlm/tjfYZDLEQlZ64UAFyfZWStQMG4XW/fGmpCwEH5RpWNm04niLEOZaYg+V4BRU6Ay
	XU00iMLIrX2Xd2JWS9Pxl7PzY/71k7ZU0VCFNKfecpZp7E9JLw0ALEXCOllFZK8j8CqL
	2fnxYlS+8I567H33cMC00G2MrgZkT0/4yHQ30zUSpwibWwNiUhM9G3P9BbOVq5bhM3+s
	r0kadONHfQU7P58VCkVaqGH4VN1aJ9LU1ecO6G5y6TewW4Zev6RXBMXELHnpWdTTYD86
	e9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=BTVCmLBIzAQs2Xn/yJmNLX7DQneA5MVNx58ZgswTROc=;
	b=j5OBMjtEQvqGEFzVq/p/jH4FZUq5LJw4z5QTt3wWVNtwn7Rk9ZWo/Yy0z/fuZ64zDI
	PB21NqtoINqOaSvYBFSlUY+AegLCAtbwyRoGid3IB8u+GJXxNIMRvnNIzYpvAzyLmefc
	VJbnt2wouxnOH10ojEnK86QeRoWz3SD0BoCkVvIrUdw8dbq9nkVNOuhgPdZrjYK7V6pk
	tqZu6sSxJVclwNCrcDZEf5ZiimIZmLbHwP9RR0ELngaxUdfK4ZhxLMwlF46zjHbYIPI+
	h+8hK3mFMZ0wpyBAs/F2q54P/81llKqKMGldqQPVrCA1cMNmx8+SfNd32Gi0TCLXsejO
	lH3w==
X-Gm-Message-State: APt69E1EGtrqwqTSw8sxXeiBJTuQU/KoEOb0g3i1itaoHLnTh9T3k09t
	dDrKLJQKNH6aK9vNjpqM6WA=
X-Google-Smtp-Source: ADUXVKJnvPyu+CkMByfmiE6fseAsMLschGTWnSdkvwjVwXPglsw060As5bgCd7iF2NCw88LCSCoGBg==
X-Received: by 2002:a0c:e74c:: with SMTP id
	g12-v6mr13504237qvn.203.1528679727125; 
	Sun, 10 Jun 2018 18:15:27 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.15.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:15:26 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Sun, 10 Jun 2018 22:14:22 -0300
Message-Id: <20180611011501.10235-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v4 01/40] include: Add IEC binary prefixes in
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
X-List-Received-Date: Mon, 11 Jun 2018 01:15:32 -0000

Loosely based on 076b35b5a56.

Suggested-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
I suppose the following warning is irrelevant:

  WARNING: 1 added file, does MAINTAINERS need updating

 include/qemu/units.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 include/qemu/units.h

diff --git a/include/qemu/units.h b/include/qemu/units.h
new file mode 100644
index 0000000000..e3a39ed59e
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
+#define KiB     (1ULL << 10)
+#define MiB     (1ULL << 20)
+#define GiB     (1ULL << 30)
+#define TiB     (1ULL << 40)
+#define PiB     (1ULL << 50)
+#define EiB     (1ULL << 60)
+
+#endif
-- 
2.17.1


