Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQ4g-0004dk-A6
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 11:41:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4c-0004Yv-3t
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4b-0003B4-9B
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:02 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:38813)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4T-00036N-Tj; Fri, 22 Sep 2017 11:40:53 -0400
Received: by mail-qk0-x243.google.com with SMTP id c69so867687qke.5;
	Fri, 22 Sep 2017 08:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=80B9v9fuWncs5YxJBC65MPw5qnffxSUFyZQJTyEDjwg=;
	b=fRPsRToKMmJ8FSVJCiaxvvHeKHg5fqT4nu3iwqgr2WZdvsImlsmWYHDHPM177TEgYe
	ylPr2sazpVVxXQcZsaLAX7PwQCwdMDwF392l5kqRdjiayIWD7JcNKv3CYiZKLzs9ZO8v
	h2wS7jv+IQpcNd12w49X7iZrySbDfYzyERRY0yhT6u/g/lXK1hG9q1b56HIPrLuSwaXq
	ebwyF0n2EZ5Sf1/ucnIt/nT88GNTHNG6UTDgm70fIPqcwxK8RJ2OPBQaMNdCudj/wFic
	lUEtf2ApOGeRcaLT0I2//oJVK+jans1GXtUN+zh6wUOLFUDm43/EeG05EfoVLJtL2lx/
	CJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=80B9v9fuWncs5YxJBC65MPw5qnffxSUFyZQJTyEDjwg=;
	b=uW1J6/foHfwRjl9MCPbZAJycaUPNCTHIQermlFvLraDR5IUjqwzzaRn5MJpvPhp5B+
	m/EhhbrrI7BA2573AkdOycHknWCHmSlH406IpKvWVFgdqCru7/8g6JbikO3FDTMxevgg
	S9bp65Updc+s9RqZCyjFaCDPyIxUxssWw16xLpi3K6RqLR7YCf+TNowbnPwAbaQPJ7lj
	0zsNUISZWeRU9guotVI1xwukQdce8v1kY+fSSxQh9WbIcJrTodzNf2z3+xuwynPPL4q0
	niGFFhLsw1EC64IV0osaBo3qzyLprlYCAlbVKGRx7JT7kBAjI0QAWr3sst4NVPoRtg3u
	krHQ==
X-Gm-Message-State: AHPjjUj+L441PDCCDXzp3e7PiJzrx8QJtQwsMv5SByxGYqvyiSYpVIwA
	R2VDMZqGngdYoEJjBHueOEA=
X-Google-Smtp-Source: AOwi7QDj1D/fgi1R9ycA6W6fEcah4m/gFl1EzwndQR/VxrSNCJr0DdNgD3nox/HaIKYa8GyPsXHlHw==
X-Received: by 10.55.10.76 with SMTP id 73mr7869859qkk.205.1506094853411;
	Fri, 22 Sep 2017 08:40:53 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id z75sm71742qkb.71.2017.09.22.08.40.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 08:40:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 12:39:46 -0300
Message-Id: <20170922154014.29350-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH 06/34] ppc: remove duplicated includes
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
X-List-Received-Date: Fri, 22 Sep 2017 15:41:03 -0000

applied using ./scripts/clean-includes

not needed since 7ebaf795560

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ppc/spapr_hcall.c | 1 -
 target/ppc/kvm.c     | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 57bb411394..2aeee28fe6 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -13,7 +13,6 @@
 #include "trace.h"
 #include "kvm_ppc.h"
 #include "hw/ppc/spapr_ovec.h"
-#include "qemu/error-report.h"
 #include "mmu-book3s-v3.h"
 
 struct SPRSyncState {
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 1deaf106d2..c9105af393 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -47,9 +47,6 @@
 #include "sysemu/hostmem.h"
 #include "qemu/cutils.h"
 #include "qemu/mmap-alloc.h"
-#if defined(TARGET_PPC64)
-#include "hw/ppc/spapr_cpu_core.h"
-#endif
 #include "elf.h"
 #include "sysemu/kvm_int.h"
 
-- 
2.14.1


