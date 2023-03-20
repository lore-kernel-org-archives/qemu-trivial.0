Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1peHwK-0000He-Sh
	for mharc-qemu-trivial@gnu.org; Mon, 20 Mar 2023 12:00:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peHwD-0000EX-2J
 for qemu-trivial@nongnu.org; Mon, 20 Mar 2023 12:00:45 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peHw9-0008Jo-UN
 for qemu-trivial@nongnu.org; Mon, 20 Mar 2023 12:00:44 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m2so10858888wrh.6
 for <qemu-trivial@nongnu.org>; Mon, 20 Mar 2023 09:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679328036;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5thuQEM6F+28ApesuOqQjVYijU3KtFdlWazOrYWSE54=;
 b=hhJc1w2CnZ4C/ilzTVp//k1fbNBVf7jLYCaftGiJgfDk4dhfHuDtALdr3/XW2rbdaU
 kufZkgmfWpIIZoEDm7SWufF/KXXZWMk7vwcQphFkTioq5JWdZuhLknxGEmlgpQQBsUGe
 paCnmzOnKunQPnR3XklDZGrGexu0QXkBLkPPTqUehSo8KPHwrH5lmeBbqL445t46VETe
 hi0tUePHaLNqamVCX54Kf4hJtlOLX/3rxE3Tl98zx3VMt63Do54fARzl2YHQFz99dDj3
 d5SlRtewqIbGMbtKhw1x7cnV9zqXmsdgqkq2PL+Dz7wTC0EWN9YUP74SEy7hHatjjgZl
 vP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679328036;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5thuQEM6F+28ApesuOqQjVYijU3KtFdlWazOrYWSE54=;
 b=WqzjGdnXJ/YbRJyh1U2y6aEuNtDEG5fVkv9PyLOAA4NEAqPpAtkM1GTHB0uRLwJTr4
 UdccJywtNR00oUZGkIzpBP3TKDa38kUjoBRbVBNqQJ/t/kR1BGrHZamCS4OUMWhtNYOg
 qV7nPeVncogeBWcJUtqArqDwjNJrX5EIyPYsL/lfO52zHLR9LR0HYN3Vu1ueCl2kVTob
 ddncbP453UMtE6kpHKO8ttKr8Qw0js/IuHhQAWuxBasHso5N96xRofSBrDe0YsHO75fD
 sqLNDseu9RzPuQsSiIbNdXg70XlZ710UQDah99QSuXll5cDaggE3+xvqn8iM+fOfE9Mw
 idvw==
X-Gm-Message-State: AO0yUKVR9jeKnD9Hc8mvyU5rDRpjmIW8K9bfpesZi9AVC0PlDqJPNuJb
 whPaiava8NAz+S+NRGlULxQ45Q==
X-Google-Smtp-Source: AK7set9Y9cKdQ+HXxIVg5zOAvBEoPBR+zlRDnt9X0F3mY+LJ/aKTc9+VmMG7Qzi1S8KkzsQMOs/vLQ==
X-Received: by 2002:adf:ff85:0:b0:2ce:ae4c:c424 with SMTP id
 j5-20020adfff85000000b002ceae4cc424mr14275702wrr.4.1679328036010; 
 Mon, 20 Mar 2023 09:00:36 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z8-20020adfec88000000b002c5691f13eesm9189732wrn.50.2023.03.20.09.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 09:00:35 -0700 (PDT)
Message-ID: <f012b07b-493a-1d13-6d5a-3ace5ba1f6bc@linaro.org>
Date: Mon, 20 Mar 2023 17:00:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH-for-8.1] block/dmg: Declare a type definition for DMG
 uncompress function
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Evan Nemerson <evan@nemerson.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-trivial@nongnu.org, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>
References: <20230320152610.32052-1-philmd@linaro.org>
 <19ac8d20-5626-b014-aa77-607c757aee46@linaro.org>
In-Reply-To: <19ac8d20-5626-b014-aa77-607c757aee46@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
X-List-Received-Date: Mon, 20 Mar 2023 16:00:51 -0000

On 20/3/23 16:56, Philippe Mathieu-Daudé wrote:
> On 20/3/23 16:26, Philippe Mathieu-Daudé wrote:
>> Introduce the BdrvDmgUncompressFunc type defintion. To emphasis
>> dmg_uncompress_bz2 and dmg_uncompress_lzfse are pointer to functions,
>> declare them using this new typedef.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   block/dmg.h | 8 ++++----
>>   block/dmg.c | 7 ++-----
>>   2 files changed, 6 insertions(+), 9 deletions(-)
> 
> 
>> diff --git a/block/dmg.c b/block/dmg.c
>> index e10b9a2ba5..2769900359 100644
>> --- a/block/dmg.c
>> +++ b/block/dmg.c
>> @@ -31,11 +31,8 @@
>>   #include "qemu/memalign.h"
>>   #include "dmg.h"
>> -int (*dmg_uncompress_bz2)(char *next_in, unsigned int avail_in,
>> -                          char *next_out, unsigned int avail_out);
>> -
>> -int (*dmg_uncompress_lzfse)(char *next_in, unsigned int avail_in,
>> -                            char *next_out, unsigned int avail_out);
>> +BdrvDmgUncompressFunc *dmg_uncompress_bz2;
>> +BdrvDmgUncompressFunc *dmg_uncompress_lzfse;
> 
> Unrelated, but since DMG maintainers are Cc'ed, upstream lzfse warning:
> 
> In file included from ../../block/dmg-lzfse.c:26:
> /opt/homebrew/Cellar/lzfse/1.0/include/lzfse.h:56:43: warning: this 
> function declaration is not a prototype [-Wstrict-prototypes]
> LZFSE_API size_t lzfse_encode_scratch_size();
>                                            ^
>                                             void

Reported in 2016:
https://github.com/lzfse/lzfse/issues/3#issuecomment-226574719

> Unfortunately last upstream activity was 6 years ago...
> https://github.com/lzfse/lzfse/pulls


