Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XICex-0004le-FO
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 04:14:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XICeo-0004l9-7J
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 04:14:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XICeg-0007Wz-O6
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 04:14:42 -0400
Received: from mail-yh0-f48.google.com ([209.85.213.48]:64783)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XICeg-0007Wf-KQ
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 04:14:34 -0400
Received: by mail-yh0-f48.google.com with SMTP id i57so1969694yha.35
	for <qemu-trivial@nongnu.org>; Fri, 15 Aug 2014 01:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=2rRjbWtYwXwNmQzrIOBX3IOR9rs9dicrw6GJmAC3e9k=;
	b=OyuTu2MVaHhgPL/57C02D7vZDyL6U1CSwdeqQ2w7qzBN8ebSELwHhT9y6EYOpqfIM8
	n3cMEuaah/d/VbyN/dguHohbSKM3LcQZShx/OmLb/hTTKLqyPdWV4tOqifXE9fgKrnXR
	CHcmsySKAcBEuIWzTriF6WqKRnVboJ4r+XXxePPxqz17HWiZ3w9OuDkkcNknud7e4pnv
	GUO+Ter83B44h87nPFmdnPqqz1zTaCKl8lBZwTlOlAJebJLtNmoswDBtAstVehvlb0Er
	gX9oqUK5kFcVahQPimmI4hwKwlDi4msbOZXeiLbopimtrcG09hBHhLlzCMA9InlXiWo9
	YoGA==
X-Gm-Message-State: ALoCoQk7gcfemilHNAJsEkjhN/ooB4ceYVCqL2VDmd6pbRuafQrJFYDBoO/BruXvwHUs/vgJ24s6
X-Received: by 10.236.71.227 with SMTP id r63mr25311278yhd.2.1408090474132;
	Fri, 15 Aug 2014 01:14:34 -0700 (PDT)
Received: from localhost ([149.199.62.254]) by mx.google.com with ESMTPSA id
	k29sm16010366yha.33.2014.08.15.01.14.33 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 15 Aug 2014 01:14:33 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 01:14:02 -0700
Message-Id: <cover.1408090247.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 2.0.1.1.gfbfc394
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.48
Cc: qemu-trivial@nongnu.org, agraf@suse.de
Subject: [Qemu-trivial] [PATCH trivial v1 0/3] Initialise IRQ pointers as
	Zero
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Aug 2014 08:14:50 -0000


Hi,

I'm working on some QOM stuff that requires output IRQ pointers to be
initialised to zero. I have a catch-all workaround to the problem in
the series proper, but this is the startings of a more complete
solution.

Sending to trivial, as I think the change is an improvement
independently, just due to the fact its easier to debug with NULL
pointers rather than undefined pointer values.

Regards,
Peter


Peter Crosthwaite (3):
  ssi: xilinx_spi: Initialise CS GPIOs as NULL
  ppc: convert g_new(qemu_irq usages to g_new0
  intc: i8259: Convert Array allocation to g_new0

 hw/intc/i8259.c       | 2 +-
 hw/intc/openpic.c     | 2 +-
 hw/ppc/e500.c         | 2 +-
 hw/ppc/mac_newworld.c | 2 +-
 hw/ssi/xilinx_spi.c   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.0.1.1.gfbfc394


