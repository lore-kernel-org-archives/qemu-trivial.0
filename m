Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rcP5W-0008KB-4n
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2024 07:19:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rcP5P-0008F6-Rt
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 07:19:01 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rcP5M-0004Lz-PM
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 07:18:59 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33aeb088324so2837926f8f.2
 for <qemu-trivial@nongnu.org>; Tue, 20 Feb 2024 04:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708431535; x=1709036335; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yg5SVoKbf5S0YjskYn34WXu5kIgOC7uG7UyRrF8iVmo=;
 b=egU3IaTx8xos3x/VsSc+yOXcYuh/zkk7KBr8OXgtJbBv/RJZilGUGo8WPnniZpN9YZ
 j/JO8+mjPq3dZljBqdRKbsEla7TJ1CLrIfSoSPrTr1+5uk8j5s+pi1Hi1ZGzWx2TgNNI
 bfANXkhSlZU/i4rDEbv3ciTXhosEtdBmVdO0Yqv1TOO4Fmc2z6PZeuvlUZu8J7K1Nt6o
 shUTcMQqv4zsXbm+rUTn9DNLKT0d4ixPTqCusIzlb6R2kapWyrLXMGUyMJNKXPpl5dUF
 raVkXKWWjBlzR3hh789s+GF0YDgbE8pObRX98l6w9kr8OQH4qG62nkuFIIfLV54R8hNm
 L7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708431535; x=1709036335;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yg5SVoKbf5S0YjskYn34WXu5kIgOC7uG7UyRrF8iVmo=;
 b=Vve8TIIPitrkSreZsMo1qb5iprQjKPpThWn3IOxRDPlUoQcXbHwY4r78WoeImLEZVq
 +KEyh1noEN+HGrWdKNAbrDHYCfN13XImsTF7+pp4itbluD0CDRQHqSIdvQR0s97gWqL/
 rdZTVfoOdnum3uxitZY52ymjTSkiyddJTy0gYN6LpM5Q4FrUCgegbHQ4AQBJ/7oTvwTr
 phNBV1yGF/uR8sTY6/0snRytrsiWx1TAnNPf7JjKeCxxtpEL+pd2RQFA7ih4WF90JoLS
 HnZV05GpIngQiA+H+gCMPfXeaPOkc+SiLu0d64Oqf1MSr+BQi2j0ER+kWQqvYcsMLsp/
 XLpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAiVkvMKAAZVnnWwlYvYMa0AKhptBlu7J9jIKQ+3zu+zr234YeC8QNJLOjPMuGv2BhK+BBenQ69thBP3eQqULvyywiDOlzxg==
X-Gm-Message-State: AOJu0Yx/cyoSlR8d8G0JMxGghVYatnZ9ZeFy+YJLjX20nfebxaG281SN
 68ViWVTEs7TNga60ncXSro91oqSHpnkrrbiLaIKNAy3vKJ1rQ5ylNJlgT4sifxs=
X-Google-Smtp-Source: AGHT+IFk6yIfHM6AgO9sZQhV0dx4WqObYKbhDnynI3esJQfvFtVaKPn9PIPLgwRnL2UTff0Ow5PcpQ==
X-Received: by 2002:a5d:6dae:0:b0:33d:3cf6:a2ca with SMTP id
 u14-20020a5d6dae000000b0033d3cf6a2camr5430643wrs.30.1708431535219; 
 Tue, 20 Feb 2024 04:18:55 -0800 (PST)
Received: from [192.168.69.100] (mek33-h02-176-184-23-7.dsl.sta.abo.bbox.fr.
 [176.184.23.7]) by smtp.gmail.com with ESMTPSA id
 a7-20020adfeec7000000b0033b483d1abcsm13193952wrp.53.2024.02.20.04.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 04:18:54 -0800 (PST)
Message-ID: <aae1de82-7f8f-42c1-bab3-b859fe8aa1b4@linaro.org>
Date: Tue, 20 Feb 2024 13:18:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/21] pc-bios/README: correct typos
Content-Language: en-US
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
 <300815e3494a5f016137a09f331bc4137f1ed9ff.1708419115.git.manos.pitsidianakis@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <300815e3494a5f016137a09f331bc4137f1ed9ff.1708419115.git.manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 20 Feb 2024 12:19:01 -0000

On 20/2/24 09:52, Manos Pitsidianakis wrote:
> Correct typos automatically found with the `typos` tool
> <https://crates.io/crates/typos>
> 
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>   pc-bios/README | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



