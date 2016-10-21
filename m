Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bxTle-0007F1-AM
	for mharc-qemu-trivial@gnu.org; Fri, 21 Oct 2016 02:57:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>) id 1bxTlc-0007DT-Dr
	for qemu-trivial@nongnu.org; Fri, 21 Oct 2016 02:57:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>) id 1bxTlb-0004kq-O2
	for qemu-trivial@nongnu.org; Fri, 21 Oct 2016 02:57:24 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:33659)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <anand.indukala@gmail.com>)
	id 1bxTlX-0004a6-Fa; Fri, 21 Oct 2016 02:57:19 -0400
Received: by mail-pf0-x243.google.com with SMTP id i85so7781205pfa.0;
	Thu, 20 Oct 2016 23:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XPxJMxcaWWG0iwL9nBHUZvPKisif/uFzbuInk64gGu4=;
	b=f4BkCeWlzCA7BmCFWbqAeZl1UFn3ECHcSv6+bfduS89P0tw6G/0HfepXavOVHUsEha
	ASPBireoy2BOS9e52rmt42yhHj2wYrGT6NDccDOU5eh0fwo3KjedRUFFqi8kOt7QFV/W
	HB48dLijiqq7ftsN0c2McB/3kM4FvUfQ8k2PnobWw3uPQHvlzMXatX6DscE81QQIeh6O
	ri5KxmKcJbBiPAQxZsweiSsQz/A7cNq++mRxHGHYjnNCHVDn5sgDQSxLGNrITWlbzp1c
	7L+HIU+5MUZRrZadcIyRZ3KtvoTaCTPXfRHeJQfFY7lgyWEdK1+cq1SCvTSixXjNAoEI
	FIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XPxJMxcaWWG0iwL9nBHUZvPKisif/uFzbuInk64gGu4=;
	b=Hd1G6p47xecv9vqQI/bko5P7+f5USjWWl4DJX+0XHdPTWGlp2hcdQO/F/x5QH8sbqp
	iVRMiUSLI+eMT735a0qyL5OMM+pHdKB7Qhlg3U3lZCjfwfY55yHAOm4I5h/eDeUhQxg3
	BlNf2yipuFRO986Mp16RdQt4ffV49po8c2GVuRn/ay9UangjiaKPeubH8yDj1LYbege/
	S5M2OM9uwKoZDW7VklRYE9qoEHOgbtlHGsmQ4FLIPf02ra0KeU/uZ9bAI7KJqFAHv8ba
	1JjRLPCBpb8fqesXD3JFFucd9dHgDRhFk/eVy/z7QzxkP48ulIwG24PjqbSdKPCRNZf1
	ir4A==
X-Gm-Message-State: AA6/9Rm//MVXY+qU+lNAHxeW4zn8vL/WDSC381N+cP47ijaL/IVBXBOOY+LsQLU0AOeIIw==
X-Received: by 10.99.56.87 with SMTP id h23mr7228829pgn.82.1477033037944;
	Thu, 20 Oct 2016 23:57:17 -0700 (PDT)
Received: from anand.j ([117.242.89.90]) by smtp.googlemail.com with ESMTPSA id
	j17sm2057818pfe.79.2016.10.20.23.57.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Oct 2016 23:57:17 -0700 (PDT)
From: Anand J <anand.indukala@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	thuth@redhat.com,
	eblake@redhat.com
Date: Fri, 21 Oct 2016 12:27:05 +0530
Message-Id: <1477033027-25315-1-git-send-email-anand.indukala@gmail.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-trivial] [Qemu-devel] [PATCH v4 0/2] Script changes to find
 duplicate #include entries
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
X-List-Received-Date: Fri, 21 Oct 2016 06:57:25 -0000

There were some files in the code base with multiple inclusion of the same header files.
Following changes are made to mitigate this issue.

 1) --check-dup-head option is added to the scripts/clean-includes to search files and
    find out such entries. This will help to catch redundant #includes in the future.
 2) Removed most of the duplicate entries currently present in the code base using the
    script.

Anand J (2):
  scripts/clean-includes: added duplicate #include check
  clean-up: removed duplicate #includes

 accel.c                             |  1 -
 cputlb.c                            |  1 -
 gdbstub.c                           |  1 -
 hw/i386/acpi-build.c                |  1 -
 hw/microblaze/boot.c                |  1 -
 hw/mips/mips_malta.c                |  1 -
 hw/nvram/fw_cfg.c                   |  1 -
 hw/pci-bridge/pci_expander_bridge.c |  1 -
 hw/ppc/ppc405_boards.c              |  1 -
 hw/ppc/spapr.c                      |  1 -
 hw/timer/grlib_gptimer.c            |  1 -
 hw/tpm/tpm_tis.c                    |  1 -
 hw/unicore32/puv3.c                 |  1 -
 hw/usb/dev-mtp.c                    |  1 -
 include/hw/i386/pc.h                |  1 -
 monitor.c                           |  2 --
 qemu-io-cmds.c                      |  1 -
 qmp.c                               |  1 -
 scripts/clean-includes              | 56 +++++++++++++++++++++++++++----------
 target-i386/machine.c               |  3 --
 target-mips/machine.c               |  1 -
 target-ppc/machine.c                |  1 -
 target-ppc/mem_helper.c             |  1 -
 target-sparc/machine.c              |  3 --
 target-xtensa/translate.c           |  1 -
 tests/crypto-tls-x509-helpers.h     |  3 --
 tests/vhost-user-test.c             |  2 --
 util/oslib-posix.c                  |  1 -
 vl.c                                |  1 -
 29 files changed, 42 insertions(+), 50 deletions(-)

-- 
2.7.4


