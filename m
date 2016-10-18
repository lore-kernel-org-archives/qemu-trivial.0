Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bwPK7-0005OF-8Q
	for mharc-qemu-trivial@gnu.org; Tue, 18 Oct 2016 04:00:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>) id 1bwPK2-0005Lm-QF
	for qemu-trivial@nongnu.org; Tue, 18 Oct 2016 04:00:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>) id 1bwPJu-0006kQ-TT
	for qemu-trivial@nongnu.org; Tue, 18 Oct 2016 04:00:30 -0400
Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243]:34880)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <anand.indukala@gmail.com>)
	id 1bwPJn-0006iH-4j; Tue, 18 Oct 2016 04:00:15 -0400
Received: by mail-io0-x243.google.com with SMTP id p26so12199413ioo.2;
	Tue, 18 Oct 2016 01:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AwEQbnE8gpN+Qnj83LMlhzAbysYiPsZIoTbcTi2/Y8I=;
	b=MoRC5BdXZ6CaxnL7uHlhamoYQ9goIbMrwMGBpwF6460e3ELDWqkYH+QJg3FljGWqFS
	b3TeyOhUQHGzol8UOZqc69RJWF0VJO4WdOhDuiXD+JnJuMyktvLQNl4nDHhsF1MiXl7O
	AV9PHWiSkf0Wj5KQKL2hsPYyXCD06N7nfDL/jK0+Z/HQ8ofCe4b/vg/QPvtvKIfIFrmh
	6ogDw4CCVPUSVmaDhSClz9zsZyYkGw2SN2Zr3C1U5V4JycAy+Wce9B7NY2NTLq05N32I
	jVWB3QkXCXWUlwFgro19vf08nyyslbef93oATk91uZNpAtOCQc8ZpWvW/Yy5Moi0x8sm
	i04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AwEQbnE8gpN+Qnj83LMlhzAbysYiPsZIoTbcTi2/Y8I=;
	b=AN6jeXeaOOE81snuiaedHiYc9TIXoFlaaQWGYHSSsAoSnCrko0ruLRL4fQFOhtQRFF
	dXlPvBenPij4HW6ksrqrgaFITeKZZgE6HIkQNIhTQ8I4FwbaDYU54lLkZtyelUfhMIJD
	Buk235ui6u5LDlO7Y4h2NMgxr3ZQOWU0HfqOR/sQXrso7uUels5SllO5bf76QwQjSiAd
	AvrUPr6+CADYel6cbvttEkzABOG+sAdRQ8CgsKmJ++eO7QVBQ6opUyodvu33CcPqrNtR
	H+WIia007VJzlEY48GMalflBQnCTRmm9/spyMqWIK51QPHmMHm0Fy6H4iZ5dqqCXakm0
	T1Yw==
X-Gm-Message-State: AA6/9Rmgi/gGQHRmrb3rixjy+WEf4fkNK4966D+JFV0dZeBeLBCB2AcMY5rD17PkUus8oZIo/DCDtbdAEhqXSQ==
X-Received: by 10.107.17.32 with SMTP id z32mr26516927ioi.1.1476777613930;
	Tue, 18 Oct 2016 01:00:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.159.8 with HTTP; Tue, 18 Oct 2016 01:00:13 -0700 (PDT)
In-Reply-To: <1476297600-27453-1-git-send-email-anand.indukala@gmail.com>
References: <1476297600-27453-1-git-send-email-anand.indukala@gmail.com>
From: Anand J <anand.indukala@gmail.com>
Date: Tue, 18 Oct 2016 13:30:13 +0530
Message-ID: <CANDALvkyuvZaE7-SOuz6S7WzJC1k7w4UiRma5wG5wO0rAouzEw@mail.gmail.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary=001a113f2676173735053f1f15e2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] script/clean-includes:
 added duplicate #include check
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
X-List-Received-Date: Tue, 18 Oct 2016 08:00:34 -0000

--001a113f2676173735053f1f15e2
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 13, 2016 at 12:10 AM, Anand J <anand.indukala@gmail.com> wrote:

> Added script to check duplicate #include entries. This check will scan and
> print the files in which duplicate #include entries are present.
>
> Script might output false postive entries as well. Such entries should
> not be removed. So if it finds any duplicate entries script will terminate
> with an exit status 1. Then each and every file should be checked manually
> and corrected if necessary.
>
> Added an additional option --ignore-duphead in the clean-includes
> script to disable this check if all the duplicate #includes are
> genuine. The check in enabled by default.
>
> NOTE: Removed some of the genuine duplicate entries in the code base.
>
> Signed-off-by: Anand J <anand.indukala@gmail.com>
> ---
>  accel.c                             |  1 -
>  cputlb.c                            |  1 -
>  gdbstub.c                           |  1 -
>  hw/i386/acpi-build.c                |  1 -
>  hw/microblaze/boot.c                |  1 -
>  hw/mips/mips_malta.c                |  1 -
>  hw/nvram/fw_cfg.c                   |  1 -
>  hw/pci-bridge/pci_expander_bridge.c |  1 -
>  hw/ppc/ppc405_boards.c              |  1 -
>  hw/ppc/spapr.c                      |  1 -
>  hw/timer/grlib_gptimer.c            |  1 -
>  hw/tpm/tpm_tis.c                    |  1 -
>  hw/unicore32/puv3.c                 |  1 -
>  hw/usb/dev-mtp.c                    |  1 -
>  include/hw/i386/pc.h                |  1 -
>  monitor.c                           |  2 --
>  qemu-io-cmds.c                      |  1 -
>  qmp.c                               |  1 -
>  scripts/clean-includes              | 50 +++++++++++++++++++++++++++---
> -------
>  target-i386/machine.c               |  3 ---
>  target-mips/machine.c               |  1 -
>  target-ppc/machine.c                |  1 -
>  target-ppc/mem_helper.c             |  1 -
>  target-sparc/machine.c              |  3 ---
>  target-xtensa/translate.c           |  1 -
>  tests/crypto-tls-x509-helpers.h     |  3 ---
>  tests/vhost-user-test.c             |  2 --
>  util/oslib-posix.c                  |  1 -
>  vl.c                                |  1 -
>  29 files changed, 37 insertions(+), 49 deletions(-)
>
> diff --git a/accel.c b/accel.c
> index 403eb5e..b5a4210 100644
> --- a/accel.c
> +++ b/accel.c
> @@ -25,7 +25,6 @@
>
>  #include "qemu/osdep.h"
>  #include "sysemu/accel.h"
> -#include "hw/boards.h"
>  #include "qemu-common.h"
>  #include "sysemu/arch_init.h"
>  #include "sysemu/sysemu.h"
> diff --git a/cputlb.c b/cputlb.c
> index 3c99c34..59b3969 100644
> --- a/cputlb.c
> +++ b/cputlb.c
> @@ -19,7 +19,6 @@
>
>  #include "qemu/osdep.h"
>  #include "cpu.h"
> -#include "exec/exec-all.h"
>  #include "exec/memory.h"
>  #include "exec/address-spaces.h"
>  #include "exec/cpu_ldst.h"
> diff --git a/gdbstub.c b/gdbstub.c
> index ecea8c4..67eb028 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -31,7 +31,6 @@
>
>  #define MAX_PACKET_LENGTH 4096
>
> -#include "cpu.h"
>  #include "qemu/sockets.h"
>  #include "sysemu/kvm.h"
>  #include "exec/semihost.h"
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index e999654..b2baa60 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -30,7 +30,6 @@
>  #include "qom/cpu.h"
>  #include "hw/i386/pc.h"
>  #include "target-i386/cpu.h"
> -#include "hw/timer/hpet.h"
>  #include "hw/acpi/acpi-defs.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/cpu.h"
> diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
> index 9eebb1a..1834d22 100644
> --- a/hw/microblaze/boot.c
> +++ b/hw/microblaze/boot.c
> @@ -30,7 +30,6 @@
>  #include "qemu/option.h"
>  #include "qemu/config-file.h"
>  #include "qemu/error-report.h"
> -#include "qemu-common.h"
>  #include "sysemu/device_tree.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/loader.h"
> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index e90857e..61aa8eb 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -47,7 +47,6 @@
>  #include "elf.h"
>  #include "hw/timer/mc146818rtc.h"
>  #include "hw/timer/i8254.h"
> -#include "sysemu/block-backend.h"
>  #include "sysemu/blockdev.h"
>  #include "exec/address-spaces.h"
>  #include "hw/sysbus.h"             /* SysBusDevice */
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 92aa563..1f0c3e9 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -29,7 +29,6 @@
>  #include "hw/isa/isa.h"
>  #include "hw/nvram/fw_cfg.h"
>  #include "hw/sysbus.h"
> -#include "hw/boards.h"
>  #include "trace.h"
>  #include "qemu/error-report.h"
>  #include "qemu/config-file.h"
> diff --git a/hw/pci-bridge/pci_expander_bridge.c
> b/hw/pci-bridge/pci_expander_bridge.c
> index 1cc598f..6ac187f 100644
> --- a/hw/pci-bridge/pci_expander_bridge.c
> +++ b/hw/pci-bridge/pci_expander_bridge.c
> @@ -15,7 +15,6 @@
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_bus.h"
>  #include "hw/pci/pci_host.h"
> -#include "hw/pci/pci_bus.h"
>  #include "hw/pci/pci_bridge.h"
>  #include "hw/i386/pc.h"
>  #include "qemu/range.h"
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 4b2f07a..d01798f 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -37,7 +37,6 @@
>  #include "qemu/log.h"
>  #include "qemu/error-report.h"
>  #include "hw/loader.h"
> -#include "sysemu/block-backend.h"
>  #include "sysemu/blockdev.h"
>  #include "exec/address-spaces.h"
>
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 03e3803..42432d9 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -37,7 +37,6 @@
>  #include "sysemu/block-backend.h"
>  #include "sysemu/cpus.h"
>  #include "sysemu/kvm.h"
> -#include "sysemu/device_tree.h"
>  #include "kvm_ppc.h"
>  #include "migration/migration.h"
>  #include "mmu-hash64.h"
> diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
> index 712d1ae..4ed96e9 100644
> --- a/hw/timer/grlib_gptimer.c
> +++ b/hw/timer/grlib_gptimer.c
> @@ -26,7 +26,6 @@
>  #include "hw/sysbus.h"
>  #include "qemu/timer.h"
>  #include "hw/ptimer.h"
> -#include "qemu/timer.h"
>  #include "qemu/main-loop.h"
>
>  #include "trace.h"
> diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
> index 381e726..a6440fe 100644
> --- a/hw/tpm/tpm_tis.c
> +++ b/hw/tpm/tpm_tis.c
> @@ -34,7 +34,6 @@
>  #include "qapi/error.h"
>  #include "qemu-common.h"
>  #include "qemu/main-loop.h"
> -#include "sysemu/tpm_backend.h"
>
>  #define DEBUG_TIS 0
>
> diff --git a/hw/unicore32/puv3.c b/hw/unicore32/puv3.c
> index 31cd171..032078f 100644
> --- a/hw/unicore32/puv3.c
> +++ b/hw/unicore32/puv3.c
> @@ -13,7 +13,6 @@
>  #include "qapi/error.h"
>  #include "qemu-common.h"
>  #include "cpu.h"
> -#include "qemu-common.h"
>  #include "ui/console.h"
>  #include "elf.h"
>  #include "exec/address-spaces.h"
> diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
> index 58d95ff..9cb0f50 100644
> --- a/hw/usb/dev-mtp.c
> +++ b/hw/usb/dev-mtp.c
> @@ -17,7 +17,6 @@
>  #include <sys/statvfs.h>
>  #ifdef CONFIG_INOTIFY1
>  #include <sys/inotify.h>
> -#include "qapi/error.h"
>  #include "qemu/main-loop.h"
>  #endif
>
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index b16c448..9c42603 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -13,7 +13,6 @@
>  #include "qemu/bitmap.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/pci/pci.h"
> -#include "hw/boards.h"
>  #include "hw/compat.h"
>  #include "hw/mem/pc-dimm.h"
>  #include "hw/mem/nvdimm.h"
> diff --git a/monitor.c b/monitor.c
> index 8728dd9..b8773a5 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -59,7 +59,6 @@
>  #include "qapi/qmp/json-streamer.h"
>  #include "qapi/qmp/json-parser.h"
>  #include "qom/object_interfaces.h"
> -#include "cpu.h"
>  #include "trace.h"
>  #include "trace/control.h"
>  #include "monitor/hmp-target.h"
> @@ -76,7 +75,6 @@
>  #include "qapi/qmp-event.h"
>  #include "qapi-event.h"
>  #include "qmp-introspect.h"
> -#include "sysemu/block-backend.h"
>  #include "sysemu/qtest.h"
>  #include "qemu/cutils.h"
>  #include "qapi/qmp/dispatch.h"
> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> index 3a3838a..e0249e2 100644
> --- a/qemu-io-cmds.c
> +++ b/qemu-io-cmds.c
> @@ -18,7 +18,6 @@
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/timer.h"
> -#include "sysemu/block-backend.h"
>  #include "qemu/cutils.h"
>
>  #define CMD_NOFILE_OK   0x01
> diff --git a/qmp.c b/qmp.c
> index b3ba9ef..f37ad7e 100644
> --- a/qmp.c
> +++ b/qmp.c
> @@ -36,7 +36,6 @@
>  #include "qom/object_interfaces.h"
>  #include "hw/mem/pc-dimm.h"
>  #include "hw/acpi/acpi_dev_interface.h"
> -#include "qemu/uuid.h"
>
>  NameInfo *qmp_query_name(Error **errp)
>  {
> diff --git a/scripts/clean-includes b/scripts/clean-includes
> index 4412a55..4700e9d 100755
> --- a/scripts/clean-includes
> +++ b/scripts/clean-includes
> @@ -14,15 +14,18 @@
>  # the top-level directory.
>
>  # Usage:
> -#   clean-includes [--git subjectprefix] file ...
> +#   clean-includes [--git subjectprefix] [--ignore-duphead] file ...
>  # or
> -#   clean-includes [--git subjectprefix] --all
> +#   clean-includes [--git subjectprefix] [--ignore-duphead] --all
>  #
>  # If the --git subjectprefix option is given, then after making
>  # the changes to the files this script will create a git commit
>  # with the subject line "subjectprefix: Clean up includes"
>  # and a boilerplate commit message.
>  #
> +# If --ignore-duphead option is used, then check for duplicate
> +# header files will be skipped.
> +#
>  # Using --all will cause clean-includes to run on the whole source
>  # tree (excluding certain directories which are known not to need
>  # handling).
> @@ -45,23 +48,36 @@
>
>
>  GIT=no
> +DUPHEAD=yes
>
>  # Extended regular expression defining files to ignore when using --all
>  XDIRREGEX='^(tests/tcg|tests/multiboot|pc-bios|disas/libvixl)'
>
> -if [ $# -ne 0 ] && [ "$1" = "--git" ]; then
> -    if [ $# -eq 1 ]; then
> -        echo "--git option requires an argument"
> -        exit 1
> -    fi
> -    GITSUBJ="$2"
> -    GIT=yes
> -    shift
> -    shift
> -fi
> +while true
> +do
> +    case $1 in
> +    "--git")
> +         if [ $# -eq 1 ]; then
> +             echo "--git option requires an argument"
> +             exit 1
> +         fi
> +         GITSUBJ="$2"
> +         GIT=yes
> +         shift
> +         shift
> +         ;;
> +    "--ignore-duphead")
> +        DUPHEAD=no
> +        shift
> +        ;;
> +    *)
> +        break
> +        ;;
> +   esac
> +done
>
>  if [ $# -eq 0 ]; then
> -    echo "Usage: clean-includes [--git subjectprefix] [--all | foo.c ...]"
> +    echo "Usage: clean-includes [--git subjectprefix] [--ignore-duphead]
> [--all | foo.c ...]"
>      echo "(modifies the files in place)"
>      exit 1
>  fi
> @@ -154,6 +170,14 @@ for f in "$@"; do
>
>  done
>
> +if [ "$DUPHEAD" = "yes" ]; then
> +    grep "^#include" $@ | sort | uniq -c | awk '{if ($1 > 1) print $0}'
> +    if [ $? -eq 0 ]; then
> +        echo "Found duplicate header file includes. Please check the
> above files manually."
> +        exit 1
> +    fi
> +fi
> +
>  if [ "$GIT" = "yes" ]; then
>      git add -- "$@"
>      git commit --signoff -F - <<EOF
> diff --git a/target-i386/machine.c b/target-i386/machine.c
> index 71c0e4d..48037f1 100644
> --- a/target-i386/machine.c
> +++ b/target-i386/machine.c
> @@ -7,10 +7,7 @@
>  #include "hw/i386/pc.h"
>  #include "hw/isa/isa.h"
>  #include "migration/cpu.h"
> -#include "exec/exec-all.h"
>
> -#include "cpu.h"
> -#include "exec/exec-all.h"
>  #include "sysemu/kvm.h"
>
>  #include "qemu/error-report.h"
> diff --git a/target-mips/machine.c b/target-mips/machine.c
> index a27f2f1..d20d948 100644
> --- a/target-mips/machine.c
> +++ b/target-mips/machine.c
> @@ -2,7 +2,6 @@
>  #include "qemu-common.h"
>  #include "cpu.h"
>  #include "hw/hw.h"
> -#include "cpu.h"
>  #include "migration/cpu.h"
>
>  static int cpu_post_load(void *opaque, int version_id)
> diff --git a/target-ppc/machine.c b/target-ppc/machine.c
> index 4820f22..e43cb6c 100644
> --- a/target-ppc/machine.c
> +++ b/target-ppc/machine.c
> @@ -8,7 +8,6 @@
>  #include "helper_regs.h"
>  #include "mmu-hash64.h"
>  #include "migration/cpu.h"
> -#include "exec/exec-all.h"
>
>  static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
>  {
> diff --git a/target-ppc/mem_helper.c b/target-ppc/mem_helper.c
> index 6548715..1ab8a6e 100644
> --- a/target-ppc/mem_helper.c
> +++ b/target-ppc/mem_helper.c
> @@ -23,7 +23,6 @@
>  #include "exec/helper-proto.h"
>
>  #include "helper_regs.h"
> -#include "exec/exec-all.h"
>  #include "exec/cpu_ldst.h"
>
>  //#define DEBUG_OP
> diff --git a/target-sparc/machine.c b/target-sparc/machine.c
> index 59c92f7..aea6397 100644
> --- a/target-sparc/machine.c
> +++ b/target-sparc/machine.c
> @@ -6,10 +6,7 @@
>  #include "hw/boards.h"
>  #include "qemu/timer.h"
>
> -#include "cpu.h"
> -#include "exec/exec-all.h"
>  #include "migration/cpu.h"
> -#include "exec/exec-all.h"
>
>  #ifdef TARGET_SPARC64
>  static const VMStateDescription vmstate_cpu_timer = {
> diff --git a/target-xtensa/translate.c b/target-xtensa/translate.c
> index 4c1e487..fb0fa56 100644
> --- a/target-xtensa/translate.c
> +++ b/target-xtensa/translate.c
> @@ -36,7 +36,6 @@
>  #include "tcg-op.h"
>  #include "qemu/log.h"
>  #include "sysemu/sysemu.h"
> -#include "exec/exec-all.h"
>  #include "exec/cpu_ldst.h"
>  #include "exec/semihost.h"
>
> diff --git a/tests/crypto-tls-x509-helpers.h b/tests/crypto-tls-x509-
> helpers.h
> index a8faa92..921341c 100644
> --- a/tests/crypto-tls-x509-helpers.h
> +++ b/tests/crypto-tls-x509-helpers.h
> @@ -21,9 +21,6 @@
>  #include <gnutls/gnutls.h>
>  #include <gnutls/x509.h>
>
> -#include <gnutls/gnutls.h>
> -#include <gnutls/x509.h>
> -
>  #if !(defined WIN32) && \
>      defined(CONFIG_TASN1) && \
>      (LIBGNUTLS_VERSION_NUMBER >= 0x020600)
> diff --git a/tests/vhost-user-test.c b/tests/vhost-user-test.c
> index d7c48c5..4d85f88 100644
> --- a/tests/vhost-user-test.c
> +++ b/tests/vhost-user-test.c
> @@ -20,8 +20,6 @@
>  #include "libqos/pci-pc.h"
>  #include "libqos/virtio-pci.h"
>
> -#include "libqos/pci-pc.h"
> -#include "libqos/virtio-pci.h"
>  #include "libqos/malloc-pc.h"
>  #include "hw/virtio/virtio-net.h"
>
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 8ec99cc..67c6589 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -28,7 +28,6 @@
>
>  #include "qemu/osdep.h"
>  #include <termios.h>
> -#include <termios.h>
>
>  #include <glib/gprintf.h>
>
> diff --git a/vl.c b/vl.c
> index c657acd..1b7cfed 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -110,7 +110,6 @@ int main(int argc, char **argv)
>  #include "trace.h"
>  #include "trace/control.h"
>  #include "qemu/queue.h"
> -#include "sysemu/cpus.h"
>  #include "sysemu/arch_init.h"
>
>  #include "ui/qemu-spice.h"
> --
> 2.7.4
>
>

--001a113f2676173735053f1f15e2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br></div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Thu, Oct 13, 2016 at 12:10 AM, Anand J <span dir=3D"ltr">&lt;<=
a href=3D"mailto:anand.indukala@gmail.com" target=3D"_blank">anand.indukala=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Added sc=
ript to check duplicate #include entries. This check will scan and<br>
print the files in which duplicate #include entries are present.<br>
<br>
Script might output false postive entries as well. Such entries should<br>
not be removed. So if it finds any duplicate entries script will terminate<=
br>
with an exit status 1. Then each and every file should be checked manually<=
br>
and corrected if necessary.<br>
<br>
Added an additional option --ignore-duphead in the clean-includes<br>
script to disable this check if all the duplicate #includes are<br>
genuine. The check in enabled by default.<br>
<br>
NOTE: Removed some of the genuine duplicate entries in the code base.<br>
<br>
Signed-off-by: Anand J &lt;<a href=3D"mailto:anand.indukala@gmail.com">anan=
d.indukala@gmail.com</a>&gt;<br>
---<br>
=C2=A0accel.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
=C2=A0cputlb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
=C2=A0gdbstub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
=C2=A0hw/i386/acpi-build.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 -<br>
=C2=A0hw/microblaze/boot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 -<br>
=C2=A0hw/mips/mips_malta.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 -<br>
=C2=A0hw/nvram/fw_cfg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
=C2=A0hw/pci-bridge/pci_expander_<wbr>bridge.c |=C2=A0 1 -<br>
=C2=A0hw/ppc/ppc405_boards.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 1 -<br>
=C2=A0hw/ppc/spapr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
=C2=A0hw/timer/grlib_gptimer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 -<br>
=C2=A0hw/tpm/tpm_tis.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
=C2=A0hw/unicore32/puv3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 1 -<br>
=C2=A0hw/usb/dev-mtp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
=C2=A0include/hw/i386/pc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 -<br>
=C2=A0monitor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 --<br>
=C2=A0qemu-io-cmds.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
=C2=A0qmp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
=C2=A0scripts/clean-includes=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 50 +++++++++++++++++++++++++++---<wbr>-------<br>
=C2=A0target-i386/machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 3 ---<br>
=C2=A0target-mips/machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 1 -<br>
=C2=A0target-ppc/machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 -<br>
=C2=A0target-ppc/mem_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 -<br>
=C2=A0target-sparc/machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 3 ---<br>
=C2=A0target-xtensa/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 1 -<br>
=C2=A0tests/crypto-tls-x509-helpers.<wbr>h=C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ---=
<br>
=C2=A0tests/vhost-user-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 --<br>
=C2=A0util/oslib-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 1 -<br>
=C2=A0vl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
=C2=A029 files changed, 37 insertions(+), 49 deletions(-)<br>
<br>
diff --git a/accel.c b/accel.c<br>
index 403eb5e..b5a4210 100644<br>
--- a/accel.c<br>
+++ b/accel.c<br>
@@ -25,7 +25,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;sysemu/accel.h&quot;<br>
-#include &quot;hw/boards.h&quot;<br>
=C2=A0#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;sysemu/arch_init.h&quot;<br>
=C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
diff --git a/cputlb.c b/cputlb.c<br>
index 3c99c34..59b3969 100644<br>
--- a/cputlb.c<br>
+++ b/cputlb.c<br>
@@ -19,7 +19,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
-#include &quot;exec/exec-all.h&quot;<br>
=C2=A0#include &quot;exec/memory.h&quot;<br>
=C2=A0#include &quot;exec/address-spaces.h&quot;<br>
=C2=A0#include &quot;exec/cpu_ldst.h&quot;<br>
diff --git a/gdbstub.c b/gdbstub.c<br>
index ecea8c4..67eb028 100644<br>
--- a/gdbstub.c<br>
+++ b/gdbstub.c<br>
@@ -31,7 +31,6 @@<br>
<br>
=C2=A0#define MAX_PACKET_LENGTH 4096<br>
<br>
-#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;qemu/sockets.h&quot;<br>
=C2=A0#include &quot;sysemu/kvm.h&quot;<br>
=C2=A0#include &quot;exec/semihost.h&quot;<br>
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c<br>
index e999654..b2baa60 100644<br>
--- a/hw/i386/acpi-build.c<br>
+++ b/hw/i386/acpi-build.c<br>
@@ -30,7 +30,6 @@<br>
=C2=A0#include &quot;qom/cpu.h&quot;<br>
=C2=A0#include &quot;hw/i386/pc.h&quot;<br>
=C2=A0#include &quot;target-i386/cpu.h&quot;<br>
-#include &quot;hw/timer/hpet.h&quot;<br>
=C2=A0#include &quot;hw/acpi/acpi-defs.h&quot;<br>
=C2=A0#include &quot;hw/acpi/acpi.h&quot;<br>
=C2=A0#include &quot;hw/acpi/cpu.h&quot;<br>
diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c<br>
index 9eebb1a..1834d22 100644<br>
--- a/hw/microblaze/boot.c<br>
+++ b/hw/microblaze/boot.c<br>
@@ -30,7 +30,6 @@<br>
=C2=A0#include &quot;qemu/option.h&quot;<br>
=C2=A0#include &quot;qemu/config-file.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;sysemu/device_tree.h&quot;<br>
=C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
=C2=A0#include &quot;hw/loader.h&quot;<br>
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c<br>
index e90857e..61aa8eb 100644<br>
--- a/hw/mips/mips_malta.c<br>
+++ b/hw/mips/mips_malta.c<br>
@@ -47,7 +47,6 @@<br>
=C2=A0#include &quot;elf.h&quot;<br>
=C2=A0#include &quot;hw/timer/mc146818rtc.h&quot;<br>
=C2=A0#include &quot;hw/timer/i8254.h&quot;<br>
-#include &quot;sysemu/block-backend.h&quot;<br>
=C2=A0#include &quot;sysemu/blockdev.h&quot;<br>
=C2=A0#include &quot;exec/address-spaces.h&quot;<br>
=C2=A0#include &quot;hw/sysbus.h&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* SysBusDevice */<br>
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c<br>
index 92aa563..1f0c3e9 100644<br>
--- a/hw/nvram/fw_cfg.c<br>
+++ b/hw/nvram/fw_cfg.c<br>
@@ -29,7 +29,6 @@<br>
=C2=A0#include &quot;hw/isa/isa.h&quot;<br>
=C2=A0#include &quot;hw/nvram/fw_cfg.h&quot;<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
-#include &quot;hw/boards.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qemu/config-file.h&quot;<br>
diff --git a/hw/pci-bridge/pci_expander_<wbr>bridge.c b/hw/pci-bridge/pci_e=
xpander_<wbr>bridge.c<br>
index 1cc598f..6ac187f 100644<br>
--- a/hw/pci-bridge/pci_expander_<wbr>bridge.c<br>
+++ b/hw/pci-bridge/pci_expander_<wbr>bridge.c<br>
@@ -15,7 +15,6 @@<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci_bus.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci_host.h&quot;<br>
-#include &quot;hw/pci/pci_bus.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci_bridge.h&quot;<br>
=C2=A0#include &quot;hw/i386/pc.h&quot;<br>
=C2=A0#include &quot;qemu/range.h&quot;<br>
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c<br>
index 4b2f07a..d01798f 100644<br>
--- a/hw/ppc/ppc405_boards.c<br>
+++ b/hw/ppc/ppc405_boards.c<br>
@@ -37,7 +37,6 @@<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;hw/loader.h&quot;<br>
-#include &quot;sysemu/block-backend.h&quot;<br>
=C2=A0#include &quot;sysemu/blockdev.h&quot;<br>
=C2=A0#include &quot;exec/address-spaces.h&quot;<br>
<br>
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c<br>
index 03e3803..42432d9 100644<br>
--- a/hw/ppc/spapr.c<br>
+++ b/hw/ppc/spapr.c<br>
@@ -37,7 +37,6 @@<br>
=C2=A0#include &quot;sysemu/block-backend.h&quot;<br>
=C2=A0#include &quot;sysemu/cpus.h&quot;<br>
=C2=A0#include &quot;sysemu/kvm.h&quot;<br>
-#include &quot;sysemu/device_tree.h&quot;<br>
=C2=A0#include &quot;kvm_ppc.h&quot;<br>
=C2=A0#include &quot;migration/migration.h&quot;<br>
=C2=A0#include &quot;mmu-hash64.h&quot;<br>
diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c<br>
index 712d1ae..4ed96e9 100644<br>
--- a/hw/timer/grlib_gptimer.c<br>
+++ b/hw/timer/grlib_gptimer.c<br>
@@ -26,7 +26,6 @@<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
=C2=A0#include &quot;hw/ptimer.h&quot;<br>
-#include &quot;qemu/timer.h&quot;<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
<br>
=C2=A0#include &quot;trace.h&quot;<br>
diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c<br>
index 381e726..a6440fe 100644<br>
--- a/hw/tpm/tpm_tis.c<br>
+++ b/hw/tpm/tpm_tis.c<br>
@@ -34,7 +34,6 @@<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
-#include &quot;sysemu/tpm_backend.h&quot;<br>
<br>
=C2=A0#define DEBUG_TIS 0<br>
<br>
diff --git a/hw/unicore32/puv3.c b/hw/unicore32/puv3.c<br>
index 31cd171..032078f 100644<br>
--- a/hw/unicore32/puv3.c<br>
+++ b/hw/unicore32/puv3.c<br>
@@ -13,7 +13,6 @@<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
-#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;ui/console.h&quot;<br>
=C2=A0#include &quot;elf.h&quot;<br>
=C2=A0#include &quot;exec/address-spaces.h&quot;<br>
diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c<br>
index 58d95ff..9cb0f50 100644<br>
--- a/hw/usb/dev-mtp.c<br>
+++ b/hw/usb/dev-mtp.c<br>
@@ -17,7 +17,6 @@<br>
=C2=A0#include &lt;sys/statvfs.h&gt;<br>
=C2=A0#ifdef CONFIG_INOTIFY1<br>
=C2=A0#include &lt;sys/inotify.h&gt;<br>
-#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
=C2=A0#endif<br>
<br>
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h<br>
index b16c448..9c42603 100644<br>
--- a/include/hw/i386/pc.h<br>
+++ b/include/hw/i386/pc.h<br>
@@ -13,7 +13,6 @@<br>
=C2=A0#include &quot;qemu/bitmap.h&quot;<br>
=C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
-#include &quot;hw/boards.h&quot;<br>
=C2=A0#include &quot;hw/compat.h&quot;<br>
=C2=A0#include &quot;hw/mem/pc-dimm.h&quot;<br>
=C2=A0#include &quot;hw/mem/nvdimm.h&quot;<br>
diff --git a/monitor.c b/monitor.c<br>
index 8728dd9..b8773a5 100644<br>
--- a/monitor.c<br>
+++ b/monitor.c<br>
@@ -59,7 +59,6 @@<br>
=C2=A0#include &quot;qapi/qmp/json-streamer.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/json-parser.h&quot;<br>
=C2=A0#include &quot;qom/object_interfaces.h&quot;<br>
-#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
=C2=A0#include &quot;trace/control.h&quot;<br>
=C2=A0#include &quot;monitor/hmp-target.h&quot;<br>
@@ -76,7 +75,6 @@<br>
=C2=A0#include &quot;qapi/qmp-event.h&quot;<br>
=C2=A0#include &quot;qapi-event.h&quot;<br>
=C2=A0#include &quot;qmp-introspect.h&quot;<br>
-#include &quot;sysemu/block-backend.h&quot;<br>
=C2=A0#include &quot;sysemu/qtest.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/dispatch.h&quot;<br>
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c<br>
index 3a3838a..e0249e2 100644<br>
--- a/qemu-io-cmds.c<br>
+++ b/qemu-io-cmds.c<br>
@@ -18,7 +18,6 @@<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
-#include &quot;sysemu/block-backend.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
<br>
=C2=A0#define CMD_NOFILE_OK=C2=A0 =C2=A00x01<br>
diff --git a/qmp.c b/qmp.c<br>
index b3ba9ef..f37ad7e 100644<br>
--- a/qmp.c<br>
+++ b/qmp.c<br>
@@ -36,7 +36,6 @@<br>
=C2=A0#include &quot;qom/object_interfaces.h&quot;<br>
=C2=A0#include &quot;hw/mem/pc-dimm.h&quot;<br>
=C2=A0#include &quot;hw/acpi/acpi_dev_interface.h&quot;<br>
-#include &quot;qemu/uuid.h&quot;<br>
<br>
=C2=A0NameInfo *qmp_query_name(Error **errp)<br>
=C2=A0{<br>
diff --git a/scripts/clean-includes b/scripts/clean-includes<br>
index 4412a55..4700e9d 100755<br>
--- a/scripts/clean-includes<br>
+++ b/scripts/clean-includes<br>
@@ -14,15 +14,18 @@<br>
=C2=A0# the top-level directory.<br>
<br>
=C2=A0# Usage:<br>
-#=C2=A0 =C2=A0clean-includes [--git subjectprefix] file ...<br>
+#=C2=A0 =C2=A0clean-includes [--git subjectprefix] [--ignore-duphead] file=
 ...<br>
=C2=A0# or<br>
-#=C2=A0 =C2=A0clean-includes [--git subjectprefix] --all<br>
+#=C2=A0 =C2=A0clean-includes [--git subjectprefix] [--ignore-duphead] --al=
l<br>
=C2=A0#<br>
=C2=A0# If the --git subjectprefix option is given, then after making<br>
=C2=A0# the changes to the files this script will create a git commit<br>
=C2=A0# with the subject line &quot;subjectprefix: Clean up includes&quot;<=
br>
=C2=A0# and a boilerplate commit message.<br>
=C2=A0#<br>
+# If --ignore-duphead option is used, then check for duplicate<br>
+# header files will be skipped.<br>
+#<br>
=C2=A0# Using --all will cause clean-includes to run on the whole source<br=
>
=C2=A0# tree (excluding certain directories which are known not to need<br>
=C2=A0# handling).<br>
@@ -45,23 +48,36 @@<br>
<br>
<br>
=C2=A0GIT=3Dno<br>
+DUPHEAD=3Dyes<br>
<br>
=C2=A0# Extended regular expression defining files to ignore when using --a=
ll<br>
=C2=A0XDIRREGEX=3D&#39;^(tests/tcg|tests/<wbr>multiboot|pc-bios|disas/<wbr>=
libvixl)&#39;<br>
<br>
-if [ $# -ne 0 ] &amp;&amp; [ &quot;$1&quot; =3D &quot;--git&quot; ]; then<=
br>
-=C2=A0 =C2=A0 if [ $# -eq 1 ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;--git option requires an argument&q=
uot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 GITSUBJ=3D&quot;$2&quot;<br>
-=C2=A0 =C2=A0 GIT=3Dyes<br>
-=C2=A0 =C2=A0 shift<br>
-=C2=A0 =C2=A0 shift<br>
-fi<br>
+while true<br>
+do<br>
+=C2=A0 =C2=A0 case $1 in<br>
+=C2=A0 =C2=A0 &quot;--git&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $# -eq 1 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;--git option re=
quires an argument&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GITSUBJ=3D&quot;$2&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GIT=3Dyes<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shift<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shift<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 &quot;--ignore-duphead&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DUPHEAD=3Dno<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shift<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
+=C2=A0 =C2=A0 *)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
+=C2=A0 =C2=A0esac<br>
+done<br>
<br>
=C2=A0if [ $# -eq 0 ]; then<br>
-=C2=A0 =C2=A0 echo &quot;Usage: clean-includes [--git subjectprefix] [--al=
l | foo.c ...]&quot;<br>
+=C2=A0 =C2=A0 echo &quot;Usage: clean-includes [--git subjectprefix] [--ig=
nore-duphead] [--all | foo.c ...]&quot;<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;(modifies the files in place)&quot;<br>
=C2=A0 =C2=A0 =C2=A0exit 1<br>
=C2=A0fi<br>
@@ -154,6 +170,14 @@ for f in &quot;$@&quot;; do<br>
<br>
=C2=A0done<br>
<br>
+if [ &quot;$DUPHEAD&quot; =3D &quot;yes&quot; ]; then<br>
+=C2=A0 =C2=A0 grep &quot;^#include&quot; $@ | sort | uniq -c | awk &#39;{i=
f ($1 &gt; 1) print $0}&#39;<br>
+=C2=A0 =C2=A0 if [ $? -eq 0 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Found duplicate header file include=
s. Please check the above files manually.&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+=C2=A0 =C2=A0 fi<br>
+fi<br>
+<br>
=C2=A0if [ &quot;$GIT&quot; =3D &quot;yes&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0git add -- &quot;$@&quot;<br>
=C2=A0 =C2=A0 =C2=A0git commit --signoff -F - &lt;&lt;EOF<br>
diff --git a/target-i386/machine.c b/target-i386/machine.c<br>
index 71c0e4d..48037f1 100644<br>
--- a/target-i386/machine.c<br>
+++ b/target-i386/machine.c<br>
@@ -7,10 +7,7 @@<br>
=C2=A0#include &quot;hw/i386/pc.h&quot;<br>
=C2=A0#include &quot;hw/isa/isa.h&quot;<br>
=C2=A0#include &quot;migration/cpu.h&quot;<br>
-#include &quot;exec/exec-all.h&quot;<br>
<br>
-#include &quot;cpu.h&quot;<br>
-#include &quot;exec/exec-all.h&quot;<br>
=C2=A0#include &quot;sysemu/kvm.h&quot;<br>
<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
diff --git a/target-mips/machine.c b/target-mips/machine.c<br>
index a27f2f1..d20d948 100644<br>
--- a/target-mips/machine.c<br>
+++ b/target-mips/machine.c<br>
@@ -2,7 +2,6 @@<br>
=C2=A0#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;hw/hw.h&quot;<br>
-#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;migration/cpu.h&quot;<br>
<br>
=C2=A0static int cpu_post_load(void *opaque, int version_id)<br>
diff --git a/target-ppc/machine.c b/target-ppc/machine.c<br>
index 4820f22..e43cb6c 100644<br>
--- a/target-ppc/machine.c<br>
+++ b/target-ppc/machine.c<br>
@@ -8,7 +8,6 @@<br>
=C2=A0#include &quot;helper_regs.h&quot;<br>
=C2=A0#include &quot;mmu-hash64.h&quot;<br>
=C2=A0#include &quot;migration/cpu.h&quot;<br>
-#include &quot;exec/exec-all.h&quot;<br>
<br>
=C2=A0static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)<br=
>
=C2=A0{<br>
diff --git a/target-ppc/mem_helper.c b/target-ppc/mem_helper.c<br>
index 6548715..1ab8a6e 100644<br>
--- a/target-ppc/mem_helper.c<br>
+++ b/target-ppc/mem_helper.c<br>
@@ -23,7 +23,6 @@<br>
=C2=A0#include &quot;exec/helper-proto.h&quot;<br>
<br>
=C2=A0#include &quot;helper_regs.h&quot;<br>
-#include &quot;exec/exec-all.h&quot;<br>
=C2=A0#include &quot;exec/cpu_ldst.h&quot;<br>
<br>
=C2=A0//#define DEBUG_OP<br>
diff --git a/target-sparc/machine.c b/target-sparc/machine.c<br>
index 59c92f7..aea6397 100644<br>
--- a/target-sparc/machine.c<br>
+++ b/target-sparc/machine.c<br>
@@ -6,10 +6,7 @@<br>
=C2=A0#include &quot;hw/boards.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
<br>
-#include &quot;cpu.h&quot;<br>
-#include &quot;exec/exec-all.h&quot;<br>
=C2=A0#include &quot;migration/cpu.h&quot;<br>
-#include &quot;exec/exec-all.h&quot;<br>
<br>
=C2=A0#ifdef TARGET_SPARC64<br>
=C2=A0static const VMStateDescription vmstate_cpu_timer =3D {<br>
diff --git a/target-xtensa/translate.c b/target-xtensa/translate.c<br>
index 4c1e487..fb0fa56 100644<br>
--- a/target-xtensa/translate.c<br>
+++ b/target-xtensa/translate.c<br>
@@ -36,7 +36,6 @@<br>
=C2=A0#include &quot;tcg-op.h&quot;<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
-#include &quot;exec/exec-all.h&quot;<br>
=C2=A0#include &quot;exec/cpu_ldst.h&quot;<br>
=C2=A0#include &quot;exec/semihost.h&quot;<br>
<br>
diff --git a/tests/crypto-tls-x509-<wbr>helpers.h b/tests/crypto-tls-x509-<=
wbr>helpers.h<br>
index a8faa92..921341c 100644<br>
--- a/tests/crypto-tls-x509-<wbr>helpers.h<br>
+++ b/tests/crypto-tls-x509-<wbr>helpers.h<br>
@@ -21,9 +21,6 @@<br>
=C2=A0#include &lt;gnutls/gnutls.h&gt;<br>
=C2=A0#include &lt;gnutls/x509.h&gt;<br>
<br>
-#include &lt;gnutls/gnutls.h&gt;<br>
-#include &lt;gnutls/x509.h&gt;<br>
-<br>
=C2=A0#if !(defined WIN32) &amp;&amp; \<br>
=C2=A0 =C2=A0 =C2=A0defined(CONFIG_TASN1) &amp;&amp; \<br>
=C2=A0 =C2=A0 =C2=A0(LIBGNUTLS_VERSION_NUMBER &gt;=3D 0x020600)<br>
diff --git a/tests/vhost-user-test.c b/tests/vhost-user-test.c<br>
index d7c48c5..4d85f88 100644<br>
--- a/tests/vhost-user-test.c<br>
+++ b/tests/vhost-user-test.c<br>
@@ -20,8 +20,6 @@<br>
=C2=A0#include &quot;libqos/pci-pc.h&quot;<br>
=C2=A0#include &quot;libqos/virtio-pci.h&quot;<br>
<br>
-#include &quot;libqos/pci-pc.h&quot;<br>
-#include &quot;libqos/virtio-pci.h&quot;<br>
=C2=A0#include &quot;libqos/malloc-pc.h&quot;<br>
=C2=A0#include &quot;hw/virtio/virtio-net.h&quot;<br>
<br>
diff --git a/util/oslib-posix.c b/util/oslib-posix.c<br>
index 8ec99cc..67c6589 100644<br>
--- a/util/oslib-posix.c<br>
+++ b/util/oslib-posix.c<br>
@@ -28,7 +28,6 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &lt;termios.h&gt;<br>
-#include &lt;termios.h&gt;<br>
<br>
=C2=A0#include &lt;glib/gprintf.h&gt;<br>
<br>
diff --git a/vl.c b/vl.c<br>
index c657acd..1b7cfed 100644<br>
--- a/vl.c<br>
+++ b/vl.c<br>
@@ -110,7 +110,6 @@ int main(int argc, char **argv)<br>
=C2=A0#include &quot;trace.h&quot;<br>
=C2=A0#include &quot;trace/control.h&quot;<br>
=C2=A0#include &quot;qemu/queue.h&quot;<br>
-#include &quot;sysemu/cpus.h&quot;<br>
=C2=A0#include &quot;sysemu/arch_init.h&quot;<br>
<br>
=C2=A0#include &quot;ui/qemu-spice.h&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br></div>

--001a113f2676173735053f1f15e2--

