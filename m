Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW395-0004kW-56
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 13:13:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW392-0004hJ-20
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 13:13:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW391-00023J-1V
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 13:13:16 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:38716)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW38u-0001zU-Fs; Thu, 21 Jun 2018 13:13:08 -0400
Received: by mail-qk0-x243.google.com with SMTP id y4-v6so2170323qka.5;
	Thu, 21 Jun 2018 10:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AJyoSg3jt7e/yAZ5L2rmZ5yibQyCGYI7o2n1HJ4qtkE=;
	b=TZzr6rGeqgPoNY2OWFXtCa0J0TywRVR7L5aBicp858J9MzOQfVqlZToyqcKzH/AcYu
	FLJP2et2jisoRWBWxADmRZ1e+V5VqLkiCiqIq/H3iBAOTBRedi+p/glZz5cBexNpXmKq
	RugD+8w8BJgShoGKaoAxwqPyjLDidKme4dF3pkZ2s5hLeaNUT3EHdyRbPdNosqthMD+9
	3PAv1PPO8pNKUmUQzhhTdAR1IcYOgMs2Z2+FBoBzft7xHUNKWtpAvMhzML8D2gL2eP85
	V0+9YC6WRg+69E7R+e88eyED0Ii/i/m1lC1FOJCY/T4Sju0nkyP456/yy5cgYDC+OVEE
	Rmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=AJyoSg3jt7e/yAZ5L2rmZ5yibQyCGYI7o2n1HJ4qtkE=;
	b=tZH/4sLl+b+QrvVa2JzgfgTiBJwJgI0B/1Ec2RwAxIeM7IHEUpXeSUc+3xWTXVgcjG
	YOmDtjMyP1YULM+eWmafoKqctnzEbHGUkzpOrQ1t1IgP1O1deXaH0JVx40kJ/2qkqGg4
	YnzgET+qUvypOxg30ZqoEo8cz8zZ3Egn5TO3rIpKvhsXF2rSlTWIjxfjgv69LRjtIoJM
	B5rNgxwZ7nx3ubmM0YYN72zsUBkO7IBMXN4T/+IrlP5WCikmqiobuVkYdyEWZBX641sl
	Pbg8a4PNUXVA88XItQGfojrcm/2KX7ZNcSLj9cnDc9c15M5TUbgPxdVwuaoQK1uXGx47
	tZpQ==
X-Gm-Message-State: APt69E05Q6lgd2n3wXB1pAwz4CGlRuVH3vPiDbPAlARVncq12Ujzl7WU
	R9Ic/x+RLi/0TtFrWUEbXFw=
X-Google-Smtp-Source: ADUXVKJkcLn5FRMXGGRtDVLn+ivWORT7NVyaCbfKiIx+nwkmLrPvTj+RaCmfgD2Ui5Kh5nSWMNbXhQ==
X-Received: by 2002:a37:3707:: with SMTP id
	e7-v6mr21373472qka.50.1529601187615; 
	Thu, 21 Jun 2018 10:13:07 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	t14-v6sm3166159qtp.65.2018.06.21.10.13.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 10:13:07 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>,
	John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Date: Thu, 21 Jun 2018 14:12:46 -0300
Message-Id: <20180621171257.14897-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH 00/11] hw: various conversions to trace-events
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
X-List-Received-Date: Thu, 21 Jun 2018 17:13:17 -0000

Hi,

This series is a collection of various trivial patches from
different stagnating branches. Time to share before loosing
them.

Only the first differs and is meant for Stefan, other will
probably go via the Trivial tree once Acked.

Regards,

Phil.

Philippe Mathieu-Daudé (11):
  trace: Fix format string for the struct timeval members casted to size_t
  sdcard: Reduce sdcard_set_blocklen() trace digits
  hw/char/serial: Convert from DPRINTF macro to trace events
  hw/char/parallel: Convert from pdebug() macro to trace events
  hw/display/cirrus: Convert printf() calls to trace events
  hw/input/tsc2005: Convert a fprintf() call to trace events
  hw/net/ne2000: Add trace events
  hw/net/ne2000: Convert printf() calls to trace events
  hw/net/etraxfs_eth: Convert printf() calls to trace events
  hw/block/fdc: Convert from FLOPPY_DPRINTF() macro to trace events
  hw/block/pflash_cfi: Convert from DPRINTF() macro to trace events

 hw/block/fdc.c                   |  6 ++---
 hw/block/pflash_cfi01.c          | 42 ++++++++++++--------------------
 hw/block/pflash_cfi02.c          | 18 +++++++-------
 hw/char/parallel.c               | 16 +++++++++---
 hw/char/serial.c                 |  5 ++--
 hw/display/cirrus_vga.c          | 25 +++++--------------
 hw/input/tsc2005.c               |  7 +++---
 hw/net/etraxfs_eth.c             |  8 +++---
 hw/net/ne2000.c                  | 25 ++++++++++---------
 hw/block/trace-events            | 17 +++++++++++++
 hw/char/trace-events             |  8 ++++++
 hw/display/trace-events          |  2 ++
 hw/input/trace-events            |  3 +++
 hw/net/trace-events              | 11 +++++++++
 hw/sd/trace-events               |  2 +-
 scripts/tracetool/backend/log.py |  2 +-
 16 files changed, 113 insertions(+), 84 deletions(-)

-- 
2.18.0.rc2


