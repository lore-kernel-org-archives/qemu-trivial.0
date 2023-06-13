Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q8zIt-0005Bx-Il
	for mharc-qemu-trivial@gnu.org; Tue, 13 Jun 2023 04:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8zIo-0005BE-Ir
 for qemu-trivial@nongnu.org; Tue, 13 Jun 2023 04:22:58 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8zIm-0000NV-Tx
 for qemu-trivial@nongnu.org; Tue, 13 Jun 2023 04:22:58 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9786fc23505so768423066b.2
 for <qemu-trivial@nongnu.org>; Tue, 13 Jun 2023 01:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686644574; x=1689236574;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7BW7xFLMLLmJrE+t3oSXmltAKMBD+9lAfZCZ8Bj9m08=;
 b=DxVLDRc+azjKu8vRFQudTwsierb9J/QBHJjoyWn0308Hpfzt0cThR1xIdHFbF6AY+I
 EXHcqwBDMePK89VSr94t/zilcJQsnlJf/qskq9Cp4z5gw1PB7xpYuNvOC1R/aizR7qBN
 x5YuIT8ZTn9MVkjo1RWPyyOJ7SviAgoEPYrkGOC/tbG6bGkF8bckcv83cTElH59LH2zq
 KbciP75L0W8EOtGEJnE2LIfO4zgyXTofky8FSGOAtWtADywiPGEeSWmEavUaH/raycv3
 HybtCuxlS5MeZ8DHmLwMk4How8O5FCSFlb3F/80OaPxNeEkPceysYs0s12p+me3zHKAj
 FPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686644574; x=1689236574;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7BW7xFLMLLmJrE+t3oSXmltAKMBD+9lAfZCZ8Bj9m08=;
 b=Uy6ICKMgeQZrfMndp/jk8iIOrU2svLsDvQ9655lvfUnSCYHEKjWT7ipDmMfJIVwpjj
 gsj4/Rc7NORgOyngep4cLh1IBrunp46mkP38Ql3dvbk8VyZwCsYqnxZuXeNX+nNw/tdF
 o3NgvMXVFzV6ayDNMpdWClDspbcBOWk6DxhDLchEJweCHhO++ge7ZIg1KAweYQSdX/nJ
 rYjHyvUVmF30TBlWXWoe2fO/ri3H56LJSUQ2HwVAzQEsxta0H+cuRh02Dc9BLyhidi2F
 iModqDgGct73yh2WQ/1mbhg8vAAuolDajwzw5u9xnEyyZQA/ksb/f0suA4L3w0L9Ip3W
 s91A==
X-Gm-Message-State: AC+VfDw0RcnvHxjgRo28xfCkGFwzbfKRqtpzWMM7BwfjsqOW7ZORScUt
 moThkbPldIzuOLpvbIcFh71NFQ==
X-Google-Smtp-Source: ACHHUZ4afG/BujjBldqEZ2J34xUCPJIk4ETWHGQjihylBpbtDTjjcFBFluYKRl0WVeaAWnUME+iuCg==
X-Received: by 2002:a17:907:9281:b0:962:46d7:c8fc with SMTP id
 bw1-20020a170907928100b0096246d7c8fcmr11461411ejc.21.1686644574370; 
 Tue, 13 Jun 2023 01:22:54 -0700 (PDT)
Received: from [10.10.0.115] ([185.140.244.249])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a170906358700b00969cbd5718asm6223234ejb.48.2023.06.13.01.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 01:22:53 -0700 (PDT)
Message-ID: <960a7253-8c14-a349-0a1c-d7b1f0a7405e@linaro.org>
Date: Tue, 13 Jun 2023 10:22:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v2 0/2] Export struct ISAParallelState
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-trivial@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20230612081238.1742-1-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230612081238.1742-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.096,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 13 Jun 2023 08:22:59 -0000

On 12/6/23 10:12, Bernhard Beschow wrote:
> This series incorporates rebased versions of the ISAParallelState patches of
> [1] as requested by Mark.

> Bernhard Beschow (2):
>    hw/char/parallel: Export struct ParallelState
>    hw/char/parallel-isa: Export struct ISAParallelState

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


