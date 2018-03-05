Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoI3-0004DZ-8w
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:28:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHw-0003lZ-Bo
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHv-0007EO-CP
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:16 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:54736)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHv-0007Dm-62; Mon, 05 Mar 2018 06:28:15 -0500
Received: by mail-wm0-x243.google.com with SMTP id z81so15052625wmb.4;
	Mon, 05 Mar 2018 03:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=yv5Lcskk06wa/1SojgLfcWJvmnnds8Nf14SRhp4WIzE=;
	b=e+iUS9nX1UqNmFHiBSld3WjtrHJ2EiSANotzCHvF/AYkw+QrcgpCFaKznNyltz18GH
	i8PPrvEAy1HSYSFEhAk/3ZWl6hSQtzhPeYxw7IpBWZ6AM8pA19JFPHLBK25kaYBz075h
	7JtswJiFaVzZoHLT3yj8yvmvxLDyhJCcxvEN5Sn+xHiLQb3YMjSiLdG0c8pd2Y7k3Vmk
	U2Em6GwDFZ5CVcbtCAO4ZafnwhhJzZ6SzXclKHVAByMBZrMDK8siqU+npre+M1f+Aixa
	SmscOCpxpf+8jPVGcxGPC6lWcfmy7nxgerTJElJd80R/G2QHi0gbQCGcsSvK+85q/P4w
	kVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=yv5Lcskk06wa/1SojgLfcWJvmnnds8Nf14SRhp4WIzE=;
	b=JQRZPK/03ZsdQ7UMPZdNGdO3BkrSS1fjcZvNeW7dBxQmoZbV9Rwjjt4D++U7ptMIcU
	MN+DdLsuWFeGKkHiR4OXX+68XGVj0HXV02WJxZJ1H4YGVuJr1/hHDzERJqVdOd8NOvNp
	WqaW4crCorB9kOpGbagey1wLs/+yg5MP0TBIgw+tH8wIJ1HjAlKRDuOCR1w/Qqfubial
	+NO2Qw8TFygr5UjySzqXDK6INWF0RLpv9qown7FYoFhIPsAeVAzJnWO8sKW0FuYOGKru
	a6NQGRpCOMyv8Yd5bb7c2PnRJPtKAefjuFO8Ai3XdKXLLKYrhDpZWQnmu9sfIbIEHNtp
	wxMw==
X-Gm-Message-State: AElRT7GgztsGJ2Wbq8xnzypzVnlT5j9cebxuA76iELy8532dUj7KDqID
	Jdi4/cnWNvcWpuoeql+0qMsxtdLMuqw=
X-Google-Smtp-Source: AG47ELtmD3FdIz4ONF6KcudZqr6a/1NUGGBAY9AMNEKp3DwHmzSw3sQypwGjlBCVshjONJH8ppz9iQ==
X-Received: by 10.28.218.147 with SMTP id r141mr7497919wmg.55.1520249294001;
	Mon, 05 Mar 2018 03:28:14 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.28.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:28:13 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
Date: Mon,  5 Mar 2018 08:27:28 -0300
Message-Id: <20180305112732.26471-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: [Qemu-trivial] [PATCH v2 26/30] hw/smbios: use the BYTE-based
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
X-List-Received-Date: Mon, 05 Mar 2018 11:28:19 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/smbios/smbios.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 27a07e96f4..fa02f9ce3f 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -625,10 +625,6 @@ static void smbios_build_type_11_table(void)
     SMBIOS_BUILD_TABLE_POST;
 }
 
-#define ONE_KB ((ram_addr_t)1 << 10)
-#define ONE_MB ((ram_addr_t)1 << 20)
-#define ONE_GB ((ram_addr_t)1 << 30)
-
 #define MAX_T16_STD_SZ 0x80000000 /* 2T in Kilobytes */
 
 static void smbios_build_type_16_table(unsigned dimm_cnt)
@@ -640,7 +636,7 @@ static void smbios_build_type_16_table(unsigned dimm_cnt)
     t->location = 0x01; /* Other */
     t->use = 0x03; /* System memory */
     t->error_correction = 0x06; /* Multi-bit ECC (for Microsoft, per SeaBIOS) */
-    size_kb = QEMU_ALIGN_UP(ram_size, ONE_KB) / ONE_KB;
+    size_kb = QEMU_ALIGN_UP(ram_size, K_BYTE) / K_BYTE;
     if (size_kb < MAX_T16_STD_SZ) {
         t->maximum_capacity = cpu_to_le32(size_kb);
         t->extended_maximum_capacity = cpu_to_le64(0);
@@ -668,7 +664,7 @@ static void smbios_build_type_17_table(unsigned instance, uint64_t size)
     t->memory_error_information_handle = cpu_to_le16(0xFFFE); /* Not provided */
     t->total_width = cpu_to_le16(0xFFFF); /* Unknown */
     t->data_width = cpu_to_le16(0xFFFF); /* Unknown */
-    size_mb = QEMU_ALIGN_UP(size, ONE_MB) / ONE_MB;
+    size_mb = QEMU_ALIGN_UP(size, M_BYTE) / M_BYTE;
     if (size_mb < MAX_T17_STD_SZ) {
         t->size = cpu_to_le16(size_mb);
         t->extended_size = cpu_to_le32(0);
@@ -707,8 +703,8 @@ static void smbios_build_type_19_table(unsigned instance,
 
     end = start + size - 1;
     assert(end > start);
-    start_kb = start / ONE_KB;
-    end_kb = end / ONE_KB;
+    start_kb = start / K_BYTE;
+    end_kb = end / K_BYTE;
     if (start_kb < UINT32_MAX && end_kb < UINT32_MAX) {
         t->starting_address = cpu_to_le32(start_kb);
         t->ending_address = cpu_to_le32(end_kb);
@@ -869,7 +865,7 @@ void smbios_get_tables(const struct smbios_phys_mem_area *mem_array,
 
         smbios_build_type_11_table();
 
-#define MAX_DIMM_SZ (16ll * ONE_GB)
+#define MAX_DIMM_SZ (16 * G_BYTE)
 #define GET_DIMM_SZ ((i < dimm_cnt - 1) ? MAX_DIMM_SZ \
                                         : ((ram_size - 1) % MAX_DIMM_SZ) + 1)
 
-- 
2.16.2


