Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQry-0002tf-9H
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:45:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrq-0002m9-KX
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:45:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrp-0008Nr-Kq
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:45:14 -0400
Received: from mail-qt0-x22b.google.com ([2607:f8b0:400d:c0d::22b]:36334)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrj-0008Lk-Kg; Mon, 25 Jun 2018 08:45:07 -0400
Received: by mail-qt0-x22b.google.com with SMTP id o9-v6so11749200qtp.3;
	Mon, 25 Jun 2018 05:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=W2c1BxIlBljpouZn/2l8+mbc2hEwvv4El7saaUaHAcs=;
	b=VMIZ/bmNI2aaQ/MWkvJu06/QXWuSaSruo+s92GhiATXHtVo1GPUCeYtC8K5U3BDH8y
	RRpIL8ylGJSoIsWm4nyHGpr9LaTOmNSKazjOgGL210+LFJkqKj7UxDPPnDqlDoyxALTd
	0lKUzixeYxi+iZ7/j67M4o5bb8MN0p/1WL9kNRqZ9l/DMUXqO/lT/y8Z9MoEPaI3vJAp
	id5zrIGkhQEYqxF/owRYggwI4uHD3piuYYC/9OEUqSBEEhoWi3ycmqWkp7M3vMyMvGIz
	qyQBfcjk57D6Kdk5P4VHzUS86N9TrJKWni9q2k5epJ8WZpgAqJ3jpkIqvRToqX0G86Ig
	/7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=W2c1BxIlBljpouZn/2l8+mbc2hEwvv4El7saaUaHAcs=;
	b=BQe+keOxrD5IgNn0lOoEucfoi9BEvdRlP1Kop9LeH0wbVFYn76XgAf94V8CEUnvE53
	46GC4CAISkASMlt0CA4Zh2tImdN/RJJVHNgcDLEHBGbwE3YCju9GG7w6xgNTYORApTWC
	D2Y1yMdEG+vJPOvtG+SmW5KedHUSjAGNMq20v2reKyTZoVRYDO3BWxmHLbc8rM97/z0T
	UI1Yh9BteL5Z0+wMnBIWZFBzgf33bYRjSTPJ2x4z9XT/mqUk8eGWmAArUGC/8hfib8qp
	8IMhjUgMi74ViYdMCB+Vnws0aOGZyXme/1jTUMmRkUBP7/GZy/3CRRLZdWb1N9K+qwEN
	qpWQ==
X-Gm-Message-State: APt69E35HgJxN7k9vw9f4F6ic3L2S0Po5imdsAPFIyasFuX21r/rdAbx
	ZaMaWkCtKrvmFPdrRKGd4uA=
X-Google-Smtp-Source: ADUXVKKFY75sjmb7ZdOSz1QaghpB2AyJyw6kPW+oQ7BfByh1zLPnzgnpdorMzAAsYjwS+V3nSYKzBA==
X-Received: by 2002:ac8:2825:: with SMTP id
	34-v6mr10928477qtq.377.1529930707052; 
	Mon, 25 Jun 2018 05:45:07 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.45.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:45:06 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
	qemu-ppc@nongnu.org (open list:PowerPC)
Date: Mon, 25 Jun 2018 09:42:33 -0300
Message-Id: <20180625124238.25339-42-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22b
Subject: [Qemu-trivial] [PATCH v5 41/46] hw/ppc: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 25 Jun 2018 12:45:20 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -n '[<>][<>]= ?[1-5]0'

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ppc/sam460ex.c       | 2 +-
 target/ppc/mmu_helper.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index ffe561fbc1..c7c799b843 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -126,7 +126,7 @@ static void generate_eeprom_spd(uint8_t *eeprom, ram_addr_t ram_size)
     int i;
 
     /* work in terms of MB */
-    ram_size >>= 20;
+    ram_size /= MiB;
 
     while ((ram_size >= 4) && (nbanks <= 2)) {
         int sz_log2 = MIN(31 - clz32(ram_size), 14);
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 98ce17985b..e6739e6c24 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -17,6 +17,7 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "sysemu/kvm.h"
@@ -1090,11 +1091,10 @@ static void mmubooke_dump_mmu(FILE *f, fprintf_function cpu_fprintf,
         pa = entry->RPN & mask;
         /* Extend the physical address to 36 bits */
         pa |= (hwaddr)(entry->RPN & 0xF) << 32;
-        size /= 1024;
-        if (size >= 1024) {
-            snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "M", size / 1024);
+        if (size >= 1 * MiB) {
+            snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "M", size / MiB);
         } else {
-            snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "k", size);
+            snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "k", size / KiB);
         }
         cpu_fprintf(f, "0x%016" PRIx64 " 0x%016" PRIx64 " %s %-5u %08x %08x\n",
                     (uint64_t)ea, (uint64_t)pa, size_buf, (uint32_t)entry->PID,
-- 
2.18.0


