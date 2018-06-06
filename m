Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQaKG-0000g1-Tn
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 11:26:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fQaKE-0000dS-8T
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:26:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fQaKD-0006py-A9
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:26:14 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:40121)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1fQaK5-0006ii-Un; Wed, 06 Jun 2018 11:26:06 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue001 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0MK9VV-1fPCkJ2bUz-001RNe; Wed, 06 Jun 2018 17:26:02 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20180606152128.449-1-f4bug@amsat.org>
	<20180606152128.449-10-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <9fcb3ccc-f703-de2d-7072-3bab2e37e3b0@vivier.eu>
Date: Wed, 6 Jun 2018 17:26:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180606152128.449-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VOLjCJO7X+mwUC0uF9K15SB2T7kFy2bH3/gy8wUH9s8GkIro8+b
	yrjp92l2sFdyY/saSS5roPNPpkE6RT6xFhlEwKVU0+9l6LugiyxNCIS0tfrWhUfnD879vKr
	crOtt25XgXXbSiY5Ff8LVMJNA0U6nym/yEJoSJecgIMB8oZSCG5YVpuaHJI/tzMBpnf4Zcx
	DyWI3mzy6cDZxS6KAD80A==
X-UI-Out-Filterresults: notjunk:1;V01:K0:o09wSFunR9w=:ciLZZ4wE5I0dxbsqkSfYge
	TGVULOtYf3qgFJ4dGkIFPlYmIatlo8eI2l76pdJAH6mIzXUwZIyCvOZNCdqaBV1xfuhe4ICDF
	yeDPvX6aJ3fxIl9Ukb2nF9rElx5satJ+p6YRWktpi8pJVIhTDaB1kfXxhLJyIcLc7pwq/Mh+Y
	O0Sj/3jpgAzQqLXMo/0J5vhWQeeRMruZ9MLcEGeA1/4WWiQIaXPfeWupB3f6BNUBds4qypRH5
	C7ZeJWU6Q5D0bRln4gBLcUaDxPYTtWmgLBjtekGyEyKP7ZWtmlI7qfbzhue5kI70GtTGGvKBg
	FPfGIKKU2G+1tL40aV7HDMigs9gTdYkrF6E0Ry3MDQj415q3Ny5tQLNyd942d7eCuSN/GE4MQ
	EogL+PmnG1Qjhxgp1drmflmgYNnvCWlLPZrO1eYxXmuxrBLW6kWAlbMKH95JXrmy5d3WjQ02n
	t9HHOHvhb/FpmCfX62K+q+2TUR6k3sARawnnqFRX1sdSoaeyQitKhZPFt8FZjnlBHfRF0sZMH
	GxDHQi5fD/3k09w+hjnfLXbJSOdM8Gd75kCj63IquPObLgVgfs+ozvXJtDQkX3AjZ2MFkg9FY
	s8v6sEikglE479/VomeusAiZVUDo2a3Y8hWgYuPJbUf28mERjyaO195ieanNITeBKPjniHEk+
	kUEWwhgKF9ijq4eh45iPcRFrkN4LWjbNZ94TbNPFT4uF4R6KlAXqEhDgXm/KKs31tEf8Fap9A
	z4NSQHxz257SnELj
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.134
Subject: Re: [Qemu-trivial] [PATCH 09/11] target/m68k: Add trailing '\n' to
 qemu_log() call
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
X-List-Received-Date: Wed, 06 Jun 2018 15:26:15 -0000

Le 06/06/2018 à 17:21, Philippe Mathieu-Daudé a écrit :
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/m68k/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index 37d6ffd853..4b5dbdb51c 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -1556,7 +1556,7 @@ DISAS_INSN(undef)
>      /* ??? This is both instructions that are as yet unimplemented
>         for the 680x0 series, as well as those that are implemented
>         but actually illegal for CPU32 or pre-68020.  */
> -    qemu_log_mask(LOG_UNIMP, "Illegal instruction: %04x @ %08x",
> +    qemu_log_mask(LOG_UNIMP, "Illegal instruction: %04x @ %08x\n",
>                    insn, s->insn_pc);
>      gen_exception(s, s->insn_pc, EXCP_UNSUPPORTED);
>  }
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


