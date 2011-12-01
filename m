Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RVxSc-0006OH-HZ
	for mharc-qemu-trivial@gnu.org; Wed, 30 Nov 2011 22:37:22 -0500
Received: from eggs.gnu.org ([140.186.70.92]:56704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wuzhy@linux.vnet.ibm.com>) id 1RVxSa-0006O6-GE
	for qemu-trivial@nongnu.org; Wed, 30 Nov 2011 22:37:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wuzhy@linux.vnet.ibm.com>) id 1RVxSY-0002A4-AR
	for qemu-trivial@nongnu.org; Wed, 30 Nov 2011 22:37:20 -0500
Received: from e28smtp08.in.ibm.com ([122.248.162.8]:33128)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wuzhy@linux.vnet.ibm.com>) id 1RVxSX-00029l-NI
	for qemu-trivial@nongnu.org; Wed, 30 Nov 2011 22:37:18 -0500
Received: from /spool/local
	by e28smtp08.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <wuzhy@linux.vnet.ibm.com>;
	Thu, 1 Dec 2011 09:07:13 +0530
Received: from d28relay03.in.ibm.com (9.184.220.60)
	by e28smtp08.in.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 1 Dec 2011 09:07:10 +0530
Received: from d28av04.in.ibm.com (d28av04.in.ibm.com [9.184.220.66])
	by d28relay03.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pB13SKwW3330208; Thu, 1 Dec 2011 09:07:09 +0530
Received: from d28av04.in.ibm.com (loopback [127.0.0.1])
	by d28av04.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	pB13Hxj7005144; Thu, 1 Dec 2011 14:17:59 +1100
Received: from f15.cn.ibm.com (f15.cn.ibm.com [9.115.118.120])
	by d28av04.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pB13HuSZ005041
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Thu, 1 Dec 2011 14:17:58 +1100
Date: Thu, 1 Dec 2011 11:17:55 +0800
From: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
To: stefanha@linux.vnet.ibm.com
Message-ID: <20111201031755.GA25303@f15.cn.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
x-cbid: 11120103-2000-0000-0000-0000058FA7AE
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 122.248.162.8
Cc: qemu-trivial@nongnu.org, yamahata@valinux.co.jp, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] pcie_aer: adjust
 do_pcie_aer_inejct_error -> do_pcie_aer_inject_error]
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
X-List-Received-Date: Thu, 01 Dec 2011 03:37:21 -0000

HI, stefan,

Can you pull this patch into your qemu trivial branch?


Regards,

Zhi Yong Wu
----- Forwarded message from Isaku Yamahata <yamahata@valinux.co.jp> -----

Date: Wed, 30 Nov 2011 13:47:02 +0900
From: Isaku Yamahata <yamahata@valinux.co.jp>
To: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
Cc: stefanha@linux.vnet.ibm.com, qemu-trivial@nongnu.org
Subject: Re: [PATCH] pcie_aer: adjust do_pcie_aer_inejct_error -> do_pcie_aer_inject_error
Message-ID: <20111130044702.GB4684@valinux.co.jp>
References: <1322627987-8698-1-git-send-email-wuzhy@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1322627987-8698-1-git-send-email-wuzhy@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.19 (2009-01-05)
X-Virus-Scanned: clamav-milter 0.95.2 at va-mail.local.valinux.co.jp
X-Virus-Status: Clean
x-cbid: 11113004-3270-0000-0000-0000023AAEC4
X-IBM-ISS-SpamDetectors: Score=0; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00000235; HX=3.00000178; KW=3.00000007; PH=3.00000001; SC=3.00000001;
	SDB=6.00091957; UDB=6.00024379; UTC=2011-11-30 04:47:05
X-Xagent-From: yamahata@valinux.co.jp
X-Xagent-To: wuzhy@linux.vnet.ibm.com
X-Xagent-Gateway: vmsdvm4.vnet.ibm.com (XAGENTU4 at VMSDVM4)

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


----- End forwarded message -----


