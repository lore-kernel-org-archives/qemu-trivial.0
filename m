Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKp1C-0006GX-8G
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jan 2023 18:17:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKp1A-0006G1-JA
 for qemu-trivial@nongnu.org; Wed, 25 Jan 2023 18:17:24 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKp18-0006sC-W3
 for qemu-trivial@nongnu.org; Wed, 25 Jan 2023 18:17:24 -0500
Received: by mail-wm1-x329.google.com with SMTP id fl24so94048wmb.1
 for <qemu-trivial@nongnu.org>; Wed, 25 Jan 2023 15:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y8BDiINBwSD7It7TkhO32XcJz4B1GuSdShR7bB+F+Ps=;
 b=pCbbWjzs1gTnvcW1PHk6BArNYwJvmWLWnj0xRrHdeiltD1hB9rVeL9eyvR5ywlH9GV
 hsF2jXqA5o8fHGPaqGk+EJXmIDKn5W6wsF2aCdrInTPISF0oJIV8r3vbodP1RxNfcTUo
 01N+89UC+peMf9xKEYGyXHIqhNlW3RWz/695kqvxg0ct5A4dvqkINb0jSEeEqDePCjv1
 5/m16DQSNw6M/1qNjr3ex5ouuQRqzCC+4yMAbLvEXKx8aZBQ5zpEpNALfMAKPDhUnLG7
 5whsDVtMphgiESsG4wla1ahWL9UDTY8QYVlA6j6PZDBYuSlxdYQOWFZG4GspqGG7QGvx
 wPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y8BDiINBwSD7It7TkhO32XcJz4B1GuSdShR7bB+F+Ps=;
 b=v+Es7iXHWsW4doGurfZQ/xq374Y1aIvKJ4ePFwLJfgHIeWskEbWI+/afsfZ4YYvpw1
 NwRdDsXWyYaadsTNiGL/D1Mr5oF+8LxGIAyivkgqooYkd2vRXhuZSaOmbSLKjWO/w/Ww
 0YOHOcIpBz59XqwQCqzPj/xF3FjsT6d/E/qlO+0zkKqqdEnnEaoVWuyJEayjeM3pZpm0
 FIUwPb+FUYy3wdsY1RQLLXkcr4yxtgupUNwJRQx1wY2Zpl8EiLzZw5BHjdFxudvSiWyv
 4y91BSlV/7rA0wnZMBdFeTSr8+QN2559GpoPlqzoH58o2vkgJ9XJyNLnD1qbkGbQdh5z
 KZxQ==
X-Gm-Message-State: AFqh2kpZ/G6WfgdxljJ482g/9oQ6DgSL8TgMP8xcqF3WBYZSb1aCcL1Q
 CwCMZJFaxMPxyBeXZwzeo/+ptw==
X-Google-Smtp-Source: AMrXdXuZAaX5KZzmd5K+MaCU7oCKprcUUe/Fd7WEsJerpJWfFfLs9c0h+rsbZZwLXGBF50i2tuB9Uw==
X-Received: by 2002:a05:600c:19d0:b0:3dc:c05:9db6 with SMTP id
 u16-20020a05600c19d000b003dc0c059db6mr9025513wmq.33.1674688641285; 
 Wed, 25 Jan 2023 15:17:21 -0800 (PST)
Received: from [192.168.0.114] ([196.77.22.181])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a7bcbc6000000b003d237d60318sm2965294wmi.2.2023.01.25.15.17.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 15:17:20 -0800 (PST)
Message-ID: <f1cdb635-f02d-3ce0-1123-199293abef5a@linaro.org>
Date: Thu, 26 Jan 2023 00:17:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 4/4] hw/ppc/e500.c: Attach eSDHC unimplemented region to
 ccsr_addr_space
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
References: <20230125130024.158721-1-shentey@gmail.com>
 <20230125130024.158721-5-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230125130024.158721-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 25 Jan 2023 23:17:24 -0000

On 25/1/23 14:00, Bernhard Beschow wrote:
> Makes the unimplemented region move together with the CCSR address space
> if moved by a bootloader. Moving the CCSR address space isn't
> implemented yet but this patch is a preparation for it.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ppc/e500.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


