Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QLwKJ-0006D9-P0
	for mharc-qemu-trivial@gnu.org; Mon, 16 May 2011 07:51:07 -0400
Received: from eggs.gnu.org ([140.186.70.92]:40605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geleman@gmail.com>) id 1QLwKE-00062w-Ml
	for qemu-trivial@nongnu.org; Mon, 16 May 2011 07:51:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geleman@gmail.com>) id 1QLwKD-0003ou-Un
	for qemu-trivial@nongnu.org; Mon, 16 May 2011 07:51:02 -0400
Received: from mail-yx0-f173.google.com ([209.85.213.173]:58462)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geleman@gmail.com>)
	id 1QLwK8-0003oN-OR; Mon, 16 May 2011 07:50:56 -0400
Received: by yxk8 with SMTP id 8so1771885yxk.4
	for <multiple recipients>; Mon, 16 May 2011 04:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to:cc
	:content-type; bh=sQQgFIsLV7PDU+EzlsM6QpLgWkgD8TxWhB2JEPWTTvw=;
	b=NwN1zMCDQPMhIdRmds5ieaaKeu6RbUhgqeACNytQ38rPVu67/jcviMM+d19wGFUx+S
	6eHNIRjAFX1/vARjgr9qaQjCsr8CMgR2vTdpCzb32rLLFdfjz3ZAIXIBRS/FY2X3SjAK
	+BE1oER6tBkhntCzlM1vSpae5ThmMWcDqh7RM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	b=R+ENKOvpfdzk8eXU9XXl5nHpQFiMgekSBOVGzjIzuOZ0LejA1LMKc0+3Lsqw9I2bUU
	bGJTh159zx5oQi8+EpTRs9r1GMYXYkRqawyFbPSigHvYTcLiZn6DHjIbZgQlkwgsyu6A
	wZXsh5HgxfssVbSGWPL76oxyxiZd74CVmryjs=
MIME-Version: 1.0
Received: by 10.147.149.11 with SMTP id b11mr3070056yao.11.1305546655199; Mon,
	16 May 2011 04:50:55 -0700 (PDT)
Received: by 10.147.98.17 with HTTP; Mon, 16 May 2011 04:50:55 -0700 (PDT)
Date: Mon, 16 May 2011 19:50:55 +0800
Message-ID: <BANLkTimVJAJL=2Jxe+qDMKPtS8CLagYhBA@mail.gmail.com>
From: TeLeMan <geleman@gmail.com>
To: Isaku Yamahata <yamahata@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.173
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] piix_pci: fix piix3_set_irq_pic()
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
X-List-Received-Date: Mon, 16 May 2011 11:51:06 -0000

If pic_irq is greater than 7, the irq level is always 0 on 32bits.

Signed-off-by: TeLeMan <geleman@gmail.com>
---
 hw/piix_pci.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/piix_pci.c b/hw/piix_pci.c
index 7f1c4cc..85a320e 100644
--- a/hw/piix_pci.c
+++ b/hw/piix_pci.c
@@ -312,7 +312,7 @@ static void piix3_set_irq_pic(PIIX3State *piix3,
int pic_irq)
 {
     qemu_set_irq(piix3->pic[pic_irq],
                  !!(piix3->pic_levels &
-                    (((1UL << PIIX_NUM_PIRQS) - 1) <<
+                    (((1ULL << PIIX_NUM_PIRQS) - 1) <<
                      (pic_irq * PIIX_NUM_PIRQS))));
 }

-- 
1.7.3.1.msysgit.0
--
SUN OF A BEACH

