Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rL59M-0005bl-Bc
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jan 2024 12:35:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rL59K-0005VY-Rj
 for qemu-trivial@nongnu.org; Wed, 03 Jan 2024 12:35:26 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rL59F-0003DD-JF
 for qemu-trivial@nongnu.org; Wed, 03 Jan 2024 12:35:26 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-336746a545fso445127f8f.0
 for <qemu-trivial@nongnu.org>; Wed, 03 Jan 2024 09:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704303319; x=1704908119; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KD8fHoYY9U39+j5t+ooqKoaHFyC3927TgphRWKKkdTI=;
 b=inFojhz3ZNH41mWAHV4CbUO3LZ9c5Z+UjWLfdi/39ty0uXFTk1A/t70oYYrXq35C3j
 0QlhME7KVvvXwefjo4OFZue6Sgjom4dSevoY5C19ijXDfbgXH1UXp79Quf8GhpUpxIpZ
 NRDu5cqIKHCc9PSXUU6WuT6O1vGt/H1xBX8nlPNlZHK7fNW7TOv+uL2oPJ8U3nIayZKA
 pB1TzD0rIofXpbK+pN2oh6OPG+U1jj/OBxsaPWd9xHbH7OXhNVxoBKJah8DST7G5mNui
 jKrQZZOUymYZyaVvoNkXTI5vxi2bmtV3HU1xO1SHirc7jGTQmJFp0zKz8Vtg465nMoQv
 +inA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303319; x=1704908119;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KD8fHoYY9U39+j5t+ooqKoaHFyC3927TgphRWKKkdTI=;
 b=tHxFml91kXufQ33thU+97SNWy6yjsphhIeNxM226lt+amsRp/yvaq9zXY/cDdEF4UN
 qO+jRPQEQv1shCi9sJYfXY36fCbgCuad877eQev6hNf3SmqaHwnQ3guqaNUxIJzGV2g5
 9UAwHKo1drlwiYYuiCvT6+N+uuN/ctyGI0q07Kzpt5+pIZcsJ1x54tzJ72hkh0cAjDvH
 Pt5mpG/FbxFDlRmt8EAE/uotqs6BgnCkRifXitUpF5r8PjrUIwDRFOdN2Um3TxW33VTn
 tNCvgB+bZvaegAv885aaqOEJHTRkZRmXVGHQrC1YugI6eoegGfSbw/kBhbOyeuJuoHMq
 fo2A==
X-Gm-Message-State: AOJu0YyOcva+4KnlauLN/+7weRUnLrgK3n1Q68QeRKp/Pard84rwRj7W
 jsBfbu1ELMBJDLBXkcXKzHVPgM9dArJxTQ==
X-Google-Smtp-Source: AGHT+IGHqjfl2YnBGzIh53H1YFXaGD+aPYNJLKinq1kCK73QY5tSJnaKRC7CmLB9Va56r3QWYcWz+A==
X-Received: by 2002:adf:ffc3:0:b0:336:8af0:1fd1 with SMTP id
 x3-20020adfffc3000000b003368af01fd1mr660063wrs.11.1704303318825; 
 Wed, 03 Jan 2024 09:35:18 -0800 (PST)
Received: from [192.168.69.100] (tre93-h02-176-184-7-144.dsl.sta.abo.bbox.fr.
 [176.184.7.144]) by smtp.gmail.com with ESMTPSA id
 e14-20020a5d6d0e000000b00336cbbf2e0fsm21642247wrq.27.2024.01.03.09.35.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jan 2024 09:35:18 -0800 (PST)
Message-ID: <b6d96fea-ab43-43cd-bd7c-1da59ab7f2d1@linaro.org>
Date: Wed, 3 Jan 2024 18:35:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: use "buses" rather than "busses"
Content-Language: en-US
To: Samuel Tardieu <sam@rfc1149.net>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Vikram Garhwal <fnu.vikram@xilinx.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240103172817.2197737-1-sam@rfc1149.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240103172817.2197737-1-sam@rfc1149.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 03 Jan 2024 17:35:27 -0000

On 3/1/24 18:28, Samuel Tardieu wrote:
> If "busses" might be encountered as a plural of "bus" (5 instances),
> the correct spelling is "buses" (26 instances). Fixing those 5
> instances makes the doc more consistent.
> 
> Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
> ---
>   docs/system/arm/palm.rst    | 2 +-
>   docs/system/arm/xscale.rst  | 2 +-
>   docs/system/devices/can.rst | 6 +++---
>   3 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


