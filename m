Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ULzBx-0007XU-IO
	for mharc-qemu-trivial@gnu.org; Sat, 30 Mar 2013 13:03:45 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ULzBr-0007OF-Cr
	for qemu-trivial@nongnu.org; Sat, 30 Mar 2013 13:03:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ULzBo-0001nt-6h
	for qemu-trivial@nongnu.org; Sat, 30 Mar 2013 13:03:39 -0400
Received: from mail-pb0-f47.google.com ([209.85.160.47]:41490)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1ULzBi-0001mu-5G; Sat, 30 Mar 2013 13:03:30 -0400
Received: by mail-pb0-f47.google.com with SMTP id rp2so626516pbb.20
	for <multiple recipients>; Sat, 30 Mar 2013 10:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=w2tOg1jhfubZ/jFTuolGfCidoUjxuuPotd9lKvvzgXY=;
	b=nDF9Jfyu3ZrzrS+QPXobSjl14+7CvW49XXV2gRm/Nh0KJVM8w3otlgwMSDZPWPXMdz
	fCRAnLVBy3ijfLOrBOh27h2mBmwsFVYs25Lk4wHKDUb4z3Pxhh407HSN4VOviKEmwxku
	sjdYicNSGOr4a5odNWvb7ko3Eab1OjCc+MynAiBizTtCD03Esez+5NTVhpBSiNOYh6Bt
	UxZFtaxjUmUPFq2M6xoBdIY3RgfWXCWcKWexGuMl1HKSmDap6DvyfsTNZQXibUs/npEj
	6VIgPNfen3+gIQwmvNO6pf5+RzuM3ToQjXU4XUfqhEQ4lb/m6G/w+lRyBqf60aOGSGLy
	1UBg==
X-Received: by 10.68.143.197 with SMTP id sg5mr9801870pbb.101.1364663009115;
	Sat, 30 Mar 2013 10:03:29 -0700 (PDT)
Received: from anchor.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by mx.google.com with ESMTPS id gf1sm7122254pbb.33.2013.03.30.10.03.27
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 30 Mar 2013 10:03:28 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Sat, 30 Mar 2013 10:03:25 -0700
Message-Id: <1364663005-1470-1-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 1.8.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.160.47
Cc: qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>
Subject: [Qemu-trivial] [PATCH] target-s390: Fix SRNMT
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
X-List-Received-Date: Sat, 30 Mar 2013 17:03:44 -0000

Fallthough into abort = oops.

Cc: qemu-trivial@nongnu.org
Cc: Alexander Graf <agraf@suse.de>
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 target-s390x/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target-s390x/translate.c b/target-s390x/translate.c
index a4f2194..0c3cf68 100644
--- a/target-s390x/translate.c
+++ b/target-s390x/translate.c
@@ -3088,6 +3088,7 @@ static ExitStatus op_srnm(DisasContext *s, DisasOps *o)
         break;
     case 0xb9: /* SRNMT */
         pos = 4, len = 3;
+        break;
     default:
         tcg_abort();
     }
-- 
1.8.1.4


