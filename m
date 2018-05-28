Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNRYT-00071X-4k
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 19:27:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRYQ-0006yz-LU
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:27:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRYP-0000pA-WC
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:27:54 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:43287)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRYO-0000mo-0Z; Mon, 28 May 2018 19:27:52 -0400
Received: by mail-qt0-x242.google.com with SMTP id f13-v6so16555536qtp.10;
	Mon, 28 May 2018 16:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pFVDd02SgHn0Dk8AODLViVBSLIMC9LvUomG6UQeoPMA=;
	b=RdjlOlu/cVivQzgv7qontaZenNtj9hrOkcLo2WQtx7EV0Nghmyns+iSSPByhi+WhTG
	6pIPfrJTQT22M8NHanGb7kaw0DrpNuJs3xiuTB073u4I5HDEw9SMFLKvrs0WRknbK4NS
	yGNrBpYDOLnItfGKSaj56BXHFc26N2Qysae8cJVc6XXFKISoCT7n/Rt1ZUx1Eys1ic0H
	vQbVszy2IorUD/KLuz4R/XrIsQVvXDLsgkPklDaykGYU05aPxxJqeCB66Zlml4l5CsH7
	vIow5YOyzbROyjd0Gjmkwrcc8DDh0nI35zvwbo35GFCUdSniT3JcYN63GTSfjS0CK6eR
	0o9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=pFVDd02SgHn0Dk8AODLViVBSLIMC9LvUomG6UQeoPMA=;
	b=TVDwxOeAA9ZuqwuO/CKoLg9Rmi6pmjiv64KrBvyergdO/yF6mI46vIbgwIW8CB4QkL
	KzEtrkZmiifQzs7+OBfsVjc9sCrugonI5afKt1Jrsg/05rl4ITQUbc8drgK485YYscNs
	OGDzbapJcP2LJ5NyWIuFssbfWkC9E/QEHcyyt+h2+gLts1QNy7mB1BbuVOtsa07UVCho
	6I1aY85NwDxHL2b7jSHWGroOF6/0IcSWvdbtEuYJAsGcYc0qpq/GKApDWFxvosTGD9dh
	HwASidT7nZxNksTI4pEk+tvI0UzI7sSMeaFzqDG7WMZZ/gWEmZnGyq3D1VhF5HQ+h48Y
	vtGA==
X-Gm-Message-State: ALKqPwe7UeRjtc8cvrsVQM79lPtvcPDYqJD2mCVizzs+k3RM2rbrJZE3
	Qy4CcT/RVpgxdpT7zcNcfpk=
X-Google-Smtp-Source: ADUXVKJkmQP3QH6yUAG7MqM7Gekhs01FUaqjHUA5cgN2hvVpewYpblC0jtoCO6QmSMyRjtkrmqFGpg==
X-Received: by 2002:ac8:36f3:: with SMTP id
	b48-v6mr14654966qtc.334.1527550071531; 
	Mon, 28 May 2018 16:27:51 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s19-v6sm23756182qki.62.2018.05.28.16.27.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 16:27:51 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 28 May 2018 20:27:04 -0300
Message-Id: <20180528232719.4721-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528232719.4721-1-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v4 06/21] target/xtensa: Include
 "qemu/timer.h" to use NANOSECONDS_PER_SECOND
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
X-List-Received-Date: Mon, 28 May 2018 23:27:55 -0000

Since d0ce7e9cfc the dc232b structure uses the NANOSECONDS_PER_SECOND
definition from "qemu/timer.h".  Include it to allow further includes
cleanup.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/xtensa/core-dc232b.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/xtensa/core-dc232b.c b/target/xtensa/core-dc232b.c
index 7331eeea2f..70f33622ec 100644
--- a/target/xtensa/core-dc232b.c
+++ b/target/xtensa/core-dc232b.c
@@ -30,6 +30,7 @@
 #include "exec/exec-all.h"
 #include "exec/gdbstub.h"
 #include "qemu/host-utils.h"
+#include "qemu/timer.h"
 
 #include "core-dc232b/core-isa.h"
 #include "overlay_tool.h"
-- 
2.17.0


