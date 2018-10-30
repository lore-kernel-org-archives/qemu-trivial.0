Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHVlQ-0005tQ-7J
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 11:17:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1gHVlL-0005r8-7Q
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 11:17:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1gHVlF-0008Ap-GH
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 11:16:59 -0400
Received: from m12-12.163.com ([220.181.12.12]:40478)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>)
	id 1gHVlA-0007iO-6b; Tue, 30 Oct 2018 11:16:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=RGWDpLwMf32LSp/moM
	pe+2yokTmCT6QsLsaT8zPGSpo=; b=HxUkyw3mmis/13bJvf+qE535rna6txDEi/
	8ZthhWnQ0lvqhproky5f56Y474R3WUZI9PYkO4Ds4rM5lFPJ8rYIB8bqAHF6+Qho
	dYkgGJCkqBnWzmgESE+tOMlLucfSlYVUvU0yXsJayIibtQ3DoesSpMS1/zffxWDP
	ggmv7wHUI=
Received: from ubuntu.localdomain (unknown [115.204.66.204])
	by smtp8 (Coremail) with SMTP id DMCowAB3ZLDWddhbnaioWQ--.13505S2;
	Tue, 30 Oct 2018 23:16:40 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: f4bug@amsat.org,
	armbru@redhat.com,
	laurent@vivier.eu
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Li Qiang <liq3ea@163.com>
Date: Tue, 30 Oct 2018 08:16:37 -0700
Message-Id: <20181030151637.37207-1-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: DMCowAB3ZLDWddhbnaioWQ--.13505S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU0ucEUUUUU
X-Originating-IP: [115.204.66.204]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/1tbitBjvbVSIZUA9ugAAsQ
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.12
Subject: [Qemu-trivial] [PATCH] hw: qdev: fix error in comment
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
X-List-Received-Date: Tue, 30 Oct 2018 15:17:02 -0000

Cc: qemu-trivial@nongnu.org

Signed-off-by: Li Qiang <liq3ea@163.com>
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
2.17.1



