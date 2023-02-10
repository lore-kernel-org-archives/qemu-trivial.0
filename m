Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQSmN-0006VC-W7
	for mharc-qemu-trivial@gnu.org; Fri, 10 Feb 2023 07:45:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQSmM-0006Uu-Nz
 for qemu-trivial@nongnu.org; Fri, 10 Feb 2023 07:45:26 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQSmL-0005BE-7L
 for qemu-trivial@nongnu.org; Fri, 10 Feb 2023 07:45:26 -0500
Received: by mail-wr1-x430.google.com with SMTP id j25so4963587wrc.4
 for <qemu-trivial@nongnu.org>; Fri, 10 Feb 2023 04:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0fSnH1e4vyd2u4Kryqx30mRURqd4lKi6QXrHiBpdw1s=;
 b=J8JlCuZYTh+hV/zbDLNGUIYLAst+EWpykoyqRcl//txtLxFtff1UQT6kNpk7M4gtGI
 d7C+i7G5upIkEBXdntNuvl7ltMNpbvhDbgIPLE/djkf/tvuFB4yxRC7tSpmcOUYOwiD7
 l743THN21Qjq/rh8iCbhbdKemhMfEyX33TSObtU1D5+e1FxkvyPeZRiI57HN2qVsDJoO
 BpXp4HKY1cTjqptm6GRP+nAhfvmVj1ys37HCreoVGeFAuVpfImDRM33LOZWlW7cCwOMQ
 7ouuZgCJWE1CYbLx24iIUv7cHxdqJAOLflHOCNaNIEFORLuVM4efgbuBk+aIZ0WPM2IY
 E0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0fSnH1e4vyd2u4Kryqx30mRURqd4lKi6QXrHiBpdw1s=;
 b=km3n6PZ+EW3r1N/Rex3utvwsYAu1kbLGrq/BUBUyoEmoYw/MSKT0x0vtopyZ5pR23a
 4jb9xDPOXrZVQrq4eO9I/QPvsZOoPoAGWvLTBWZVllfH5BZpVhQWpkUqYRCCYGqyUrPx
 YIN5OzgU4gEIfWkVNKua6UArSQ0F2qs9grBQeL/7zFQCMS7Q9F/9rQ/+QIV6zaQJ8Zkb
 0UCKXvXJLdNbP5wAkEHW3XJgQTmOZTefBF3ZSC/yKWlHfsEo91h5u8YQ2pAJ/gPQ/ynC
 4g1/0LpzeLHxSuX+FgLzepZ7aRQ18gz6x95p58QsqbntiFN3JH5n1StfhXiTNdrR+/I0
 1CeA==
X-Gm-Message-State: AO0yUKVakcRZahgce+DAxpW+CSxtFskj0g/kDgqakZeRvtHDDlB2oTR4
 99QUI/S9SA8XHUY330Op7zNGtw==
X-Google-Smtp-Source: AK7set/J6FxMFQ1jau/ankFu1DXRadpO2AsUdYuE5mtyAsMo2HwU9ylbZZGoEyZskPFQj1rz4ew0sQ==
X-Received: by 2002:adf:f145:0:b0:2c3:ee0d:563 with SMTP id
 y5-20020adff145000000b002c3ee0d0563mr16133249wro.28.1676033122576; 
 Fri, 10 Feb 2023 04:45:22 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v18-20020a5d4a52000000b002c3f210e8c0sm3682578wrs.19.2023.02.10.04.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 04:45:22 -0800 (PST)
Message-ID: <09b35ac7-367c-d039-b544-70b5cb1ab795@linaro.org>
Date: Fri, 10 Feb 2023 13:45:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] include/hw: Do not include hw.h from headers
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>
References: <20230210112835.1117966-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230210112835.1117966-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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
X-List-Received-Date: Fri, 10 Feb 2023 12:45:26 -0000

On 10/2/23 12:28, Thomas Huth wrote:
> This include is not needed here, so drop that line.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   include/hw/ssi/ibex_spi_host.h          | 1 -
>   include/hw/tricore/tricore_testdevice.h | 1 -
>   2 files changed, 2 deletions(-)

Possibly more?

$ git grep hw/hw.h $(git grep -L -w hw_error)
hw/pci-host/mv64361.c:14:#include "hw/hw.h"
hw/ppc/pegasos2.c:13:#include "hw/hw.h"
hw/sensor/dps310.c:12:#include "hw/hw.h"
include/hw/ssi/ibex_spi_host.h:31:#include "hw/hw.h"
include/hw/tricore/tricore_testdevice.h:22:#include "hw/hw.h"

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


