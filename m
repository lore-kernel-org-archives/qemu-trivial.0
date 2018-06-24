Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWwJ2-0004SN-HY
	for mharc-qemu-trivial@gnu.org; Sun, 24 Jun 2018 00:07:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIz-0004Or-Gd
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:07:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIv-0004PI-M7
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:07:13 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:46820)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIs-0004N2-BF; Sun, 24 Jun 2018 00:07:06 -0400
Received: by mail-qt0-x241.google.com with SMTP id h5-v6so9321598qtm.13;
	Sat, 23 Jun 2018 21:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ChrS/spx+A2v0ilF0tFUJ3RU9zfGVuplHoHQXfS1MYs=;
	b=LmdjT+PcmACB3Dm1t9cv3q01HuI6twQFKpowfoUkyiInMXPr/vFR6LgzWVo16fMjrz
	6g2d9EjTdz4BnvURf3Z96lRGPftVcjMFZCWNyadIJ/ph/LYkcUjWuM2PeO2tbn9IBazk
	kOg933xt9GZcvrHX0ZbO02hWX+RdfsRq8yAQAakYFPRS5uBvi4TS5z75CxhfvoXNsLce
	4u2iSBr2GyM7fUi9WzSI/skR7ZZzjHgF7HvresGxN9dhkV1YGlbDm/exdxJ6qYXV/3DX
	nQLuDUAtOrpTM3cVQUsKVUrZo+eEEaXnnJVse8w6afNDBm4J90IpKxGP6ZjdM5aufJQZ
	HNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ChrS/spx+A2v0ilF0tFUJ3RU9zfGVuplHoHQXfS1MYs=;
	b=Uih+UmcRlA+M6Sv2G0Z3x/wnVznueXAEchCeUEpoRGdrceE1v6skHGb19bbfuC9NXj
	saOv+iYP//aKmCDChApoaA6lB90N17qaedu/0YKT9u56rTS/DsUnwIS+9OOQvfm+7SPs
	xK+gWDkf/tXeuoeRB4AlKP3CpoCJcLvW1AhOHrunuCuNnfdYgNVqiU28iybkpycxO12h
	bhwIitQvbMb5Jk54upfej0m38M82qOeWDA+o84dyNxTZXpLPhMTTBcFpmm4+8fa7SLVH
	uZuPJ7jCRyjcam9YRVwg6snG3u1ACBNne08tM7eLovBw4Sqmr0pFXPHo0GwM/IelEY7p
	o1YQ==
X-Gm-Message-State: APt69E0h8k3kgUp0V80AvtADSZ1BBwleFVerKXr0D/8WKjN5Oh4ZSb5n
	pbYODWWs8kT6NYCsxW8XA28=
X-Google-Smtp-Source: AAOMgpfLJtL/M1iKSLyGZBpQ623xycGtH0VZJv/6H87DRGP7lGj8JY0br5mTK3g/8rlHTKZ0YEgWOg==
X-Received: by 2002:a0c:8c8a:: with SMTP id
	p10-v6mr6606448qvb.68.1529813225927; 
	Sat, 23 Jun 2018 21:07:05 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.07.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:07:05 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Sun, 24 Jun 2018 01:06:08 -0300
Message-Id: <20180624040609.17572-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v3 15/16] hw/arm/stellaris: Fix gptm_write()
 error message
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
X-List-Received-Date: Sun, 24 Jun 2018 04:07:14 -0000

Missed in df3692e04b2.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/stellaris.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index d06e366402..42baa768b2 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -294,7 +294,7 @@ static void gptm_write(void *opaque, hwaddr offset,
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "GPTM: read at bad offset 0x%x\n", (int)offset);
+                      "GPTM: write at bad offset 0x%x\n", (int)offset);
     }
     gptm_update_irq(s);
 }
-- 
2.18.0


