Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jfgbL-00076M-9B
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2020 05:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1jfgbK-00076A-Me
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 05:19:22 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:34305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1jfgbJ-0004fK-Mc
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 05:19:22 -0400
Received: by mail-wm1-x343.google.com with SMTP id u26so11615483wmn.1
 for <qemu-trivial@nongnu.org>; Mon, 01 Jun 2020 02:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5A3StrLl1dugDkCzgdqXK3MO8PHx1QxhbwM4zOMgvP8=;
 b=wAMdrB+NqsWe0uA5j7m4jfKSMcbBH/8n2YXpsci84G54wBefuh8AqKn7s3XK5vkuS3
 SKA2dY6X9RQ07jKAiqkeuLiMrmKlMfwZSla/PS8e4K4bm05NwpnROjib4JZ2dFcV+7is
 unwqkoW/WDgW/QDij63eNvDEI/sIm8RRzkbIwrc44RIqMnKNjwow24ouKXWv9uN5z1ub
 Zl25IxjGBjzOBpGCXV6wn9qAwTk8t1ek5esvSLDidrCH2wp91I+/+kwCOzJ0awv/K/5U
 NZs5b7avXpzW97RE+EmF/1Cz3U7boVuJ8vNjysyJDdTINmsi77CcQeDcCT/aYaDNjntN
 iTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5A3StrLl1dugDkCzgdqXK3MO8PHx1QxhbwM4zOMgvP8=;
 b=brIaa+04oZ3TGU3krG9kvuxSoQLsXoqPIr7sJUqU6HU8Xr6ChyWvxkUhNCHRY5ZYwb
 5b471NWWuLgz3Zikhlzbhf0xe6TIfLd7UwxhArJboEbgYt6f8QERP+yY+2psZV8NwVUz
 XI25CD2OoVnizX8W80O6P1R5xJyo65Ex8gpqOILyN6M6hz9THajGjMsVPaitL+4oyixE
 RiUaK0L/XfXu9P4rb68KW2L8QoqGWfr8shIrg7pL4oB38+DbIy/hTTheTEJBSbXNg/wO
 6n444MZkOoUZvhRFx4P3vC7ew8a7zeqdsaGKmeNljwrRdMNL5iPtMLAnvIQgJ94ZyFfg
 AP7A==
X-Gm-Message-State: AOAM531o1K2oGMuttA5IwAx1ufDg184xDwoEggqdmtQY4v99Y/C6RC5V
 Y2oIzgWaGgQHdzVKNiV6WU5bNYdoYoZYCQ==
X-Google-Smtp-Source: ABdhPJyPUfn+RpmKJFi7Z3XWoUqHB0Vm9Vrzmo5fZAhqns6JFrL5NySbLFfOn0eF4ALNbQuoVGFWUA==
X-Received: by 2002:a1c:c1:: with SMTP id 184mr15063270wma.74.1591003159449;
 Mon, 01 Jun 2020 02:19:19 -0700 (PDT)
Received: from linux.home ([2a01:cb19:867e:2100:7eef:23e0:9210:3e8])
 by smtp.gmail.com with ESMTPSA id v2sm20084173wrn.21.2020.06.01.02.19.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 02:19:18 -0700 (PDT)
Subject: Re: [PATCH] semihosting: remove the pthread include which seems unused
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 alex.bennee@linaro.org
Cc: frederic.konrad@adacore.com, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <1589806958-23511-1-git-send-email-frederic.konrad@adacore.com>
 <5ab6f370-6725-1cdb-1b82-24a58cb7642e@redhat.com>
From: Fred Konrad <konrad@adacore.com>
Message-ID: <dfd77414-83e8-755f-1386-13188b968aef@adacore.com>
Date: Mon, 1 Jun 2020 11:19:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <5ab6f370-6725-1cdb-1b82-24a58cb7642e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=konrad@adacore.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Jun 2020 09:19:22 -0000



Le 5/18/20 à 3:50 PM, Philippe Mathieu-Daudé a écrit :
> On 5/18/20 3:02 PM, konrad@adacore.com wrote:
>> From: KONRAD Frederic <frederic.konrad@adacore.com>
>>
>> This have been introduced by:
>>    8de702cb677c8381fb702cae252d6b69aa4c653b
>>
>> It doesn't seem to be used so remove it.
>>
>> Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>
>> ---
>>   hw/semihosting/console.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/hw/semihosting/console.c b/hw/semihosting/console.c
>> index 6346bd7..22e7827 100644
>> --- a/hw/semihosting/console.c
>> +++ b/hw/semihosting/console.c
>> @@ -23,7 +23,6 @@
>>   #include "exec/exec-all.h"
>>   #include "qemu/log.h"
>>   #include "chardev/char.h"
>> -#include <pthread.h>
>>   #include "chardev/char-fe.h"
>>   #include "sysemu/sysemu.h"
>>   #include "qemu/main-loop.h"
>>
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

Thanks for the review, Philippe.  Can this go through qemu-trivial?

Regards,
Fred

