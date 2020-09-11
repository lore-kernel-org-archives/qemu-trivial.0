Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGsBw-0004rW-UB
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2020 19:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGsBv-0004rG-Dd
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 19:10:51 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:37885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGsBt-0003Nu-Qq
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 19:10:51 -0400
Received: by mail-pg1-x544.google.com with SMTP id 5so7598259pgl.4
 for <qemu-trivial@nongnu.org>; Fri, 11 Sep 2020 16:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0ydLp4meF9o2JhNP0kAqRQyliGYUsh+mHHbI+dJCN9c=;
 b=obMOWbMSHReO+/dB/VDTGnk30//PcBR/wxLA1s/kVcxod20bHi05ng0wZBJvLapdo6
 3sy17/pAzVyKxvMw/QnSlgyjcB2WlzHpU0Jmn7KIHCIB/Kze3AvbF35GVZ8D3s8GrQDe
 LU8576YtjJU7vEiDjVqDjPwOZACYwWv+iD+Zu1CAmHAiHZt46iyV+Iu0fpSLzoIHZf7v
 oSFpZ5O6xehzfVBB3BwPQhJhxfpml+658YcBC2PsjIk+YY/8NnjH11oqdCJIHeIohayE
 p9NnHPHAFZpgT05FRMIVzvzP/0xJoFb2/Cs9EpxrAgdq/dNXjODaBT46U+ox5HWjybi5
 qm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0ydLp4meF9o2JhNP0kAqRQyliGYUsh+mHHbI+dJCN9c=;
 b=d33AluRBVvLUdTWtBToRJh4hChhTCNU6e1Y8JHLEVeAQHkrD4JUPsEDYa3EQ+yhzta
 RHWAD4rgBirWRx9vzm6vA2LmpiiNrqWq9pHwjBflhO5JiM6ea0S9yz7weRkog0j2hRMJ
 DKC4KC9FEeEje3m0jdm+dAQzciCrw3gwBHQO2JHJErEZqVu3pD0oNG7ygh7LosyBHUXc
 cXwf3TsWb3tYhrdSxcHMbN2mCi3EWrAkl5ZmTqrDNgnySyEEnV3tGQko6dV6VbUCJQVX
 mZJzaBJscdHTYVraKDRsHvEZtrnMosL/DmaYao0snFJnPDpx6rDxgPWMO9a6ueuIcDQ/
 Gh9A==
X-Gm-Message-State: AOAM533dgTDqfDMBE3K/GSxuqZDrB7PlBP6aDOOztEcHbjzRNeXK09D1
 teTQKHfJvSGNDW7cWqI4LNhahA==
X-Google-Smtp-Source: ABdhPJxQ9IzbgepDdIJubmYjyBHqaZs6gTt5tBtnnJuGUBEiPbLl61dGxqSWkVqDH5Pbl/OPfXlsDQ==
X-Received: by 2002:a63:c66:: with SMTP id 38mr3144108pgm.379.1599865847637;
 Fri, 11 Sep 2020 16:10:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id m13sm2751775pjl.45.2020.09.11.16.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 16:10:46 -0700 (PDT)
Subject: Re: [PATCH 5/7] hw/char/serial: Make 'wakeup' property boolean
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20200907015535.827885-1-f4bug@amsat.org>
 <20200907015535.827885-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3287e2ce-966f-50f0-cb66-e166ca37046b@linaro.org>
Date: Fri, 11 Sep 2020 16:10:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200907015535.827885-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.469,
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
X-List-Received-Date: Fri, 11 Sep 2020 23:10:51 -0000

On 9/6/20 6:55 PM, Philippe Mathieu-Daudé wrote:
> Make the "wakeup" property introduced in commit 9826fd597df
> ("suspend: make serial ports wakeup the guest") a boolean.
> 
> As we want to reuse the generic serial properties in the
> ISA model (next commit), expose this property.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/char/serial.h | 2 +-
>  hw/char/serial-isa.c     | 2 +-
>  hw/char/serial.c         | 1 +
>  3 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


