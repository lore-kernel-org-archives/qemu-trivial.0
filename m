Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yx8X0-0005aN-Aw
	for mharc-qemu-trivial@gnu.org; Tue, 26 May 2015 02:40:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Yx8Wx-0005Uf-7a
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 02:40:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Yx8Ww-0001AW-Es
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 02:40:03 -0400
Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229]:36861)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1Yx8Wr-0000tP-7n; Tue, 26 May 2015 02:39:57 -0400
Received: by pdfh10 with SMTP id h10so83697304pdf.3;
	Mon, 25 May 2015 23:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YV0kFc0A8hhmnhogcyOCD3YdvBBDB2o6cIe7nZt0Xw8=;
	b=Dj4HxzAUofjIv9XKMvHWx5YLVZyBXpWrmEKJZdiyWTbjQX4mdwrJ07QnE8OZDhUuSu
	4caL5z8dGPdMxf8gtx87/uApNlsGTbJXaKaXkAmrjmHIiAT4l2lE0MtKjyU72hOzjoXw
	OLYh53mvpWVCQ3q/ZtgZchj8I5e5z+U3HoW26PRqs6ZoqqYGn+f2/28YYqR1HSSzpi6Y
	cJTXwDh+jCpwM8BUyKQVfRLTpuaWDW5FT+SFMVJU23FHMG5NpFnqcURhkdkz5Hxrvggb
	2KzZlQP2+/cd4ouM8uzum05//F5Rq7FtmuooiUqUT6Q86twdIP0sk1oTrZedI70bh0tm
	iu9A==
X-Received: by 10.69.17.130 with SMTP id ge2mr45412004pbd.75.1432622396215;
	Mon, 25 May 2015 23:39:56 -0700 (PDT)
Received: from pcrost-laptop.hsd1.ca.comcast.net
	(c-24-5-157-48.hsd1.ca.comcast.net. [24.5.157.48])
	by mx.google.com with ESMTPSA id a5sm11888995pdk.58.2015.05.25.23.39.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 May 2015 23:39:54 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 May 2015 23:38:22 -0700
Message-Id: <1432622302-6798-1-git-send-email-crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::229
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PATCH] memory_mapping: Use qemu_common.h include
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 May 2015 06:40:04 -0000

Rather than an explicit inclusion of cpu.h. This maked it more
consistent with other core code files, which either just rely on
qemu-common.h inclusion or preceed cpu.h with qemu-common.h anyway.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
Picked up by my multi arch WIP where target-multi/cpu.h cant handle
random core code inclusion without preceeded qemu-common.h. I guess
this is the only one in tree?
---
 memory_mapping.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/memory_mapping.c b/memory_mapping.c
index 7b69801..7cf5548 100644
--- a/memory_mapping.c
+++ b/memory_mapping.c
@@ -13,8 +13,7 @@
 
 #include <glib.h>
 
-#include "cpu.h"
-#include "exec/cpu-all.h"
+#include "qemu-common.h"
 #include "sysemu/memory_mapping.h"
 #include "exec/memory.h"
 #include "exec/address-spaces.h"
-- 
1.9.1


