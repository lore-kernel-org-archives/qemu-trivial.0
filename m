Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6Dbf-0007U0-Us
	for mharc-qemu-trivial@gnu.org; Fri, 16 Dec 2022 11:30:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Dbe-0007Sq-I1
 for qemu-trivial@nongnu.org; Fri, 16 Dec 2022 11:30:42 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Dbb-0002VT-Vl
 for qemu-trivial@nongnu.org; Fri, 16 Dec 2022 11:30:42 -0500
Received: by mail-wr1-x436.google.com with SMTP id a17so1875890wrt.11
 for <qemu-trivial@nongnu.org>; Fri, 16 Dec 2022 08:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7L0Z4MbvB1dXFTJ/PXFbC1ByY9mQtKaYj/qD6g3pag0=;
 b=RqBQqhvN3IZiInz/NnGgczMAunxywtqx1WFuLWFIonn9GSNCp3D5e2Ar0yuG8VSS6C
 M90Iiz/l2hygVzepqo7TsXKWZCX3GBqWwxdvYqZFvTaJk3pgJU9g7OQoFzEdy+xVHlQ6
 fVQzHP73agvlebFaD8+X5jV0fOddBeLU/bxGMOLgtClc/qpv0ldJd7zHnXh/MIQRRJbj
 JfQtJWhphQMYdib4toy+jv2ArZnsxQC+faI8b7bThTf9v5TuMtAHZ4VnOMrHsa0IZ+hC
 zovzzeq85k5qYYEgXLrfEtSD1BGvERMWFy50bxe9wxLOFRen6IQReWxSKfaP6ZDntgBb
 Q6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7L0Z4MbvB1dXFTJ/PXFbC1ByY9mQtKaYj/qD6g3pag0=;
 b=KBztdp+P/QQe2Y9pTbk5Cy4xo6TiEPeSf5OobnvixSjmO+jQlCTnL34SRtL5oCn/a9
 na1jmy2Sf+gTD0Gn92x9I8OwEvvHwmLWTIDvTIRL3YNMlOA1Ywe07llIpJ94bISW99WO
 GdtEJHfE7lEzerCKqoja2QSkxVGLm1BR1rU33Yl+kPXnwPSA+VlrEg74+/Xke6K/8XnG
 nQRy+zDIldgzKjWVEyxHdemNaydrNFIsZM05vfsL9ex6YrB/QhoAxlxPiWGTiUwj7gOI
 HOh7nvfbHqMHpls3V23NYoaVSSODvcjCpI3NTr+/Jb34eaIrsuu5cGPNQzk6Nu2o5Rtj
 n3UQ==
X-Gm-Message-State: ANoB5pkxt7MAros7CYmDI/5+tzL+0j6IaIpdPyUvBGxyWwaZSNmewnbU
 BcbLetU/3tgWIOR8RNEW0EUfUg==
X-Google-Smtp-Source: AA0mqf4GG5XPI4QpF0KCiJT/kSzhjBfIe6av6m6pLhs6dJ8NLLP9StcE8IQyUPKRtOrLC+2J+BdclA==
X-Received: by 2002:a05:6000:182:b0:242:4d70:7882 with SMTP id
 p2-20020a056000018200b002424d707882mr20002145wrx.15.1671208238119; 
 Fri, 16 Dec 2022 08:30:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y9-20020a5d6149000000b0023662d97130sm2685057wrt.20.2022.12.16.08.30.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 08:30:37 -0800 (PST)
Message-ID: <5c3c7f39-1e73-efdb-25c9-117cda9013c9@linaro.org>
Date: Fri, 16 Dec 2022 17:30:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 4/6] hw/ppc/e500: Prefer local variable over
 qdev_get_machine()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>, Michael Tokarev
 <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20221216145709.271940-1-shentey@gmail.com>
 <20221216145709.271940-5-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221216145709.271940-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
X-List-Received-Date: Fri, 16 Dec 2022 16:30:42 -0000

On 16/12/22 15:57, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ppc/e500.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 2fe496677c..ad83924004 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -959,7 +959,7 @@ void ppce500_init(MachineState *machine)
>       memory_region_add_subregion(address_space_mem, 0, machine->ram);

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



