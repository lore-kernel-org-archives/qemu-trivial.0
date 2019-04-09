Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hDki4-0003Lg-B5
	for mharc-qemu-trivial@gnu.org; Tue, 09 Apr 2019 02:58:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hDki2-0003J8-38
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2019 02:58:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hDki1-0008G0-6O
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2019 02:58:18 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:43132)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hDki0-0008FY-QI
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2019 02:58:17 -0400
Received: by mail-pg1-x531.google.com with SMTP id z9so5818416pgu.10
	for <qemu-trivial@nongnu.org>; Mon, 08 Apr 2019 23:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=xLIW+9yrr4b5bnsgGOL/nvK8hLj+LD4cpg6r32kRl1I=;
	b=OOTJx6RCIcgRfgk83g0DPxrS4vD5cXPnR72JO1knX4hAaZxPFls/pMhyLjmqB+F/N2
	v5EZrO26AvTtdXE9QPCp2LBaO3B/FTR2ph+NMLwmHsLnTnoe8s4s2KNs7ROzmtkv2WVb
	GmKdl99OtI7CUjRX+hJkp70Nr28BJbefDniIieWs+NGW57TpbsjmGObEHZJ6+9FeqstC
	VUmtSqeG0THL56byboqMmHqsH0ZGG8aEblKzKFoiBaxS6dUeusiPNmMLXsVMdgBN2fO+
	fCaluR8ldZJ6xmStfUtFJkxsVIOYIo+HcJQ6MfFZaBsAzjJoGq0sfQzhMlP/CgPPaAes
	3mgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xLIW+9yrr4b5bnsgGOL/nvK8hLj+LD4cpg6r32kRl1I=;
	b=ZO5L3Shw7zg4k5oj4vgnUxhLxh/wRhV+b5VkjmI3vq8CDkhIa6XxedAPYE6yu7nA+l
	PgakcqazpbuMJrZ94Z6+yFXHd7QXGt5OjCndfEtk+WmtPqQqgC4v7od+uYYOspgOnJJs
	iX9AHmS1tEcKv64SzpgWxjUD0JTgyJ+8fzWoebjNrCmtGDvZGgU63TO0RzukASde9eQY
	VuqYfIHvnoJmlz1kITqEA+nYcQ7miU1XTD3rrhtpQbBocPQsdAtLq0+jU7QgSnwxHQ1N
	IqvpjL/6PhSX/ioaZafkemlJzD0hgkC+FM4yBPkusgdK/GOdBq2obru7QOQ6WmKLxj9E
	kGCA==
X-Gm-Message-State: APjAAAVfQkdaTjTK22/2om6Y23VA1CZNhE7LLCIP3o6U+SOtcEymZL4f
	M3fde260JYH3fjjwcn2K2cj6lQ==
X-Google-Smtp-Source: APXvYqzkpfu1Qqz/i/rQwwX8pMYKu03/O5qFVQ0hxNdYfvzl51amVYHLiCo93nuQ6pTIBzQ1Uh1hFg==
X-Received: by 2002:a63:61d7:: with SMTP id
	v206mr33504445pgb.349.1554793095245; 
	Mon, 08 Apr 2019 23:58:15 -0700 (PDT)
Received: from [192.168.3.43] (rrcs-173-198-79-114.west.biz.rr.com.
	[173.198.79.114]) by smtp.gmail.com with ESMTPSA id
	j5sm25503944pfe.15.2019.04.08.23.58.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Apr 2019 23:58:14 -0700 (PDT)
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>
References: <20190409060435.22801-1-sw@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4a16a810-9806-3a76-7d17-1b6282296502@linaro.org>
Date: Mon, 8 Apr 2019 20:58:10 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190409060435.22801-1-sw@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::531
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tci: Fix some unaligned
 memory accesses
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
X-List-Received-Date: Tue, 09 Apr 2019 06:58:18 -0000

On 4/8/19 8:04 PM, Stefan Weil wrote:
>  static tcg_target_ulong tci_read_i(uint8_t **tb_ptr)
>  {
> -    tcg_target_ulong value = *(tcg_target_ulong *)(*tb_ptr);
> +    tcg_target_ulong value;

Ideally these would use the helpers from "qemu/bswap.h", ldl_he_p(), etc.


r~

