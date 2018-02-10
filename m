Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekPXT-0006nZ-T8
	for mharc-qemu-trivial@gnu.org; Sat, 10 Feb 2018 02:25:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekPXR-0006kh-KT
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 02:25:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekPXQ-0001Jm-TI
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 02:25:33 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34655)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ekPXM-0001FV-Gg; Sat, 10 Feb 2018 02:25:28 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CDF8C40C4E;
	Sat, 10 Feb 2018 10:25:27 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 564D4758;
	Sat, 10 Feb 2018 10:25:29 +0300 (MSK)
To: info@mobile-stream.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <1954640316.20171226142913@mobile-stream.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <751c9675-7e93-a907-4b9e-998c50155e84@msgid.tls.msk.ru>
Date: Sat, 10 Feb 2018 10:25:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1954640316.20171226142913@mobile-stream.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] fix evsrwu and others for powerpcspe
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
X-List-Received-Date: Sat, 10 Feb 2018 07:25:34 -0000

26.12.2017 14:29, info@mobile-stream.com wrote:
> GEN_SPEOP_ARITH2 declares non-local temporaries then calls gen_op_evsrwu/evsrws/evslw which generates branch insn.

I'm Cc'ing qemu-devel@ for review, since I don't know much about how ppc works.

Thanks,

/mjt

> --- target/ppc/translate/spe-impl.inc.c.orig
> +++ target/ppc/translate/spe-impl.inc.c
> @@ -158,8 +158,8 @@
>          gen_exception(ctx, POWERPC_EXCP_SPEU);                                \
>          return;                                                               \
>      }                                                                         \
> -    t0 = tcg_temp_new_i32();                                                  \
> -    t1 = tcg_temp_new_i32();                                                  \
> +    t0 = tcg_temp_local_new_i32();                                                  \
> +    t1 = tcg_temp_local_new_i32();                                                  \
>                                                                                \
>      tcg_gen_trunc_tl_i32(t0, cpu_gpr[rA(ctx->opcode)]);                       \
>      tcg_gen_trunc_tl_i32(t1, cpu_gpr[rB(ctx->opcode)]);                       \
> 
> 


