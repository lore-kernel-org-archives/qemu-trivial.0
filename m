Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNRYN-0006wO-BJ
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 19:27:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRYJ-0006sJ-CV
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:27:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRYI-0000hG-H1
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:27:47 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:42999)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRYG-0000ez-IM; Mon, 28 May 2018 19:27:44 -0400
Received: by mail-qt0-x244.google.com with SMTP id c2-v6so16558960qtn.9;
	Mon, 28 May 2018 16:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=EecHgJPphNJxkdYH57YbXK+P3ldJPxf7atpzFDlTqdw=;
	b=UBTzwtN9rrBkOI3gYb8vsqS1+f0L8bjkM9Xq0aX8dgGP2q4Wdb+YIaC3hRljc+L5Vn
	4U1cyjQKVHj2e06297+ZjgIL+eIwmkUoxzIMww3PH8omgyG77QVDhckPJn2BlqKlZNMW
	3ntFN0oRTEkAsSR98herdAqdjJ05T53QGyXwq2bJnqI7lE/ZFDOZ5h2Qx41v0bdUi6C3
	xrBiYzkQI6k6do45/gqZeSDWYf7kYtF+FI4yGaOtXrmDfTFZo4ZS/D7cCaSHeE0ge1op
	/vr65UH0B9f1ZFbCTIdLYI4NKGvwSrD4jz4B9RitUKlzu8+ZLXFaFZD3hUdK6VhMK73h
	FaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=EecHgJPphNJxkdYH57YbXK+P3ldJPxf7atpzFDlTqdw=;
	b=suFo9pMg8tzTWM/GWF1qekye3b1WQqEvIemovLSAksEwXB1G8hxcdgtk4JDWJW+wm9
	O5HUn46THDraPYHQrqg/1J/gKWk+F72m1n/oHevyQWpDq+gZ8ct9L4QiiLEXojk2J3qW
	phxkXRdfs+QW8bcrgfJM9CdWJ9CuIL7asOAsSxYixxWCmevWv6yR6zYy3dTR9tO4yQjW
	NBIBahTAj0Sbt1Sc6YY1Q+X9MMkC7Y/x5kQ6tr9X9rGFs0TB36izpDwX3y9VdeqTxEIh
	Zpqdfy88zT3JPhFAYdXgc8nrzpV43SZ/9kKTtBgWIItFt0bgWOhbT0yCRMTpvrG84XW3
	BFEQ==
X-Gm-Message-State: ALKqPwe+ARGYP5NNw37vyjSu0ilXpzORC9vb8ecMJW+rMJwQd+mQT6oo
	mMeVm+aKq31t1v8Wyo7WLYI=
X-Google-Smtp-Source: ADUXVKLFr7X1igTDgK4kukndAwYCkYOzPC08lMk+DkKePoHdrXUr3IBEW8CSmfxzMiJ3FwA7YoaF8A==
X-Received: by 2002:ac8:24d4:: with SMTP id
	t20-v6mr13774354qtt.30.1527550064157; 
	Mon, 28 May 2018 16:27:44 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s19-v6sm23756182qki.62.2018.05.28.16.27.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 16:27:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 28 May 2018 20:27:02 -0300
Message-Id: <20180528232719.4721-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528232719.4721-1-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v4 04/21] memory: Do not include
 "exec/ioport.h" if it is not necessary
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
X-List-Received-Date: Mon, 28 May 2018 23:27:50 -0000

Code change produced with:
    $ git grep '#include "exec/ioport.h"' memory.c | \
      cut -d: -f-1 | \
      xargs egrep -Li "(portio|cpu_(in|out).\()" | \
      xargs sed -i.bak '/#include "exec\/ioport.h"/d'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 memory.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/memory.c b/memory.c
index fc7f9b782b..7ead90f8cd 100644
--- a/memory.c
+++ b/memory.c
@@ -19,7 +19,6 @@
 #include "cpu.h"
 #include "exec/memory.h"
 #include "exec/address-spaces.h"
-#include "exec/ioport.h"
 #include "qapi/visitor.h"
 #include "qemu/bitops.h"
 #include "qemu/error-report.h"
-- 
2.17.0


