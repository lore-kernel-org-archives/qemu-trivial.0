Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVCZO-0002yh-JQ
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 01:19:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVCZI-0002xb-Qx
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 01:19:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVCQU-0001B9-Qc
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 01:09:55 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44949)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YVCQ8-00013e-9A; Tue, 10 Mar 2015 01:09:32 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id DA90941302;
	Tue, 10 Mar 2015 08:09:29 +0300 (MSK)
Message-ID: <54FE7C89.2030408@msgid.tls.msk.ru>
Date: Tue, 10 Mar 2015 08:09:29 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1425215238-25799-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1425215238-25799-1-git-send-email-sw@weilnetz.de>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] disas/cris: Fix warning caused by
	missing 'static' attribute
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
X-List-Received-Date: Tue, 10 Mar 2015 05:19:04 -0000

01.03.2015 16:07, Stefan Weil wrote:
> Warning from the Sparse static analysis tool:
> 
> disas/cris.c:1218:26: warning:
>  symbol 'cris_cond15s' was not declared. Should it be static?
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  disas/cris.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/disas/cris.c b/disas/cris.c
> index 9dfb4e3..a034dba 100644
> --- a/disas/cris.c
> +++ b/disas/cris.c
> @@ -1215,7 +1215,7 @@ cris_cc_strings[] =
>  };
>  
>  /* Different names and semantics for condition 1111 (0xf).  */
> -const struct cris_cond15 cris_cond15s[] =
> +static const struct cris_cond15 cris_cond15s[] =

This is the same patch you sent 07-feb, with Message-Id:
<1423258997-30957-2-git-send-email-sw@weilnetz.de>, and
the same patch which makes at least clang unhappy:

 disas/cris.c:1218:33: error:
 unused variable 'cris_cond15s' [-Werror,-Wunused-const-variable]
 static const struct cris_cond15 cris_cond15s[] =
                                 ^
 1 error generated.

I'll drop this patch and remove the unused variable
instead.

Thanks,

/mjt

