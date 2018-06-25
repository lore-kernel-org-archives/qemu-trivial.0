Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQpx-000113-Hw
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:43:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQpv-0000yV-8c
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQps-0007T6-HB
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:15 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:44056)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQpq-0007Rb-EL; Mon, 25 Jun 2018 08:43:10 -0400
Received: by mail-qt0-x241.google.com with SMTP id 92-v6so7286272qta.11;
	Mon, 25 Jun 2018 05:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=feBaDpy6a9bjLAF7fPXliaXcD/sYBNQfY1bgHLYC8nQ=;
	b=gQuOxpQg2mYhuNUBQCPq0CNa3O8OHWXEhgbEs5Mwl1NcJ7SwwVPx0ESafRPe9cKsim
	N1oKQ3UkCuECAftBI5qtAV+7ApKqg1ssWzT9Ty5UUgmHZ8jZ/mjmEEXsSZGqIFvntjJr
	6F9a6s3M0wnHjo5g3QkGEz7CbKuSUXzJuievXS/HvmMpK+vfkqxr6Q5ALOSfqvt0aC0U
	VlxQ1ARTmasUWkvyOEts/f010Q8rWmWebRDWG7TLf11/VWIVuSexDoFB8kMYohiexfWC
	jWugS17sWrpJdgH6NBBPEqEVHnHR3mTPtIAr1fbfeI1+x1fkFM2fcsr2Hie6gKg3ErBj
	L8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=feBaDpy6a9bjLAF7fPXliaXcD/sYBNQfY1bgHLYC8nQ=;
	b=JZ4jH+bIKCKYekEmp5vwUWsCjyxWIyCcnCdKFoZnVcBLk1vIybm82YLUGwhlSE9K9g
	UmfiGTfSEQmO6CZrLWFpVPcGxRlFzMlLBs8TXyBLEQ7ASq/ooNrUg6iL2aPcV07jQ0l1
	WybHgL2hkB1H97ARVP0HaD21uxsZUmyT2o+YA8MXoZkMrjfCKaaoR545DR08FWY55Fo/
	QDrU+d3hMI32UXkSjAmaKPuh70dWc0gNvlF45PuQwgUs0f+ml2EIBkrc+jvoKOX/T/A+
	6uy86AUIWfA6NgFU8knIlVJc5XRyPyuQyI6Rcpso+e4dZ+kPof2sGAr2FGxMdyROe/1y
	46KQ==
X-Gm-Message-State: APt69E2F1dUm2ULWANCGQzBXvJP6OaYsqpCEsWYQptpne5WKNWTfSdR3
	C8/gLegKF4LK8UmNEmJJboQ=
X-Google-Smtp-Source: AAOMgpcPocCM+YqWW6gWtVLwJ9a/L86LLxj/z/eVasS09GkUDdr51+KnQHPaUnYlhju33PmLTcdT4w==
X-Received: by 2002:a0c:e087:: with SMTP id
	l7-v6mr10819471qvk.217.1529930589956; 
	Mon, 25 Jun 2018 05:43:09 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.43.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:43:09 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Date: Mon, 25 Jun 2018 09:41:55 -0300
Message-Id: <20180625124238.25339-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v5 03/46] x86/cpu: Use definitions from
 "qemu/units.h"
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
X-List-Received-Date: Mon, 25 Jun 2018 12:43:16 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 1e69e68f25..a5c9200788 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/cutils.h"
 
 #include "cpu.h"
@@ -64,9 +65,6 @@ struct CPUID2CacheDescriptorInfo {
     int associativity;
 };
 
-#define KiB 1024
-#define MiB (1024 * 1024)
-
 /*
  * Known CPUID 2 cache descriptors.
  * From Intel SDM Volume 2A, CPUID instruction
-- 
2.18.0


