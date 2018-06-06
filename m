Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQZuV-0007Ax-2i
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 10:59:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQZuS-00071L-9e
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 10:59:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQZuR-0007C1-J4
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 10:59:36 -0400
Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c]:39768)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQZuO-00079R-Gc; Wed, 06 Jun 2018 10:59:32 -0400
Received: by mail-qk0-x22c.google.com with SMTP id g14-v6so4124327qkm.6;
	Wed, 06 Jun 2018 07:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Mqb+VSDpykMpeDgzWpaBR1pxMDVVR31ZiCZ/UzL7Bxk=;
	b=F73qEmRk/D8q4xIbCP/VHJ/mJ0mUCuVEUDA99Z/ABeGn9bnPLRmjP2aB7KcyQ4vwrq
	4dW9zKRE0FCFnMzyVsMlhR0fc2QNaT8BUu0vzNX4hnSCTlfaUlcpFc/PsSjwIzPFAo1i
	mJ/naMWt1CcOTwhr3lIrJ5zAbHyknxDGEZP8PC+U2nJbMBg3R1PIU0rSaPVxxOOsulDf
	zWLp34Xh42zDZhlQNKXn+TQ+lAmcIBqpd//WikkPGyyXG0QhWVfCKLR1f3bQ1m1UXkws
	IXsoBN9gOoNEfBnIN9GCpQijW5ASlx2+l+sFFRnfQYRyqgtQJKpEJLvrqqA4gN+F6D6Z
	xV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Mqb+VSDpykMpeDgzWpaBR1pxMDVVR31ZiCZ/UzL7Bxk=;
	b=G+5piYvaAresWKpLQbKc5kWPb+zA5WSeFFy9LsndYafLlTF132lAoRMle0jSGfjyw7
	0zbXERlEpxSqtT0KIwMdZnwx3URxIClegvF6ggmgzCQSFh0QBX21IvTKhjbbTy1xKSlt
	egTwlEPHCa1xfo9P0Y3yoTB8EGATnvjIL39dQqcrUkOh/iw+8ck8V9gJWqWW17VNWSXZ
	6Niv3ylNK4Ch3Ge3Ernx5EGxNWfcii9E3AG5Z0HM2z5hvbiORgg460quFIpxl1L4qhUr
	qPeGm6f9H0q2p+S8DIAQXvjlkV4MxjQ7DbYzianna0Vdjn0PoUVJx3o7hKdepmQE74dM
	7dcQ==
X-Gm-Message-State: APt69E0W0YURkOc5TP1szoaitSdtmdqVAM1IlBc8LzkIipMSA/cSljOo
	4AlIpFgg/Djk2fTyVWt2Gek=
X-Google-Smtp-Source: ADUXVKL+SAcV1Ec00V+C7POpahdXK1Em4AaLt9tfSnbQfM0xlThLGzyS1xWdcbEOV2dq+VSOdSwIWQ==
X-Received: by 2002:a37:6410:: with SMTP id
	y16-v6mr2880349qkb.56.1528297171889; 
	Wed, 06 Jun 2018 07:59:31 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	v29-v6sm8519439qkv.28.2018.06.06.07.59.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 07:59:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Alexander Graf <agraf@suse.de>, David Gibson <david@gibson.dropbear.id.au>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
Date: Wed,  6 Jun 2018 11:59:19 -0300
Message-Id: <20180606145921.30606-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180606145921.30606-1-f4bug@amsat.org>
References: <20180606145921.30606-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22c
Subject: [Qemu-trivial] [PATCH 1/3] MAINTAINERS: Add an entry for the MacIO
 device headers
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
X-List-Received-Date: Wed, 06 Jun 2018 14:59:37 -0000

Missed while moved in 7092e84d42b.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 41cd3736a9..2423b248fb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -766,8 +766,9 @@ F: hw/ppc/mac_newworld.c
 F: hw/pci-host/uninorth.c
 F: hw/pci-bridge/dec.[hc]
 F: hw/misc/macio/
-F: include/hw/ppc/mac_dbdma.h
 F: hw/nvram/mac_nvram.c
+F: include/hw/misc/macio/
+F: include/hw/ppc/mac_dbdma.h
 
 Old World
 M: Alexander Graf <agraf@suse.de>
-- 
2.17.1


