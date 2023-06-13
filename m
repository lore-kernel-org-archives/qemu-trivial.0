Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q90Xy-0006A4-Ec
	for mharc-qemu-trivial@gnu.org; Tue, 13 Jun 2023 05:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q90Xx-00068p-0e
 for qemu-trivial@nongnu.org; Tue, 13 Jun 2023 05:42:41 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q90Xu-0006GT-Di
 for qemu-trivial@nongnu.org; Tue, 13 Jun 2023 05:42:40 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-977d0ee1736so758317166b.0
 for <qemu-trivial@nongnu.org>; Tue, 13 Jun 2023 02:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686649356; x=1689241356;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QZrSbjS8RmVzW2fTCaSxM9/4oBvnEQ3KsZdf4odoGvk=;
 b=dkREofThKfbGzZpQBLg0/WixVDcJkno8ZYlCvkpnFFzYzfw7NUlxdmnkv5UmqblNCW
 2g+co8E+Xkk+mTx56DYPOr9HS80BQkiu30UITnpsWPg5pFThU74t+qDkBVkQG97J++1w
 d0/7lp0QgJnlob9LqzyUhjS3XJzFv4FobHvF/X9zQ5NiHdAH+tgwjwdAlvgOLpwCfzrz
 S8JCP/dYvCPKrTlB/P1CgW6W+wtU479Rf3Gux0ZVh/iWqnd1GX3XTaqPmY208uBkOt83
 EqDJ/La7CraVaKsZkdYehsK0iWIgM29GAgQ8mwY5SNEpQbEPRzFOGqW/c/pXn3A7XJQe
 ToFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686649356; x=1689241356;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QZrSbjS8RmVzW2fTCaSxM9/4oBvnEQ3KsZdf4odoGvk=;
 b=ZYsgLALrhewNA/oN85/T0gQfnwab4eWr6r9m8rZmlv7hi8ZfJaBXEc7m5Xv/Zhvrwv
 zXJI1nU5vf/Cvfvgs5HImhM4ZEX85Qxx1wrkDT3gQORsZYHt3CO+RDLqHtO/VE+vgYCM
 UD+vLg0rtOusDyZdy9cp+7N6CstIDbnOPG1PJUfTFvEYWgi1BZpFxIiUVyEzlj2vUTny
 snVY0MN8OawZlW8mcw+PBKjqndKSCQQqwsx53ZRFP21XMIxY1ImH6CzMTUwMIb1gucAr
 FIVVsSQqS3q2fwD5HTgfAc3DgoxovcazCxgjr4MQEgmV17Q2MKy7YFYNtqSbZbeb8MrE
 ifVQ==
X-Gm-Message-State: AC+VfDyhA9CLfGQNPT9FoNOvVOXUgPJ3TpnoP63F8UqStVaTc+GnP2/W
 sNeYp9TNwiDqhRHJSPbabgyC1g==
X-Google-Smtp-Source: ACHHUZ6ey5zZ3bmJ3LCqAmwiVtJ2aS52pmca3U7sKwaqzB7lPHKlGzdGenPx51HJrYBinMK5+VW0Xg==
X-Received: by 2002:a17:906:7947:b0:969:e95e:e4f3 with SMTP id
 l7-20020a170906794700b00969e95ee4f3mr12231431ejo.55.1686649356004; 
 Tue, 13 Jun 2023 02:42:36 -0700 (PDT)
Received: from [10.10.0.115] ([185.140.244.249])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a170906129300b0097381fe7aaasm6373690ejb.180.2023.06.13.02.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 02:42:35 -0700 (PDT)
Message-ID: <8a247db0-9072-cd80-fcea-4d89a1a4a6de@linaro.org>
Date: Tue, 13 Jun 2023 11:42:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: Fwd: QEMU AVR Patch - Correct handling of AVR interrupts
Content-Language: en-US
To: Adecy <ld.adecy@gmail.com>
Cc: qemu-devel@nongnu.org, mrolnik@gmail.com, qemu-trivial@nongnu.org
References: <CAB295yB5cFSZpGE74EW5hDMSNGnZfw06UC5ydepUL0sdT96WGg@mail.gmail.com>
 <CAB295yAzhzPpKC7KtpKk6t6x4Dn7Bpam=Nwfx8z0wAkZRP-JSg@mail.gmail.com>
 <268c1ca3-409f-bc43-0e88-c32f1eae71f9@linaro.org>
 <CAB295yBBgRcUdBsP+DDiZU_WZAihdn8LQE_BAyHC=QRonHS8Sw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAB295yBBgRcUdBsP+DDiZU_WZAihdn8LQE_BAyHC=QRonHS8Sw@mail.gmail.com>
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
X-List-Received-Date: Tue, 13 Jun 2023 09:42:41 -0000

On 12/6/23 19:08, Adecy wrote:
> Hello Phil,
> 
> I believe I have resolved the problem.
> 
> However, I didn't managed to make git send-email work yet. So please 
> find the patch attached.

Maybe sourcehut will be easier, its setup is well documented, see:
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#if-you-cannot-send-patch-emails


