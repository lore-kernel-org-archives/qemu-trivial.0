Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQqh-0001iN-Sy
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:44:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqf-0001fH-F2
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqe-0007qI-Lw
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:01 -0400
Received: from mail-qk0-x230.google.com ([2607:f8b0:400d:c09::230]:33603)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqa-0007nv-8z; Mon, 25 Jun 2018 08:43:56 -0400
Received: by mail-qk0-x230.google.com with SMTP id c131-v6so7370569qkb.0;
	Mon, 25 Jun 2018 05:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HnKZTyVoatcEAua8gRzzE0zGdvFeT/ivPmK+152r7rk=;
	b=pXlj9c2/ns2cADJJE7L7Q1nG7jx81hphD1ok3ZM1V6vh7nx9GYQOrYcjRiHR7HgJFU
	4zfS82bgwXAtFQTzJuzvmojUc6ZElw7bVMWA1d3vGzrsabEEht5rnZA52elO1ZLTk1my
	9HKuojR0/q9FkyTvCuq6LgYvCE1dN0GF41pVmsAnmyqAlHieRgzoSbJPgW5z6UO8MeRr
	Mi1XuSVwd2s6xtNBDIHCKEQ7do8+LpoitEd1dCjVZ39efUlsrv4h0TWJlDLyBaATiAI3
	UWGPfyluUZajk515sGRItlVI/phi9Tbxh4UW1Jj6XFj9oT9FMhaqCW/yFDVK/RxAjxG+
	Hb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=HnKZTyVoatcEAua8gRzzE0zGdvFeT/ivPmK+152r7rk=;
	b=CKx+ii9jxxcS8EE/3sJ/R1C4XUjeJ5Q55XopK81fLwS2v1WJJWDTIVFhqonroYhZ0+
	He+HCJHHw0Sr33gp4TJ2mQR7yvR2+g6s2MPM/Uo2HXJuePunO+IKaOSWw47H+CcoLgI7
	1Gs4PrhORlC1wXY0V3cWQXU4cVTnZkiADZ9k9NtYO+RytEwKSM/rTEHurgG7e5aZO64r
	+owNVtnDnZ+6uDpgdD4sUgCKvgz4eVyRpXefv/9ZIWMGjYm87hz1CHkUFiTEgLXjQSAs
	7AZL000WSK9oSxeQU+XqvtHb4PUYIBZmTb8f7W+XBCNclGbysFkSN3Fzl3NxIv21hLy3
	7fsw==
X-Gm-Message-State: APt69E1GGeqt76Ko860UgJN4O08ygPs7wKlJF2saYF5D0ZCckVBeKUhA
	Gg3yVCyvzu0NByVGhUtMYI0=
X-Google-Smtp-Source: AAOMgpcLQ3+vYB7eTUnGRXdEK5uogcyOwWGtLc9kRU4eZMellixpyOqEd+D/208p+alqEv7BW09dgw==
X-Received: by 2002:a37:6251:: with SMTP id
	w78-v6mr4856140qkb.364.1529930634984; 
	Mon, 25 Jun 2018 05:43:54 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.43.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:43:54 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Michael Clark <mjc@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Date: Mon, 25 Jun 2018 09:42:08 -0300
Message-Id: <20180625124238.25339-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::230
Subject: [Qemu-trivial] [PATCH v5 16/46] hw/riscv: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 25 Jun 2018 12:44:02 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Michael Clark <mjc@sifive.com>
---
 hw/riscv/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ad03113e0f..34d48993a2 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
@@ -84,7 +85,7 @@ static hwaddr load_initrd(const char *filename, uint64_t mem_size,
      * halfway into RAM, and for boards with 256MB of RAM or more we put
      * the initrd at 128MB.
      */
-    *start = kernel_entry + MIN(mem_size / 2, 128 * 1024 * 1024);
+    *start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
 
     size = load_ramdisk(filename, *start, mem_size - *start);
     if (size == -1) {
-- 
2.18.0


