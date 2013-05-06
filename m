Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UZNws-0003Nc-QR
	for mharc-qemu-trivial@gnu.org; Mon, 06 May 2013 12:07:34 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1UZNwo-0003M7-QD
	for qemu-trivial@nongnu.org; Mon, 06 May 2013 12:07:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1UZNwR-00088x-LW
	for qemu-trivial@nongnu.org; Mon, 06 May 2013 12:07:30 -0400
Received: from thoth.sbs.de ([192.35.17.2]:19821)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1UZNwR-00088S-By; Mon, 06 May 2013 12:07:07 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.13.6/8.13.6) with ESMTP id r46G75BQ010263;
	Mon, 6 May 2013 18:07:05 +0200
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id r46G75ED006677;
	Mon, 6 May 2013 18:07:05 +0200
Message-ID: <5187D529.7010502@siemens.com>
Date: Mon, 06 May 2013 18:07:05 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 192.35.17.2
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] memory: Replace open-coded
	memory_region_is_romd
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 06 May 2013 16:07:33 -0000

Improves readability.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 translate-all.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/translate-all.c b/translate-all.c
index da93608..0d84b0d 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -1359,7 +1359,7 @@ void tb_invalidate_phys_addr(hwaddr addr)
     section = phys_page_find(address_space_memory.dispatch,
                              addr >> TARGET_PAGE_BITS);
     if (!(memory_region_is_ram(section->mr)
-          || (section->mr->rom_device && section->mr->readable))) {
+          || memory_region_is_romd(section->mr))) {
         return;
     }
     ram_addr = (memory_region_get_ram_addr(section->mr) & TARGET_PAGE_MASK)
-- 
1.7.3.4

