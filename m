Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmOI-0007Qw-LB
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:04:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmOG-0007P9-JE
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:04:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmOC-0006ts-Bk
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:04:16 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:57749)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmOB-0006ss-SN; Tue, 11 Dec 2018 13:04:12 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MgARS-1h6MWL3vv4-00hhml; Tue, 11 Dec 2018 19:04:04 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>, Li Qiang <liq3ea@gmail.com>
Date: Tue, 11 Dec 2018 19:03:26 +0100
Message-Id: <20181211180352.19644-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:aCWctxygWlU9bDGXgb1+d94m6Xw5h9f0FePnF4x8PP6X2UeQn74
	Xboq6qV5NyVDkTuZ6E5qNwxJZHht6JVXMwJ+jB5bZ8coFRZa0nv021WQgcs0en0/14Mve4l
	cXudssFDCZdS6dJ9s0KtRPmBiismYJSfBd7VSF7+1pStdOM1W8uEV7sZbr756B8oTfdx3+8
	h1K/SJyvmhWHqYtGzYBmg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yl3SSUtcGz0=:Ah99ObE9qDn43P6taaLySu
	M1qR22+y7ykmEiu7FTrDxdKb1+ch/YxBvckHG18R2W8XW61vz2590hfcyqXqUn7FIm7GQqI5C
	WAEbc0pjFoeQACedpWX9cF998n8oxAZwzhc8fx07evCa7XUYHKDgmJpmnK1LpmgO3imycnBeO
	M3I49XKruS1JJJ2VzA2mO5HvucEQTy/710nqjLK2b6F5uvwEpYtxP6BIkiPRo3rJtezZDoJXA
	DeMLn8XptMYCK+krOC/gLac12JKEXMWBU8Ot3M2pAe1vpj/XNIMVtT5UCnBa3TnSccqGG+CNN
	0+wZVCA4V6ulu9Ze6pmRIpEQvFpDZIZzZDstUxMjRy5iinztnY3AC9n/+SJM0RonfHOLZ7lTz
	m4DAm1rOHCJdL7OHNdpl28CcPdDqJTAgaK4v5mLX7euYgcywEPHkBcudxyADuIpxwFKMc2IM1
	dMUgz89G0ew30RR2JzJx3U6lUtENUH8SSob582CsIGYskx7d3uQo281NQqhehFeCfTq8vFFzj
	LobYBFj2UpN8g2Zzzls04hG7KJWbiiTEQjU1/dhraMs5c3+Vcucv98cy4DSHBl7enBv8I3tR2
	Y+TJgimz/6pmxf8BrmTvN7KhwCksZ1i++jmp2sws+D1LU1Bj2Qaerhd97CKsnMVMoVbA6rQqp
	on8zWkNiyHYLRffDefy198qkn6nY0vO9I08cNR+rodOoo3u2USO7mHWRYVb58yZw7BAsL//Vi
	Ve1o92CqbcpjY1kdYv2XfEfURZ13AE0uToOvKA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: [Qemu-trivial] [PULL 04/30] hw: set_netdev: remove useless code
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
X-List-Received-Date: Tue, 11 Dec 2018 18:04:17 -0000

From: Li Qiang <liq3ea@gmail.com>

In set_netdev(), the peers[i] is initialized
qemu_find_net_clients_except() when i is in
0 between 'queues' it can't be NULL.

Signed-off-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <1541751214-17515-1-git-send-email-liq3ea@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/core/qdev-properties-system.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 8b22fb51c9..b45a7ef54b 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -288,10 +288,6 @@ static void set_netdev(Object *obj, Visitor *v, const char *name,
     }
 
     for (i = 0; i < queues; i++) {
-        if (peers[i] == NULL) {
-            err = -ENOENT;
-            goto out;
-        }
 
         if (peers[i]->peer) {
             err = -EEXIST;
-- 
2.19.2


