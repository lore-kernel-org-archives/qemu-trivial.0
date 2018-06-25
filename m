Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQs3-0002zA-Hf
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:45:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQry-0002tp-EI
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:45:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrx-0008S8-L1
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:45:22 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:46074)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrr-0008OV-Fk; Mon, 25 Jun 2018 08:45:15 -0400
Received: by mail-qt0-x242.google.com with SMTP id i18-v6so11724322qtp.12;
	Mon, 25 Jun 2018 05:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=D4nySAKGchCydPN6hgkd0bKR5AnKkJFcTvXHvmuvR2s=;
	b=L9CpL5fXsadoolCCZEhSv8Pdqu0Rjm8j+GyZhu0Lt6/CchiyeR02ePQMl+nqBLcYY+
	TPV8GNMr+yTLxMlseWjSWSddkdJ5gQ9hZQ5W9egsTwCx2kixS7Uxt5QPVOICoMjHpAjX
	guJYY/V05mjFUp3bzaCOO9FgLrNxY9h9893cjMYDpvx/ml7knQFn8sUYw82kSDvIptu7
	M2/+0YMch3kpVFGDbcIHMpPvSMK8fnffR9Drb6hQLA4ZfTWmdxdunw8GpGlaTUkBaacb
	z8VjBbPv/bXGzbL4CQ8/Q4W3htVa2eH20H0eD2ekTAxeCedOyA1GyMUHk8KVZZ0PHT+A
	XdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=D4nySAKGchCydPN6hgkd0bKR5AnKkJFcTvXHvmuvR2s=;
	b=XNILMnHXUwicPQlkuy5oTm0fjjT1Qt5OygHKrpC4bAML9GLH+U0qUP6LdSPLP5x84b
	4H3zy8ywZC7BXrgptRs/2lveWSqEH74JftOOhiG4Cy51M6Ql8os2wCYjQBlVLf4CuIXz
	R7FZOGTJjRxXLZ2bYpTGYiSTtIb7qEcZ0+fZsMa14pEmkqMGAGs+AmkqSPJNNMsXnPK8
	cbe4CUOpa/JzsOE2+MTzoJ2PPrZjsfCPxnHS/KNcHV7ti2MEqBj8uldu+557RXSBXkNM
	UQV2V6ZvTQ2FYett2Im7+ohpwaacW4uaxqqYE47Fx4wbh+DBEDF1zXEADqWsTEn6sO0I
	fzxQ==
X-Gm-Message-State: APt69E2HrxzJ+Ef3thgpm+vbtAO0SmoQMstZskkSjS6ttpU+k592Tuab
	BvuTuok+umtqhHA24dteTGo=
X-Google-Smtp-Source: AAOMgpekjX+Fxp0s5jVbB4E0PZcSrO9DhFcBANNs7ZabU1p/dVtFgm7xxXgpuWCYpfQ8ef2YYcQF/w==
X-Received: by 2002:a0c:8e08:: with SMTP id
	v8-v6mr3993275qvb.182.1529930714939; 
	Mon, 25 Jun 2018 05:45:14 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.45.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:45:14 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 25 Jun 2018 09:42:35 -0300
Message-Id: <20180625124238.25339-44-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v5 43/46] vl: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 25 Jun 2018 12:45:23 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -n '[<>][<>]= ?[1-5]0'

and modified manually.

Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 vl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index d451f45dc5..7729ba390f 100644
--- a/vl.c
+++ b/vl.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu-version.h"
 #include "qemu/cutils.h"
@@ -2790,7 +2791,7 @@ static void set_memory_options(uint64_t *ram_slots, ram_addr_t *maxram_size,
         if (g_ascii_isdigit(mem_str[strlen(mem_str) - 1])) {
             uint64_t overflow_check = sz;
 
-            sz <<= 20;
+            sz *= MiB;
             if ((sz >> 20) != overflow_check) {
                 error_report("too large 'size' option value");
                 exit(EXIT_FAILURE);
-- 
2.18.0


