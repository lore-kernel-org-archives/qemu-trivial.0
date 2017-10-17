Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FV8-0005tc-KQ
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:12:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FV6-0005pQ-1L
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:12:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FV5-0003rg-4L
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:12:51 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:49130)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FV0-0003mP-Rd; Mon, 16 Oct 2017 20:12:46 -0400
Received: by mail-qk0-x244.google.com with SMTP id d67so25025qkg.5;
	Mon, 16 Oct 2017 17:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=iW4BlL67z2LU2u5Xsgn/BO6ckhBOamen+YEfDd5Bbaw=;
	b=k9hICTesRKTLaHN6Ze3xpMdrvViDQ5ze+sTLsdmBFUkat2jqGQQgZ0VKnkmVUgPSwJ
	qtLwY0Y+LMUmIaTz4EeGfrKkODol0tK7AddRPcUyYazA9NASvo6Z2vKBHMhZ1tu7QZoa
	FCfcWgqUedaMkWsO+DsxAe7FI9iBw0iGH6NSmi7nHs79gp2tOTvgQ4jFURr/r1OfSRhw
	LDgplL3dycaT4GYpfGEPx2zQYtuPw0Di/GaVR7bYkac599oZ230SjL9z7oyhaAc68YpO
	akiuzAld5/QWLqWHhivMp1xGxv7OGVqAp8EoCiu2/FXlURnqvyR5sCVi3Pr6QpC6f9cU
	Nlow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=iW4BlL67z2LU2u5Xsgn/BO6ckhBOamen+YEfDd5Bbaw=;
	b=IyzmXxCsO4Fk+1WhleD/67hJmlqT4bu1Tqo13Xe1R0A90PxP2TJuDqmfw6zJC+OrTG
	kRx1k6uhXaZzNAHBx6+IQ4Vw9yKcmhjwXa8nFSju0lY2/lbV1zAkY81PctoJycLWAG7n
	lFvf8QQThutBk0Xa+urGn0zTerNP/QVYwS1SbScdzqy635riqCM5hr0ihMszd88OuoPy
	aStdfNq0WBArpaBqd7GURSNHd7FnbtpF+WeH2sDKtsOBN6k0TGzncz590T5nfyCxCHdc
	1ujYYn5QQCq0HPLnddioIeVpp97daChPPZXEzCUZJIoRZqWn5dxGlOkV5YXCupckczcF
	DYyw==
X-Gm-Message-State: AMCzsaW83Y8Kybdkpvo2IRU7o6UiaxCGRFUR8hVyQKQwQYrxLdc+XXBi
	+tZeejOnXePiCJ1TXyJRJAw=
X-Google-Smtp-Source: AOwi7QASR3KlAy0lSLfw7v+qd+ABS3gpsI+qxsfouNljk0bjGr4knMvlhVBteiNlRNiI7AxLBIH1hA==
X-Received: by 10.55.20.78 with SMTP id e75mr16222963qkh.250.1508199166412;
	Mon, 16 Oct 2017 17:12:46 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.12.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:12:45 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:34 -0300
Message-Id: <20171017001209.32276-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v2 04/39] MAINTAINERS: add an entry for
 watchdog/wdt_ib700
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
X-List-Received-Date: Tue, 17 Oct 2017 00:12:53 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0ce3c353e0..99033b049c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -856,6 +856,7 @@ F: hw/misc/pc-testdev.c
 F: hw/timer/hpet*
 F: hw/timer/i8254*
 F: hw/timer/mc146818rtc*
+F: hw/watchdog/wdt_ib700.c
 F: include/hw/dma/i8257_dma.h
 F: include/hw/i2c/pm_smbus.h
 F: include/hw/timer/hpet.h
-- 
2.15.0.rc0


