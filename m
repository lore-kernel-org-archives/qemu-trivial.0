Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ecVbT-0007zL-Nf
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jan 2018 07:17:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49173)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1ecVbR-0007xf-46
	for qemu-trivial@nongnu.org; Fri, 19 Jan 2018 07:17:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1ecVbM-0007T6-4d
	for qemu-trivial@nongnu.org; Fri, 19 Jan 2018 07:17:01 -0500
Received: from mail-wr0-f195.google.com ([209.85.128.195]:41368)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <th.huth@gmail.com>)
	id 1ecVbL-0007SU-UJ; Fri, 19 Jan 2018 07:16:56 -0500
Received: by mail-wr0-f195.google.com with SMTP id o7so1393446wro.8;
	Fri, 19 Jan 2018 04:16:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=M7RyJFO+8vp+53BZtJho1ure2PokD0y0Vc+njQUJ8o8=;
	b=t8wn38DMpYphd/fd6ntbeUtCZJIpco5DyHq/2eGgsCgmy7lFSDuGCrgO5ciTiNwNej
	4TBmIdd/T83Sbvrb7KbK/k7+2PjPY/hVaB86OxKO90IvzWo/tvo3xQ6RbkG4vRRFW8GN
	szTbIiWuHhLo1YwZB8bZVyI6DB05Ds9vEjsPXm5gdKFk367SxBOyymAY0Y5GtW86ib4L
	oVIaJd6EH1FTfVGhTmKGjll7H81ieQyHPk2TsMaJ8hkBr1qz+uJHVKhCxIjS+yJYf1kp
	MgXDuCPRkQr7oGgG2d05KvzyRUFg2RrnWznTc3t0yFHHUVDHSiu6MbbtJfIpEaEfoqfa
	XC6Q==
X-Gm-Message-State: AKwxytcIjBgnUGGPWkqD3HgmVlkeeYxvQtoUXP3CXmONnuyQs88zDr+X
	FiaSUvofjT0D+8A4ryiqCwI=
X-Google-Smtp-Source: ACJfBot4FIvnryKWTjl1e/o6GMsSMvCCUSUfQokC2IeBqxcVI/nTSMJgxfvV2q8AFkqasm8PveWa8Q==
X-Received: by 10.223.158.5 with SMTP id u5mr2323261wre.197.1516364214669;
	Fri, 19 Jan 2018 04:16:54 -0800 (PST)
Received: from [192.168.178.23] (pD9E83675.dip0.t-ipconnect.de.
	[217.232.54.117])
	by smtp.gmail.com with ESMTPSA id r3sm1809416wmg.31.2018.01.19.04.16.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Jan 2018 04:16:54 -0800 (PST)
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20180119114444.7590-1-laurent@vivier.eu>
From: Thomas Huth <huth@tuxfamily.org>
Message-ID: <d3d62aeb-435b-86eb-15a6-fa96f6e28d4c@tuxfamily.org>
Date: Fri, 19 Jan 2018 13:16:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180119114444.7590-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.195
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target/m68k: fix TCG
 variable double free
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
X-List-Received-Date: Fri, 19 Jan 2018 12:17:02 -0000

On 19.01.2018 12:44, Laurent Vivier wrote:
> t64 is also unconditionally freed after the switch () { ... }
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  target/m68k/translate.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index f0e86a73d4..ea18df940a 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -969,7 +969,6 @@ static void gen_load_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp)
>      case OS_DOUBLE:
>          tcg_gen_qemu_ld64(t64, addr, index);
>          gen_helper_extf64(cpu_env, fp, t64);
> -        tcg_temp_free_i64(t64);
>          break;
>      case OS_EXTENDED:
>          if (m68k_feature(s->env, M68K_FEATURE_CF_FPU)) {
> 

Reviewed-by: Thomas Huth <huth@tuxfamily.org>

