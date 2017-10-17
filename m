Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4Uzr-0001Pl-7k
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:45:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzo-0001Mq-CC
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzn-00036z-KF
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:36 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:54623)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzk-00035L-EF; Tue, 17 Oct 2017 12:45:32 -0400
Received: by mail-qt0-x242.google.com with SMTP id z19so4889392qtg.11;
	Tue, 17 Oct 2017 09:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dBRSX5MJqOmvvmpe7lNhAWApjSogMZ+DNAJSpI+x/3I=;
	b=LwtTK3TfSTwqu6gGOBhL+TV2R6Efazq/2BAJ3P6BRzgxen7Zit4kIb9V+KznCb6UjL
	zfvsIEDvdUwiogYSwrvAXJegwF+8BZDp/MNMhw1T93bepvu63qTMKT1ZVDBv/l/7ewLe
	Bxkjik3iuTjgyAVMT+y9mVsVrBfdNnzr9F+VGq/MIDzpkjYSO4tOBikzZS5FT/YgfV+J
	no2ewpsLsY0J+CoAYNYuCpidzzMUOF6Q5qLkIFxVPGRddMPWNWZSWI6e354FvNCN5rYq
	ZpTuWR62CIzLuy0o2+3O4fyB+bXpNtZ4ecGGEM/u0ewM1rzF76IteIEHCuShRsslt+5d
	y4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=dBRSX5MJqOmvvmpe7lNhAWApjSogMZ+DNAJSpI+x/3I=;
	b=imaFjuRx2RrPiD1RqN3SHMw8io/jjQCm9AncIgKwkm2c9xuF2LyNNagiB1C6crkkqF
	o9EdWnbmE12NZZyI4UrJo+Fiz0NP1zTbTT6bVhieVa80wgRpjG0IFGQJTOlbgrCNhJy0
	badxsUVD6l/kbeVb1UlXjJFPVVRGV8BLYsevgZZGSmmQxeW/Xj/Kua23NBW1O4htK7GL
	SCHHlx9318SMskPly57pAHZ6wukscNSsjRrjquTVVGvgyr1fuxp4LKNhxWpqjU1vvzaB
	RIDGN5fcXHpQFlcgIkeEciBbWbsQk2rhOWO4S7UFKNnrwmRjQsKiyD+OkD68vnm0KYvl
	rVxw==
X-Gm-Message-State: AMCzsaX8weemaMiAhGnHTOp6wU0AEIQoeoY/tBIWC+zRfOtGCJwx+CuE
	GK6p0QydGVsTfKATGX5m6fU=
X-Google-Smtp-Source: ABhQp+SU17tR6oaikypa2Mk+pkEbKB96DzoqkyH/YwJy+xjcPRa6pmvKdXQpPbmOqHfjgI72lUZZOA==
X-Received: by 10.237.33.186 with SMTP id l55mr20963609qtc.71.1508258731832;
	Tue, 17 Oct 2017 09:45:31 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.45.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:45:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:43:49 -0300
Message-Id: <20171017164426.25277-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v3 05/42] MAINTAINERS: add an entry for
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
X-List-Received-Date: Tue, 17 Oct 2017 16:45:37 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 510505b2f3..907e067903 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -856,6 +856,7 @@ F: hw/misc/pc-testdev.c
 F: hw/timer/hpet*
 F: hw/timer/i8254*
 F: hw/timer/mc146818rtc*
+F: hw/watchdog/wdt_ib700.c
 F: include/hw/i2c/pm_smbus.h
 F: include/hw/isa/i8257.h
 F: include/hw/timer/hpet.h
-- 
2.15.0.rc0


