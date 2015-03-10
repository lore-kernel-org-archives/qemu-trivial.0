Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVELZ-0001WB-LW
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 03:12:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YVELX-0001TR-9h
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 03:12:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YVELW-0008V0-Ax
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 03:12:55 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:40349)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1YVELQ-0008TV-60; Tue, 10 Mar 2015 03:12:48 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	1FE211180041; Tue, 10 Mar 2015 08:12:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id kZE3uMjlfBo6; Tue, 10 Mar 2015 08:12:45 +0100 (CET)
Received: from [192.168.178.24] (p54ACAA0C.dip0.t-ipconnect.de [84.172.170.12])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	E7DFB1180040; Tue, 10 Mar 2015 08:12:44 +0100 (CET)
Message-ID: <54FE996C.2040501@weilnetz.de>
Date: Tue, 10 Mar 2015 08:12:44 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <1425966045-13510-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1425966045-13510-1-git-send-email-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH] cris: remove unused cris_cond15
	declarations
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
X-List-Received-Date: Tue, 10 Mar 2015 07:12:56 -0000

Am 10.03.2015 um 06:40 schrieb Michael Tokarev:
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   disas/cris.c              | 11 -----------
>   target-cris/opcode-cris.h | 10 ----------
>   2 files changed, 21 deletions(-)
>
> diff --git a/disas/cris.c b/disas/cris.c
> index 9dfb4e3..0fc7e54 100644
> --- a/disas/cris.c
> +++ b/disas/cris.c
> @@ -1214,17 +1214,6 @@ cris_cc_strings[] =
>     "wf"
>   };
>   
> -/* Different names and semantics for condition 1111 (0xf).  */
> -const struct cris_cond15 cris_cond15s[] =
> -{
> -  /* FIXME: In what version did condition "ext" disappear?  */
> -  {"ext", cris_ver_v0_3},
> -  {"wf", cris_ver_v10},
> -  {"sb", cris_ver_v32p},
> -  {NULL, 0}
> -};
> -
> -
>   /*
>    * Local variables:
>    * eval: (c-set-style "gnu")
> diff --git a/target-cris/opcode-cris.h b/target-cris/opcode-cris.h
> index 779d4aa..e7ebb98 100644
> --- a/target-cris/opcode-cris.h
> +++ b/target-cris/opcode-cris.h
> @@ -108,16 +108,6 @@ struct cris_support_reg
>   };
>   extern const struct cris_support_reg cris_support_regs[];
>   
> -struct cris_cond15
> -{
> -  /* The name of the condition.  */
> -  const char *const name;
> -
> -  /* What CPU version this condition name applies to.  */
> -  enum cris_insn_version_usage applicable_version;
> -};
> -extern const struct cris_cond15 cris_conds15[];
> -
>   /* Opcode-dependent constants.  */
>   #define AUTOINCR_BIT (0x04)

Reviewed-by: Stefan Weil <sw@weilnetz.de>

There remains a comment in disas/cris.c referring to cris_conds15. Maybe you
want to add that to your patch, too (keep my review then).


