Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e49kz-0001ek-E7
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 14:04:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e49kx-0001ca-6U
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 14:04:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e49kw-0006lC-Er
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 14:04:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59761)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1e49kr-0006hQ-4v; Mon, 16 Oct 2017 14:04:45 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 76A7A40D0A;
	Mon, 16 Oct 2017 21:04:44 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 6511D3C3;
	Mon, 16 Oct 2017 21:04:44 +0300 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Marco A L Barbosa <malbarbo@gmail.com>, qemu-trivial@nongnu.org
References: <20171005143553.23784-1-malbarbo@gmail.com>
Cc: qemu-devel@nongnu.org
Message-ID: <8bc869d6-73cd-d085-99ca-aab8832ee1fc@msgid.tls.msk.ru>
Date: Mon, 16 Oct 2017 21:04:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171005143553.23784-1-malbarbo@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] linux-user: Add AT_SECURE auxval
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
X-List-Received-Date: Mon, 16 Oct 2017 18:04:52 -0000

I'm Cc'ing this to qemu-devel@ for review, since this patch hasn't got any reviews.
Please the next time always inclure qemu-devel@ and other addresses according
to the output of scripts/get_maintainer.pl

Thanks,

/mjt

05.10.2017 17:35, Marco A L Barbosa wrote:
> This is necessary to run android ndk applications. Without this patch, the
> following error is generated:
> 
> FATAL: kernel did not supply AT_SECURE
> 
> Should AT_SECURE from host be considered or is the ids comparisons enough?
> 
> Signed-off-by: Marco A L Barbosa <malbarbo@gmail.com>
> ---
>  linux-user/elfload.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 79062882ba..177ce30e89 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1354,7 +1354,7 @@ struct exec
>                                   ~(abi_ulong)(TARGET_ELF_EXEC_PAGESIZE-1))
>  #define TARGET_ELF_PAGEOFFSET(_v) ((_v) & (TARGET_ELF_EXEC_PAGESIZE-1))
>  
> -#define DLINFO_ITEMS 14
> +#define DLINFO_ITEMS 15
>  
>  static inline void memcpy_fromfs(void * to, const void * from, unsigned long n)
>  {
> @@ -1782,6 +1782,7 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
>      NEW_AUX_ENT(AT_HWCAP, (abi_ulong) ELF_HWCAP);
>      NEW_AUX_ENT(AT_CLKTCK, (abi_ulong) sysconf(_SC_CLK_TCK));
>      NEW_AUX_ENT(AT_RANDOM, (abi_ulong) u_rand_bytes);
> +    NEW_AUX_ENT(AT_SECURE, (abi_ulong) (getuid() != geteuid() || getgid() != getegid()));
>  
>  #ifdef ELF_HWCAP2
>      NEW_AUX_ENT(AT_HWCAP2, (abi_ulong) ELF_HWCAP2);
> 


