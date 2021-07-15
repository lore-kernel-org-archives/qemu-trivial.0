Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m43hO-000155-Fw
	for mharc-qemu-trivial@gnu.org; Thu, 15 Jul 2021 11:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m43hM-0000zw-RU
 for qemu-trivial@nongnu.org; Thu, 15 Jul 2021 11:54:53 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:42677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m43hL-0004H7-79
 for qemu-trivial@nongnu.org; Thu, 15 Jul 2021 11:54:52 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 i16-20020a17090acf90b02901736d9d2218so4725907pju.1
 for <qemu-trivial@nongnu.org>; Thu, 15 Jul 2021 08:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GGmI+Zw1aXEB8/cRYJbilKahVX3Bw9TFiAFUFDF6nPE=;
 b=z7lOmw/R60eo44u2L1r8jaxOgUWJx/8Fs1M2vFQhtDNiBko0G3eYRSKMWcepxDArrN
 7OlgWBboQL9VJj1nayb3Y3S08YLypjDLZlcJPGjoLh4PMiFHbefPNOXs+CNm/FUfVyj4
 y21oW8IEUwibZDdBkDonpBvaeB/eimziYMynDYv5l24krlh1s73ntyLDWWR7m1B9NRAR
 GdznSSCFAQR+V+/x4zMhz0OWgwqT/cLJM1QoZC1H1TQt2hqR6jBmoYRfOowpM472BCWK
 XoeDnyMrHQwIooWB9JbltKq31Do9JUhDoWD3P9wTVNMd+JWkGHJA5gM8EekaOZV2Vq/9
 44Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GGmI+Zw1aXEB8/cRYJbilKahVX3Bw9TFiAFUFDF6nPE=;
 b=djO5nq/ZfYS9P5SC2dvSY+Py/ZC3XA+BnfQRqDJxTrMKAPZVftEEhUv1OOd7yea/Vv
 7jtoYfKDIc5JVHxjqpZUfbM4GM4WGh/F1mvyOEbKEPXWU58nUlMeidkxlX+nfD0Y6i31
 1+r0BGJlFQznyLDap+ZsIP0/kg8lBorgd8RoL9g1f5Q1Nw1P8EGeY/yQUrfVJrfPkZvF
 3yV1LyYCtjUQqlo5bI1W29x62KgWM8Gs3tZ/0WCj4bsuNgv7fzm8/W5Lc4kfe4NgLW8o
 D2nMINBHqt6uchv44IQnK28EEXh3USEZKuuUpiUiwuXlC4+skompQFYSXZbRBCB8u9Vb
 RZag==
X-Gm-Message-State: AOAM530wHBfffxKkBjCeH4QoRzlqB/kjTvaOHy+rnuvB7FPTchpYYC/g
 qYow8XDO5tRA4eqqdDnc7oqVl92iHixnoA==
X-Google-Smtp-Source: ABdhPJz4J3oTMsJX1T+huz8UrvjOz2rFQgjJwbHpDmMqa8V8eUBHYuEveorCC5YvxkGssQp+qnJ53A==
X-Received: by 2002:a17:90a:8403:: with SMTP id
 j3mr5149893pjn.212.1626364489919; 
 Thu, 15 Jul 2021 08:54:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id n4sm7164799pff.51.2021.07.15.08.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 08:54:49 -0700 (PDT)
Subject: Re: [PATCH] hw/net/vmxnet3: Do not abort if the guest is trying to
 use an invalid TX queue
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>
Cc: qemu-trivial@nongnu.org
References: <20210715103755.1035566-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <07d133e2-6986-cd6f-0fa6-23041b180dde@linaro.org>
Date: Thu, 15 Jul 2021 08:54:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210715103755.1035566-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 15 Jul 2021 15:54:53 -0000

On 7/15/21 3:37 AM, Thomas Huth wrote:
> QEMU should never abort just because the guest is doing something odd.
> Let's simply log the error and ignore the bad transmit queue instead.
> 
> Buglink:https://bugs.launchpad.net/qemu/+bug/1926111
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   hw/net/vmxnet3.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

