Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z1ibc-0001yU-4i
	for mharc-qemu-trivial@gnu.org; Sun, 07 Jun 2015 17:59:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Z1ibZ-0001uf-6C
	for qemu-trivial@nongnu.org; Sun, 07 Jun 2015 17:59:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Z1ibY-00077B-4m
	for qemu-trivial@nongnu.org; Sun, 07 Jun 2015 17:59:45 -0400
Received: from mail-qk0-x233.google.com ([2607:f8b0:400d:c09::233]:36469)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1Z1ibT-00076l-Pd; Sun, 07 Jun 2015 17:59:39 -0400
Received: by qkx62 with SMTP id 62so69170267qkx.3;
	Sun, 07 Jun 2015 14:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=AoapN1Dt5P0wjG0W9VIDrV+IBYWfDIHsqxW3qkgnsX0=;
	b=UiJN3i0pUpZTewDhbm+0jAaSAnv/409MvMstdRabbLzVnd1TpgMLSrVEfh2BeUEQHF
	dncuYut5BX4/+LKnuW2t0qK/hyyXj53RQv54M40BijaXWz7XDh9JdW9lH8wKNX1hkbGz
	2WBdRCsUmWXaEV//bzJ5oA1x9dKWgqCuCIRrHY+ZzOSEWMHwUn5TgXfmvpBE86QUdebP
	qXN68p5AeGknJNDE+e/RiDNZXdnwCPIcBQouyZ88AFA1Tbeo7E6R7H/23HBBxW/+7KBw
	WKbv7TBUVCpiJAXZCXxmh6q5tFhPb/OKbHXUX4+xcu2hH5ULXJe+UTJNIXAH7qA3Ko7d
	/4Yg==
X-Received: by 10.55.41.211 with SMTP id p80mr26246221qkp.32.1433714378466;
	Sun, 07 Jun 2015 14:59:38 -0700 (PDT)
Received: from pcrost-laptop.hsd1.ca.comcast.net
	(c-24-5-157-48.hsd1.ca.comcast.net. [24.5.157.48])
	by mx.google.com with ESMTPSA id p84sm366658qkh.10.2015.06.07.14.59.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Jun 2015 14:59:37 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  7 Jun 2015 14:59:09 -0700
Message-Id: <1433714349-7262-1-git-send-email-crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c09::233
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PATCH v2] memory_mapping: Rework cpu related
	includes
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
X-List-Received-Date: Sun, 07 Jun 2015 21:59:46 -0000

This makes it more consistent with all other core code files, which
either just rely on qemu-common.h inclusion or precede cpu.h with
qemu-common.h.

cpu-all.h should not be included in addition to cpu.h. Remove it.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
changed since v1:
Leave in cpu.h include

Picked up by my multi arch WIP where target-multi/cpu.h cant handle
random core code inclusion without preceeded qemu-common.h. I guess
this is the only one in tree?
---
 memory_mapping.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memory_mapping.c b/memory_mapping.c
index 7b69801..36d6b26 100644
--- a/memory_mapping.c
+++ b/memory_mapping.c
@@ -13,8 +13,8 @@
 
 #include <glib.h>
 
+#include "qemu-common.h"
 #include "cpu.h"
-#include "exec/cpu-all.h"
 #include "sysemu/memory_mapping.h"
 #include "exec/memory.h"
 #include "exec/address-spaces.h"
-- 
1.9.1


