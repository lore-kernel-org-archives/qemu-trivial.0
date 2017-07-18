Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLsS-0001el-Mu
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:21:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsQ-0001ca-2I
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:20:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsO-0000it-Rz
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:20:58 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:35364)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsO-0000hz-NG; Tue, 18 Jul 2017 02:20:56 -0400
Received: by mail-qk0-x244.google.com with SMTP id z22so1358684qka.2;
	Mon, 17 Jul 2017 23:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AsjaAZklKW/mKugFgEQUodCZGUnC6UylG33WvR5Kkl8=;
	b=GGnKSZXP7D+dfzLmc5iV56K1Du0Q0r4g+C1JwIb9wrF3DskvE+mVtyoAYJWqLt4ZOF
	DrgKZbsgP0YIaB29MyKzhefiamR+1dzd6G18tLUHsSXs88bKBHe8xAgmlQqwTwIc8RtB
	PzB1B0M8t5sE8XVaksuyTI5fzbFJLq5qVTZm7GY3K7SvcgFtJzxnHitTJZFSkA5AcIf3
	S8JvFBz3x6shsTAtgEowUcv6KJd3pNV3snZoFnIJu4ZDviVwkfEXqVMZ0B7GQOQQDz5R
	NHWosVwD5FaYdFHpHfJlGDSPe9LyKScsHmR62MGyqr2VJUBo7vxTYPwxNs9o+tIccGBp
	YGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=AsjaAZklKW/mKugFgEQUodCZGUnC6UylG33WvR5Kkl8=;
	b=sSh/lVFT4C6mAItLWRN7K2FP/c2Q/2qZXtVvSneU77wrX4mFr+0sNfaB1TBzFMzN0A
	i3ROBz4VNdp/mMN4h0ElvIBIgLd7MzK9Mco+iHFU1p7BOCBR3LEQXwllbe9wydVga97u
	dwOZgwYxMBF84PZMvEcDh0CITXDVN+ZZjY1k1wXgj/p2aN8PRuXLuKoLVOXRUTxeOTYv
	cb79U/EjWPZQJxKokcOh12RqrKvOnkc02bkKGi7z6NomFrbUDzQbcVWJh/IAiTTuMn7c
	okN7RpyYRI20Tf6yUmMSZYexFKdUOfBPysvI4UBFM/34R+yc+ppbgrcW4Pf9csPbE0Ho
	JCIQ==
X-Gm-Message-State: AIVw110RRqoxokgBOb4fV/8SFNxQzxs1W8aBFInR66hGkp+WE1DTFmuL
	TctYPu3eMCXlikDyOni9ow==
X-Received: by 10.55.6.149 with SMTP id 143mr20801qkg.49.1500358856057;
	Mon, 17 Jul 2017 23:20:56 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.20.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:20:55 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org, Jiri Pirko <jiri@resnulli.us>,
	Jason Wang <jasowang@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:09:46 -0300
Message-Id: <20170718061005.29518-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 10/29] net/rocker: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:20:59 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/rocker/rocker.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
index 4f0f6d71e5..55228f2f52 100644
--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -1419,7 +1419,7 @@ static int pci_rocker_init(PCIDevice *dev)
             desc_ring_set_consume(ring, cmd_consume, ROCKER_MSIX_VEC_CMD);
         } else if (i == ROCKER_RING_EVENT) {
             desc_ring_set_consume(ring, NULL, ROCKER_MSIX_VEC_EVENT);
-        } else if (i % 2 == 0) {
+        } else if (QEMU_IS_ALIGNED(i, 2)) {
             desc_ring_set_consume(ring, tx_consume,
                                   ROCKER_MSIX_VEC_TX((i - 2) / 2));
         } else if (i % 2 == 1) {
-- 
2.13.2


