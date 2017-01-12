Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cRda7-0003dy-Ig
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2017 06:30:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRdZz-0003Ta-PJ
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 06:30:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRdZy-0000Bp-85
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 06:30:03 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:55570)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cRdZs-00008R-L2; Thu, 12 Jan 2017 06:29:56 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BA8D840A33;
	Thu, 12 Jan 2017 14:29:55 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id E302F560;
	Thu, 12 Jan 2017 14:29:54 +0300 (MSK)
To: Natanael Copa <ncopa@alpinelinux.org>, qemu-devel@nongnu.org
References: <20161215110459.27985-1-ncopa@alpinelinux.org>
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <ef305d55-5579-661b-e895-f91bd800dc55@msgid.tls.msk.ru>
Date: Thu, 12 Jan 2017 14:29:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.5.1
MIME-Version: 1.0
In-Reply-To: <20161215110459.27985-1-ncopa@alpinelinux.org>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] linux-user: fix build with musl on
 aarch64
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
X-List-Received-Date: Thu, 12 Jan 2017 11:30:10 -0000

15.12.2016 14:04, Natanael Copa wrote:
> Use the standard uint64_t instead of internal __u64.
> 
> This fixes compiler error with musl libc on aarch64:
> .../qemu-2.7.0/linux-user/host/aarch64/hostdep.h:28:5:
> error: unknown type name '__u64'
>      __u64 *pcreg = &uc->uc_mcontext.pc;
>      ^~~~~
> 
> Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
> ---
>  linux-user/host/aarch64/hostdep.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/host/aarch64/hostdep.h b/linux-user/host/aarch64/hostdep.h
> index 64f75cef49..6fd6e36b2a 100644
> --- a/linux-user/host/aarch64/hostdep.h
> +++ b/linux-user/host/aarch64/hostdep.h
> @@ -25,7 +25,7 @@ extern char safe_syscall_end[];
>  static inline void rewind_if_in_safe_syscall(void *puc)
>  {
>      struct ucontext *uc = puc;
> -    __u64 *pcreg = &uc->uc_mcontext.pc;
> +    uint64_t *pcreg = &uc->uc_mcontext.pc;

Is this type available in all places where this header is
being included (apparently these are linux-user/qemu.h and
linux-user/safe-syscall.S, with the latter not being
interesting. But in linux-user/qemu.h, this is the first
file which is included..

Why do we have a mix of __u64 and uint64_t ? :)

Hmm.

/mjt

>      if (*pcreg > (uintptr_t)safe_syscall_start
>          && *pcreg < (uintptr_t)safe_syscall_end) {
> 


