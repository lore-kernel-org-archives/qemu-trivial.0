Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rJn-0005CZ-Nh
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:44:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJl-0005Aa-EJ
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJk-0000lg-6J
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:44:21 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:33678)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJk-0000lM-2F; Sun, 15 Apr 2018 19:44:20 -0400
Received: by mail-qk0-x243.google.com with SMTP id d206so14812297qkb.0;
	Sun, 15 Apr 2018 16:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5f4f9a+X2jStmfQlOsnI45MDPYJWa8FAJMJMd1DmxQw=;
	b=e0E7gu2xk93FUfab9Jq4vPwVkE+rKqlrGpgnZJMQ/DCUrIuDnNdEH7+mlar8nO5U6d
	Q6TiMBUEvzgcLfLwpVQ666fC7VIn5WtQSZlGw0JNB5GDgGXlQgeRB9OMYFs7XzVm4WD7
	Rgh+IGX00kEW5nUqXD+BOCQyPBDJm1CZ6p1KBCruRqHceMWXz1NGXj90ZulOMUYHHzad
	RL613EvVCov2AS/uXAaMPnm4cOON1t/+4hS7Z2W5QEPqy+9ghyg/e0JkI8lhvDtJr3+o
	+E3f/Ft7MoLc6YgIB6SecQHW/r7Ch/FcrZ2HZ2bVpntxpbExrJN1DG8ipyoOnSMUmJRK
	cOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=5f4f9a+X2jStmfQlOsnI45MDPYJWa8FAJMJMd1DmxQw=;
	b=UHpzKqCuvTdZzBJD+5vA9jOFk4vz334UhlCHuU37+KCJdRMeIPh17HrE+3+6wCn1Ks
	14BZqmnHVCRuEWdxWc/n1xMV+QObeNVXXX+8axSc2xkQCXvBGBi3EKwAUSZ7pKE/i4LV
	9eMP4RtlnYznyrFzz8aDbUkpFijKf3QIY+6uuX8TfIqnIvNcrv/F1COuBcoUczGttb7o
	9PfUsFFvk0SEX6fkBan7w3V7B1ZHkvEYSjXQ05ZZoeDRA6n0nWQnMnuladiFxu6RYbSG
	r0phOhnXgLzgombgW40faCXEOsnNN0LX5UNWm2dnhDJ5zZ0HHLUPzqVQVFosfTEoPc+q
	gXug==
X-Gm-Message-State: ALQs6tCDX5b9Zst8o5NMca1NvTdqibGroHxc0Gk+pSU3g333nMhYAnB8
	eVVJ0SZDDzJYHYcvDCzwl0kUlCLT
X-Google-Smtp-Source: AIpwx49iPMX1CX6do+koIMBEIGYm4pb+qKvQwGibvmyMhgs3TAeMRA4RdwDRVslMp43q40W9g7sBuQ==
X-Received: by 10.55.4.12 with SMTP id 12mr1748122qke.277.1523835859266;
	Sun, 15 Apr 2018 16:44:19 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.44.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:44:18 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Alexander Graf <agraf@suse.de>,
	David Hildenbrand <david@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x@nongnu.org (open list:S390)
Date: Sun, 15 Apr 2018 20:42:45 -0300
Message-Id: <20180415234307.28132-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v3 19/41] hw/s390x: Use the BYTE-based
 definitions
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
X-List-Received-Date: Sun, 15 Apr 2018 23:44:22 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/s390-skeys.c    | 3 ++-
 hw/s390x/s390-stattrib.c | 3 ++-
 hw/s390x/sclp.c          | 5 +++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
index 76241c240e..a95373af94 100644
--- a/hw/s390x/s390-skeys.c
+++ b/hw/s390x/s390-skeys.c
@@ -10,6 +10,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/boards.h"
 #include "hw/s390x/storage-keys.h"
 #include "qapi/error.h"
@@ -19,7 +20,7 @@
 #include "sysemu/kvm.h"
 #include "migration/register.h"
 
-#define S390_SKEYS_BUFFER_SIZE 131072  /* Room for 128k storage keys */
+#define S390_SKEYS_BUFFER_SIZE (128 * K_BYTE)  /* Room for 128k storage keys */
 #define S390_SKEYS_SAVE_FLAG_EOS 0x01
 #define S390_SKEYS_SAVE_FLAG_SKEYS 0x02
 #define S390_SKEYS_SAVE_FLAG_ERROR 0x04
diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index 70b95550a8..7a4a4e61d3 100644
--- a/hw/s390x/s390-stattrib.c
+++ b/hw/s390x/s390-stattrib.c
@@ -10,6 +10,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/boards.h"
 #include "cpu.h"
 #include "migration/qemu-file.h"
@@ -20,7 +21,7 @@
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
 
-#define CMMA_BLOCK_SIZE  (1 << 10)
+#define CMMA_BLOCK_SIZE  (1 * K_BYTE)
 
 #define STATTR_FLAG_EOS     0x01ULL
 #define STATTR_FLAG_MORE    0x02ULL
diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index 047d577313..4cd6548d49 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -13,6 +13,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "sysemu/sysemu.h"
@@ -288,8 +289,8 @@ static void sclp_realize(DeviceState *dev, Error **errp)
 
     ret = s390_set_memory_limit(machine->maxram_size, &hw_limit);
     if (ret == -E2BIG) {
-        error_setg(&err, "host supports a maximum of %" PRIu64 " GB",
-                   hw_limit >> 30);
+        error_setg(&err, "host supports a maximum of %llu GB",
+                   hw_limit / G_BYTE);
     } else if (ret) {
         error_setg(&err, "setting the guest size failed");
     }
-- 
2.17.0


