Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cmTGF-000248-9f
	for mharc-qemu-trivial@gnu.org; Fri, 10 Mar 2017 17:43:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cmQnm-00089o-8V
	for qemu-trivial@nongnu.org; Fri, 10 Mar 2017 15:06:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cmQnl-0002SY-DS
	for qemu-trivial@nongnu.org; Fri, 10 Mar 2017 15:06:14 -0500
Received: from mail.kernel.org ([198.145.29.136]:32824)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1cmQnj-0002RN-A7; Fri, 10 Mar 2017 15:06:11 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 7984B20595;
	Fri, 10 Mar 2017 20:06:09 +0000 (UTC)
Received: from localhost.localdomain (bzq-109-67-52-244.red.bezeqint.net
	[109.67.52.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E025F204D2;
	Fri, 10 Mar 2017 20:06:06 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Eduardo Habkost <ehabkost@redhat.com>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 10 Mar 2017 22:05:50 +0200
Message-Id: <20170310200550.13313-3-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170310200550.13313-1-krzk@kernel.org>
References: <20170310200550.13313-1-krzk@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
X-Mailman-Approved-At: Fri, 10 Mar 2017 17:43:44 -0500
Subject: [Qemu-trivial] [PATCH v2 2/2] qdev: Constify local variable
 returned by blk_bs
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
X-List-Received-Date: Fri, 10 Mar 2017 20:06:15 -0000

Inside qdev_prop_set_drive() the value returned by blk_bs() is passed
only as pointer to const to bdrv_get_node_name() and pointed values is
not modified in other places so this can be made const for code
safeness.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 hw/core/qdev-properties-system.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index c34be1c1bace..0d40ce682d05 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -405,7 +405,7 @@ void qdev_prop_set_drive(DeviceState *dev, const char *name,
     if (value) {
         ref = blk_name(value);
         if (!*ref) {
-            BlockDriverState *bs = blk_bs(value);
+            const BlockDriverState *bs = blk_bs(value);
             if (bs) {
                 ref = bdrv_get_node_name(bs);
             }
-- 
2.9.3


