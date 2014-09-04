Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XPaL4-0007f5-GG
	for mharc-qemu-trivial@gnu.org; Thu, 04 Sep 2014 12:56:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@citrix.com>) id 1XPaKx-0007Va-N8
	for qemu-trivial@nongnu.org; Thu, 04 Sep 2014 12:56:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Stefano.Stabellini@citrix.com>) id 1XPaKs-0005Js-Rr
	for qemu-trivial@nongnu.org; Thu, 04 Sep 2014 12:56:43 -0400
Received: from smtp.citrix.com ([66.165.176.89]:55988)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@citrix.com>)
	id 1XPaKi-0005Ge-V9; Thu, 04 Sep 2014 12:56:29 -0400
X-IronPort-AV: E=Sophos;i="5.04,467,1406592000"; d="scan'208";a="168426418"
Received: from ukmail1.uk.xensource.com (10.80.16.128) by smtprelay.citrix.com
	(10.13.107.79) with Microsoft SMTP Server id 14.3.181.6;
	Thu, 4 Sep 2014 12:56:24 -0400
Received: from kaball.uk.xensource.com ([10.80.2.59])	by
	ukmail1.uk.xensource.com with esmtp (Exim 4.69)	(envelope-from
	<stefano.stabellini@eu.citrix.com>)	id 1XPaKe-0005Uo-7I;
	Thu, 04 Sep 2014 17:56:24 +0100
Date: Thu, 4 Sep 2014 17:54:44 +0100
From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
X-X-Sender: sstabellini@kaball.uk.xensource.com
To: Chen Gang <gang.chen.5i5j@gmail.com>
In-Reply-To: <5408780E.70607@gmail.com>
Message-ID: <alpine.DEB.2.02.1409041754210.18866@kaball.uk.xensource.com>
References: <5408780E.70607@gmail.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-DLP: MIA2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.89
Cc: qemu-trivial@nongnu.org, xen-devel@lists.xenproject.org,
	qemu-devel <qemu-devel@nongnu.org>, stefano.stabellini@eu.citrix.com
Subject: Re: [Qemu-trivial] [PATCH v2] xen-hvm.c: Always return -1 when
 failure occurs in xen_hvm_init()
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
X-List-Received-Date: Thu, 04 Sep 2014 16:56:48 -0000

On Thu, 4 Sep 2014, Chen Gang wrote:
> When failure occurs, it need use "return -1" instead of exit(1), so can
> let upper caller has chance to print failure information, too.
> 
> For simplify thinking, in xen_hvm_init(), also use '-1' instead of all
> '-errno', since all related upper callers always exit(1) for failure.
> 
> It is not a normal function, it does not release related resources when
> return -1, so need give related comments for it.
> 
> 
> It passes common check:
> 
>   "./configure --enable-xen && make && make check"
>   "echo $? == 0"
> 
> 
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>

Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>


>  xen-hvm.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/xen-hvm.c b/xen-hvm.c
> index 0d09940..2c6285d 100644
> --- a/xen-hvm.c
> +++ b/xen-hvm.c
> @@ -978,6 +978,7 @@ static void xen_wakeup_notifier(Notifier *notifier, void *data)
>      xc_set_hvm_param(xen_xc, xen_domid, HVM_PARAM_ACPI_S_STATE, 0);
>  }
>  
> +/* return 0 means OK, or -1 means critical issue -- will exit(1) */
>  int xen_hvm_init(ram_addr_t *below_4g_mem_size, ram_addr_t *above_4g_mem_size,
>                   MemoryRegion **ram_memory)
>  {
> @@ -991,15 +992,13 @@ int xen_hvm_init(ram_addr_t *below_4g_mem_size, ram_addr_t *above_4g_mem_size,
>      state->xce_handle = xen_xc_evtchn_open(NULL, 0);
>      if (state->xce_handle == XC_HANDLER_INITIAL_VALUE) {
>          perror("xen: event channel open");
> -        g_free(state);
> -        return -errno;
> +        return -1;
>      }
>  
>      state->xenstore = xs_daemon_open();
>      if (state->xenstore == NULL) {
>          perror("xen: xenstore open");
> -        g_free(state);
> -        return -errno;
> +        return -1;
>      }
>  
>      state->exit.notify = xen_exit_notifier;
> @@ -1069,7 +1068,7 @@ int xen_hvm_init(ram_addr_t *below_4g_mem_size, ram_addr_t *above_4g_mem_size,
>      /* Initialize backend core & drivers */
>      if (xen_be_init() != 0) {
>          fprintf(stderr, "%s: xen backend core setup failed\n", __FUNCTION__);
> -        exit(1);
> +        return -1;
>      }
>      xen_be_register("console", &xen_console_ops);
>      xen_be_register("vkbd", &xen_kbdmouse_ops);
> -- 
> 1.9.3
> 

