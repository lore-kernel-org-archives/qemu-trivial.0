Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxwv-0003ve-Fy
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:36:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxwr-0003tT-8m
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxwq-0002rl-6Y
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:29 -0400
Received: from mail-qt0-x234.google.com ([2607:f8b0:400d:c0d::234]:36612)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxwl-0002mF-E4; Fri, 28 Jul 2017 01:36:23 -0400
Received: by mail-qt0-x234.google.com with SMTP id v29so53585836qtv.3;
	Thu, 27 Jul 2017 22:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RrfqTTk0sSfdz7eFaHExE86F1OJ9lvjIf5ZOSptxDIQ=;
	b=beO2c9WHW8Ek4QJzGXB7PSoIUOHoxu5N1gpbr/RMhzJidaDIYDnubUQMZrPhKyLE0w
	RCtBG3dRXmEpHDFB6bM9DsVVECRp+p4gipLQqtQNIxUcA5gIef0tOc4CSOIpP7ms6d6a
	g5Oskt1YlMjlvNliRCdQN/tTocOMs9eDoi5qwqhR6e2CsKD4Y6bN80EuvPKgzpA6+Ofn
	WDpU9iAah6OpW/ksoO/NjxpUe/H8ZEnQVEQivodNxXHDTDHdsBA9Epwrza88li0AvqS5
	wkxF902RvGLovkX9wEcn+ciWf8ttzm0mFiWy7KVygqn13F4tz7I2JZmr49NgAfJEienh
	w0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=RrfqTTk0sSfdz7eFaHExE86F1OJ9lvjIf5ZOSptxDIQ=;
	b=RcEgAgpaAZCkycF4vdNQxyDMCnVHGquaTck7jvdxfwldX2lheDL4yK4Dv7+9yJvLNU
	c/GzlIela0YPKNvEeKDnmhFH5rpMls1Xq6hM2PQgbnoOP3T1hnEITWp00T7gUGbM6oDI
	IeF2wqlJsK4kFF0HaoBtsXvk4Z9Ma4JykH+xBPMsOevQZkmX/W3exlqtC8tHLYOMmWWb
	rOKHdqonu+q1EL83MwOYp7rdQqgZnl+WRYvhMyfjPBVCR3U8/tOukEf//JXLbULqdV4z
	rTXlZMB023rsbpohVuef+Hxzfo0o3qudP8FJzA4qqirnZEONIRPTb6CTS+KaSDRhsAEh
	nFrQ==
X-Gm-Message-State: AIVw111xafVhX2PETHH4RoxZlLh+h6IZsKbIaBmjs2ySx0CaqeIZjjQE
	dpyaV1VN64t31g==
X-Received: by 10.200.4.170 with SMTP id s42mr6784565qtg.304.1501220182817;
	Thu, 27 Jul 2017 22:36:22 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.36.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:36:22 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: 
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:23 -0300
Message-Id: <20170728053610.15770-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::234
Subject: [Qemu-trivial] [PATCH 00/47] add missing entries in MAINTAINERS
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
X-List-Received-Date: Fri, 28 Jul 2017 05:36:30 -0000

Hi,

I first prepared this series thinking about 2.10 but then realized if someone
is calling ./scripts/get_maintainer.pl he better is using an updated git
clone :)

Distribs do provide docs/ files in /usr/share/doc/qemu* but not the
MAINTAINERS file so no hurry for this series.

I provided the script I used in the last patch, I plan to improve it so
patchew/travis can start to use it: if a new file is added to the repository
without being covered in MAINTAINERS the script remember the submitter about
it and eventually he'll resend his patch, I think this is a good practice and
help the next contributors (anyway this is a valuable experience to look at a
file history to see who has been hacking around when there is no MAINTAINERS
entry).

I don't want to overburden current maintainers, so the last patches add
Orphans entries but I tried to select relevant commiters and include them in
each patch.

The criteria I used is "If I change this file, who should I notify? Who would
be interested?"

Regards,

Phil.

Philippe Mathieu-Daudé (47):
  MAINTAINERS: add missing entry for documentation
  MAINTAINERS: add missing ARM entries
  MAINTAINERS: add missing STM32 entry
  MAINTAINERS: add missing USB entry
  MAINTAINERS: add missing KVM entry
  MAINTAINERS: add missing entry for vhost
  MAINTAINERS: add missing entry for vfio/ccw
  MAINTAINERS: add missing entry for virtio
  MAINTAINERS: add missing entry for virtio/9p
  MAINTAINERS: add missing entry for virtio/blk
  MAINTAINERS: add missing entry for virtio/ccw
  MAINTAINERS: add missing entry for virtio/input
  MAINTAINERS: add missing entry for virtio/rng
  MAINTAINERS: add missing entry for virtio/crypto
  MAINTAINERS: add missing VMWare entry
  MAINTAINERS: add missing entry for gdb
  MAINTAINERS: add missing guest-agent entries
  MAINTAINERS: add missing TCG entry
  MAINTAINERS: add missing qcow2 entry
  MAINTAINERS: add missing PCI entries
  MAINTAINERS: add missing CRIS entry
  MAINTAINERS: add missing M68k entry
  MAINTAINERS: add missing LM32 entry
  MAINTAINERS: add missing MicroBlaze entry
  MAINTAINERS: add missing MIPS entry
  MAINTAINERS: add missing NiosII entry
  MAINTAINERS: add missing OpenRISC entry
  MAINTAINERS: add missing PowerPC entry
  MAINTAINERS: add missing SH-4 entry
  MAINTAINERS: add missing SPARC entry
  MAINTAINERS: add missing TriCore entry
  MAINTAINERS: add missing UniCore32 entry
  MAINTAINERS: add missing Xtensa entry
  MAINTAINERS: add missing X86 entries
  MAINTAINERS: add missing entries for throttling infra
  MAINTAINERS: add missing entry test for megasas
  MAINTAINERS: update docs/devel/ entries
  MAINTAINERS: update docs/interop/ entries
  RFC MAINTAINERS: add missing SSI entries
  RFC MAINTAINERS: add missing entry for AIO
  RFC MAINTAINERS: add missing I2C entries
  RFC MAINTAINERS: add missing Bluetooth entries
  RFC MAINTAINERS: add missing TPM entries
  RFC MAINTAINERS: add missing entry for tilegx
  RFC MAINTAINERS: add missing entries for loader
  RFC MAINTAINERS: add missing entries for Coccinelle scripts
  MAINTAINERS: script to find outdated entry

 MAINTAINERS                 | 102 ++++++++++++++++++++++++++++++++++++++++----
 scripts/check_maintainer.sh |  21 +++++++++
 2 files changed, 114 insertions(+), 9 deletions(-)
 create mode 100755 scripts/check_maintainer.sh

-- 
2.13.3


