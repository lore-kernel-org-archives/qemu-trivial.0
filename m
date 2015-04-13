Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YhgIA-0004A0-6E
	for mharc-qemu-trivial@gnu.org; Mon, 13 Apr 2015 11:28:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YhgI6-00043Q-5w
	for qemu-trivial@nongnu.org; Mon, 13 Apr 2015 11:28:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YhgI0-00042M-Ju
	for qemu-trivial@nongnu.org; Mon, 13 Apr 2015 11:28:50 -0400
Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232]:35878)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YhgHu-000410-05; Mon, 13 Apr 2015 11:28:38 -0400
Received: by wizk4 with SMTP id k4so77843113wiz.1;
	Mon, 13 Apr 2015 08:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=JGv08G24oKdmwXqVjYJ84miSccbDJwXVO6f6zKQftcw=;
	b=yHsnk/xW66fg+BPkJYSehmytWft80IyxTyDVfhlfGtyVn0W98UlabGk054HebDvN07
	8PtzGZRDC8YwC21JzeHuEedgjM8CV+MbWiasTudkER0Tiib96zWauDfcRs/3oxIoTZ7x
	pTCN4yfiENKwz6U3DzHyv2CMr5dvS/EWdqwSJvLW8JqhBvKx9b0VAl4aKA8aEUaidTmK
	9RFeQ2L3oxsxAFM5NiTkhkCvcHHyIdG2DNgKSKG5cUK7WGgZhHpPsvF1XK1bOfrtsLGv
	bdo+o+nPpLTyBPS2c+2qF9k+giXND1BG7zCHPlGAmN6ijruK+FP1GEhnaxoJzQb6QhR6
	zIRA==
X-Received: by 10.180.109.6 with SMTP id ho6mr22622686wib.58.1428938917370;
	Mon, 13 Apr 2015 08:28:37 -0700 (PDT)
Received: from localhost.localdomain (net-93-66-123-41.cust.vodafonedsl.it.
	[93.66.123.41]) by mx.google.com with ESMTPSA id
	es5sm11962299wjc.30.2015.04.13.08.28.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Apr 2015 08:28:36 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Apr 2015 17:28:27 +0200
Message-Id: <1428938907-93135-2-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 2.3.0
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::232
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] qemu-config: remove stray inclusions of hw/
	files
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
X-List-Received-Date: Mon, 13 Apr 2015 15:28:53 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-config.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/util/qemu-config.c b/util/qemu-config.c
index 2d32ce7..fba511a 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -3,10 +3,8 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "qapi/qmp/qerror.h"
-#include "hw/qdev.h"
 #include "qapi/error.h"
 #include "qmp-commands.h"
-#include "hw/i386/pc.h"
 
 static QemuOptsList *vm_config_groups[32];
 static QemuOptsList *drive_config_groups[4];
-- 
2.3.0


