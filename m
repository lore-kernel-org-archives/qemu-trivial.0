Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XOzLZ-0005Zl-IK
	for mharc-qemu-trivial@gnu.org; Tue, 02 Sep 2014 21:26:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XOzLP-0005ZU-P7
	for qemu-trivial@nongnu.org; Tue, 02 Sep 2014 21:26:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XOzLG-0006Qj-M8
	for qemu-trivial@nongnu.org; Tue, 02 Sep 2014 21:26:43 -0400
Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f]:40442)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XOzLG-0006QT-EY; Tue, 02 Sep 2014 21:26:34 -0400
Received: by mail-pa0-f47.google.com with SMTP id hz1so15998457pad.20
	for <multiple recipients>; Tue, 02 Sep 2014 18:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=m3xefXjspI55UUQdjpJtjlCsWrTVy4pL6FS/iaVvo3s=;
	b=Idu9+rI7vuk9wAzc5WJ3H5uvTYSvj0TbckihPMSu5rSU8WaSDDMbL7ljb01QLuFtMa
	lMdVSdmZynWkB1SIj6AS+n+giu0FtEJCFJPUQ8qRk8CK7vygHoULvzF0t3PV+Jy3b00V
	h+BHo+wwLp2F2zjXfSHyVVJ2Y/j9QNaWPQHtgWMRWVbEzdxdCQxi1Fp2JRk9LVnQ6HQB
	gQ+untHP+bVP/xDQGoVaawOa9IIqRrhV9X/907lLBlGa06mHFa85n4HbWyfZWQ/fxiZq
	GR8Q0HXB+QmStDE+QRaSsR2j0/GeL0zKYJEIfjNIpTr8X/DCG5At+Vn/5ebBd9oUvK+4
	f3jw==
X-Received: by 10.70.34.235 with SMTP id c11mr17069240pdj.76.1409707593091;
	Tue, 02 Sep 2014 18:26:33 -0700 (PDT)
Received: from [192.168.2.114] ([124.127.118.42])
	by mx.google.com with ESMTPSA id dl8sm7198755pdb.65.2014.09.02.18.26.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Sep 2014 18:26:32 -0700 (PDT)
Message-ID: <54066F78.7040101@gmail.com>
Date: Wed, 03 Sep 2014 09:31:36 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: stefano.stabellini@eu.citrix.com
References: <5405EED9.2090701@gmail.com>
In-Reply-To: <5405EED9.2090701@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22f
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, xen-devel@lists.xensource.com,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] xen-hvm.c: Improve the return method for
	xen_hvm_init()
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
X-List-Received-Date: Wed, 03 Sep 2014 01:26:52 -0000


Oh, sorry, forgot Cc to qemu trivial.

Thanks.

On 9/3/14 0:22, Chen Gang wrote:
> When failure occurs, it need use "return -1" instead of exit(1), so can
> let upper caller has chance to print failure information, too, then user
> can know the failure result more clearly.
> 
> xen_hvm_init() may also return -errno, which may let upper caller think
> more (e.g. free some other related resources and try again), although at
> present, all related upper callers still exit(1).
> 
> It is not a normal function which does not release related resources, if
> return -1. So need give the related comments for it.
> 
> It passes common test under fedora 20 x86_64:
> 
>   "./configure --enable-xen && make -j4 && make check"
>   execute result: "echo $? == 0".
> 
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  xen-hvm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/xen-hvm.c b/xen-hvm.c
> index 0d09940..35efec0 100644
> --- a/xen-hvm.c
> +++ b/xen-hvm.c
> @@ -978,6 +978,7 @@ static void xen_wakeup_notifier(Notifier *notifier, void *data)
>      xc_set_hvm_param(xen_xc, xen_domid, HVM_PARAM_ACPI_S_STATE, 0);
>  }
>  
> +/* return value:  0 is OK, -errno is failure, -1 is critical issue -- exit(1) */
>  int xen_hvm_init(ram_addr_t *below_4g_mem_size, ram_addr_t *above_4g_mem_size,
>                   MemoryRegion **ram_memory)
>  {
> @@ -998,6 +999,7 @@ int xen_hvm_init(ram_addr_t *below_4g_mem_size, ram_addr_t *above_4g_mem_size,
>      state->xenstore = xs_daemon_open();
>      if (state->xenstore == NULL) {
>          perror("xen: xenstore open");
> +        xc_evtchn_close(state->xce_handle);
>          g_free(state);
>          return -errno;
>      }
> @@ -1069,7 +1071,7 @@ int xen_hvm_init(ram_addr_t *below_4g_mem_size, ram_addr_t *above_4g_mem_size,
>      /* Initialize backend core & drivers */
>      if (xen_be_init() != 0) {
>          fprintf(stderr, "%s: xen backend core setup failed\n", __FUNCTION__);
> -        exit(1);
> +        return -1;
>      }
>      xen_be_register("console", &xen_console_ops);
>      xen_be_register("vkbd", &xen_kbdmouse_ops);
> 

-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

