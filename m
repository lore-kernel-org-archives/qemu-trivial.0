Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQaGP-00057q-Be
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 11:22:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaGM-000551-Cy
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:22:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaGI-0003oL-Cr
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:22:14 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:45922)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaGA-0003jd-J3; Wed, 06 Jun 2018 11:22:02 -0400
Received: by mail-qt0-x244.google.com with SMTP id i18-v6so6723246qtp.12;
	Wed, 06 Jun 2018 08:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=x+M18e3iNSIdIz1PQh3lyjSJCViAPtMh4wGMUoR2NCg=;
	b=O7vyKaiz2rTPWQLownB0lZHXVfoILe84txpYpXht633CZ2Ylxp16ibI3hGakgTYV+y
	RgnM5QmCfZMVTo0d0faoMaKIJZKrdJWdHX9b0LkBwyOdYoLzLm06LLF2NwYNtDMnMk8l
	Q1u/BTab/jLUSSgCse++EMGpInYn4eY6PTuKq1Gkicv42003kws1lUFzJ78lJrAqIuxX
	8W3L1EfFe/HO1rjE6t6kDf/Aa614QroHPwRVf3Oa+9nVzJiedabDyJf9TeqgMbNmwEhN
	Aq5tZ/eK+l7B1oSp4iRzGb6C8HtoU7UxY0OICUTfH2GuhM5JxKwq5uKKmvLf0GyMdKeK
	VWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=x+M18e3iNSIdIz1PQh3lyjSJCViAPtMh4wGMUoR2NCg=;
	b=q9KRJqiZ+yU1S+jVZ2VSnF7k5Ysmnw7bL40DECy2sMjBD51CLp9SrMb9GvK6pUBQdp
	TIUSD44GW9D0gRPlZiUJ7yaQhDRiBcJoTz2tY75+8XzlV1uIF/DGJLN7QX6m64aFIONk
	Ua4iVkC7ZrRSNt7RT+GuPlwKX2+bDsGWluVPiPogoQup1sKCRpz0HyQVclmvr6jU91HC
	TCUfmhJotqELQfdQ2DJ8b4rWyjqpm24hZmwjuMv+boQl65YKmbnovaJxBVT3R0g2vuSn
	qieTMcTFnZRZHVRYmS/IXxqA6Elmd86CCKxXmSc+AWBmZOY+yicOBYheItiF6f6jSP4C
	Z5ew==
X-Gm-Message-State: APt69E3w1tAoBerHMTFa25xgM5rSdV4lyqfJ+k1eO8dWY0grOzCKlLSp
	rbUtCsZhDmPZY2sbWLsmkrcpx971
X-Google-Smtp-Source: ADUXVKKkR23sDzOx0Zqebk2/jw2vUKHVI/hLTtWLac9BFkZH5Ca1pA3OeyYczG7pOHewNebPsuQQJQ==
X-Received: by 2002:aed:3d09:: with SMTP id
	g9-v6mr3245924qtf.272.1528298522083; 
	Wed, 06 Jun 2018 08:22:02 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	i8-v6sm38756255qtb.11.2018.06.06.08.22.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 08:22:01 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed,  6 Jun 2018 12:21:26 -0300
Message-Id: <20180606152128.449-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180606152128.449-1-f4bug@amsat.org>
References: <20180606152128.449-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 09/11] target/m68k: Add trailing '\n' to
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
X-List-Received-Date: Wed, 06 Jun 2018 15:22:16 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/m68k/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 37d6ffd853..4b5dbdb51c 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -1556,7 +1556,7 @@ DISAS_INSN(undef)
     /* ??? This is both instructions that are as yet unimplemented
        for the 680x0 series, as well as those that are implemented
        but actually illegal for CPU32 or pre-68020.  */
-    qemu_log_mask(LOG_UNIMP, "Illegal instruction: %04x @ %08x",
+    qemu_log_mask(LOG_UNIMP, "Illegal instruction: %04x @ %08x\n",
                   insn, s->insn_pc);
     gen_exception(s, s->insn_pc, EXCP_UNSUPPORTED);
 }
-- 
2.17.1


