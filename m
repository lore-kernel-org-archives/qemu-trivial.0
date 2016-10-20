Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bxFZz-0003Uq-A1
	for mharc-qemu-trivial@gnu.org; Thu, 20 Oct 2016 11:48:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>) id 1bxFZx-0003SU-0J
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 11:48:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>) id 1bxFZw-0005Id-8x
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 11:48:25 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:35215)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <anand.indukala@gmail.com>)
	id 1bxFZq-0005GG-00; Thu, 20 Oct 2016 11:48:18 -0400
Received: by mail-pf0-x241.google.com with SMTP id s8so5922728pfj.2;
	Thu, 20 Oct 2016 08:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aYCT3zr3g3QUM+sMUUVmYAY0p2Gd/S/4Wb7WoA0EYqU=;
	b=xZfhHtYZumacVlFnXx+PsvirSbY+TNcdFeTvqdVHeUv1OkG9HTuwqviuSO++aLHAhp
	VfhAqFKsWk/MYCoVyZ8Ab1Kk2myP7qL4WaGsyznhzQ45Y1gYTC/O8OK2mIOTjsldIH6I
	+OMjm3ueDWf4zTlV51uTUX/4VO3tlLpUifa+7z4Vb3/0Xce5/uYJUUBW2F4k5T5TH+Ug
	yRLhHnydypCge7zOXDO+j3WrvFh4xbbPKIJJicj2j+90uwzguiaPGwInAbpBm/9n6vQY
	Z+pLcn/Qk9NGK8Ju0mWWKdQzw95rC+TI3PZpErkcTE5XOPy1PP9W4O/L9EidiBO5wtIG
	wDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aYCT3zr3g3QUM+sMUUVmYAY0p2Gd/S/4Wb7WoA0EYqU=;
	b=aiqsJSDqePy+SQ8nMQoh0OReWRJ1MTyQwKQfjRrplWmRT5YLggiguVESUo4eRlVEwZ
	pxGCfVFwKzw6rrvsFvtPS1mYE3l/hVj+MG3EkRhbQw9AxRXcOCAdt/JnayZLCW7XM+SI
	e8tB/VMn7t5pmafXMHGEX313Dzb8hJNfhT6/zvBXDEkSRvLWYMidKgBdldYeF06f1y3r
	eo/jq07LQE0NGU6OoFikO/AZdI7n0jhbJrl/01THo5F1OwHrwcAc5D+9NKMkgdr98CcR
	yNip2w7bqEoBd/YHrUaJgjUpEUfYbAKRnOuxANdsA5jGuvHgxxYiUEROSsG/oyNFIPnB
	Igrw==
X-Gm-Message-State: AA6/9Rn5QR7PBoJfikc7XFCJC9KZOIe3STU8vOTc6Y0GpboF/jEfm7KYok15eagXj0IgIw==
X-Received: by 10.98.204.67 with SMTP id a64mr2448888pfg.120.1476978495607;
	Thu, 20 Oct 2016 08:48:15 -0700 (PDT)
Received: from anand.j ([117.209.148.213])
	by smtp.googlemail.com with ESMTPSA id
	188sm58670462pfd.9.2016.10.20.08.48.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Oct 2016 08:48:14 -0700 (PDT)
From: Anand J <anand.indukala@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	thuth@redhat.com,
	eblake@redhat.com
Date: Thu, 20 Oct 2016 21:18:00 +0530
Message-Id: <1476978482-13108-1-git-send-email-anand.indukala@gmail.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-trivial] [Qemu-devel] [PATCH v3 0/2] Script changes to find
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
X-List-Received-Date: Thu, 20 Oct 2016 15:48:26 -0000

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
 scripts/clean-includes              | 54 ++++++++++++++++++++++++++++---------
 target-i386/machine.c               |  3 ---
 target-mips/machine.c               |  1 -
 target-ppc/machine.c                |  1 -
 target-ppc/mem_helper.c             |  1 -
 target-sparc/machine.c              |  3 ---
 target-xtensa/translate.c           |  1 -
 tests/crypto-tls-x509-helpers.h     |  3 ---
 tests/vhost-user-test.c             |  2 --
 util/oslib-posix.c                  |  1 -
 vl.c                                |  1 -
 29 files changed, 41 insertions(+), 49 deletions(-)

-- 
2.7.4


