Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZiVO-0005oh-EH
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:54:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dZiVM-0005mp-FA
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:54:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dZiVL-0003iT-Lm
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:54:56 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:53192)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1dZiVG-0003al-9J; Mon, 24 Jul 2017 14:54:50 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue104 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0MFsVa-1dKvBQ0hIk-00EsRG; Mon, 24 Jul 2017 20:54:38 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-24-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <4de3bb09-6894-ee92-eb49-0f64efe1bad8@vivier.eu>
Date: Mon, 24 Jul 2017 20:54:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170724182751.18261-24-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:gDrQzKpkuZsE0LpJpYFHOwpSuqMFB97vHFPy1DWd0qXz6iiYnlZ
	uj8JthxOZNYoi1AmJXd8RFQzFJTpSp/53e9wVfpwF5L2FNcRMrKfAOwxGV0Cjtrs185NnyH
	z5srSK3gOmA+Ak+MQXrmo3xtccFpxhtcOcAsvL8KFpY+t2M1sWRlDvHiFF3qFfUV/8fBjCB
	UcCyXFu314kT6BMDFbx1w==
X-UI-Out-Filterresults: notjunk:1;V01:K0:HylzCsz2Rbc=:J0uT+9h0TAoQi/Sflvm2av
	2F6TrgdCxXWyw7hkSm+7EHR3+6tBmGgUEvAwiM4Lt0zwQXBVeYAuQHPYfHz2cc0A90VUQwKai
	xUf2t36eBWMxQ6I0KOfX5i6bRG3nr0Z6S+FejbZxs0qqX4wG4rGeUM3CfUG7PK5jcjjz5KgxZ
	ZdebzTyi8iPpxFVZeRqcYtRu5aTSqi5VDeWObk6VyYjMLsOKT2ADU96ojcEqBAmV6huDqLpKH
	KQbi5RKCiKbLnyanKtb52k2bGzKunsZXWIrExw35HL16SwQOnZFsHBXa/R9Sub/bWD/fkxBfy
	CexqCQi4YWp7WKDdp2BkfRiG1uuIiZ1hpAAgKpOEHay/bfgogK9O5qtqkO/PQAU88S+1GpnYS
	6buxr5FY6CdF03a/vkeSvp4F3nCC6pfdvhN0Pxitb/dPN+d8OfYO1wm/TSCPd56NXQ1mXsc7D
	/numoEpmAIvzMT2scVW/jNgV8CPHeYf5Gebn+r2rcgBxJQvD0WVlXFkhdYKqMYkZ4TaanjtAM
	H33dD/D7fsxP8EqYmyXMZuVt0i00Osb0DA7UHBVKWvcJpRp2MljAMgzK0NnSuquTth0Pfi81+
	UDSLroWs3gDs+KJJTI2iIM69dMtNiDcw0D13go1j9jPyiArXQ2pMAtC+NSF6Z9hBTEmIaUbdo
	HTpqD1eYJOvj3Q7lhaPSWvVajpzGOlTnE1FNO1xz6e7fTUgdnRQc8y2p3U4+ombmNGyXPUdN7
	2HDX0uDQTs2g+5UtnUFuwAwBKUrvuemAq18dwePISKhJeigcZVCzBsbOOMw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.72.192.73
Subject: Re: [Qemu-trivial] [PATCH for 2.10 23/35] m68k/translate: fix
 incorrect copy/paste
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
X-List-Received-Date: Mon, 24 Jul 2017 18:54:57 -0000

Le 24/07/2017 à 20:27, Philippe Mathieu-Daudé a écrit :
> db3d7945ae extended gen_cc_cond() for cond [6, 7, 9, 10] but misswrote [4, 5]
> 
> target/m68k/translate.c:1323:70: warning: identical expressions on both sides of logical operator
>         if (op == CC_OP_ADDB || op == CC_OP_ADDW || op == CC_OP_ADDL ||
>             op == CC_OP_ADDB || op == CC_OP_ADDW || op == CC_OP_ADDL) {
>             ~~~~~~~~~~~~~~~~    ~~~~~~~~~~~~~~~~    ~~~~~~~~~~~~~~~~ ^
> 
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/m68k/translate.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index ada2a91b64..1a2f421aab 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -1321,7 +1321,8 @@ static void gen_cc_cond(DisasCompare *c, DisasContext *s, int cond)
>      case 5: /* CS (C) */
>          /* Some cases fold C into X.  */
>          if (op == CC_OP_ADDB || op == CC_OP_ADDW || op == CC_OP_ADDL ||
> -            op == CC_OP_ADDB || op == CC_OP_ADDW || op == CC_OP_ADDL) {
> +            op == CC_OP_SUBB || op == CC_OP_SUBW || op == CC_OP_SUBL ||
> +            op == CC_OP_LOGIC) {

According to commit (db3d7945) introducing the incorrect copy/paste, I
don't think we need the CC_OP_LOGIC here. Logic operations never
generates X flags (whereas they can generate Z and and N).

Thanks,
Laurent

