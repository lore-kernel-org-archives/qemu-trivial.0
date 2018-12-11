Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmPS-00008B-4i
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:05:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPL-0008Nl-M9
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPH-0007dC-CU
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:23 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:47449)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmPB-0007SS-0J; Tue, 11 Dec 2018 13:05:13 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1M9Ib1-1gZEhq3N7X-006S9y; Tue, 11 Dec 2018 19:04:26 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Date: Tue, 11 Dec 2018 19:03:51 +0100
Message-Id: <20181211180352.19644-30-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UfRa0HwpZPENCI/LvWmdy3IYX8SeYzvVvfMQwTuXLil8b6fPDiz
	lD9lY1l2q/M8VECySlGqI/sQnEgqo9M2Joc7wQQ6MwryR7DiG3S99GW9/JOkoiWqXIAkhZN
	tmEVZ2yV0GWZ3UYp3PZlE1mC5WMK78889YhEr1lKhGmGwU5CPBJ5bKR7Y4sj7EUSD0VN3GZ
	gZP9RzxNmULP1/2rC0KxA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pXoDOpgwquY=:ckD04CeKBNVzx8sC1nPFvX
	MoPiMT3A/5X2/bBdzScVafPUy8pKUne+fQu1F/bQbSJFebnvrm0AAkY+8xCHiSA2Z7q2CtnRv
	YslxpedoNeFDdi/kC60YHNyB2YZFmgdkhjYtcMhKqDFmyLqlRLaiZNw2xS2aLx9GXhvZKJtis
	6xV/8Rl2xdBAVizDS9rZaphThU6Ex0HW0Xd2/0OF0gUG+84KGXfwDCMsYE1IG8Ox7MhLk5ZRe
	TtDYjKXPiMpz9ZUpFnFkzvnlTJfENavopas3F0Hf+g2yLdiUyTAtlaeoTUziXAs2xRCR6zntL
	mNBreRC1xjQg1M/J/E4MVZIMDUjmCKPItZVLFmSMmsANKC8XoTDGsbCGZKiiobqGM9fQjj9lD
	+mKCNjdXhivplAQ1q3HQpvQWXjqMyES7CRa1+TPodN8fZtl2RbUXJd9cPlDcygGC6yjkI2qiC
	DtTcIJWIZSJ5d9MhujJkqMPqDaUmbXjHfotHFk8DT8mV7amZhN6RraJaAMGvce1fPOQLDv5U9
	97xXbPwUmTj+soK3WoZpRpZLNItM8gA2W4TMRN81tFQH7N2tR3Hf2bmxyLZAY/nrXzmIUJ+H4
	7JDuyZB1vHB+VWcx8FdD+inqWT3LfA0sHq3jHFFVM0FvlseodZGcgDTPNFoIND4pY+so7BRTp
	HGKeBYsGeT+8+2ECjOM61XPhtTBS9yd4hpggHalBIVNChAnBIGDUyV39wEhLzZbeH5RwWXhDn
	yhLXW1MVNxpsr2OM6BAFci8ufGizTEuYTwKF9Nrf7MlXunoNbc/MjUS+Iuc=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-trivial] [PULL 29/30] maint: Grammar fix to mailmap
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
X-List-Received-Date: Tue, 11 Dec 2018 18:05:28 -0000

From: Eric Blake <eblake@redhat.com>

Make the sentence read better.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20181207170733.129532-1-eblake@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 .mailmap | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index ed8faa5719..b8e08297c9 100644
--- a/.mailmap
+++ b/.mailmap
@@ -34,6 +34,6 @@ Justin Terry (VM) <juterry@microsoft.com> Justin Terry (VM) via Qemu-devel <qemu
 
 
 # Also list preferred name forms where people have changed their
-# git author config, or having utf8/latin1 encoding issues.
+# git author config, or had utf8/latin1 encoding issues.
 Daniel P. Berrangé <berrange@redhat.com>
 Reimar Döffinger <Reimar.Doeffinger@gmx.de>
-- 
2.19.2


