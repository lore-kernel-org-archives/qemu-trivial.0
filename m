Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U8yrq-0005IQ-RT
	for mharc-qemu-trivial@gnu.org; Fri, 22 Feb 2013 15:05:14 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1U8yri-0005D6-SL
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 15:05:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1U8yrh-0003Pv-42
	for qemu-trivial@nongnu.org; Fri, 22 Feb 2013 15:05:06 -0500
Received: from goliath.siemens.de ([192.35.17.28]:20137)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1U8yrg-0003Mc-RT; Fri, 22 Feb 2013 15:05:05 -0500
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.13.6/8.13.6) with ESMTP id r1MK51ru023036;
	Fri, 22 Feb 2013 21:05:02 +0100
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id r1MK516F028930;
	Fri, 22 Feb 2013 21:05:01 +0100
Message-ID: <5127CF6D.2060104@siemens.com>
Date: Fri, 22 Feb 2013 21:05:01 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 192.35.17.28
Cc: qemu-devel <qemu-devel@nongnu.org>,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: [Qemu-trivial] [PATCH][RESENT] configure: Create link to icon
 bitmap for out-of-tree builds
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
X-List-Received-Date: Fri, 22 Feb 2013 20:05:14 -0000

This allows to pick up the icon when starting QEMU directly from an
out-of-tree build directory.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configure |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/configure b/configure
index 0eb25dd..265d8f7 100755
--- a/configure
+++ b/configure
@@ -4342,6 +4342,7 @@ FILES="$FILES tests/tcg/lm32/Makefile po/Makefile"
 FILES="$FILES pc-bios/optionrom/Makefile pc-bios/keymaps"
 FILES="$FILES pc-bios/spapr-rtas/Makefile"
 FILES="$FILES roms/seabios/Makefile roms/vgabios/Makefile"
+FILES="$FILES pc-bios/qemu-icon.bmp"
 for bios_file in \
     $source_path/pc-bios/*.bin \
     $source_path/pc-bios/*.aml \
-- 
1.7.3.4

