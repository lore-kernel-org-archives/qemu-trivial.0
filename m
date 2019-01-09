Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghAth-0005MO-CO
	for mharc-qemu-trivial@gnu.org; Wed, 09 Jan 2019 05:15:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33051)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghAtf-0005KV-5z
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 05:15:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghAte-0005YM-8B
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 05:15:39 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:37513)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ghAtd-0005Um-Sa; Wed, 09 Jan 2019 05:15:38 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1N9dkB-1hJFGW18ab-015VfQ; Wed, 09 Jan 2019 11:15:29 +0100
To: Jon Diekema <jon.diekema@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
References: <5c2e6965.1c69fb81.b832c.13ee@mx.google.com>
Cc: qemu-trivial@nongnu.org
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <2c434536-6388-563f-344b-c6800769a733@vivier.eu>
Date: Wed, 9 Jan 2019 11:15:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <5c2e6965.1c69fb81.b832c.13ee@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ZwqdWwThyeZT04kr5lfZJbNQFfZGhYUe3+xHYzBV8Aj7OtXbou9
	DoqEI0ecvEK2FeHWro37W9scfuYFfiTDXJU6q5l3yb1z9lYCcrkLMlHMaJKE2tD4sLmkNVG
	axtN780oBRgJ+D+86OMY3SDLibK4Ppy3xt9ns2VVwQdDIeklReGl/Wb+k/zVWX23EVkn1c2
	REqDfSxXoBOR3Luf+YdMQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WwUtxew8d8w=:XHZMANRNqeX2+G72YpX04n
	EJRx2uXojtWIWdHDgS+U2H9aj3DSMh+3gRuU2epEMb1vpEtYMAic6nGwZEfZXfHPI0x3P7k3W
	m3Gvp62hhtkdvAb5G4Huk5YPoIDURwcftzr1D2iDGMyamQVRTTVYstuW9BZncPCeakMWlgXRf
	7OvhTdAiZyKvfWpR7j0xf/aOKK+gj0/NXuWd2/9RJac9+WaSUVbdq1w/4MUbgxLYGO/l9uPFg
	bOIA8eIcnsayjYWxQWdpno+C/TyW3CTQkdNOQ4ZeZTbhqGxc61/MkynrBJZ967S4FWda73lu+
	39PaOqZGI33qsqINAVXAAxQZMuX+4eAadqgZOp9ePW2WHfXLD2vaihCSs0zdd3xyOYFhmK7g/
	J2mr1djCM86h6/TCeevlTsqZuGwbGt6sOIektrSpmynYjl5NJRfoFBUrq0+xLu88quGXgIG+D
	UjJ74foaRO8JY6BMQfcDIDZiYV8T+Nh4w4Xpy6DE/tEn6Z+RhZ5A2f+tdjMuSiltpegAN5HxB
	/VGNXcN31o3VKXcY2Bjkook1AnSS82/4vKNkw36xvRvSd9Km/Yf8fs4qU/8GRfz+n2kDq5uVk
	VEcU/3DnJrPV8S2znFhbpEIu/My92vSQpiYN4TtI2wAow554JPCl7aAgdC+X2D6+XYQ6PQg2d
	F4HJrM+jnhOcZjBRHbdNzmUIO6L14I6l4g3KRjg3kk4cgn5JnkrklNHl+t5tGXiUQuLOtqmnK
	OzOgq4ibsa+9kG0O8/FXqI5mzW5mKB1RzzXQWdCl6GWLa9Oqd8LK7MvAaGE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
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
X-List-Received-Date: Wed, 09 Jan 2019 10:15:40 -0000

Hi Jon,

please cc: qemu-devel and MAINTAINERS when you send a patch.

You can have the list of maintainers using a script in qemu directory:

   ./scripts/get_maintainer.pl XXXX.patch

Thanks,
Laurent

On 03/01/2019 20:58, Jon Diekema wrote:
> From: Jon Diekema <jon.diekema@gmail.com>
> Date: Tue, 25 Dec 2018 04:03:04 -0500
> Subject: Whitespace cleanup: target/ppc/translate_init.inc.c
> 
> Signed-off-by: Jon Diekema <jon.diekema@gmail.com>
> ---
>  target/ppc/translate_init.inc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.inc.c
> index c971a5faf7..b5f4c9bd55 100644
> --- a/target/ppc/translate_init.inc.c
> +++ b/target/ppc/translate_init.inc.c
> @@ -5237,7 +5237,7 @@ static void init_proc_601(CPUPPCState *env)
>                   0x00000000);
>      /* Memory management */
>      init_excp_601(env);
> -    /* XXX: beware that dcache line size is 64 
> +    /* XXX: beware that dcache line size is 64
>       *      but dcbz uses 32 bytes "sectors"
>       * XXX: this breaks clcs instruction !
>       */
> @@ -10485,7 +10485,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
>      cc->tcg_initialize = ppc_translate_init;
>  #endif
>      cc->disas_set_info = ppc_disas_set_info;
> - 
> +
>      dc->fw_name = "PowerPC,UNKNOWN";
>  }
>  
> 


