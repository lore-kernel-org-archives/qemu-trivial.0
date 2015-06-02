Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yzeu4-0003OI-DO
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 01:38:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yzeu3-0003MN-35
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 01:38:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yzeu2-0000EU-7x
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 01:38:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34250)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yzetx-0000B8-P7; Tue, 02 Jun 2015 01:38:13 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 38E9940423;
	Tue,  2 Jun 2015 08:38:11 +0300 (MSK)
Message-ID: <556D4142.3000506@msgid.tls.msk.ru>
Date: Tue, 02 Jun 2015 08:38:10 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1433145235-13941-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1433145235-13941-1-git-send-email-pbonzini@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] translate-all: delete prototype for
	non-existent function
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
X-List-Received-Date: Tue, 02 Jun 2015 05:38:19 -0000

01.06.2015 10:53, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  translate-all.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/translate-all.h b/translate-all.h
> index ef9166c..0384640 100644
> --- a/translate-all.h
> +++ b/translate-all.h
> @@ -24,7 +24,6 @@ void tb_invalidate_phys_page_fast(tb_page_addr_t start, int len);
>  void tb_invalidate_phys_page_range(tb_page_addr_t start, tb_page_addr_t end,
>                                     int is_cpu_write_access);
>  void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end);
> -void cpu_unlink_tb(CPUState *cpu);
>  void tb_check_watchpoint(CPUState *cpu);
>  
>  #ifdef CONFIG_USER_ONLY

Hmm.  This does not apply due to context, my version of translate-all.h
is very short, without tb_invalidate_phys_page_range prototype and
without ifdef CONFIG_USER_ONLY, and after this prototype removal it
contains just 3 prototypes.

I reduced this to just the one-line removal and applied, and git pull
should do the right thing too.

Thanks,

/mjt

