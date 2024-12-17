Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tNerL-0005JK-CN
	for mharc-qemu-trivial@gnu.org; Tue, 17 Dec 2024 16:12:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tNerK-0005In-3T
 for qemu-trivial@nongnu.org; Tue, 17 Dec 2024 16:12:02 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tNerI-0001Gm-LK
 for qemu-trivial@nongnu.org; Tue, 17 Dec 2024 16:12:01 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-728f28744c5so5377811b3a.1
 for <qemu-trivial@nongnu.org>; Tue, 17 Dec 2024 13:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734469918; x=1735074718; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iVQheL5sfpfsPf8LOc0lx9kGU26P7wcAvZn8IDeXaDs=;
 b=I1Iknq1I2q6c/qLjsa8lVFrvUqkYvfn57isOo14Bzh1fX3Q8wztlCbICAuELCQhqfi
 DtX3gxQfUCtlBFOT/dTesWqw28rp63dyfY3RRFpIXpUVBfw2q637HaNKKkcBl509hSQI
 x2Z6cBgqbdZ/UkiVahCrQgQbjgPPDslKr59224/znMWC0ArE83pVHUCiVunBN+UEXI5X
 PmQRmrQELCcX7WisdlRNT0CEeUutPv7LB7uVYu9YgTFnhD4R+qmGJvG98fxNdRtqn+b6
 mp2VMbZbI8Ax06c9QsRNNj7hgPLOFFi9hCeL+4h/tiDU7yeDeW/csF1YvsuJiTnFOO++
 3AsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734469918; x=1735074718;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iVQheL5sfpfsPf8LOc0lx9kGU26P7wcAvZn8IDeXaDs=;
 b=kPGMtkyI010oZQwJuC0PsBYxyxqI974cuT49lc2tVtp5YS2SFb+/zduI0nbfqtzWNB
 E/he8/3g0LeF4I4aex9fDmcfB6ZMnMImZ807Zi+Ie4E60TsMsbF0J8jE0a2fv8QSwTPC
 IN0C9ohVV1fqW9vEiapTh3k+fvUHtv2CmhLQMj+733PSqcnYp1ytGSEKOKIvRN41v2Sn
 3UJnzI3oyZMLeg1GFeC2COI4osz0gzZzNY02pNCo6v8mD1j/a3EtWu8c12744RVHmcDL
 sLrDyzij8WA+R6z9Bh2tJj5EnHP+X/NkxUjvdXB7nonpAdf2gdop4JK2ice+na9sw6Jh
 eiLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEE+nG+jqBLZLfF2FsysbbKZ7VnTBQo/PbDUwpK5DRdCP78UTrg8hl4dNj2AqFWah1dB45aKhj7qxSoDI=@nongnu.org
X-Gm-Message-State: AOJu0YwuGJgon51t3OfcTxmiAbZfxWQdlXw8CHXZWv3H7Ab9zicURL89
 koFikTyflL6PTqFtTDMKHuhaLclJBM+ls8XFurv7czI+Yi97iA95zcXsHwnOq+A=
X-Gm-Gg: ASbGncuVxnuGhQpTgG1Y7gvTR+ONzgZZ5eLPykZpQjXas5uZdP1EZxxBKTdZrldsTbZ
 RCCzexqtR+sIbfIwfQSRkA1CiONKInP+MJ3F8+lhAyHlWMzucucB8z9HRV7A4o7iBXReMu/XWg6
 +gF5V3qa1f3JnlzmPU04cWxWSZUc7kUtOFyMq9Fku1OlYIE6sItpIMiQXuZfnrXnTUfdSaBi0/1
 aD3LGs7Cy0eEotiMkABGauv0G7gRPpZ4AFRhJqIVf+sE9vdHfzcpvfp6ZMk9+OGAdDNUA==
X-Google-Smtp-Source: AGHT+IGc0fR6JkKqsCulnAbjxbUeqxVzDKnuT4Q/Fdm4CxYCxlBf5p7HrdWfysAuWRzRjXEoaWkJpw==
X-Received: by 2002:a05:6a00:14c8:b0:727:3cd0:1145 with SMTP id
 d2e1a72fcca58-72a8d0313dcmr646758b3a.2.1734469917761; 
 Tue, 17 Dec 2024 13:11:57 -0800 (PST)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72918bce39csm7362539b3a.189.2024.12.17.13.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 13:11:57 -0800 (PST)
Message-ID: <4ba9f5c6-9ed5-4bdf-b4a7-60ac420fe9b7@linaro.org>
Date: Tue, 17 Dec 2024 13:11:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] contrib/plugins/bbv.c: Start bb index from 1
Content-Language: en-US
To: ckf104 <1900011634@pku.edu.cn>, qemu-trivial@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20241217142413.148978-1-1900011634@pku.edu.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241217142413.148978-1-1900011634@pku.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Dec 2024 21:12:02 -0000

Hi,

On 12/17/24 06:24, ckf104 wrote:
> Standard simpoint tool reqeusts that index of basic block index starts from 1.
> 
> Signed-off-by: ckf104 <1900011634@pku.edu.cn>
> ---
>   contrib/plugins/bbv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/contrib/plugins/bbv.c b/contrib/plugins/bbv.c
> index a5256517dd..b9da6f815e 100644
> --- a/contrib/plugins/bbv.c
> +++ b/contrib/plugins/bbv.c
> @@ -109,7 +109,7 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
>           bb = g_new(Bb, 1);
>           bb->vaddr = vaddr;
>           bb->count = qemu_plugin_scoreboard_new(sizeof(uint64_t));
> -        bb->index = g_hash_table_size(bbs);
> +        bb->index = g_hash_table_size(bbs) + 1;
>           g_hash_table_replace(bbs, &bb->vaddr, bb);
>       }
>       g_rw_lock_writer_unlock(&bbs_lock);

thanks for this fix.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


