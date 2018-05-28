Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNRYJ-0006s6-5P
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 19:27:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRYG-0006pP-Ln
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:27:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRYF-0000eV-MH
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:27:44 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:43413)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRYD-0000aZ-9r; Mon, 28 May 2018 19:27:41 -0400
Received: by mail-qk0-x242.google.com with SMTP id h19-v6so10178890qkj.10;
	Mon, 28 May 2018 16:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jJa7L/bm7J/KTn9ep7XGxFK2Q77xY0ZwqWdtlXP/FZI=;
	b=q2kHXQKpoTTgdGC82wYx/LghNUS+hUvy1imExw0XwjLlAvQNO5TMPviJ94SZIAIgNO
	71tap19FfAnQK00VPCG+ma2WKGxZKru90UikwhhBV9Dfk0E66JBsZ3wg8K6VGHZAwGGh
	V3mYy62GdCHnQJHZE5ueflq6Y7N+mjZk3DNQblbs1jW8dDeqi7UgTjBEr3GTbaCP78lD
	6JlrarXhzOBiQKQYywvA3ae5VP/XmIXT8GC/2IJfMxUZb6ANXBRslLZ8LS5TF/ioskxM
	SAJYdFm4d9d79DOt5o7IY4FSeR5bHSPLXU8eesi9xigLLGU6/NuDBWDVd+ufBPuLWwuk
	rgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=jJa7L/bm7J/KTn9ep7XGxFK2Q77xY0ZwqWdtlXP/FZI=;
	b=gjZ24WTh7a1AInTSB4HlSOXQDAREuGaEt27zDoPf8CkXoW3mWB0g9N/n0tPEGaEugS
	KESfumqaB8gsP9L2ub837dQtYpT2m50xfEEw13zlpWPvPxZOKR8p+y6raXnpyJ5xN7Hx
	lH/V2jqWqsjCfr9uW6/72dLlITZNF0buP/znfb27pgUMxuOi6rJt30zyOSLpPz72Ruw8
	v0JD0dJ6H+ULO2qygX0fohtiMG4Idq1ASWpymxqTYASOzJn36We9xHCNAlD9i8eqP5Ji
	Utj1jvha/68p3tEeg+WuLG5LkNfAVd4BbL/9qP7d9DuXDVQGcNE0I4A87LdHsH/Xs/VJ
	e7Og==
X-Gm-Message-State: ALKqPwfO87V5Q2ggy/3uOKyl65e+9qQX1Zx2QVE477E/7fzpfc3o8lqC
	5duOswLDy4PJEN5vf9lDZK4=
X-Google-Smtp-Source: ADUXVKIybUm7Y82SpC39LZjQti8fyTZMHxGjsbEoryMLkxgo4He8+pvctKZoC7YSOVNPUjytKK0ZEg==
X-Received: by 2002:a37:bc44:: with SMTP id
	m65-v6mr13624889qkf.87.1527550060767; 
	Mon, 28 May 2018 16:27:40 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s19-v6sm23756182qki.62.2018.05.28.16.27.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 16:27:40 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>, Alexander Graf <agraf@suse.de>,
	David Hildenbrand <david@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	qemu-s390x@nongnu.org (open list:S390)
Date: Mon, 28 May 2018 20:27:01 -0300
Message-Id: <20180528232719.4721-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528232719.4721-1-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH v4 03/21] target: Do not include
 "exec/address-spaces.h" if it is not necessary
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
X-List-Received-Date: Mon, 28 May 2018 23:27:45 -0000

Code change produced with:
    $ git grep '#include "exec/address-spaces.h"' target | \
      cut -d: -f-1 | \
      xargs egrep -L "(get_system_|address_space_)" | \
      xargs sed -i.bak '/#include "exec\/address-spaces.h"/d'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hvf/x86_task.c | 1 -
 target/s390x/kvm.c         | 1 -
 target/s390x/mem_helper.c  | 1 -
 target/s390x/misc_helper.c | 1 -
 target/sparc/mmu_helper.c  | 1 -
 5 files changed, 5 deletions(-)

diff --git a/target/i386/hvf/x86_task.c b/target/i386/hvf/x86_task.c
index 4abf3db25e..c3ead2ca73 100644
--- a/target/i386/hvf/x86_task.c
+++ b/target/i386/hvf/x86_task.c
@@ -26,7 +26,6 @@
 #include <Hypervisor/hv.h>
 #include <Hypervisor/hv_vmx.h>
 
-#include "exec/address-spaces.h"
 #include "exec/exec-all.h"
 #include "exec/ioport.h"
 #include "hw/i386/apic_internal.h"
diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index 58e4380ae3..ac370da281 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -39,7 +39,6 @@
 #include "hw/hw.h"
 #include "sysemu/device_tree.h"
 #include "exec/gdbstub.h"
-#include "exec/address-spaces.h"
 #include "trace.h"
 #include "hw/s390x/s390-pci-inst.h"
 #include "hw/s390x/s390-pci-bus.h"
diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index a0e28bd124..e21a47fb4d 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -21,7 +21,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "internal.h"
-#include "exec/address-spaces.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
diff --git a/target/s390x/misc_helper.c b/target/s390x/misc_helper.c
index 1f834f35ef..de1ced2082 100644
--- a/target/s390x/misc_helper.c
+++ b/target/s390x/misc_helper.c
@@ -26,7 +26,6 @@
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 #include "qemu/timer.h"
-#include "exec/address-spaces.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index f8886ae039..135a9c9d9b 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -21,7 +21,6 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "trace.h"
-#include "exec/address-spaces.h"
 
 /* Sparc MMU emulation */
 
-- 
2.17.0


