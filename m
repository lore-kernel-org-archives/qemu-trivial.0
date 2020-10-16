Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kTUSM-0007oY-Ns
	for mharc-qemu-trivial@gnu.org; Fri, 16 Oct 2020 14:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kTUSL-0007o9-4P; Fri, 16 Oct 2020 14:27:57 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57594
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kTUSJ-0000F0-0E; Fri, 16 Oct 2020 14:27:56 -0400
Received: from host86-148-246-80.range86-148.btcentralplus.com
 ([86.148.246.80] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kTUSE-0003wP-MF; Fri, 16 Oct 2020 19:27:54 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, f4bug@amsat.org,
 hpoussin@reactos.org, qemu-ppc@nongnu.org, atar4qemu@gmail.com,
 david@gibson.dropbear.id.au
Date: Fri, 16 Oct 2020 19:27:34 +0100
Message-Id: <20201016182739.22875-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.246.80
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 0/5] m48t59: remove legacy init functions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Oct 2020 18:27:57 -0000

This patchset is inspired by Philippe's "hw/rtc/m48t59: Simplify m48t59_init()"
patchset at https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg04493.html
but goes further: rather than tidy-up the legacy init functions, convert the
callers to use qdev properties directly so they can simply be removed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Mark Cave-Ayland (5):
  m48t59-isa: remove legacy m48t59_init_isa() function
  sun4m: use qdev properties instead of legacy m48t59_init() function
  sun4u: use qdev properties instead of legacy m48t59_init() function
  ppc405_boards: use qdev properties instead of legacy m48t59_init()
    function
  m48t59: remove legacy m48t59_init() function

 hw/ppc/ppc405_boards.c  | 10 +++++++++-
 hw/rtc/m48t59-isa.c     | 25 -------------------------
 hw/rtc/m48t59.c         | 35 -----------------------------------
 hw/sparc/sun4m.c        |  8 +++++++-
 hw/sparc64/sun4u.c      |  7 +++++--
 include/hw/rtc/m48t59.h |  6 ------
 6 files changed, 21 insertions(+), 70 deletions(-)

-- 
2.20.1


