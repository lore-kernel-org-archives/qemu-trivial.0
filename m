Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ztasv-00039s-Gc
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2015 07:40:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ztass-00038d-D9
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 07:40:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ztasr-0005TT-JK
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 07:40:18 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:42570)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ztasl-0005Sl-RR; Tue, 03 Nov 2015 07:40:12 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 14057407DB;
	Tue,  3 Nov 2015 15:40:11 +0300 (MSK)
Message-ID: <5638AB2B.5060700@msgid.tls.msk.ru>
Date: Tue, 03 Nov 2015 15:40:11 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1446553829-28463-1-git-send-email-caoj.fnst@cn.fujitsu.com>
In-Reply-To: <1446553829-28463-1-git-send-email-caoj.fnst@cn.fujitsu.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, marcel@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] set_memory_options: remove code that
	make no sense
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
X-List-Received-Date: Tue, 03 Nov 2015 12:40:19 -0000

03.11.2015 15:30, Cao jin wrote:
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  vl.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/vl.c b/vl.c
> index f5f7c3f..13f2c8b 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -2860,11 +2860,6 @@ static void set_memory_options(uint64_t *ram_slots, ram_addr_t *maxram_size,
>      sz = 0;
>      mem_str = qemu_opt_get(opts, "size");
>      if (mem_str) {
> -        if (!*mem_str) {
> -            error_report("missing 'size' option value");
> -            exit(EXIT_FAILURE);
> -        }

I'm not sure this one is bad or good, it is indeed possible
to specify no value for size=, but if we're to check that,
we'd have to add such checks everywhere.

But the next one...

>          sz = qemu_opt_get_size(opts, "size", ram_size);
>  
>          /* Fix up legacy suffix-less format */
> @@ -2886,10 +2881,6 @@ static void set_memory_options(uint64_t *ram_slots, ram_addr_t *maxram_size,
>  
>      sz = QEMU_ALIGN_UP(sz, 8192);
>      ram_size = sz;
> -    if (ram_size != sz) {
> -        error_report("ram size too large");
> -        exit(EXIT_FAILURE);
> -    }

is definitely wrong.

sz is uint64_t, while ram_size is ram_addr_t which is
either uint64_t or uintptr_t.  Until it is fixed to
always be 64bits, the above code makes (some) sense.

Thanks,

/mjt

