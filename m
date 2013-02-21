Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U8Md5-0003XI-RK
	for mharc-qemu-trivial@gnu.org; Wed, 20 Feb 2013 22:15:27 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alinush@t400>) id 1U8Mcy-0003CY-Mn
	for qemu-trivial@nongnu.org; Wed, 20 Feb 2013 22:15:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alinush@t400>) id 1U8Mct-0000eJ-6i
	for qemu-trivial@nongnu.org; Wed, 20 Feb 2013 22:15:20 -0500
Received: from cpe-72-229-54-85.nyc.res.rr.com ([72.229.54.85]:55057 helo=t400)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <alinush@t400>)
	id 1U8Mch-0000My-1C; Wed, 20 Feb 2013 22:15:03 -0500
Received: by t400 (Postfix, from userid 1000)
	id 0034026469B; Wed, 20 Feb 2013 21:36:19 -0500 (EST)
From: Alin Tomescu <tomescu.alin@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 20 Feb 2013 21:36:09 -0500
Message-Id: <1361414169-2887-1-git-send-email-tomescu.alin@gmail.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 72.229.54.85
Cc: qemu-trivial@nongnu.org, Alin Tomescu <tomescu.alin@gmail.com>
Subject: [Qemu-trivial] [PATCH] ppc: fixed RAM initialization bug in
	hw/ppc4xx_devs.c,
	can now use memory larger than 256MB in bamboo PPC machines
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
X-List-Received-Date: Thu, 21 Feb 2013 03:15:25 -0000

I hope this is the right way of submitting QEMU patches.

I was trying to launch a PowerPC "bamboo" machine with more than 256MB of RAM
with qemu-system-ppc -M bamboo -kernel $kernel -initrd $ramdisk -m 512, but QEMU
would just hang. However, when I used -m 256, the machine would boot.

I looked through the code in hw/ and it seems there is an error when the
RAM memory is setup (if my understanding is correct).

After patching it, the machine launched and booted successfully with 512MB of
RAM.

Signed-off-by: Alin Tomescu <tomescu.alin@gmail.com>
---
 hw/ppc4xx_devs.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc4xx_devs.c b/hw/ppc4xx_devs.c
index 5e491bc..b6bb0e1 100644
--- a/hw/ppc4xx_devs.c
+++ b/hw/ppc4xx_devs.c
@@ -700,7 +700,7 @@ ram_addr_t ppc4xx_sdram_adjust(ram_addr_t ram_size, int nr_banks,
                 vmstate_register_ram_global(&ram_memories[i]);
                 ram_bases[i] = base;
                 ram_sizes[i] = bank_size;
-                base += ram_size;
+                base += bank_size;
                 size_left -= bank_size;
                 break;
             }
-- 
1.7.9.5


