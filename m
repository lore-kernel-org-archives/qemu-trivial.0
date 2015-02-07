Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YK1cE-0006mM-VR
	for mharc-qemu-trivial@gnu.org; Sat, 07 Feb 2015 04:23:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YK1c9-0006ev-5I
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 04:23:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YK1c4-0002y9-Eb
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 04:23:45 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60598)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YK1bw-0002vY-9y; Sat, 07 Feb 2015 04:23:32 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4452C41366;
	Sat,  7 Feb 2015 12:23:29 +0300 (MSK)
Message-ID: <54D5D991.2010605@msgid.tls.msk.ru>
Date: Sat, 07 Feb 2015 12:23:29 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Maxim Ostapenko <m.ostapenko@partner.samsung.com>, 
	Peter Maydell <peter.maydell@linaro.org>
References: <54CF8735.3080806@partner.samsung.com>
In-Reply-To: <54CF8735.3080806@partner.samsung.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Slava Garbuzov <v.garbuzov@samsung.com>, Riku Voipio <riku.voipio@iki.fi>,
	QEMU Developers <qemu-devel@nongnu.org>, Yury Gribov <y.gribov@samsung.com>
Subject: Re: [Qemu-trivial] [PATCH v2] Fix ABI incompatibility between
 Qemu-aarch64 and Linux Kernel in signal handling.
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
X-List-Received-Date: Sat, 07 Feb 2015 09:23:49 -0000

02.02.2015 17:18, Maxim Ostapenko wrote:
> From 5b035df58f9f17e64b35311b6b5f55097c7f8ce1 Mon Sep 17 00:00:00 2001
> From: Max Ostapenko <m.ostapenko@partner.samsung.com>
> Date: Mon, 2 Feb 2015 12:03:20 +0400
> Subject: [PATCH] linux-user: wrong TARGET_SI_PAD_SIZE value for some targets.
> 
> Fix TARGET_SI_PAD_SIZE calculation to match the way the kernel does it.
> Use different TARGET_SI_PREAMBLE_SIZE for 32-bit and 64-bit targets.

I've applied your patch to -trivial.  However, the patch has been whitespace-
damaged so I had to apply it manually - your mailer added several leading
spaces, changed tabs into spaces, and word-wrapped several lines.  Please,
for the next time, send a patch over email to youself and verify if it
still applies to a clean branch -- before sending it to the list.

Note also that I used the original subject line of your patch, not the
subject line of this emai.  Again, please ensure there's just one message
with one subject and date, not two ;)

Thanks,

/mjt

> Signed-off-by: Maxim Ostapenko <m.ostapenko@partner.samsung.com>
> ---
>  linux-user/syscall_defs.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index ebb3be1..9ed6de8 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -655,7 +655,14 @@ typedef struct {
>  #endif
> 
>  #define TARGET_SI_MAX_SIZE    128
> -#define TARGET_SI_PAD_SIZE    ((TARGET_SI_MAX_SIZE/sizeof(int)) - 3)
> +
> +#if TARGET_ABI_BITS == 32
> +#define TARGET_SI_PREAMBLE_SIZE (3 * sizeof(int))
> +#else
> +#define TARGET_SI_PREAMBLE_SIZE (4 * sizeof(int))
> +#endif
> +
> +#define TARGET_SI_PAD_SIZE ((TARGET_SI_MAX_SIZE - TARGET_SI_PREAMBLE_SIZE) / sizeof(int))
> 
>  typedef struct target_siginfo {
>  #ifdef TARGET_MIPS


