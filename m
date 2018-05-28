Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNRZe-00086K-PB
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 19:29:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZb-00081t-4j
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:29:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZa-0001wX-EN
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:29:07 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:37095)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZW-0001t2-5h; Mon, 28 May 2018 19:29:02 -0400
Received: by mail-qt0-x242.google.com with SMTP id q13-v6so16575366qtp.4;
	Mon, 28 May 2018 16:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wqstSKMmVFIzO+tcMpLZq6ubNJHaHllFI9pDsKdvwBM=;
	b=oqkpFoyI9Pa5fj3+nmOJhRQ8okRyfREwzJZC72/V/qW1pUl87XUcptIPJbgClQssJt
	xfh5yikeZeBgkDhPgsQO/ZxcM+2J6k8yjvnw7nK73fyGRis37VPAoMiioDQFiYD23jyh
	vouCa/iEf/XOMA8C8uFTd2RdPPGjCIMu6D2jhpNPXW+BRrVO2swEQYvqXSNJLx0eQuGO
	3EHIiOjph7VMLFcw9UR6/JIbZ+qejl09BO5O0SG7MWcO+vS7dUAEUsD+OwAybg7QeuzI
	ufkh13xq9GLUuljWEBIgMAla0sV5GyxO+suzST4Z3FCEc8h39QQnMAPcziL8kD2ZQ4Mu
	GKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=wqstSKMmVFIzO+tcMpLZq6ubNJHaHllFI9pDsKdvwBM=;
	b=Ci3LfwKBq2PJbHES5oD4LwtEQPIB67krfBhkugkDs5w1O0Ist+VTLgqyTqk66EEQQg
	Di3/9L0J4GvmIP1zsR63yqjBUJlFlsp4+hZUPJt6bKW2GCPgAv++Qm9cCA1EK0RYCIF8
	5RdlHvriUYWrTlj8v0q+5XEQtq+WqGC6OPJqsXhg5u/NoRLtL1K0QtBiUWB+LbqWD5sA
	3C02pYiBw6VruJwZQi2BwO+b3pDhcxnM8kCyVEpZeJR8b3z8sTqQIY4i/n09IUlOo3ys
	NM82Gdt4CYOaSS10Hr3TcmMhp+ZIaE7knEpDDXZO3f1yrHMZfc6NZ5ILrLiVVNYBlgQu
	B4fg==
X-Gm-Message-State: ALKqPwdU5/YuWW+S5t1oo3JUrwcx8xh9aETmidgVV9NaeKHqE6eskAxd
	LlFAHAwRBE5j1arW9/0HnyA=
X-Google-Smtp-Source: ADUXVKJ5w3NKY81TXrGnj7jwgLsDt3Cpu2doLIodanNLTH/iBDXPgR+qw6cEX6IiZZu8iHZ4LXUmsQ==
X-Received: by 2002:ac8:27ad:: with SMTP id
	w42-v6mr14025566qtw.17.1527550141745; 
	Mon, 28 May 2018 16:29:01 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s19-v6sm23756182qki.62.2018.05.28.16.28.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 16:29:01 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Mon, 28 May 2018 20:27:17 -0300
Message-Id: <20180528232719.4721-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528232719.4721-1-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v4 19/21] hw/i386/pc: Remove unused include
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
X-List-Received-Date: Mon, 28 May 2018 23:29:08 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/pc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index d768930d02..8b0803cb83 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -64,7 +64,6 @@
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/cpu_hotplug.h"
 #include "hw/boards.h"
-#include "hw/pci/pci_host.h"
 #include "acpi-build.h"
 #include "hw/mem/pc-dimm.h"
 #include "qapi/error.h"
-- 
2.17.0


