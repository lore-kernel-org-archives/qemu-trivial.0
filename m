Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UHfub-0005ot-ND
	for mharc-qemu-trivial@gnu.org; Mon, 18 Mar 2013 15:40:01 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1UHfuZ-0005mM-6J
	for qemu-trivial@nongnu.org; Mon, 18 Mar 2013 15:40:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1UHfuX-0001ZL-DO
	for qemu-trivial@nongnu.org; Mon, 18 Mar 2013 15:39:59 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:39364)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1UHfuR-0001Wj-UV; Mon, 18 Mar 2013 15:39:52 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	D51B872800CD; Mon, 18 Mar 2013 20:39:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id samQhHn0UhJ8; Mon, 18 Mar 2013 20:39:47 +0100 (CET)
Received: from [192.168.178.35] (p54AD936B.dip.t-dialin.net [84.173.147.107])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	1F0EC7280057; Mon, 18 Mar 2013 20:39:47 +0100 (CET)
Message-ID: <51476D81.6000303@weilnetz.de>
Date: Mon, 18 Mar 2013 20:39:45 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1363627207-29224-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1363627207-29224-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] Fix typos and misspellings
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
X-List-Received-Date: Mon, 18 Mar 2013 19:40:01 -0000

Am 18.03.2013 18:20, schrieb Peter Maydell:
> Fix various typos and misspellings. The bulk of these were found with
> codespell.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I noticed the PCI typo while reading the file so I figured I'd run codespell
> on the tree while I was at it. (Oddly codespell doesn't complain about the
> typos in pci_host.c.)

Codespell uses a list of common typos. It's possible to extend this
list - just send a patch to Codespell's author.

>
>  docs/usb-storage.txt     |    4 ++--
>  hw/arm-misc.h            |    2 +-
>  hw/pci/pci_host.c        |    2 +-
>  hw/sdhci.c               |    2 +-
>  include/qom/object.h     |    2 +-
>  monitor.c                |    8 ++++----
>  net/tap.c                |    2 +-
>  qemu-options.hx          |    2 +-
>  qga/commands-posix.c     |    2 +-
>  target-i386/translate.c  |    2 +-
>  target-s390x/translate.c |    2 +-
>  11 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/docs/usb-storage.txt b/docs/usb-storage.txt
> index fa93111..c5a3866 100644
> --- a/docs/usb-storage.txt
> +++ b/docs/usb-storage.txt
> @@ -5,7 +5,7 @@ qemu usb storage emulation
>  QEMU has three devices for usb storage emulation.
>  
>  Number one emulates the classic bulk-only transport protocol which is
> -used by 99% of the usb sticks on the marked today and is called
> +used by 99% of the usb sticks on the market today and is called
>  "usb-storage".  Usage (hooking up to xhci, other host controllers work
>  too):
>  
> @@ -36,7 +36,7 @@ It's called "usb-bot".  It shares most code with "usb-storage", and
>  the guest will not be able to see the difference.  The qemu command
>  line interface is simliar to usb-uas though, i.e. no automatic scsi
>  disk creation.  It also features support for up to 16 LUNs.  The LUN
> -numbers must be continous, i.e. for three devices you must use 0+1+2.
> +numbers must be continuous, i.e. for three devices you must use 0+1+2.
>  The 0+1+5 numbering from the "usb-uas" example isn't going to work
>  with "usb-bot".
>  
> diff --git a/hw/arm-misc.h b/hw/arm-misc.h
> index cba7553..7b2b02d 100644
> --- a/hw/arm-misc.h
> +++ b/hw/arm-misc.h
> @@ -14,7 +14,7 @@
>  #include "exec/memory.h"
>  #include "hw/irq.h"
>  
> -/* The CPU is also modeled as an interrupt controller.  */
> +/* The CPU is also modelled as an interrupt controller.  */
>  #define ARM_PIC_CPU_IRQ 0
>  #define ARM_PIC_CPU_FIQ 1
>  qemu_irq *arm_pic_init_cpu(ARMCPU *cpu);
> diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
> index daca1c1..12254b1 100644
> --- a/hw/pci/pci_host.c
> +++ b/hw/pci/pci_host.c
> @@ -38,7 +38,7 @@ do { printf("pci_host_data: " fmt , ## __VA_ARGS__); } while (0)
>   * bit  0 -  7: offset in configuration space of a given pci device
>   */
>  
> -/* the helper functio to get a PCIDeice* for a given pci address */
> +/* the helper function to get a PCIDevice* for a given pci address */
>  static inline PCIDevice *pci_dev_find_by_addr(PCIBus *bus, uint32_t addr)
>  {
>      uint8_t bus_num = addr >> 16;
> diff --git a/hw/sdhci.c b/hw/sdhci.c
> index 93feada..4a29e6c 100644
> --- a/hw/sdhci.c
> +++ b/hw/sdhci.c
> @@ -763,7 +763,7 @@ static void sdhci_do_adma(SDHCIState *s)
>          }
>      }
>  
> -    /* we have unfinished bussiness - reschedule to continue ADMA */
> +    /* we have unfinished business - reschedule to continue ADMA */
>      qemu_mod_timer(s->transfer_timer,
>                     qemu_get_clock_ns(vm_clock) + SDHC_TRANSFER_DELAY);
>  }
> diff --git a/include/qom/object.h b/include/qom/object.h
> index cf094e7..d0f99c5 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -202,7 +202,7 @@ typedef struct InterfaceInfo InterfaceInfo;
>   * Methods are always <emphasis>virtual</emphasis>. Overriding a method in
>   * #TypeInfo.class_init of a subclass leads to any user of the class obtained
>   * via OBJECT_GET_CLASS() accessing the overridden function.
> - * The original function is not automatically invoked. It is the responsability
> + * The original function is not automatically invoked. It is the responsibility
>   * of the overriding class to determine whether and when to invoke the method
>   * being overridden.
>   *
> diff --git a/monitor.c b/monitor.c
> index 112e920..99bbb17 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -3541,10 +3541,10 @@ static const mon_cmd_t *qmp_find_cmd(const char *cmdname)
>   * If @cmdline is blank, return NULL.
>   * If it can't be parsed, report to @mon, and return NULL.
>   * Else, insert command arguments into @qdict, and return the command.
> - * If sub-command table exist, and if @cmdline contains addtional string for
> - * sub-command, this function will try search sub-command table. if no
> - * addtional string for sub-command exist, this function will return the found
> - * one in @table.
> + * If a sub-command table exists, and if @cmdline contains an additional string
> + * for a sub-command, this function will try to search the sub-command table.
> + * If no additional string for a sub-command is present, this function will
> + * return the command found in @table.
>   * Do not assume the returned command points into @table!  It doesn't
>   * when the command is a sub-command.
>   */
> diff --git a/net/tap.c b/net/tap.c
> index daab350..ce79699 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -696,7 +696,7 @@ int net_init_tap(const NetClientOptions *opts, const char *name,
>      /* QEMU vlans does not support multiqueue tap, in this case peer is set.
>       * For -netdev, peer is always NULL. */
>      if (peer && (tap->has_queues || tap->has_fds || tap->has_vhostfds)) {
> -        error_report("Multiqueue tap cannnot be used with QEMU vlans");
> +        error_report("Multiqueue tap cannot be used with QEMU vlans");
>          return -1;
>      }
>  
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 30fb85d..c68a46e 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1119,7 +1119,7 @@ is a TCP port number, not a display number.
>  @item websocket
>  
>  Opens an additional TCP listening port dedicated to VNC Websocket connections.
> -By defintion the Websocket port is 5700+@var{display}. If @var{host} is
> +By definition the Websocket port is 5700+@var{display}. If @var{host} is
>  specified connections will only be allowed from this host.
>  As an alternative the Websocket port could be specified by using
>  @code{websocket}=@var{port}.
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index d7da850..3b5c536 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -120,7 +120,7 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **err)
>          return;
>      }
>  
> -    /* succeded */
> +    /* succeeded */
>  }
>  
>  int64_t qmp_guest_get_time(Error **errp)
> diff --git a/target-i386/translate.c b/target-i386/translate.c
> index 705147a..c9cc2ff 100644
> --- a/target-i386/translate.c
> +++ b/target-i386/translate.c
> @@ -4746,7 +4746,7 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
>              }
>              s->pc++;
>  
> -            /* 4.1.1-4.1.3: No preceeding lock, 66, f2, f3, or rex prefixes. */
> +            /* 4.1.1-4.1.3: No preceding lock, 66, f2, f3, or rex prefixes. */
>              if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ
>                              | PREFIX_LOCK | PREFIX_DATA)) {
>                  goto illegal_op;
> diff --git a/target-s390x/translate.c b/target-s390x/translate.c
> index 88e481c..a4f2194 100644
> --- a/target-s390x/translate.c
> +++ b/target-s390x/translate.c
> @@ -1142,7 +1142,7 @@ struct DisasInsn {
>  };
>  
>  /* ====================================================================== */
> -/* Miscelaneous helpers, used by several operations.  */
> +/* Miscellaneous helpers, used by several operations.  */
>  
>  static void help_l2_shift(DisasContext *s, DisasFields *f,
>                            DisasOps *o, int mask)


Reviewed-by: Stefan Weil <sw@weilnetz.de>


