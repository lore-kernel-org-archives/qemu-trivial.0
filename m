Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgv1-0005vS-LX
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:44:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePguy-0005t0-HG
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:44:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgut-0005S6-MA
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:44:12 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:36076)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgur-0005Q5-H2; Thu, 14 Dec 2017 22:44:05 -0500
Received: by mail-qt0-x244.google.com with SMTP id a16so10641528qtj.3;
	Thu, 14 Dec 2017 19:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/RRxTZobcO21pHtK/RmOxTQ5gbnzDHAhadLyYEkQw34=;
	b=ajlSgMhaqPy0KoW3m9H+kBYv8teYUevHCvJ2C4YifQXjJcrNcd3eWoSjcpNINSQ6Tz
	KZBRG+1ZdQvoEKasjEvYzzKV+nKbJNRmM46P/W5U3EKFLsibN5yZxSlZ9rXURv/gtH/v
	KFnpADF9UP1VGVCWky1/9k2dhX86CUHJfGlyZGbp0HSkGTdT4OQpdmRCzNoaVCqJ++KK
	7J9LIs0jmzpgUE+HZwZkgWJLUkA2sriT9U45E5flyz2T95VqGbb1cHo92j16aqbkRrbW
	lfN1B9Ap1uC3ErXGcCaBDZ5WuPp4J4xKdqvvxr+o2U7WbqVyE3nHemQ3HZ+BT/+egVku
	7I2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=/RRxTZobcO21pHtK/RmOxTQ5gbnzDHAhadLyYEkQw34=;
	b=NNABtljOLVK9dl2k9XYiGugZ9kDD+1nBgk0w8jEJWeeLiEHxWsXyuklSBkJrlqwkVc
	egAwZWAENPu7q3shVZBOINIzI2ffoY+euOkTVTLfIkuEhjIrVP8BtbkzPGmti1tG84Xv
	JTKwA1Dh7kwMJoeUYUnXb4gI2jifUaQ8ZpkuHBbWuizFR7+zScySfS7j6pBjmqOKJWpt
	uzxRODjiH3aWcgPHJVJVLslhPtcYbD5xMAkvBaoqSjsykMUlZ8o4PusEsOpLYB4eR0EA
	Zj75UAy/2xw2pbWL+SMJj+CdDCBCPJ8vPMTrJQZZhpNktYK6TUPg3bg8ibp32e6K1Yol
	3vug==
X-Gm-Message-State: AKGB3mIdBXVGCY9n7E2YQk3iKyYqhCyf3mgLyAjR1p4Ozs7g/BMbMi2C
	bgelvxIM1sd2ybc0dyCxvaA=
X-Google-Smtp-Source: ACJfBougyvdJpdqmA7G/Il/HUrEKR6IxNw9I8zX0pBVKN0VJaVFXX/FKMfUlm6RLq/ZYSrdGFKO6wQ==
X-Received: by 10.200.44.243 with SMTP id 48mr18658645qtx.99.1513309444908;
	Thu, 14 Dec 2017 19:44:04 -0800 (PST)
Received: from x1.local ([181.91.222.165])
	by smtp.gmail.com with ESMTPSA id n3sm3543633qte.14.2017.12.14.19.44.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:44:04 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org
Date: Fri, 15 Dec 2017 00:43:54 -0300
Message-Id: <20171215034356.4449-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v5 0/2] remove i386/pc dependency from non-PC
 world (part 1) fix
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
X-List-Received-Date: Fri, 15 Dec 2017 03:44:13 -0000

Fix patch 42 from previous series (v4) so patchew can build, and if a maintainer
is willing to take the previous series with the last 2 patches, I don't need to
respam a v6.

Regards,

Phil.

Based-on: 20171215033015.738-42-f4bug@amsat.org
          (remove i386/pc dependency from non-PC world v4)

Philippe Mathieu-Daudé (2):
  hw/i386/vmport: replace fprintf() by trace events
  misc: drop old i386 dependency

 hw/char/debugcon.c      | 1 -
 hw/i386/vmport.c        | 8 +++-----
 hw/intc/lm32_pic.c      | 1 -
 hw/moxie/moxiesim.c     | 1 -
 hw/sparc/sun4m.c        | 1 -
 hw/watchdog/wdt_ib700.c | 1 -
 hw/i386/trace-events    | 4 ++++
 7 files changed, 7 insertions(+), 10 deletions(-)

-- 
2.15.1


