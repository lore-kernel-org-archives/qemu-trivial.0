Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQaG6-0004l0-RM
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 11:22:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaG3-0004cH-2n
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:21:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaG0-0003dZ-0i
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:21:55 -0400
Received: from mail-qt0-x232.google.com ([2607:f8b0:400d:c0d::232]:43629)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaFr-0003Z4-VZ; Wed, 06 Jun 2018 11:21:44 -0400
Received: by mail-qt0-x232.google.com with SMTP id y89-v6so6733174qtd.10;
	Wed, 06 Jun 2018 08:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=R2c0dCdRKfNwLK7aLrg342j87TiuJblDv2Y8wxRyhdQ=;
	b=TRn4yXoKIy2Flke4AdU04pdO7Slub2y2TH0fbOcR7RRim9pk28eNsm83Qj3805GMyS
	TfKVE+qkvP4CnrNqqnfZGFx88sNU6DxH3cLqJ2gE8bZmGdllixDRR9tegMDq3TW75bEg
	ZRT559GD2/B++MA1Fpk72SGxhJUINYUwImQjxyc+5Lt3pNGpW+GBheo+LjKN+GoR7TEj
	Ygtt6ynbuHCNkJuVpeyoyKOi4eP3GLbicLLtPgti0pKldZFqFX16q7E8tCDHA9tG4i6g
	wPtQpQ0CV3qsf++RC3nsSDierxkv5nxyvrDV99U9Bc4kHwXWvPFY5quHFavhKpoXDwci
	5pyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=R2c0dCdRKfNwLK7aLrg342j87TiuJblDv2Y8wxRyhdQ=;
	b=BmLvl16ejFVTJySJmXll48i92a0vGGdTF2OPBLRpJLcu96ZbrgyVeBj4OLK+Xg4FX+
	0fx0Zy6jdLPzeo9ZWGhswzvI+AwhJnsO606o394TixvLISZuk5gq5Zo56g3s3K9VKzUl
	3yNZ/bDWJkCLtCGZ1VmeoO7sDRFEalgsQrCyEHYpwAv/FKI466NkqVSudb3Otb+AoPlr
	5CHHy9rvxdoYunn8F1vRNGs4CPhLR3wgGza31mOC9rqfNZz3JTF1lZovqSV7K83is2Wo
	8wD6my3coCVwffyzNzk5GHccT0p4IMYhm16Xg2E4KBm65eO4e+6BftTdaEhTfSVrZpFu
	u7sg==
X-Gm-Message-State: APt69E2XYdT6VnDVmbQ0Hmjejvnl75Gy9xxYjUpz6hptVGWZuJ1kMpXl
	GmQHiSrfp9Rvc7e38CFYgRk=
X-Google-Smtp-Source: ADUXVKLGPvDbHeOtlH5QPvqXMA9zlqkjIOtNQI3Nzza9EmfIqsj7IF/tWxhr+VwJWMboTXKJ6vS5sA==
X-Received: by 2002:ac8:388:: with SMTP id t8-v6mr3208062qtg.194.1528298503555;
	Wed, 06 Jun 2018 08:21:43 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	i8-v6sm38756255qtb.11.2018.06.06.08.21.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 08:21:42 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Walle <michael@walle.cc>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed,  6 Jun 2018 12:21:18 -0300
Message-Id: <20180606152128.449-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180606152128.449-1-f4bug@amsat.org>
References: <20180606152128.449-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::232
Subject: [Qemu-trivial] [PATCH 01/11] hw/sd/milkymist-memcard: Add trailing
 '\n' to qemu_log() call
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
 hw/sd/milkymist-memcard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
index fe1cccca76..fcbccf54ea 100644
--- a/hw/sd/milkymist-memcard.c
+++ b/hw/sd/milkymist-memcard.c
@@ -140,7 +140,7 @@ static uint64_t memcard_read(void *opaque, hwaddr addr,
             r = s->response[s->response_read_ptr++];
             if (s->response_read_ptr > s->response_len) {
                 qemu_log_mask(LOG_GUEST_ERROR, "milkymist_memcard: "
-                              "read more cmd bytes than available. Clipping.");
+                              "read more cmd bytes than available: clipping\n");
                 s->response_read_ptr = 0;
             }
         }
-- 
2.17.1


