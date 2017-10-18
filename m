Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4wPc-0000Vs-LT
	for mharc-qemu-trivial@gnu.org; Wed, 18 Oct 2017 18:02:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1e4wPZ-0000TH-OP
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 18:02:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1e4wPY-0003uW-Uf
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 18:02:01 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:32835)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1e4wPU-0003nm-9i; Wed, 18 Oct 2017 18:01:56 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id CCE3C21333;
	Wed, 18 Oct 2017 18:01:55 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Wed, 18 Oct 2017 18:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=mesmtp; bh=SQcQE//gn4xjaK
	pa+Gy9RRydimyQZwy4d8yy2ZPIOu0=; b=GaygjT7G662WLZmztg5cEsxsLHugB7
	qlm4MU4dvAilptUcQ5tXLXAn1J3o+fGchherlEGQJEm/pOD0wtPnVVriVnpV4wRm
	jpnowLQZRw8njL/V8yKaQyKFYC3ca2JNteHV164kwdDqkgepT1dKWGgKrpQUNaTA
	UNc4yRa4EfCi0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=SQcQE//gn4xjaKpa+Gy9RRydimyQZwy4d8yy2ZPIOu0=; b=qvB9WZfg
	F5zuCU9D8NAnC4Ii+1D1U1jC8V0BZvpkB3L8x7T4S9BlXbsX+aekAb3ffJeS4c2b
	GLzsD2RqyuNINs7Jtlv3GjBLD1BWbnMZnBdZVN5/ExcpAE5L4WorYoOlYb0I7Kgk
	hDZYGwlTAEj4nwb7R7mOFe8yUgGcRzCUOTK6bUw6YGOdBcR831EyDzJ3S9SD2oAN
	2SY1ViloGufari431vidJBzyk5S3bvalb7fi3rZx3b1eHwTr+O1JmNL1MpM+Uj8H
	vdec/NSm5lxG1Cc4DJBInp+IUEmeXMSAlbVHO9hLeRjjnRx+nD4uLY48OUCXWY1P
	HtptmdCzh0W0vQ==
X-ME-Sender: <xms:U8_nWb5e6X3qKQreUbh2KK3sr0YlmRa9GnIDMCch1e8DBAstC-QphQ>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8DD60247AE;
	Wed, 18 Oct 2017 18:01:55 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
Date: Wed, 18 Oct 2017 18:01:42 -0400
Message-Id: <1508364103-16131-4-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1508364103-16131-1-git-send-email-cota@braap.org>
References: <1508364103-16131-1-git-send-email-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: [Qemu-trivial] [PATCH 3/4] translate-all: fix 'consisits' typo in
 comment
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
X-List-Received-Date: Wed, 18 Oct 2017 22:02:03 -0000

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 accel/tcg/translate-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index c5ce99d..70942be 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -255,7 +255,7 @@ static target_long decode_sleb128(uint8_t **pp)
 /* Encode the data collected about the instructions while compiling TB.
    Place the data at BLOCK, and return the number of bytes consumed.
 
-   The logical table consisits of TARGET_INSN_START_WORDS target_ulong's,
+   The logical table consists of TARGET_INSN_START_WORDS target_ulong's,
    which come from the target's insn_start data, followed by a uintptr_t
    which comes from the host pc of the end of the code implementing the insn.
 
-- 
2.7.4


