Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCPbu-0004lQ-D7
	for mharc-qemu-trivial@gnu.org; Wed, 08 Nov 2017 07:37:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48104)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCPbs-0004ku-9o
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 07:37:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCPbo-0003dP-7f
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 07:37:36 -0500
Received: from mail-qk0-x233.google.com ([2607:f8b0:400d:c09::233]:50850)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCPbo-0003d8-2Y; Wed, 08 Nov 2017 07:37:32 -0500
Received: by mail-qk0-x233.google.com with SMTP id p7so3061224qkd.7;
	Wed, 08 Nov 2017 04:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5IMo+8EO+DRFrdfjdGkmCayjczUGEoFz+KZfpAv6Eho=;
	b=bQlKuQJslIaaZ8GXAzarKFelCPxbe1EBYbWi19TfRBqeuZk+L2kDgWTCOB2wEFw9XF
	N3bl0VDJEYci1iEcL3GwgRSBGqpCetpFhGPPRnMXYixfUawDTs/q85/z3olJhjYISb9n
	F/YtlJEKldpCDGnZv9rfLMbSRDB5A/jffUcRJ/+LKS6jTsqBzvJirg4qRBtBBfxinCYK
	QCbYPv62451nwN027TAh81dvsSCK4hl+KWwmVvslJGba1RE8GyPu1b7C6bHPrBV+2LJe
	aHOiS/t6R3dVGSXySTgx67bac6QAb7krADSBxLtyfD84K+lwXGKgjkLlLO5z/f/Pq0Nt
	5LFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=5IMo+8EO+DRFrdfjdGkmCayjczUGEoFz+KZfpAv6Eho=;
	b=fPhWjw66UuhsI05rexHg4+3dyyCEqKq0Qp9VruRvpTLUOaPdv/gMcM3PBkW79VKL0P
	YS78+pYIQ9Bpi+fWgos+i1KKqtDSpDZFr65A52/d3eEgnT4LBs8q7RonqbKPUyiHy7bq
	/WDrfqRT/nYfoQlBGgfmU+ECEMLJIEBpRzhiaq2Tg/TIbFoUj8wJkpBKVJyGhFtzkHLh
	ABenEdXt4rSyy6b02sLPcvCTprHirsv3Fz+dcR7PVMVVXA3NJumNrE8Klcr3/CX7CKLU
	Vi7lp1ttP5SJizOUSo3v/+1tOzdYNuE0/e6TqXAO3p6eUa5IYyYEoutPTBHaQQKfnUlk
	8yzA==
X-Gm-Message-State: AJaThX587VtWqBAQrNvo2X4mUNj6CEdr9S4c8hF22/NHDGyDNXgl/yUr
	FrUBxL7TpPqgssbG9eXgC0RfYQUenqM=
X-Google-Smtp-Source: AGs4zMaxjbFoWjY8yODd23ycNV8OMZ/7T3333+ihCrfkT3kdFM/XTLJGw7gtXk9Lel9P64eYK9tnTQ==
X-Received: by 10.233.221.66 with SMTP id r63mr502959qkf.79.1510144651101;
	Wed, 08 Nov 2017 04:37:31 -0800 (PST)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id j7sm2555766qth.25.2017.11.08.04.37.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Nov 2017 04:37:30 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <1510087611-1851-1-git-send-email-cota@braap.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <49151b79-7ec4-b728-1ea9-d5c393a5bada@amsat.org>
Date: Wed, 8 Nov 2017 09:37:26 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510087611-1851-1-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::233
Subject: Re: [Qemu-trivial] [Qemu-arm] [PATCH] arm/translate-a64: mark path
 as unreachable to eliminate warning
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
X-List-Received-Date: Wed, 08 Nov 2017 12:37:37 -0000

On 11/07/2017 05:46 PM, Emilio G. Cota wrote:
> Fixes the following warning when compiling with gcc 5.4.0 with -O1
> optimizations and --enable-debug:
> 
> target/arm/translate-a64.c: In function ‘aarch64_tr_translate_insn’:
> target/arm/translate-a64.c:2361:8: error: ‘post_index’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>      if (!post_index) {
>         ^
> target/arm/translate-a64.c:2307:10: note: ‘post_index’ was declared here
>      bool post_index;
>           ^
> target/arm/translate-a64.c:2386:8: error: ‘writeback’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>      if (writeback) {
>         ^
> target/arm/translate-a64.c:2308:10: note: ‘writeback’ was declared here
>      bool writeback;
>           ^
> 
> Note that idx comes from selecting 2 bits, and therefore its value
> can be at most 3.
> 
> Signed-off-by: Emilio G. Cota <cota@braap.org>

Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/translate-a64.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index caca05a..625ef2d 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -2340,28 +2340,30 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
>      switch (idx) {
>      case 0:
>      case 2:
>          post_index = false;
>          writeback = false;
>          break;
>      case 1:
>          post_index = true;
>          writeback = true;
>          break;
>      case 3:
>          post_index = false;
>          writeback = true;
>          break;
> +    default:
> +        g_assert_not_reached();
>      }
>  
>      if (rn == 31) {
>          gen_check_sp_alignment(s);
>      }
>      tcg_addr = read_cpu_reg_sp(s, rn, 1);
>  
>      if (!post_index) {
>          tcg_gen_addi_i64(tcg_addr, tcg_addr, imm9);
>      }
>  
>      if (is_vector) {
>          if (is_store) {
>              do_fp_st(s, rt, tcg_addr, size);
> 

