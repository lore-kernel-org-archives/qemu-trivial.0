Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQqE-0001G4-7l
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:43:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqA-0001BW-7Q
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQq9-0007aJ-8l
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:30 -0400
Received: from mail-qk0-x22b.google.com ([2607:f8b0:400d:c09::22b]:39732)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQq7-0007Z4-1R; Mon, 25 Jun 2018 08:43:27 -0400
Received: by mail-qk0-x22b.google.com with SMTP id g14-v6so7362177qkm.6;
	Mon, 25 Jun 2018 05:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VmXn4fH5z8BhfEDYfNwQajZx+eidFdphjSwi7Jl0LRw=;
	b=aKbSPljv+B8EcO7g88MzvPYyxNfUL5KffN55veL6BMtQh0mg6LZ0cWOhCqVvJ550Fm
	nu0NMIn6wADi5umVgM7G76salS2ALeN5XJOR6UE16Q675fz1wmiH37ZKU6PI1R5lsYO9
	q3w2rND56KfUmSmHh3s5TkkurkoDjfJQMnlOL5n24edgBAOWJgsSLhyTbJTLdaUQ2emC
	St91JIQ6aCUR3UCD320U3pIldfe2OiNedivrjEC97APsiQ/C6NLd3uQsTStquqejGL+3
	oPFa68cpTnBP/3kh+H2XqI7bISaRk6uMAL7KG5UEesXH4ErgM8HlZoKQITQXeULZvLWB
	YBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=VmXn4fH5z8BhfEDYfNwQajZx+eidFdphjSwi7Jl0LRw=;
	b=juw36Dl8kgF+lS64Uo3RtMcyalexz/ZJbgFIOlu0x4h6KcYPHtJ96UClPt+gPMv5m3
	ma6IIA4JVyrxpnlVoEKqlRUPjm+cQYCzKwjt4cSFS00d7RUfYphhWqLg5uCXbX+3Gy2m
	S3XVQOchUxqUgjeWJu9YruSZ913iECufi4woOYtFD17PNIQX+NCiRYiZcJswWEH7cqgO
	N0FIDfOtEhNpNSrrYBYTBVNJfY3jaF1B2P7SAR87+116JK4GRqgtAdEiL1fjF8xAtow3
	2Q4KvMk+XQir7WL8W++8mnHKN899VGSpITRpachYgXruCQzXPKjE5mjWp5k7tf98C5zy
	8peg==
X-Gm-Message-State: APt69E3zJsJF5clmtbv1eZZ53wCJClfJCoZ8M3cuymEPQEBvHsuROOh/
	vQOfoftwe+6ReKWZ0HARr5s=
X-Google-Smtp-Source: AAOMgpdjETZt4AhWs3wgG7TGL5FVxkrIxE1Ye5qgW1Ad2Al9kdfehA66odFe5m0pXVGVC0np72wBRA==
X-Received: by 2002:a37:85c5:: with SMTP id
	h188-v6mr10749997qkd.40.1529930606468; 
	Mon, 25 Jun 2018 05:43:26 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.43.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:43:25 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 25 Jun 2018 09:41:59 -0300
Message-Id: <20180625124238.25339-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22b
Subject: [Qemu-trivial] [PATCH v5 07/46] hw/ivshmem: Use the IEC binary
 prefix definitions
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
X-List-Received-Date: Mon, 25 Jun 2018 12:43:33 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/misc/ivshmem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 16f03701b7..9a9f990867 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -17,6 +17,7 @@
  * GNU GPL, version 2 or (at your option) any later version.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "hw/hw.h"
@@ -1302,7 +1303,7 @@ static void ivshmem_realize(PCIDevice *dev, Error **errp)
     }
 
     if (s->sizearg == NULL) {
-        s->legacy_size = 4 << 20; /* 4 MB default */
+        s->legacy_size = 4 * MiB; /* 4 MB default */
     } else {
         int ret;
         uint64_t size;
-- 
2.18.0


