Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQaG9-0004nT-E1
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 11:22:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaG3-0004cT-4M
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:21:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaG0-0003di-8v
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:21:55 -0400
Received: from mail-qt0-x22f.google.com ([2607:f8b0:400d:c0d::22f]:45748)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaFw-0003bm-U2; Wed, 06 Jun 2018 11:21:48 -0400
Received: by mail-qt0-x22f.google.com with SMTP id i18-v6so6722393qtp.12;
	Wed, 06 Jun 2018 08:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Km7/EToSyn+5OUeJ/zcjNNR0AlH8h1r1sMEozf0w/PM=;
	b=fU5TOZzwLMtTvcj6FbegvWOSKcaytn8uwRlkHHH+gVyKoiLMsEsPaTU/EmTHDm4MRd
	cTWP+v2N9XraQE1Uj2Ct3UgWXWGEfcUC0nLwhOnxbH0Lagnjr4+T3r6asIo/detYSS6s
	d8HjqwIjhkpIlDClBzbK4QZQLxvoF3Pv6/1KNnXjcJYQtbH8oQQXlquwMaNMaVa5iTfR
	xIqDpKlmuVyJkttbK+7AP6zebCbGUMn5n7AtVddJeRQJzexCFK1s7TipD2ilc0XbHjml
	1ppA5JAJ7fbNGWEYVAA6DL1KTyVyq9et51gNFeY4IZ4DvzikmH7ECGV+boNt1yeZ2KiE
	SlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Km7/EToSyn+5OUeJ/zcjNNR0AlH8h1r1sMEozf0w/PM=;
	b=OvJH8H03c0XQDWnuKzCzWNDiI+FilEhpaihIornFTj7PNwUH+NsXOd3e3RlNtO1ycM
	v06vmkMGMu8K32utxMKSjs4B1SyONBXdjxFlJj5ftrsH3aCAiLuoz5H/gYmhrgWsBfft
	7CosHK5Jeu4QbE58eyTcg0xkKnVX8Hpevvl81R7mnQ7+y1P2+Z8cHMo2IUcklkE9/dru
	pFvMHMlwcywFD0J3BteNqlaaemB53j9dn5/q7Nk3MFzT+Dx+ImWdInETMU2dolklEekA
	uuin+RFhfrWIctrxFs7Hm2b+w5rKcoKV47h5VEabSec4lcuwJs/rHGjSnjemGlSnIzbS
	P8YQ==
X-Gm-Message-State: APt69E0lhS/iB3q9ubUHeVbBlCJDfpuddv9C8bOcAp2S3B4Xq9fNucCu
	Fr6KJHvTvjnbsMEhjGkaoBc=
X-Google-Smtp-Source: ADUXVKJQTLPRrietGq48VQ2rUzYoUi3Q3eT++AYGiTtaF6qTStkJBgUPrFLzfV3QYnoHdkiqv6cE3g==
X-Received: by 2002:ac8:19fa:: with SMTP id
	s55-v6mr3082050qtk.95.1528298508440; 
	Wed, 06 Jun 2018 08:21:48 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	i8-v6sm38756255qtb.11.2018.06.06.08.21.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 08:21:47 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Wed,  6 Jun 2018 12:21:20 -0300
Message-Id: <20180606152128.449-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180606152128.449-1-f4bug@amsat.org>
References: <20180606152128.449-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22f
Subject: [Qemu-trivial] [PATCH 03/11] xilinx-dp: Add trailing '\n' to
 qemu_log() call
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
X-List-Received-Date: Wed, 06 Jun 2018 15:21:56 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/xlnx_dp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 6715b9cc2b..c32ab083f8 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1074,7 +1074,9 @@ static void xlnx_dp_avbufm_write(void *opaque, hwaddr offset, uint64_t value,
     case AV_BUF_STC_SNAPSHOT1:
     case AV_BUF_HCOUNT_VCOUNT_INT0:
     case AV_BUF_HCOUNT_VCOUNT_INT1:
-        qemu_log_mask(LOG_UNIMP, "avbufm: unimplmented");
+        qemu_log_mask(LOG_UNIMP, "avbufm: unimplemented register 0x%04"
+                                 PRIx64 "\n",
+                      offset << 2);
         break;
     default:
         s->avbufm_registers[offset] = value;
-- 
2.17.1


