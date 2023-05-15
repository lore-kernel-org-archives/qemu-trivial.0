Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pySOD-0004Cq-VC
	for mharc-qemu-trivial@gnu.org; Mon, 15 May 2023 03:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pySO3-0004Bm-Fp
 for qemu-trivial@nongnu.org; Mon, 15 May 2023 03:12:52 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pySO0-0001KH-Uj
 for qemu-trivial@nongnu.org; Mon, 15 May 2023 03:12:51 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3063891d61aso11763317f8f.0
 for <qemu-trivial@nongnu.org>; Mon, 15 May 2023 00:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684134764; x=1686726764;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b/oiEmPQIkeFpASoq4XTupg+lFlgGViG0MiItQ8ZB6M=;
 b=M2y9VdKCVU9ytFgykqm69QkwQsHlim8azhrzBL3DVs6byZmmoniwEm99CVTICws2VO
 vyoOnHsoQo4OeLUawDQ+L6fSX41ULOWhJGJAM85fADipSnZBMUHa6TwRzegNNbBKHnCZ
 TrnR9xJiSj/ObVScsox18zmz0nuzZN19wIvq0lrCZvYnFn4UuRq6lU4QpSbheZEtROBs
 6Q8rBed5FzsLjCf+O3ANNt4IWH5scvmRj+5lu4xQgBIsRL70d3+fnXQU14ZGUIltHMfJ
 FnvljRjAYsAgxiWqva8Jib9V1FQ03/zdkbAzy3yOnhXEUM/xqR5fbgtXFSQGwFuizkqy
 M7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684134764; x=1686726764;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b/oiEmPQIkeFpASoq4XTupg+lFlgGViG0MiItQ8ZB6M=;
 b=OFgdFTzqpNBlJGfBZekZaXfsLCXo+dvCj2Wr6y+aVuJUoYSZSKwWBdt10lMqaJ02D+
 l5j9wgq0AUnVZl6siA4bePiwf4B6YhtrDcI2irJAU7k2g87aZXgLrWtkn9LWD1aWXXJ8
 hiiqSyVuHeYuaL8hlyLNAxKGU3DR53V+xgfO45b+mQRfrYALa7OPxQT8Rwh4b5mbM7P8
 G5F23n6jxwSh8phrkeA3MqvOwFe7vcCTGAZ3HLLrwJjVb5XmXjetwQUeWQgunxgrMZem
 q6PlHgwR9ZcrxEWtOHjyHDIF9+nA9EKKCp6aw/cRiNu5GIsxPjAGJsYxcFpxFxw/fpO6
 rOZA==
X-Gm-Message-State: AC+VfDycKa67sNTK6I0P5nyl9KHPsf9q71b0FHdaa9In3Tq0WieEusa1
 Ukn68+w2lurujbxkS23yU4JQbw==
X-Google-Smtp-Source: ACHHUZ58dXYNYfUfNCzyMf49NKnCR0bKh4Gkj3BJen+AQUS9o39jE7aIn9//CVjaZ87EgSI/phnmvg==
X-Received: by 2002:adf:e4c7:0:b0:2f1:e162:d48 with SMTP id
 v7-20020adfe4c7000000b002f1e1620d48mr21606234wrm.47.1684134764629; 
 Mon, 15 May 2023 00:12:44 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l18-20020a5d4bd2000000b003078bb639bdsm27184552wrt.68.2023.05.15.00.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 00:12:44 -0700 (PDT)
Message-ID: <e7cae245-b496-c8bf-9158-f4d86ba0f8ba@linaro.org>
Date: Mon, 15 May 2023 09:12:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 1/4] hw/timer/i8254_common: Share "iobase" property via
 base class
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20230513100906.46672-1-shentey@gmail.com>
 <20230513100906.46672-2-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230513100906.46672-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.93,
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
X-List-Received-Date: Mon, 15 May 2023 07:12:54 -0000

On 13/5/23 12:09, Bernhard Beschow wrote:
> Both TYPE_KVM_I8254 and TYPE_I8254 have their own but same implementation of
> the "iobase" property. The storage for the property already resides in
> PITCommonState, so also move the property definition there.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/kvm/i8254.c     | 1 -
>   hw/timer/i8254.c        | 6 ------
>   hw/timer/i8254_common.c | 6 ++++++
>   3 files changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


