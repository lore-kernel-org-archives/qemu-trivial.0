Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6DZM-0006T9-V8
	for mharc-qemu-trivial@gnu.org; Fri, 16 Dec 2022 11:28:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6DZE-0006R9-LB
 for qemu-trivial@nongnu.org; Fri, 16 Dec 2022 11:28:12 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6DZB-00019K-9o
 for qemu-trivial@nongnu.org; Fri, 16 Dec 2022 11:28:11 -0500
Received: by mail-wr1-x432.google.com with SMTP id bx10so3091680wrb.0
 for <qemu-trivial@nongnu.org>; Fri, 16 Dec 2022 08:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QWbN1O525e/FzsyKi0QvHVMg6hB/eQpzdtCxsQajocw=;
 b=yJOVylYRXz+BYMJ6i6tNwST7je5Y0QZXsegx4pQGpJ5pmyA1Qud7oydkaSUR11k0Hm
 0v7P4E7edMmmFDJ1CfJD7HY89i59ccRkW2lpmpwcY/kijyXperxw+MI2W6oWFl1s81zZ
 WOofQcLddc/czieodpEmC2vhHCK+tD1LKR5xFh3emnNLvUH6mP46i8THKNJc8VDMJYeC
 1+fw29SZf5omTnn6NwU01Lp1BL+1RXqpcqd4u/eU5auy9JPkUV+B5ZEC53WfATlEaSPr
 AgNWcc0axO03BVZP9LpI4+7pB4PbZqAQQKRoypU7E4AzV4kBRS4KK8yIjzoN2H0rWylP
 z/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QWbN1O525e/FzsyKi0QvHVMg6hB/eQpzdtCxsQajocw=;
 b=kuaDEFm9xwbEBVcMD0hZr5Qm39CRlRf4GMLswz+EgiPHzmWOZtvBrrobhtqcgqtKeP
 crw3TkKGhaNrDvDJqbpf6C4Q5aVSfMKZhRzGdzBr2ixRAV3TAKsRKfdvL1RLnd0GiAw1
 Y5S9sNcUu6j31RRxe99El1dKwC1/Oei9dkC89Q67Hl0BG7cfCdXuI4X5TTo0THKfxlvn
 HjS3PdmT98JFpPEaChgj3aS1V18ccMBc9RbU96kerHPZCgrIJBuR6nsNNqg87imtdbSC
 th0riMUbL2snIJxl6HBc5Xm2HoX9ACMG5cFzto/dKU+I4oWClLtbIY6HNshgKnamLSnY
 NEcA==
X-Gm-Message-State: ANoB5pmxC2DT41nNvZyE72CLjxsMW3fo3ZWG3mtIqRlBTDNLU+vfw279
 NyU6eAFAsHzRzbVoql3aljyLvA==
X-Google-Smtp-Source: AA0mqf7h8Q92du9DrFipLBBQiwkEruoja1cRpQrcOecqIbC9mIluCHuVu7yqsauOrHgoyeHvAr0B4A==
X-Received: by 2002:adf:f446:0:b0:24c:f111:82ad with SMTP id
 f6-20020adff446000000b0024cf11182admr15429859wrp.54.1671208087255; 
 Fri, 16 Dec 2022 08:28:07 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w12-20020a05600018cc00b002423edd7e50sm2623866wrq.32.2022.12.16.08.28.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 08:28:06 -0800 (PST)
Message-ID: <fa2a12e8-3640-0c86-d812-86e171407046@linaro.org>
Date: Fri, 16 Dec 2022 17:28:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 3/6] hw/ppc/virtex_ml507: Prefer local over global variable
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>, Michael Tokarev
 <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20221216145709.271940-1-shentey@gmail.com>
 <20221216145709.271940-4-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221216145709.271940-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 16 Dec 2022 16:28:18 -0000

On 16/12/22 15:57, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ppc/virtex_ml507.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
> index 13cace229b..f2f81bd425 100644
> --- a/hw/ppc/virtex_ml507.c
> +++ b/hw/ppc/virtex_ml507.c
> @@ -157,7 +157,7 @@ static int xilinx_load_device_tree(MachineState *machine,
>       int r;
>       const char *dtb_filename;
>   
> -    dtb_filename = current_machine->dtb;
> +    dtb_filename = machine->dtb;

https://lore.kernel.org/qemu-devel/20200109152133.23649-1-philmd@redhat.com/

\o/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



