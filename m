Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQaG4-0004dw-Ii
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 11:21:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaFy-0004Yp-Uu
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:21:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaFx-0003c0-5G
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:21:50 -0400
Received: from mail-qk0-x235.google.com ([2607:f8b0:400d:c09::235]:35247)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaFu-0003aQ-Hw; Wed, 06 Jun 2018 11:21:46 -0400
Received: by mail-qk0-x235.google.com with SMTP id d130-v6so4187635qkc.2;
	Wed, 06 Jun 2018 08:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=H9Jx3ZsoCrenRU7skyz8KGCY7zDyhcjoy12Hh6vS5mo=;
	b=opjsKYtzYAtET5SmaXPfsfxp1YHTOoQMzgEGYsCDdG91o55B9XPjU+6odd642wzOes
	fejafjb6o4mmibRlPLb2bsP6GDll7QYqCpoftAVQ9oCOvYEYOcTaKRJQDxlqk+UD++Nl
	HAVK/N1EgKbbFnOuyMzFJUbPjdEK6CiGD83EVuo6jZj17hzWBIQdlAYyH/MtDYUY0mYz
	dbTwa/JIPqLC/QO3PJ+prBtxgR6Ny6Tj2C1z0G/dyvXPLcbdseRJE3HogYsSeW4pzI1j
	Oe6XTLacZ0zyfhxzVlQeS7T5/rk/35VfJimP6e3xJoHDW0kfGl9WhECNfEj+NVeql07j
	wE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=H9Jx3ZsoCrenRU7skyz8KGCY7zDyhcjoy12Hh6vS5mo=;
	b=UviZrzuqrzfqsKsZg3+Y0n6k2HWP2c/FSWjqZzVMG7iMyStMRVkElPip/az2pzup68
	ztCPa4hLHsabBd+gkrABpsyrJemZWukRWOgRJwLWp8/BBis844wn0j3v78sLRphCK5Py
	bBD1ruxzIFRZsK7qq/FnHIp8kcud+cbA8BLuKh1ck/c8HpIobx2+5a9MLMLt7jPfI36D
	xkEli4Lze/khLbAlGNTR9H2Nlb1Q4xPfwuK2CDCm6c66Dpl7OX8NFuxpJLBLaxVd4Kl+
	lmwrIHc756ChP2EswIZcdS6WV5Sb4BcnqVMR01qELHTBDgchn90bwokVAvLC9UQx+KpR
	WD7w==
X-Gm-Message-State: APt69E17QqWGFJNezjwq3Z8JdOlyBTVp7vUdv5ceSugpaYdGKPgJRPGc
	mN8UEVES0Sr7xdjIszlHLYc=
X-Google-Smtp-Source: ADUXVKI4IcqvHwn5c5sDM0UwrmCaEd7eEjrfmUE5WnobeSW9AL+VnJApfbMddBu7xv+7lkoHE4QLxA==
X-Received: by 2002:a37:6294:: with SMTP id
	w142-v6mr2862311qkb.124.1528298505995; 
	Wed, 06 Jun 2018 08:21:45 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	i8-v6sm38756255qtb.11.2018.06.06.08.21.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 08:21:45 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Antony Pavlov <antonynpavlov@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org (open list:Canon DIGIC)
Date: Wed,  6 Jun 2018 12:21:19 -0300
Message-Id: <20180606152128.449-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180606152128.449-1-f4bug@amsat.org>
References: <20180606152128.449-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::235
Subject: [Qemu-trivial] [PATCH 02/11] hw/digic: Add trailing '\n' to
 qemu_log() calls
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
X-List-Received-Date: Wed, 06 Jun 2018 15:21:55 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/digic-uart.c   | 4 ++--
 hw/timer/digic-timer.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/char/digic-uart.c b/hw/char/digic-uart.c
index 6ebcb87a40..ccc75eaa4d 100644
--- a/hw/char/digic-uart.c
+++ b/hw/char/digic-uart.c
@@ -60,7 +60,7 @@ static uint64_t digic_uart_read(void *opaque, hwaddr addr,
     default:
         qemu_log_mask(LOG_UNIMP,
                       "digic-uart: read access to unknown register 0x"
-                      TARGET_FMT_plx, addr << 2);
+                      TARGET_FMT_plx "\n", addr << 2);
     }
 
     return ret;
@@ -98,7 +98,7 @@ static void digic_uart_write(void *opaque, hwaddr addr, uint64_t value,
     default:
         qemu_log_mask(LOG_UNIMP,
                       "digic-uart: write access to unknown register 0x"
-                      TARGET_FMT_plx, addr << 2);
+                      TARGET_FMT_plx "\n", addr << 2);
     }
 }
 
diff --git a/hw/timer/digic-timer.c b/hw/timer/digic-timer.c
index e1fcf73c3e..4d73077207 100644
--- a/hw/timer/digic-timer.c
+++ b/hw/timer/digic-timer.c
@@ -73,7 +73,7 @@ static uint64_t digic_timer_read(void *opaque, hwaddr offset, unsigned size)
     default:
         qemu_log_mask(LOG_UNIMP,
                       "digic-timer: read access to unknown register 0x"
-                      TARGET_FMT_plx, offset);
+                      TARGET_FMT_plx "\n", offset);
     }
 
     return ret;
@@ -109,7 +109,7 @@ static void digic_timer_write(void *opaque, hwaddr offset,
     default:
         qemu_log_mask(LOG_UNIMP,
                       "digic-timer: read access to unknown register 0x"
-                      TARGET_FMT_plx, offset);
+                      TARGET_FMT_plx "\n", offset);
     }
 }
 
-- 
2.17.1


