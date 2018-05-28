Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNRYR-0006zy-Hp
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 19:27:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRYO-0006x2-N8
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:27:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRYN-0000mq-Ot
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:27:52 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:36722)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRYK-0000j7-Ju; Mon, 28 May 2018 19:27:48 -0400
Received: by mail-qt0-x244.google.com with SMTP id q6-v6so16565776qtn.3;
	Mon, 28 May 2018 16:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FnmjRruUstki2vsXYQq5CdrixQ34Vl3I585Z2rrPKI0=;
	b=HrwenYpQ/+cp/hABCrqdE7aE+YLMhHeKyGD/OuuYGZi5wWd3UCFtkPP4seDBRzP454
	1id+8cO2Sqa+mPoDHz5F5ANk1bpRMvzx597x6GzPBcyilQTDzKI0BetQjNFiq+5lAKlg
	GtuPyZNX+ep5eCow/FEjmZFV4mjAOxHWMdW1qSv3sQ4Rw+e6sVglp7zMHTo5hwu3hlhZ
	BGtthUTsVZEEUmtWwjLMe0BAJ4zjNsYjB0trl7CEfI1OQaIcpVTjOPHUI2QGcL2H+TL6
	XMoAureY7JGc8uj9bZYtjea3TRG968gUmRfhlWiDtJvqtvK5k+5wYnKG/5PdDieYJ8FT
	5PsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=FnmjRruUstki2vsXYQq5CdrixQ34Vl3I585Z2rrPKI0=;
	b=pt//LCqs8eq0XQ3IEXARJM1pO0GkToHyAlq7/6k3KrdrmDP0zJMKn8qB1XgOZKQGjQ
	E2rR03hbu8BlQ+GR06DknyewCdDQdHHoRipyLGRsnZcdzb7T0/MJPtGgSJQngCBcPyCc
	F76ptS7At+ViH7YMhd9jTdcRGxXU24aOtEa8D5h5R4ylGqURFi43G1uyQBYzpx/3aUqt
	lz0NbNZBYRaMx2hVFMmy/9gkv6coJ4Pzb8xfRIXYnTSFBdKknNSxoL9IDAKDjj/UE31c
	fwItQdmyROKX3JxpX9SQyIPuvOa7PRNdtSI/rA7xnkLResynJKPtUVno+oiWboJVyeJ1
	DQqA==
X-Gm-Message-State: ALKqPwexPo+qFdL6FtCRj3rO2bsArPZiVuIcgTarqq0wIK2HNpGxUXye
	kZBnvxGkPTKaJa45W+jsVXg=
X-Google-Smtp-Source: ADUXVKJTWPETDyRtNj90spt6VIHT88sQfbYk9sJmwAEqca1vFWApzkbPtU4HgohNMpVFd6g7CLmAgA==
X-Received: by 2002:ac8:7185:: with SMTP id
	w5-v6mr14512306qto.415.1527550068146; 
	Mon, 28 May 2018 16:27:48 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s19-v6sm23756182qki.62.2018.05.28.16.27.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 16:27:47 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org (open list:X86)
Date: Mon, 28 May 2018 20:27:03 -0300
Message-Id: <20180528232719.4721-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528232719.4721-1-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v4 05/21] target/i386: Do not include
 "exec/ioport.h" if it is not necessary
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
X-List-Received-Date: Mon, 28 May 2018 23:27:53 -0000

Code change produced with:
    $ git grep '#include "exec/ioport.h"' target | \
      cut -d: -f-1 | \
      xargs egrep -Li "(portio|cpu_(in|out).\()" | \
      xargs sed -i.bak '/#include "exec\/ioport.h"/d'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hax-all.c      | 1 -
 target/i386/hvf/hvf.c      | 1 -
 target/i386/hvf/x86_task.c | 1 -
 target/i386/kvm.c          | 1 -
 4 files changed, 4 deletions(-)

diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
index cad7531406..c5856bbdc3 100644
--- a/target/i386/hax-all.c
+++ b/target/i386/hax-all.c
@@ -27,7 +27,6 @@
 #include "cpu.h"
 #include "exec/address-spaces.h"
 #include "exec/exec-all.h"
-#include "exec/ioport.h"
 
 #include "qemu-common.h"
 #include "hax-i386.h"
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index c36753954b..f6c872e678 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -66,7 +66,6 @@
 
 #include "exec/address-spaces.h"
 #include "exec/exec-all.h"
-#include "exec/ioport.h"
 #include "hw/i386/apic_internal.h"
 #include "hw/boards.h"
 #include "qemu/main-loop.h"
diff --git a/target/i386/hvf/x86_task.c b/target/i386/hvf/x86_task.c
index c3ead2ca73..7610d85802 100644
--- a/target/i386/hvf/x86_task.c
+++ b/target/i386/hvf/x86_task.c
@@ -27,7 +27,6 @@
 #include <Hypervisor/hv_vmx.h>
 
 #include "exec/exec-all.h"
-#include "exec/ioport.h"
 #include "hw/i386/apic_internal.h"
 #include "hw/boards.h"
 #include "qemu/main-loop.h"
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 6511329d11..9d8f80f4c0 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -40,7 +40,6 @@
 #include "hw/i386/intel_iommu.h"
 #include "hw/i386/x86-iommu.h"
 
-#include "exec/ioport.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
-- 
2.17.0


