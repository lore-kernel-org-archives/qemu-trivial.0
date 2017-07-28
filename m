Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dbE1X-00056N-F8
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 18:46:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1U-00055R-Gj
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 18:46:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1R-00027X-9r
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 18:46:20 -0400
Received: from mail-qt0-x233.google.com ([2607:f8b0:400d:c0d::233]:38235)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1R-00026n-34; Fri, 28 Jul 2017 18:46:17 -0400
Received: by mail-qt0-x233.google.com with SMTP id t37so90769009qtg.5;
	Fri, 28 Jul 2017 15:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VLruKz0faxFHhrYCLP1yhc9aThsn19BMF2V+IfHKvd4=;
	b=IN4vn1eRrwh7x44MEMrdUzKSO0qB3cahgAxh2Pq3VT6iLmj+VIGkjca3CNf2BE4z3B
	pjEBXpXcCbu+9esujDbFZQW68loSNMHzRyvdUeziIScZHsqitEnCoBRg1gMOZxghQ4yC
	ZXBOqqK+sS69PBH4mEmkE5pgtPV9ENj/zNOaIJzZ3e5EYLaUD2RzeLpqUSAT1cx+XLoV
	l3gRvqpJAjDzrpvteczftU4nl0L//SonrRWtxRpkldX+TnyRZY47SMa56ZtL02tW3ixk
	rEOyZ4pU6hhZx3nni8l+f5RNYtJG+JfyTCVE9l74h+ALzetWAgUQIIfng3PcE2oVTMh/
	/6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=VLruKz0faxFHhrYCLP1yhc9aThsn19BMF2V+IfHKvd4=;
	b=YOBJYO340TwfboSENiF9aaWCVU8lWqlilctI0t8nTWyAWIyNI2+uGsAjlEOPagvjm8
	Mcc+GujFISYYuouhbugnoSfMdtxFvyJU5aXNYyPDIpBoKeypBg6+gtV4QEO0Erwk6Uf7
	9Ih3J5mEOPEbu2ZAyXsfMkR7HTz204Q4ldWmN3QztNyDVHnJ6iJM8rdmS0Ln9kN3CUtf
	slgczKOLgGW6Tn3Y/HOPVpRfP4GUsUx7mSkqAJZOREaHFmSc5F09bLnct2Agz7J/CgXX
	9GKQ5lsmCssbSMUF2jVwekib+ttIgjve9tTkxBiMsCIXYU8eOoWDRiCF7GZA2sVcEty4
	4UUw==
X-Gm-Message-State: AIVw112HkxkG2JgYZgSsDZYWhDJ7MC/nUaReicwXwS4fVGaKmNHEFL7/
	RNLon4Ywbwj/eA==
X-Received: by 10.237.62.14 with SMTP id l14mr14188680qtf.52.1501281974951;
	Fri, 28 Jul 2017 15:46:14 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	m129sm15831970qkc.2.2017.07.28.15.46.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jul 2017 15:46:14 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>,
	qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
	Cleber Rosa <crosa@redhat.com>
Date: Fri, 28 Jul 2017 19:46:00 -0300
Message-Id: <20170728224608.3598-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::233
Subject: [Qemu-trivial] [PATCH v2 for 2.10 0/8] docs: fix broken paths
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
X-List-Received-Date: Fri, 28 Jul 2017 22:46:21 -0000

Hi Michael, you already applied this series to -trivial, however I updated the
commits message, not requested but not a heavy task to do neither. Since you
didn't not sent PR yet, if you mind can you take those instead? Else it's not
a big deal. Thanks!

v2:
- fixed what I misunderstood Eric said,
- fixed shell command using Eric feedback,
- added commit id of the change that introduce the invalid reference in the
  commit message.

following Cleber Rosa example I cleaned more invalid references.

Eric said "this doesn't change code and doc updates are find during freeze,
so this is a GOOD candidate for 2.10; but if it misses 2.10, slipping to 2.11
doesn't hurt." and I agree :)

I used the following command (improved by Eric) which I consider to include
in some CI test job:

$ git grep docs/ \
    | sed -ne "s/.* \(docs[^ :)}\"\']*\).*/\1/p" \
    | sed -e 's/\(.*\)\.$/\1/p' \
    | sort -u \
    | xargs ls -d >/dev/null

Regards,

Phil.

Cleber Rosa (1):
  docs: fix broken paths to docs/interop dir

Philippe Mathieu-Daudé (7):
  docs: fix broken paths to docs/interop/qcow2.txt
  docs: fix broken paths to docs/devel/qapi-code-gen.txt
  docs: fix broken paths to docs/devel/atomics.txt
  docs: fix broken paths to docs/devel/tracing.txt
  docs: fix broken paths to docs/config/ich9-ehci-uhci.cfg
  docs: fix broken paths to docs/specs/ivshmem-spec.txt
  docs: fix broken paths to docs/spin/

 audio/trace-events                  | 2 +-
 block/trace-events                  | 2 +-
 chardev/trace-events                | 2 +-
 crypto/trace-events                 | 2 +-
 docs/devel/lockcnt.txt              | 2 +-
 docs/devel/writing-qmp-commands.txt | 4 ++--
 docs/qcow2-cache.txt                | 2 +-
 docs/specs/pci-ids.txt              | 2 +-
 docs/spin/aio_notify.promela        | 6 +++---
 docs/spin/aio_notify_accept.promela | 4 ++--
 docs/spin/aio_notify_bug.promela    | 4 ++--
 docs/spin/tcg-exclusive.promela     | 2 +-
 docs/usb2.txt                       | 2 +-
 hw/9pfs/trace-events                | 2 +-
 hw/acpi/trace-events                | 2 +-
 hw/alpha/trace-events               | 2 +-
 hw/arm/trace-events                 | 2 +-
 hw/audio/trace-events               | 2 +-
 hw/block/dataplane/trace-events     | 2 +-
 hw/block/trace-events               | 2 +-
 hw/char/trace-events                | 2 +-
 hw/display/trace-events             | 2 +-
 hw/dma/trace-events                 | 2 +-
 hw/i386/trace-events                | 2 +-
 hw/input/trace-events               | 2 +-
 hw/intc/trace-events                | 2 +-
 hw/isa/trace-events                 | 2 +-
 hw/mem/trace-events                 | 2 +-
 hw/misc/trace-events                | 2 +-
 hw/net/trace-events                 | 2 +-
 hw/nvram/trace-events               | 2 +-
 hw/pci/trace-events                 | 2 +-
 hw/ppc/trace-events                 | 2 +-
 hw/s390x/trace-events               | 2 +-
 hw/scsi/trace-events                | 2 +-
 hw/sd/trace-events                  | 2 +-
 hw/sparc/trace-events               | 2 +-
 hw/timer/trace-events               | 2 +-
 hw/usb/trace-events                 | 2 +-
 hw/vfio/trace-events                | 2 +-
 hw/virtio/trace-events              | 2 +-
 hw/xen/trace-events                 | 2 +-
 include/block/aio.h                 | 2 +-
 include/qapi/visitor.h              | 2 +-
 include/qemu/atomic.h               | 4 ++--
 io/trace-events                     | 2 +-
 linux-user/trace-events             | 2 +-
 migration/trace-events              | 2 +-
 net/trace-events                    | 2 +-
 qapi-schema.json                    | 4 ++--
 qapi/introspect.json                | 2 +-
 qapi/qapi-util.c                    | 2 +-
 qom/trace-events                    | 2 +-
 scripts/qapi2texi.py                | 2 +-
 scripts/simpletrace.py              | 2 +-
 target/arm/trace-events             | 2 +-
 target/i386/trace-events            | 2 +-
 target/mips/trace-events            | 2 +-
 target/ppc/trace-events             | 2 +-
 target/s390x/trace-events           | 2 +-
 target/sparc/trace-events           | 2 +-
 tcg/README                          | 2 +-
 ui/trace-events                     | 2 +-
 util/trace-events                   | 2 +-
 64 files changed, 71 insertions(+), 71 deletions(-)

-- 
2.13.3


