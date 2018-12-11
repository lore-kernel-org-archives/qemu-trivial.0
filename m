Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmPV-0000DE-Kb
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:05:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPM-0008PV-DZ
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPI-0007eo-P8
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:24 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:52951)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmPA-0007Rj-Uq; Tue, 11 Dec 2018 13:05:13 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MEC8L-1geANw200r-00AFmC; Tue, 11 Dec 2018 19:04:01 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>, Li Qiang <liq3ea@163.com>
Date: Tue, 11 Dec 2018 19:03:23 +0100
Message-Id: <20181211180352.19644-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9AOR2yOB1yq03UauFCJZVAYsIgKh116hP3cmdwrTFPp4vA+q5c4
	jBbQjPD1mvztWbUjSHgxe3Ue/TP2okvAYwE4cozRNvnUsGE9LrwydRUz7YvWW0lbbvpLwoH
	HGiRbMiPdobJb6K66q1iJSRFzYa4lHppAUg752rOdJF4Nd+9azgUH5gP5unkAKvjEM+xNql
	yM8rRpA6ElurKihbnueIw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sqUKvbk86qw=:MTEJBYdCM+3pH3TGf7vGrD
	UW7DbqqraIELkGNO2S1VrMd3fOkrGKqh6suzVkInMXJF7jIY9iyPR4iy/qhxBT0hh3vC+SqYQ
	7mYUwLsrTLJKKRRV1CsOf02ELt5IViCfvK2t7KtUAS0j3ecDiCmYifIlxPcPWciX4TEKmeCmU
	R9KAFtRnFRT179e3slYgee9EjJ1fC5NJpNMvniEJ1wCok+BiSelSw1Fd2xjgnFs6uOwanwV7D
	qqrl2JktLPSj9dhaKT6hLBhiW+sOY3FGjV39LieoPg81zgp5/z9wVXItSmxcxyNPG5Sn6iWbX
	n/I8A0icfwIXEDUoOUmGwGYL/swqp+4OBZf441melO7O1aKOhWJAdpAAl5kVerF38xuuXBGVZ
	/ZiROrcUSBXuFrcNSwEAcBwTDLGezPTvtKHj10MHd95nDMZ3p0Fy+NgMXoGw04NvD6haRI/PF
	1wi5c0WLbxAToksCJZbB512kWVq8CfkroVtflMQZAB+d1PlvQa/BkwuWa7QIqtqy8h5mlB8KA
	RRs0zYLa3T8i39eE0UJ+3VJb5EacoVlHZf3bpEDCmWnu9qkb7dT9kl6ju86Ex2z2GRF5GT9OJ
	COACbS93D6VPlSLzY/72/Seb/CtCip7SMsnFSEvBqSADF3yW6rQ9q464jTxTCJpGMGnRUS7UQ
	bgu9A+0IVLO3sPgiG7YH10LWed01O5/6bBED6jno9Okt2Q0l+NtbZ1JVg2EuMxfa2nYBkMpkS
	h59j6pUDWvGdl049kOcOci1hdT6mUE7DeYzhLA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-trivial] [PULL 01/30] hw: qdev: fix error in comment
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

From: Li Qiang <liq3ea@163.com>

Cc: qemu-trivial@nongnu.org

Signed-off-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20181030151637.37207-1-liq3ea@163.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/qdev-core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index a24d0dd566..92851e55df 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -197,7 +197,7 @@ typedef struct BusChild {
 
 /**
  * BusState:
- * @hotplug_device: link to a hotplug device associated with bus.
+ * @hotplug_handler: link to a hotplug handler associated with bus.
  */
 struct BusState {
     Object obj;
-- 
2.19.2


