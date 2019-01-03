Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gf6he-00048w-Aq
	for mharc-qemu-trivial@gnu.org; Thu, 03 Jan 2019 12:22:42 -0500
Received: from eggs.gnu.org ([208.118.235.92]:42915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gf6hZ-00040v-Ft
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2019 12:22:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gf6hY-0004zV-Re
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2019 12:22:37 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:50863)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gf6hQ-0004eX-6c; Thu, 03 Jan 2019 12:22:28 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MwwuJ-1hXvRc49Fr-00yUkR; Thu, 03 Jan 2019 18:22:16 +0100
References: <CALvuzg6x2NjiJR=fPkgEmW2fCn6Uzy+rLAPHsC6Qn-S6hiNoqQ@mail.gmail.com>
Cc: qemu-trivial@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
To: Jon Diekema <jon.diekema@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <cfd7963a-d93f-1977-b7c5-ddf1b80a09ab@vivier.eu>
Date: Thu, 3 Jan 2019 18:22:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <CALvuzg6x2NjiJR=fPkgEmW2fCn6Uzy+rLAPHsC6Qn-S6hiNoqQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:DuUkok/xBQ7JD0VHeIUgnvMbTrB2Bua3GWpwqQqtVAxWgq8F/uB
	DsuMPStEfeTLO8JjwC34l0dZIX+5QtaOdPZLQIPRHN0xMJ1OHhrpa1WSxlDvJz1bR++VgMb
	ZJPrPGO0Vu9owjhYAKADlqEg8k3trxy5geC/TPuKE2UuCVM/NrUxatGcXTZNqvkK4jgr3uN
	YJYI82GXBvHE+CqyVlj9w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6w4Ok8fAy4s=:qi2x4wpjxoeVCD3MEnjy9W
	5E106wAeyH+lvQEcBw083FyjRqV/qcV5hnzmjp9bfDFcGfr5ALnc0vJXe+h6Mn4TOo3PwRSG1
	N9e65hy1szTtA7/KfvtlLtMFoygY0pPt8W5IHrtWnTsZMMDI/SahRuyNYz8hx4gM5g19CaOMB
	Crj5ZZn1CBlER97RCyRLpmYoQQeMUTpP7Lfd8sh2Lix9MdR8rcpPW/EAEYOb8COtD/UEgC7i7
	DEMoccHmMUjymnZ0eIzxyZeCchBr2uyXGE0JJ9OOJiy3dq5kPls1oERLpJvB3nWtgFFVB5oXX
	XkDb4OzcsLq6yuVzaqmDYcQGlpAbbukNx2RYcEH7QtE1tZIqD4I9WTy6prswfoAf0Kgwh9P+Y
	y4w0Y54y3wf9J48BOMnkiWiz9Ph9+25Evo/P+x7dgCcT5+qklGaYOY987tIj3b2R6xzXcwDHj
	j6DfDSMIhDWXJPj2wPgSl4KmOovRWRUUgghGAwXsP2O3h69aNXN7J5+bod2CJ+B//5f/YvBxV
	dxgc6Gm64VgkaAzZqLTLeeejcPzVG9tmaglVOKglPfeVzC3MtCRIzHqa4851AsRN2F5GvcEwj
	NaOjN23/PzwdA8sG/95d9ewTu3RtcbgvLyxS1uqbY7Qr/jKOOGh1hyseWOP0LkcuvfaxMGLpI
	Gq5WxJc7KXe9IQP68cZi2CXg1vnZ/Tcf+9Pcl+QLFNa4Z+5cdADtEfW5PwobX8HTMuj3QSQyK
	t5FUQm2bVQENA1Y/O+sx1wYDslmne8n+pbYO4sx9Vahd939VQ/hSJJ1+FOw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-trivial] Whitespace cleanup:
 target/ppc/translate_init.inc.c
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
X-List-Received-Date: Thu, 03 Jan 2019 17:22:40 -0000

Hi,

your patch is corrupted: please generate it with "git format-patch" and
send it with "git send-email" (you can also use git-publish)

Thanks,
Laurent

Le 25/12/2018 à 10:57, Jon Diekema a écrit :
> From b9c6caf3913487f05997144a940db0b900b17f05 Mon Sep 17 00:00:00 2001
> From: Jon Diekema <jon.diekema@ge.com <mailto:jon.diekema@ge.com>>
> Date: Tue, 25 Dec 2018 04:03:04 -0500
> Subject: Whitespace cleanup: target/ppc/translate_init.inc.c
> 
> Signed-off-by: Jon Diekema <jon.diekema@ge.com <mailto:jon.diekema@ge.com>>
> ---
>  target/ppc/translate_init.inc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/translate_init.inc.c
> b/target/ppc/translate_init.inc.c
> index 03f1d34a97..ac186845d0 100644
> --- a/target/ppc/translate_init.inc.c
> +++ b/target/ppc/translate_init.inc.c
> @@ -5245,7 +5245,7 @@ static void init_proc_601(CPUPPCState *env)
>                   0x00000000);
>      /* Memory management */
>      init_excp_601(env);
> -    /* XXX: beware that dcache line size is 64 
> +    /* XXX: beware that dcache line size is 64
>       *      but dcbz uses 32 bytes "sectors"
>       * XXX: this breaks clcs instruction !
>       */
> @@ -10493,7 +10493,7 @@ static void ppc_cpu_class_init(ObjectClass *oc,
> void *data)
>      cc->tcg_initialize = ppc_translate_init;
>  #endif
>      cc->disas_set_info = ppc_disas_set_info;
> - 
> +
>      dc->fw_name = "PowerPC,UNKNOWN";
>  }
>  
> -- 
> 2.20.1.3.gf17a2b179
> 


