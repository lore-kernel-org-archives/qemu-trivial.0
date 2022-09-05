Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVBzM-0000VJ-Cx
	for mharc-qemu-trivial@gnu.org; Mon, 05 Sep 2022 09:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVBzK-0000P6-F8; Mon, 05 Sep 2022 09:18:06 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:46747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVBzB-0005a3-M7; Mon, 05 Sep 2022 09:18:04 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-127a3a39131so539078fac.13; 
 Mon, 05 Sep 2022 06:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=t83j+U/1eMk0gktE26i27s5AYMjt+l6rvM96lRQV0JM=;
 b=LMRshvVhIEEruHXQtifjX8t5qJQxFaX+zS7k4gKJIDKAmc1nKOXnteU63DS2fRcbjQ
 L47eWgxMq7IHpbtDcbEklgVMbc975/EHDsA05AauywGh8bSs5acWWY4pMxIGtJe+J46C
 EfVfedY0W8ONZP2/5UF49ArkUpEJuxITV9tWCti6Bau9N33IIfdLYYSU3mJmtAXSDXqj
 Loi4mYJ8rijEmasPtlPKaiGj+gBx/mp0uftqd6Tg//7lobJiewB2g+dJFznhM1+CJmht
 9JsbzgTiDweW3tugCfK2itTtMoYHrR5wKeNVh0b7Kdp1/rKJUn9Lci+/xMk99lSxvHlA
 g2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=t83j+U/1eMk0gktE26i27s5AYMjt+l6rvM96lRQV0JM=;
 b=J9FnJFHtdA5rirDKghALU9HR40U/Tusitd03odIz5ktVWWZzALM4HZuNO4djtMDKO8
 FSdOkErUf0c942fVAQsdLValEuN+90hDQbtd/LcNXm16V5EClx+7PX7gHutTpaWZVBSI
 gVyCExxd9j39Z8WVs99LQ8UDasPAn9pnEdGwSaeUNxCxSUtkMcmGih8foUQptqakPeHa
 H8Z3SB5FQpGmFBJP7qg4ljX5YLbgIOBFy329K/7jo4Mn3w1tCINVFDfURXldedimuzEd
 veLHnp0DY3lgw6hnn05cbpA03cfF8ar3Jqco6zT+rX7/RF2GTROc9VleOJlCpeJMe1p4
 WPbg==
X-Gm-Message-State: ACgBeo0k2p+bC8KzPtqtmgl/4jrvLvwHQsKfBX7nu1NaE3impuWrq5P8
 HpwZ6h7n/qgTg4yj/01dNxM=
X-Google-Smtp-Source: AA6agR5bFYfCAIT6fcDaJ8goBaD2twP3nQrLkEuboRr6i/XPe4o+en2tbpBHhn7/qmOF7MX6aaNVuQ==
X-Received: by 2002:a05:6870:a992:b0:11e:6d35:62d8 with SMTP id
 ep18-20020a056870a99200b0011e6d3562d8mr9142097oab.225.1662383875688; 
 Mon, 05 Sep 2022 06:17:55 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 em39-20020a0568705ba700b0010e20d0b2e3sm4855787oab.44.2022.09.05.06.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 06:17:55 -0700 (PDT)
Message-ID: <d8020d82-4002-8b27-b887-9c4d14dda7d0@gmail.com>
Date: Mon, 5 Sep 2022 10:17:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 01/19] target/ppc: Remove extra space from s128 field in
 ppc_vsr_t
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br, qemu-trivial@nongnu.org
References: <20220901131756.26060-1-victor.colombo@eldorado.org.br>
 <20220901131756.26060-2-victor.colombo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220901131756.26060-2-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 05 Sep 2022 13:18:07 -0000



On 9/1/22 10:17, Víctor Colombo wrote:
> Very trivial rogue space removal. There are two spaces between Int128
> and s128 in ppc_vsr_t struct, where it should be only one.
> 
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Ccing qemu-trivial since this can be picked up by them as well.


Thanks,

Daniel



>   target/ppc/cpu.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index a4c893cfad..985ff86f55 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -246,7 +246,7 @@ typedef union _ppc_vsr_t {
>   #ifdef CONFIG_INT128
>       __uint128_t u128;
>   #endif
> -    Int128  s128;
> +    Int128 s128;
>   } ppc_vsr_t;
>   
>   typedef ppc_vsr_t ppc_avr_t;

