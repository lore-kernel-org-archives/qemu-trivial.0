Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVewT-0002jg-6x
	for mharc-qemu-trivial@gnu.org; Mon, 04 May 2020 13:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVewR-0002iX-R8
 for qemu-trivial@nongnu.org; Mon, 04 May 2020 13:31:43 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:36174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVewR-0000Qe-1z
 for qemu-trivial@nongnu.org; Mon, 04 May 2020 13:31:43 -0400
Received: by mail-pf1-x442.google.com with SMTP id z1so5883414pfn.3
 for <qemu-trivial@nongnu.org>; Mon, 04 May 2020 10:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qbwvw77ZiG8x+kHfzEvk6KH6Bh3Tzut6Z38R8dGDqBs=;
 b=HYOy4xDSjYOXeDEyHR0BnKMaHola/ANbMRlOFdlrzzywgg612DjvQ5MomlWBVcOwsY
 1hxddZmqevwSDG4oHaIUDORlXzETkZjDa+ZhZrQbd95hivPG8kLJxlzv63Mp2doNpVPd
 XT4VTFP41St5z1Dps0wjMa79q+UcSnupHDg5yg/uqitWuFobbFuM8snd1+He2u02C9a4
 vKz7WmS499jKVjsSI1EFdDq4tAZuEBNFYvnJu29SnOxxYDBqXwh6ghfCbdqHoazpDrNS
 fhxX74BPNLE61SspKvfcfgM2sepVOVuAzkFmV9spDAewWAmicTGuYVJ3F82FyVWqxT2E
 iyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qbwvw77ZiG8x+kHfzEvk6KH6Bh3Tzut6Z38R8dGDqBs=;
 b=SKnk667amZhiU+VHbEiQiBFXLtY1TDEdBsg+BC2jy968PUEvWJ/mJkswAXdszltimP
 jK1z0Z5Ckq0C/X1lBaVWuzDPEOezBvb7liWx1FagdhbiLtM9GIllZPxFzNivErymJsgz
 fuS36gqcffu6hu5GQfzobhgL2p2HlryYAqsIZcCorLWhJo5r2a/y5Mbzaijq5FvZHC91
 vV61YoF7nXjhUI9t3qZHmmTz4Yg7D/XbCDAZtX2AG18m7csxFaeaAh7Ocg7V1t8F7SP/
 jNEcgeV6HzLY3B9NDrDafRRlWkDj5BD6EVwqw7L42a/qwKEJpcrbopv8KyaSsjjuSJ3J
 qvLg==
X-Gm-Message-State: AGi0Pua/kD4YdgcetCPfwoqXpLa0OEZOXtxbRn/NZ7uyorsKf6nqXYkc
 PqrkviKFXviy/B3YOWISWcgsEw==
X-Google-Smtp-Source: APiQypKuV0uzg2mDfzBI5c1oN8929/B47g6koT9pL6UsRab65CtBLIKuyFA2yzJ+72jVhUelrBs4lg==
X-Received: by 2002:a62:7e0f:: with SMTP id z15mr18318181pfc.149.1588613501372; 
 Mon, 04 May 2020 10:31:41 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id i13sm61515pja.40.2020.05.04.10.31.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 10:31:40 -0700 (PDT)
Subject: Re: [PATCH 1/2] hw/display: Include local 'framebuffer.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <huth@tuxfamily.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20200504082003.16298-1-f4bug@amsat.org>
 <20200504082003.16298-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d24ff35e-9ce3-6b95-9c3c-e5f849ac16c3@linaro.org>
Date: Mon, 4 May 2020 10:31:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504082003.16298-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 04 May 2020 17:31:44 -0000

On 5/4/20 1:20 AM, Philippe Mathieu-Daudé wrote:
> The "framebuffer.h" header is not an exported include.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/display/artist.c  | 2 +-
>  hw/display/next-fb.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


