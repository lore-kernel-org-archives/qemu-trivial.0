Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WRiHo-0004WO-Gq
	for mharc-qemu-trivial@gnu.org; Sun, 23 Mar 2014 09:18:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>) id 1WReio-0002KB-7x
	for qemu-trivial@nongnu.org; Sun, 23 Mar 2014 05:29:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>) id 1WReif-0003rs-S1
	for qemu-trivial@nongnu.org; Sun, 23 Mar 2014 05:29:38 -0400
Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233]:40380)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>)
	id 1WReiJ-0003lJ-MJ; Sun, 23 Mar 2014 05:29:07 -0400
Received: by mail-pd0-f179.google.com with SMTP id w10so4073293pde.24
	for <multiple recipients>; Sun, 23 Mar 2014 02:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jjp8RxIJeltX8ED0A4n6Ekm3V+M1Vw4CJ+MjOQ3gKXs=;
	b=K+QNjUqZ4l+pDMgS3UXEug1kwhgjnYsKdhVa1hLo1a62skmUCvxHddBacrYo2HWV2K
	sAr4ebJ/xIgErKAo4oPBsF7lKZhKTTUv2CGMjjYHRhW50attcHbenQlOOZlecxB+Or6Y
	QYWKh3UF9q644rU33RcRO5K2j9Lp/DbwPW/HN0G+/sKK01YBF/Hl0wgxa1TgWIARWSKP
	AH9199R2M4u0+kB/Y736tIoozRZtK0DnhhjqJ4TPf99PD1QG57RryQY+vwLIjMtxPPsL
	qW4yKPb0jq6ADjVPtFPG78+t8ysMps4arcom0YkbBFgjqx5TZfcdnXAqttbDoz7IBJSV
	ROog==
X-Received: by 10.68.239.70 with SMTP id vq6mr614144pbc.152.1395566946683;
	Sun, 23 Mar 2014 02:29:06 -0700 (PDT)
Received: from prasad-desktop ([117.195.29.155])
	by mx.google.com with ESMTPSA id
	dn1sm21085081pbb.54.2014.03.23.02.28.59 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 23 Mar 2014 02:29:05 -0700 (PDT)
Received: by prasad-desktop (Postfix, from userid 1000)
	id 5C8CFA005D0; Sun, 23 Mar 2014 14:58:50 +0530 (IST)
From: Prasad Joshi <prasadjoshi.linux@gmail.com>
To: prasadjoshi.linux@gmail.com
Date: Sun, 23 Mar 2014 14:58:38 +0530
Message-Id: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
X-Mailer: git-send-email 1.8.1.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::233
X-Mailman-Approved-At: Sun, 23 Mar 2014 09:17:59 -0400
Cc: peter.maydell@linaro.org, stefanha@redhat.com, v.maffione@gmail.com,
	aik@ozlabs.ru, jan.kiszka@siemens.com, riku.voipio@iki.fi,
	agraf@suse.de, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	av1474@comtv.ru, kraxel@redhat.com, aliguori@amazon.com,
	pbonzini@redhat.com, g.lettieri@iet.unipi.it, alex@alex.org.uk,
	rizzo@iet.unipi.it, afaerber@suse.de
Subject: [Qemu-trivial] [PATCH 1/6] audio: set top level latch for each slot
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
X-List-Received-Date: Sun, 23 Mar 2014 09:29:46 -0000

CSMKeyControll function is supposed to set the top level latch for each
slot. However, at the moment, it incorrectly updates only the first
slot. Patch fixes the problem.

Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
---
 hw/audio/fmopl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
index 290a224..eb60c12 100644
--- a/hw/audio/fmopl.c
+++ b/hw/audio/fmopl.c
@@ -725,7 +725,7 @@ INLINE void CSMKeyControll(OPL_CH *CH)
 	OPL_KEYOFF(slot2);
 	/* total level latch */
 	slot1->TLL = slot1->TL + (CH->ksl_base>>slot1->ksl);
-	slot1->TLL = slot1->TL + (CH->ksl_base>>slot1->ksl);
+	slot2->TLL = slot2->TL + (CH->ksl_base>>slot2->ksl);
 	/* key on */
 	CH->op1_out[0] = CH->op1_out[1] = 0;
 	OPL_KEYON(slot1);
-- 
1.8.1.2


