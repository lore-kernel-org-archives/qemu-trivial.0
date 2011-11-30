Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RVc4d-0000zS-SK
	for mharc-qemu-trivial@gnu.org; Tue, 29 Nov 2011 23:47:11 -0500
Received: from eggs.gnu.org ([140.186.70.92]:36604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yamahata@valinux.co.jp>) id 1RVc4b-0000zM-Oh
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2011 23:47:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yamahata@valinux.co.jp>) id 1RVc4a-00051a-Gu
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2011 23:47:09 -0500
Received: from mail.valinux.co.jp ([210.128.90.3]:59450)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yamahata@valinux.co.jp>) id 1RVc4Z-00051Q-Rf
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2011 23:47:08 -0500
Received: from ps.local.valinux.co.jp (vagw.valinux.co.jp [210.128.90.14])
	by mail.valinux.co.jp (Postfix) with SMTP id BABA487576;
	Wed, 30 Nov 2011 13:47:02 +0900 (JST)
Received: (nullmailer pid 5248 invoked by uid 1000);
	Wed, 30 Nov 2011 04:47:02 -0000
Date: Wed, 30 Nov 2011 13:47:02 +0900
From: Isaku Yamahata <yamahata@valinux.co.jp>
To: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
Message-ID: <20111130044702.GB4684@valinux.co.jp>
References: <1322627987-8698-1-git-send-email-wuzhy@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1322627987-8698-1-git-send-email-wuzhy@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.19 (2009-01-05)
X-Virus-Scanned: clamav-milter 0.95.2 at va-mail.local.valinux.co.jp
X-Virus-Status: Clean
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 210.128.90.3
Cc: qemu-trivial@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [PATCH] pcie_aer: adjust
	do_pcie_aer_inejct_error ->	do_pcie_aer_inject_error
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
X-List-Received-Date: Wed, 30 Nov 2011 04:47:10 -0000

Good catch. Thank you.

On Wed, Nov 30, 2011 at 12:39:47PM +0800, Zhi Yong Wu wrote:
> This function name is a bit wrong. Although it doesn't impact function, it is a bit necessary that we should fixup it.
> 
> 
> Signed-off-by: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
> ---
>  hmp-commands.hx |    2 +-
>  hw/pci-stub.c   |    2 +-
>  hw/pcie_aer.c   |    2 +-
>  sysemu.h        |    2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 089c1ac..5775144 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -922,7 +922,7 @@ ETEXI
>                        "<tlb header> = 32bit x 4\n\t\t\t"
>                        "<tlb header prefix> = 32bit x 4",
>          .user_print  = pcie_aer_inject_error_print,
> -        .mhandler.cmd_new = do_pcie_aer_inejct_error,
> +        .mhandler.cmd_new = do_pcie_aer_inject_error,
>      },
>  
>  STEXI
> diff --git a/hw/pci-stub.c b/hw/pci-stub.c
> index 636171c..134c448 100644
> --- a/hw/pci-stub.c
> +++ b/hw/pci-stub.c
> @@ -34,7 +34,7 @@ static void pci_error_message(Monitor *mon)
>      monitor_printf(mon, "PCI devices not supported\n");
>  }
>  
> -int do_pcie_aer_inejct_error(Monitor *mon,
> +int do_pcie_aer_inject_error(Monitor *mon,
>                               const QDict *qdict, QObject **ret_data)
>  {
>      pci_error_message(mon);
> diff --git a/hw/pcie_aer.c b/hw/pcie_aer.c
> index 62c06ea..08bb25a 100644
> --- a/hw/pcie_aer.c
> +++ b/hw/pcie_aer.c
> @@ -951,7 +951,7 @@ static int pcie_aer_parse_error_string(const char *error_name,
>      return -EINVAL;
>  }
>  
> -int do_pcie_aer_inejct_error(Monitor *mon,
> +int do_pcie_aer_inject_error(Monitor *mon,
>                               const QDict *qdict, QObject **ret_data)
>  {
>      const char *id = qdict_get_str(qdict, "id");
> diff --git a/sysemu.h b/sysemu.h
> index 22cd720..3806901 100644
> --- a/sysemu.h
> +++ b/sysemu.h
> @@ -148,7 +148,7 @@ void do_pci_device_hot_remove(Monitor *mon, const QDict *qdict);
>  
>  /* pcie aer error injection */
>  void pcie_aer_inject_error_print(Monitor *mon, const QObject *data);
> -int do_pcie_aer_inejct_error(Monitor *mon,
> +int do_pcie_aer_inject_error(Monitor *mon,
>                               const QDict *qdict, QObject **ret_data);
>  
>  /* serial ports */
> -- 
> 1.7.6
> 

-- 
yamahata

