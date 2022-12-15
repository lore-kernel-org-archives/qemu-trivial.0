Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p5npZ-0007yA-Ao
	for mharc-qemu-trivial@gnu.org; Thu, 15 Dec 2022 07:59:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5npK-0007m5-3I
 for qemu-trivial@nongnu.org; Thu, 15 Dec 2022 07:59:07 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5npI-0008FM-Hl
 for qemu-trivial@nongnu.org; Thu, 15 Dec 2022 07:59:05 -0500
Received: by mail-wr1-x42f.google.com with SMTP id u12so2919159wrr.11
 for <qemu-trivial@nongnu.org>; Thu, 15 Dec 2022 04:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pd+WzUnCc/vHhF8+sUjSCch9sSXxilWUxKZQJ8mNWko=;
 b=ahetI8rUU0jeearRSq9Cf5B17q3LlFsAlIEiN8xz0Cysm0PM1BMfTFB9gpVAFcpgY2
 cGmfjmWhZn2MoLzi+IH7qR8iYIS9KM3qFcdUL7ZgBTjYzRWzix7eAv1/tDLWLAuDFUJk
 M+Y4W7HAS33PvRkQFyNQZjMhZ3IWScpzBFmUf8SHjzFExGVGYpllnK+rYKhSL7P2OmJQ
 XN1ThjhDZjl83/B7Erb2nA2OzQdFkdLbH8eLHIAmawtydhuVUmlLs7G5NL4PJfQRqJPn
 oUVraUVqBNSwMlhqUeWhE1kWOthKGubHtoEaGwdVfgFKDmWuK3R/mNFDG+yR2050u1XO
 mgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pd+WzUnCc/vHhF8+sUjSCch9sSXxilWUxKZQJ8mNWko=;
 b=CUMWODEU/BoZRQCq1tJSC3vcp26BZu5vsa8JKD2dqWDdySnFhxHU50Da0n9yqhHfn0
 tCoQOEq8RrQGJMOfxGVFhyQyw2X7g3NLEMYxhY2vxtLenWPbl3brnVNQ42s2Ef70OOP+
 SRnB00Ay8ZAwhKyM0KckykylwrETiwkqFOjH/9JmlSvmMw5lAIzdPyzxToHr6lO+6EDo
 DTqv8VidkXcJ7MYQ4uHfIJqz8rNVTG9AzAj54yDhKl088RibNAUnseRsAZ7hBlVO/ing
 2/OKr+CL/m0bF5TgHVitjCQkLAJj4t+oKSro02mF7Fcarvj7SptywGYeSfGY0oFziQAs
 uh2Q==
X-Gm-Message-State: ANoB5pmESGhA+yRV+9Q/MQ5byGoDyjGxl8n8VRvpPPJmxM9918UDvvRy
 wAltmqWxhuBgOhdXERWKdG1akw==
X-Google-Smtp-Source: AA0mqf7NE++WZsl6mdQKb9zoxC0dCeim79pm9DnY7GJBbSMfQbHGWQoi493fWb85cghdXpRTZi7G9Q==
X-Received: by 2002:a5d:51cd:0:b0:242:17d3:a9f9 with SMTP id
 n13-20020a5d51cd000000b0024217d3a9f9mr17346084wrv.68.1671109142967; 
 Thu, 15 Dec 2022 04:59:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b8-20020a05600003c800b0024258722a7fsm6062964wrg.37.2022.12.15.04.59.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 04:59:02 -0800 (PST)
Message-ID: <1c926e93-2118-b8c7-a40b-51ca537dfb6c@linaro.org>
Date: Thu, 15 Dec 2022 13:59:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH Trivial] hw/cxl/cxl-cdat.c: spelling: missmatch
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20221215123749.1026775-1-mjt@msgid.tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221215123749.1026775-1-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 15 Dec 2022 12:59:07 -0000

On 15/12/22 13:37, Michael Tokarev wrote:
> Introduced by: aba578bdace5303a441f8a37aad781b5cb06f38c
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   hw/cxl/cxl-cdat.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



