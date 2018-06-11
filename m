Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBRt-0005cJ-Qw
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:16:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRr-0005XU-Jw
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRq-0003CZ-IF
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:16:43 -0400
Received: from mail-qk0-x234.google.com ([2607:f8b0:400d:c09::234]:42995)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBRl-00037N-Qm; Sun, 10 Jun 2018 21:16:37 -0400
Received: by mail-qk0-x234.google.com with SMTP id j80-v6so12056289qke.9;
	Sun, 10 Jun 2018 18:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kLCoZ0LRFan9Viz3NI54Wxwq5XOpk5xuLF5Z3/6sRS0=;
	b=I9qtYUQxl1E9GyoTAnwqEhMKCxQdK0t0Q9IOdNjzc+1cxvGxKgn8MR3xzdG1DUZu1y
	bgyLmdxibyX+tR8QTKSpsKuJAxIQTpxhm8Iu35jbS5GQYAoeh6fhCpc4v1DNsC9QfMyY
	S0Nk5kI7PmiQsFuRFRJZJS2REDN6+plDleMPwZViXSy7Jp8s0t0OiwLXTmco5lMkky4C
	vaJxEx1WyMFqujkAgqAUIKkbHHB/0zxWsRwU5vNwCumvFt0T6ojqk0vfQmnZObAdl6je
	9bA6KeDBHJBz56rhkFqwdh20wFSh6Lw20JWxlhplKn/e9yRzjsYgK5C2TRBqTeA426iu
	lJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=kLCoZ0LRFan9Viz3NI54Wxwq5XOpk5xuLF5Z3/6sRS0=;
	b=rVLIh7CJykCjQTwUXTNdT5ERxA5hNADNuCHyeGQWgfoXwyM3/EkbC6lcKz9xU834A8
	JhqDMzSNEpg9xGpxG71D+5tRX6p39Q5k8P8JeX0N+K88b/UhXVlLxOlbyicKJpKkxVLW
	4/HuY3hIE1lnM3KRLLB6XbE5lhLT/HJkMyPh5748OftEqXSuhj/CuLFJoYrERCPm/dy7
	dcL4B7woBD4DSmIUKwT2/B7kzcRcY/AJKqvjOdXUuiU9aCu2BwDTlvomsWkSWOjYsERb
	Ic3umnTuUtQuR+jvzcMuF3QtaxsiU4FmMaBIp3PK9l4daPGKX1Kgoh84AgJojrJvaBLy
	XoXA==
X-Gm-Message-State: APt69E3xvEitRdeHTNC0OEWJlbRpp8Li1f4Zts8CLWbxYM12d25+H4CR
	74WGcj3OOAaDfTNgRcG54QU=
X-Google-Smtp-Source: ADUXVKITGhbAhlHJOvp2/wfWiJOrmMD1BMLssqI5FcSrj2TJTT/pFt8HycJ6TJU0+SexU0g09Ia3LQ==
X-Received: by 2002:a37:285e:: with SMTP id
	o91-v6mr12744736qkh.129.1528679797347; 
	Sun, 10 Jun 2018 18:16:37 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.16.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:16:36 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Richard Henderson <rth@twiddle.net>, Alexander Graf <agraf@suse.de>,
	David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x@nongnu.org (open list:S390)
Date: Sun, 10 Jun 2018 22:14:40 -0300
Message-Id: <20180611011501.10235-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::234
Subject: [Qemu-trivial] [PATCH v4 19/40] hw/s390x: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 11 Jun 2018 01:16:44 -0000

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
 hw/s390x/sclp.c          | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
index 76241c240e..15f7ab0e53 100644
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
+#define S390_SKEYS_BUFFER_SIZE (128 * KiB)  /* Room for 128k storage keys */
 #define S390_SKEYS_SAVE_FLAG_EOS 0x01
 #define S390_SKEYS_SAVE_FLAG_SKEYS 0x02
 #define S390_SKEYS_SAVE_FLAG_ERROR 0x04
diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index 70b95550a8..5161a1659b 100644
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
+#define CMMA_BLOCK_SIZE  (1 * KiB)
 
 #define STATTR_FLAG_EOS     0x01ULL
 #define STATTR_FLAG_MORE    0x02ULL
diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index 047d577313..04b51fbd15 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -13,6 +13,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "sysemu/sysemu.h"
@@ -288,8 +289,7 @@ static void sclp_realize(DeviceState *dev, Error **errp)
 
     ret = s390_set_memory_limit(machine->maxram_size, &hw_limit);
     if (ret == -E2BIG) {
-        error_setg(&err, "host supports a maximum of %" PRIu64 " GB",
-                   hw_limit >> 30);
+        error_setg(&err, "host supports a maximum of %llu GB", hw_limit / GiB);
     } else if (ret) {
         error_setg(&err, "setting the guest size failed");
     }
-- 
2.17.1


