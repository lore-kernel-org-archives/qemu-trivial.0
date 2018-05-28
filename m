Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNRZV-0007w9-IS
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 19:29:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZT-0007ta-BC
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:29:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZS-0001oW-Dh
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:28:59 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:42902)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZP-0001js-4T; Mon, 28 May 2018 19:28:55 -0400
Received: by mail-qk0-x243.google.com with SMTP id j80-v6so8454162qke.9;
	Mon, 28 May 2018 16:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2vgDLMMOYLk8mEhn1wi7FHPumY6S9xLlWJFaqz5dmig=;
	b=vPjd+PDCoyC9UpEOOj7xUTnxysGmvIhEM80OpHFI2l9U25AqxfMmmkj7i1YbqyN9sZ
	QWH583mlIKXxXYnrauiROS/v2P3TWz6uvAN/NTZ3D9Rb5r7O58pma41WJGFfzcjyz2YN
	0fym4im/PEx+mb6rptOc4CVkukorpCc0mWcTdk73OYplP6dcFPyUcySwqBXAVvGBP354
	Kp/0uyY5jqm4lc0+FVrLXllB0RvJRXJZZhY8y2CKblJ4WD9Jlz+N2rAZTJ8PnBQU1nY5
	zu9koCrkr9GfpNovyloCaZQHr2k2wI13X3j6ZkTBRVK3YZivOTu3ZO57BX8SauX5O7iZ
	/pUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=2vgDLMMOYLk8mEhn1wi7FHPumY6S9xLlWJFaqz5dmig=;
	b=H20yDZpubvrv5T0HXXOISz/7fdx1B8Xatc7MR8mTj50YMOaanW9aJeOREz2L968D2g
	A81rsWBoMyPuiaoAE+mXYSCEIjOaoJpDVy14HYljrUfdM2QKMgDeYopOGvwaPMUjXmu9
	60i18GYxfQkA5SEzAjIKDes4i0aq+ZyrPICR0F+clUykE4cH+SwqWJD3tUkk1ziDbqgs
	CFLD7WyTW5VnvrKk1EBCu9QHEorYojm8RAX3KnNEDXe1F1GHvyKBNLyieKadvjIrZjA+
	f7XC+/ziRlv+qL0z3OJciw9OuiBVHG61m4LxfBZPZIMuxe/rj9sfsd9fS1wP0KTNgG6q
	1ung==
X-Gm-Message-State: ALKqPwdvMjB8XCfiAhlFPsIszUQQjMjP8bBNN9ZXvJ33ApewDPB60zYV
	MN7u2L+0J4QChPgBufnCr5pofgbIxWQ=
X-Google-Smtp-Source: ADUXVKLqHtsNJk6dtQQzYc5gY72MbPeGiOTzW3r7ihu1dbmYN/8J9BSORPVHCCWSLycV4f3okNa/lg==
X-Received: by 2002:a37:7183:: with SMTP id
	m125-v6mr12775550qkc.107.1527550134652; 
	Mon, 28 May 2018 16:28:54 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s19-v6sm23756182qki.62.2018.05.28.16.28.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 16:28:54 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Mon, 28 May 2018 20:27:15 -0300
Message-Id: <20180528232719.4721-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528232719.4721-1-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v4 17/21] hw/misc/sga: Use the correct ISA
 include
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
X-List-Received-Date: Mon, 28 May 2018 23:29:00 -0000

The SGA BIOS loader is an ISA device, it does not require the PCI header.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/sga.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/sga.c b/hw/misc/sga.c
index 97fd63f176..4a22a52a60 100644
--- a/hw/misc/sga.c
+++ b/hw/misc/sga.c
@@ -25,7 +25,7 @@
  *
  */
 #include "qemu/osdep.h"
-#include "hw/pci/pci.h"
+#include "hw/isa/isa.h"
 #include "hw/loader.h"
 #include "sysemu/sysemu.h"
 
-- 
2.17.0


