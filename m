Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQaFy-0004Y8-9Y
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 11:21:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaFw-0004Wy-7J
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:21:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaFv-0003b9-Cc
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:21:48 -0400
Received: from mail-qt0-x232.google.com ([2607:f8b0:400d:c0d::232]:44484)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaFp-0003Xp-PQ; Wed, 06 Jun 2018 11:21:41 -0400
Received: by mail-qt0-x232.google.com with SMTP id l33-v6so6720786qta.11;
	Wed, 06 Jun 2018 08:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WmXrDEjSrbWiSs20Taaf/u9ygPS4zQsPt3kiHlH+Tqc=;
	b=ezLloFJwo4z+oz8Kn9K+9T8w6kYZuYP5IQslActaHogsaYc5/xy8IM5CMEUrCBzeHD
	ufMTBh4iTB1RHL/vvCnxhV+1k06hVMZDn9QlYnwmpjZq0B+DzRkUCabDPcV66vQcKev6
	LCpXTqSTbOzj/lTHqYjPBqH8TW7KOV8T36sbdL6G7NkX/weSNfOGY8QN/fQma3Cvs0pI
	BdqYBVx4CrgJCay1nqt/R1hQOAtuowjuKnvMgQf4YRsrJHEPEbJPQHaZ2iLq/O0RZo+w
	5xBBaAQ67GgvjJsECI7v6OVpEuvfgTPwI7ncWVjakkIwrDuKOUmzeMuq71+3qMWsROSw
	y6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=WmXrDEjSrbWiSs20Taaf/u9ygPS4zQsPt3kiHlH+Tqc=;
	b=CRp3oOlyF1WtmlbnIznMJqnH+FBWdqzSG9jDMB7V0b6wVD4rjx//Ijb2MakA/9nL7w
	yPcxZe7t4Aq0H4Y/9WrZKcf/4Wp8iFxA/m0s0vb1RtiZaW7WB/80N84bnYYoZog9a9nH
	bp9fKzwIMA3b6tOrSTih9Bl+fQKNizi92MP54989+UoUk/NpAM1c/tw8A2Po+fwuOyEB
	/XuqVu/dLHnoyl7xOXbYHGksyrCMgsMA/LDjKbv7FTzJ+K32O7sSGjASsvX1jepz+Qml
	gugWcjINA2rjpWKjoaHPUnrkSjX6azQZ4m3ga3/cFAPUF44Fy1ITqTEJFJYjyTSFbDvc
	6pHw==
X-Gm-Message-State: APt69E2qw4JWwIMGkby+4Rw/hX0WmOXbeFQj/ewoy4Bp5rCbCdlP7oEg
	o4ou6sdU4zl9CwjVq3xe8Yc=
X-Google-Smtp-Source: ADUXVKJVI6YYdBpcQub3abHEwLr+5h0ahu1NCfY4ny8RaUZ3LGrgmmM4ZvnVt0lrgxtMZwJ/c561qw==
X-Received: by 2002:ac8:2d6c:: with SMTP id
	o41-v6mr3219115qta.107.1528298501211; 
	Wed, 06 Jun 2018 08:21:41 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	i8-v6sm38756255qtb.11.2018.06.06.08.21.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 08:21:40 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Clark <mjc@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
	Paul Burton <paul.burton@mips.com>, Yongbok Kim <yongbok.kim@mips.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Antony Pavlov <antonynpavlov@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org
Date: Wed,  6 Jun 2018 12:21:17 -0300
Message-Id: <20180606152128.449-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::232
Subject: [Qemu-trivial] [PATCH 00/11] misc: Add trailing '\n' to qemu_log()
 calls
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
X-List-Received-Date: Wed, 06 Jun 2018 15:21:49 -0000

Nothing very exciting here.
I sometimes miss to notice some trace events, running with -d unimp,trace...
then using 'grep ^...'. This is only due to a missing '\n' :)

Philippe Mathieu-Daudé (11):
  hw/sd/milkymist-memcard: Add trailing '\n' to qemu_log() call
  hw/digic: Add trailing '\n' to qemu_log() calls
  xilinx-dp: Add trailing '\n' to qemu_log() call
  ppc/pnv: Add trailing '\n' to qemu_log() calls
  hw/core/register: Add trailing '\n' to qemu_log() call
  hw/mips/boston: Add trailing '\n' to qemu_log() calls
  stellaris: Add trailing '\n' to qemu_log() calls
  target/arm: Add trailing '\n' to qemu_log() calls
  target/m68k: Add trailing '\n' to qemu_log() call
  RISC-V: Add trailing '\n' to qemu_log() calls
  RFC target/xtensa: Add trailing '\n' to qemu_log() calls

 hw/arm/stellaris.c        | 11 ++++++-----
 hw/char/digic-uart.c      |  4 ++--
 hw/core/register.c        |  2 +-
 hw/display/xlnx_dp.c      |  4 +++-
 hw/mips/boston.c          |  8 ++++----
 hw/ppc/pnv_core.c         |  4 ++--
 hw/sd/milkymist-memcard.c |  2 +-
 hw/timer/digic-timer.c    |  4 ++--
 target/arm/helper.c       |  4 ++--
 target/m68k/translate.c   |  2 +-
 target/riscv/op_helper.c  |  6 ++++--
 target/xtensa/translate.c |  6 +++---
 12 files changed, 31 insertions(+), 26 deletions(-)

-- 
2.17.1


