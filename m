Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fM7YB-0004gl-V6
	for mharc-qemu-trivial@gnu.org; Fri, 25 May 2018 03:54:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fM7Y7-0004fQ-9l
	for qemu-trivial@nongnu.org; Fri, 25 May 2018 03:54:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fM7Y3-0005fT-BR
	for qemu-trivial@nongnu.org; Fri, 25 May 2018 03:54:07 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:46375)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1fM7Xy-0005dw-Ho; Fri, 25 May 2018 03:53:58 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue005 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0LfWo9-1gAMg23Htx-00p51L; Fri, 25 May 2018 09:53:51 +0200
To: Michael Clark <mjc@sifive.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@groups.riscv.org, Michael Tokarev <mjt@tls.msk.ru>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <Alistair.Francis@wdc.com>
References: <1527232960-51123-1-git-send-email-mjc@sifive.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	xsFNBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
	WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
	SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
	UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
	Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
	JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
	q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
	RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
	8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
	LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABzSNMYXVyZW50IFZp
	dmllciA8bHZpdmllckByZWRoYXQuY29tPsLBeAQTAQIAIgUCVgVQgAIbAwYLCQgHAwIGFQgC
	CQoLBBYCAwECHgECF4AACgkQ8ww4vT8vvjwpgg//fSGy0Rs/t8cPFuzoY1cex4limJQfReLr
	SJXCANg9NOWy/bFK5wunj+h/RCFxIFhZcyXveurkBwYikDPUrBoBRoOJY/BHK0iZo7/WQkur
	6H5losVZtrotmKOGnP/lJYZ3H6OWvXzdz8LL5hb3TvGOP68K8Bn8UsIaZJoeiKhaNR0sOJyI
	YYbgFQPWMHfVwHD/U+/gqRhD7apVysxv5by/pKDln1I5v0cRRH6hd8M8oXgKhF2+rAOL7gvh
	jEHSSWKUlMjC7YwwjSZmUkL+TQyE18e2XBk85X8Da3FznrLiHZFHQ/NzETYxRjnOzD7/kOVy
	gKD/o7asyWQVU65mh/ECrtjfhtCBSYmIIVkopoLaVJ/kEbVJQegT2P6NgERC/31kmTF69vn8
	uQyW11Hk8tyubicByL3/XVBrq4jZdJW3cePNJbTNaT0d/bjMg5zCWHbMErUib2Nellnbg6bc
	2HLDe0NLVPuRZhHUHM9hO/JNnHfvgiRQDh6loNOUnm9Iw2YiVgZNnT4soUehMZ7au8PwSl4I
	KYE4ulJ8RRiydN7fES3IZWmOPlyskp1QMQBD/w16o+lEtY6HSFEzsK3o0vuBRBVp2WKnssVH
	qeeV01ZHw0bvWKjxVNOksP98eJfWLfV9l9e7s6TaAeySKRRubtJ+21PRuYAxKsaueBfUE7ZT
	7zfOwU0EVgUmGQEQALxSQRbl/QOnmssVDxWhHM5TGxl7oLNJms2zmBpcmlrIsn8nNz0rRyxT
	460k2niaTwowSRK8KWVDeAW6ZAaWiYjLlTunoKwvF8vP3JyWpBz0diTxL5o+xpvy/Q6YU3BN
	efdq8Vy3rFsxgW7mMSrI/CxJ667y8ot5DVugeS2NyHfmZlPGE0Nsy7hlebS4liisXOrN3jFz
	asKyUws3VXek4V65lHwB23BVzsnFMn/bw/rPliqXGcwl8CoJu8dSyrCcd1Ibs0/Inq9S9+t0
	VmWiQWfQkz4rvEeTQkp/VfgZ6z98JRW7S6l6eophoWs0/ZyRfOm+QVSqRfFZdxdP2PlGeIFM
	C3fXJgygXJkFPyWkVElr76JTbtSHsGWbt6xUlYHKXWo+xf9WgtLeby3cfSkEchACrxDrQpj+
	Jt/JFP+q997dybkyZ5IoHWuPkn7uZGBrKIHmBunTco1+cKSuRiSCYpBIXZMHCzPgVDjk4viP
	brV9NwRkmaOxVvye0vctJeWvJ6KA7NoAURplIGCqkCRwg0MmLrfoZnK/gRqVJ/f6adhU1oo6
	z4p2/z3PemA0C0ANatgHgBb90cd16AUxpdEQmOCmdNnNJF/3Zt3inzF+NFzHoM5Vwq6rc1JP
	jfC3oqRLJzqAEHBDjQFlqNR3IFCIAo4SYQRBdAHBCzkM4rWyRhuVABEBAAHCwV8EGAECAAkF
	AlYFJhkCGwwACgkQ8ww4vT8vvjwg9w//VQrcnVg3TsjEybxDEUBm8dBmnKqcnTBFmxN5FFtI
	WlEuY8+YMiWRykd8Ln9RJ/98/ghABHz9TN8TRo2b6WimV64FmlVn17Ri6FgFU3xNt9TTEChq
	AcNg88eYryKsYpFwegGpwUlaUaaGh1m9OrTzcQy+klVfZWaVJ9Nw0keoGRGb8j4XjVpL8+2x
	OhXKrM1fzzb8JtAuSbuzZSQPDwQEI5CKKxp7zf76J21YeRrEW4WDznPyVcDTa+tz++q2S/Bp
	P4W98bXCBIuQgs2m+OflERv5c3Ojldp04/S4NEjXEYRWdiCxN7ca5iPml5gLtuvhJMSy36gl
	U6IW9kn30IWuSoBpTkgV7rLUEhh9Ms82VWW/h2TxL8enfx40PrfbDtWwqRID3WY8jLrjKfTd
	R3LW8BnUDNkG+c4FzvvGUs8AvuqxxyHbXAfDx9o/jXfPHVRmJVhSmd+hC3mcQ+4iX5bBPBPM
	oDqSoLt5w9GoQQ6gDVP2ZjTWqwSRMLzNr37rJjZ1pt0DCMMTbiYIUcrhX8eveCJtY7NGWNyx
	FCRkhxRuGcpwPmRVDwOl39MB3iTsRighiMnijkbLXiKoJ5CDVvX5yicNqYJPKh5MFXN1bvsB
	kmYiStMRbrD0HoY1kx5/VozBtc70OU0EB8Wrv9hZD+Ofp0T3KOr1RUHvCZoLURfFhSQ=
Message-ID: <4926fd94-b29b-8dad-bbdb-e19729bfa39f@vivier.eu>
Date: Fri, 25 May 2018 09:53:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1527232960-51123-1-git-send-email-mjc@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:X5G9K7yCF0KK5H51uZv60R4SyZuCay554+CO5+lOm4OVNA1XQdv
	6Dyz0Pmg1aRcf/zYiQP2zJdRyZ3gYVaqA9nNXO1wnf6qPHDhbvc6o/OugKy7BizX7s+YEHw
	+GoCLrS0kXkgcfqswQ6KIcXVpCEho93wUpcytVtBui41IuZrn8FHDjjGWeIbmPLx487aJRL
	s2vn1g1Mz6fJgZV3NVvPw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:G0tT75dwE9k=:VT0XxRzLjvxloLCTwCstuh
	MIUjfgmSnuUsPdHMYMSJDeVuT2m6UDRItcWt5xs5p31/+cCFUXsRMFzGUQvYyVdgQkCYpSeA6
	k3RP6eP883XfOceZpK8PjdV7Epuf2/169wSZeqCHD5blzc9craBAC4akGlpWRXWIG3xPKaPNe
	nmw1qc4o1TuoXnsAoMx2uXX8AhYamzZNi6fTmv3zP0c78/OtBkvZHVsPqScUN66CZ7FH02pVF
	pjiD79e7b6p1KkpbDo2EHPcgWHmRTJuLp8AgH4nAddAaA6x+BCA53kNp7GQmUdUSWXdvXXbQT
	nIHSBiySA0rNoHHxdcKAXAxN+wjsj622P6dvtxqPiPcmJQHnV7LrSq7ewg4fnnOJv44S4aAiX
	F/0dHWlWtrKbdf6BBcXi+/wsmCOl5xKGpVrZ6dhHY4xefSIayVukrxwlqB0Cous8Jx5jxkKwR
	jE2Hurn3qIF8ZZooIHwxbnmJs6VVSQE750zdnyy4ixwFjLc2+cHofFstMbTa4q12m38aNzUMB
	uktQiE41JIJguMlrUnLQ01S1d6Htk9YUHztkOU6rwBdsshD+g9uHY9/1OAPrl/vCtfjhxLiwl
	ZV853AVihX6oeLsHWG7FJxoZLNsH+yxthnFMMuMeUrO4g8jSneKmvZuP9e/2SAQOmNZbILAZ9
	w4xIuq3C+FutCi4SfcE1hRQuDwfMqoGtAPME0iDn/6MP7A/zC6OgKiYASu0AMTCCWNLuTj1xq
	jvPYsQCtx5hb/s3I
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.134
Subject: Re: [Qemu-trivial] [PATCH v2] elf: Add RISC-V PSABI ELF header
 defines
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
X-List-Received-Date: Fri, 25 May 2018 07:54:10 -0000

Le 25/05/2018 à 09:22, Michael Clark a écrit :
> Refer to the RISC-V PSABI specification for details:
> 
> - https://github.com/riscv/riscv-elf-psabi-doc/blob/master/riscv-elf.md
> 
> Cc: Michael Tokarev <mjt@tls.msk.ru>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Alistair Francis <Alistair.Francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> ---
>  include/elf.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/elf.h b/include/elf.h
> index 934dbbd6b3ae..bd0493f43d19 100644
> --- a/include/elf.h
> +++ b/include/elf.h
> @@ -1285,6 +1285,14 @@ typedef struct {
>  #define R_IA64_DTPREL64LSB	0xb7	/* @dtprel(sym + add), data8 LSB */
>  #define R_IA64_LTOFF_DTPREL22	0xba	/* @ltoff(@dtprel(s+a)), imm22 */
>  
> +/* RISC-V specific definitions.  */
> +#define EF_RISCV_RVC 0x0001
> +#define EF_RISCV_FLOAT_ABI_SINGLE 0x0002
> +#define EF_RISCV_FLOAT_ABI_DOUBLE 0x0004
> +#define EF_RISCV_FLOAT_ABI_QUAD 0x0006
> +#define EF_RISCV_RVE 0x0008
> +#define EF_RISCV_TSO 0x0010
> +
>  typedef struct elf32_rel {
>    Elf32_Addr	r_offset;
>    Elf32_Word	r_info;
> 

from glibc (and binutils), I have:

  /* RISC-V ELF Flags */
  #define EF_RISCV_RVC                    0x0001
  #define EF_RISCV_FLOAT_ABI              0x0006
  #define EF_RISCV_FLOAT_ABI_SOFT         0x0000
  #define EF_RISCV_FLOAT_ABI_SINGLE       0x0002
  #define EF_RISCV_FLOAT_ABI_DOUBLE       0x0004
  #define EF_RISCV_FLOAT_ABI_QUAD         0x0006

Perhaps you can also define EF_RISCV_FLOAT_ABI_SOFT and EF_RISCV_FLOAT_ABI?

Anyway:

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


