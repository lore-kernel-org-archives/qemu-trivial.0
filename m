Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Srt7A-0002GW-JO
	for mharc-qemu-trivial@gnu.org; Thu, 19 Jul 2012 11:58:08 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1Srt71-0002Fw-9b
	for qemu-trivial@nongnu.org; Thu, 19 Jul 2012 11:58:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1Srt70-0000XF-9T
	for qemu-trivial@nongnu.org; Thu, 19 Jul 2012 11:57:59 -0400
Received: from goliath.siemens.de ([192.35.17.28]:19765)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1Srt6z-0000Wk-Vp; Thu, 19 Jul 2012 11:57:58 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.13.6/8.13.6) with ESMTP id q6JFvpj3010144;
	Thu, 19 Jul 2012 17:57:51 +0200
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id q6JFvpaC026603;
	Thu, 19 Jul 2012 17:57:51 +0200
Message-ID: <50082E7F.7030800@siemens.com>
Date: Thu, 19 Jul 2012 17:57:51 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.28
Cc: malc <av1474@comtv.ru>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] audio: Make PC speaker audio card available
	by default
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
X-List-Received-Date: Thu, 19 Jul 2012 15:58:07 -0000

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configure |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 106209a..42adc8d 100755
--- a/configure
+++ b/configure
@@ -90,8 +90,8 @@ static="no"
 sparc_cpu=""
 cross_prefix=""
 audio_drv_list=""
-audio_card_list="ac97 es1370 sb16 hda"
-audio_possible_cards="ac97 es1370 sb16 cs4231a adlib gus hda"
+audio_card_list="ac97 es1370 sb16 hda pcspk"
+audio_possible_cards="ac97 es1370 sb16 cs4231a adlib gus hda pcspk"
 block_drv_whitelist=""
 host_cc="gcc"
 helper_cflags=""
-- 
1.7.3.4

