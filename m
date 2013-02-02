Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U1acb-0002CH-29
	for mharc-qemu-trivial@gnu.org; Sat, 02 Feb 2013 05:46:57 -0500
Received: from eggs.gnu.org ([208.118.235.92]:38469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1U1acX-0002C6-Pp
	for qemu-trivial@nongnu.org; Sat, 02 Feb 2013 05:46:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1U1acW-0004Qd-Ib
	for qemu-trivial@nongnu.org; Sat, 02 Feb 2013 05:46:53 -0500
Received: from mout.web.de ([212.227.17.12]:50116)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1U1acW-0004QR-8z; Sat, 02 Feb 2013 05:46:52 -0500
Received: from mchn199C.mchp.siemens.de ([95.157.56.37]) by smtp.web.de
	(mrweb001) with ESMTPSA (Nemesis) id 0LkyXt-1UZoyd1sFJ-00abYF;
	Sat, 02 Feb 2013 11:46:50 +0100
Message-ID: <510CEE9A.1030207@web.de>
Date: Sat, 02 Feb 2013 11:46:50 +0100
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
X-Enigmail-Version: 1.5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Provags-ID: V02:K0:47MHaWHRqluw60Jv8YmV05Rlkwz9KP7hf281Z4m3rCA
	BxL6yBSiz85c1jhMal+JHlQyc5yn/0wDaNgccGGC+JONRR2FLF
	oP808by8pVm/9leQSgzCs6lNAQbLMIHe+Rtb0vSBdTOEZbHKMS
	NYUg4Ma3MBBlR5jDkEgh2Tbuzjexna6laJHyoFqG97U1lBBPBj
	Ab3f6rC7+l+2DXhlKPHuA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 212.227.17.12
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] configure: Create link to icon bitmap for
	out-of-tree builds
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
X-List-Received-Date: Sat, 02 Feb 2013 10:46:56 -0000

From: Jan Kiszka <jan.kiszka@siemens.com>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configure |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/configure b/configure
index 0657b1a..cfccec5 100755
--- a/configure
+++ b/configure
@@ -4289,6 +4289,7 @@ FILES="$FILES tests/tcg/lm32/Makefile"
 FILES="$FILES pc-bios/optionrom/Makefile pc-bios/keymaps"
 FILES="$FILES pc-bios/spapr-rtas/Makefile"
 FILES="$FILES roms/seabios/Makefile roms/vgabios/Makefile"
+FILES="$FILES pc-bios/qemu-icon.bmp"
 for bios_file in \
     $source_path/pc-bios/*.bin \
     $source_path/pc-bios/*.aml \
-- 
1.7.3.4

