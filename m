Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVfyU-0003oA-Dv
	for mharc-qemu-trivial@gnu.org; Mon, 04 May 2020 14:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVfyS-0003nO-Mx
 for qemu-trivial@nongnu.org; Mon, 04 May 2020 14:37:52 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:37911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVfyR-0001jp-K6
 for qemu-trivial@nongnu.org; Mon, 04 May 2020 14:37:52 -0400
Received: by mail-pf1-x441.google.com with SMTP id y25so5959287pfn.5
 for <qemu-trivial@nongnu.org>; Mon, 04 May 2020 11:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LBe0LByfI8ODUWHGnqMJ+kv/EENUQD7l4y3Ff87mtOY=;
 b=o2VLUdgdRU3jcUhS4YAg9ZVj3HfDwCVN6K2pmcpbMe4R4rXaI1rb9rI+aMxlsKqetB
 6ispbs1sm/pkVAUbBiLwoH1EatCwPoEZDzC6QuOTNe24pAFY4o/arTCOtDGRstaf2DIf
 6aHp86FMMIIJgxAJEltyfZYrbDiZfuCRzazWAniSm3IK5krWBsJioMikYqeLc9E98vlc
 mP9FpsAKoB6XUDqGALEe+OWVK1QYwHJMpn1iSOkLxkKQKo0o4qHOc+0mGDR2xpBFx5U1
 PY5w36AYyZ5IKqtEtIJtcb6UCQX9Mfxa38z+1JWa+VmheaeSY4ys/N0lAZOn3vnL9FmP
 j7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LBe0LByfI8ODUWHGnqMJ+kv/EENUQD7l4y3Ff87mtOY=;
 b=hgIm1soW3p3wtgZwGAAeNF3Bw4NHUiv7YVtU7Xu19PhhoIAQr3wGDB4WBpYbeduvbF
 Ab/K7RKsS1zrnVjmqHkK2GkPpNyFrF/h7zrybpCk+wtIxcneYkgSVUdeBPsBS3hpXdM+
 cUXy+eE+NuKjkhM1AfhV2uAKKxeCHGfX1W9CtKWmIMAw+RL06CIl6O0XxXsiAmisSBAe
 Upof2QlFWO8K6h4Xy790O+WMRWK0DZE6PeSuOojB/3of1ZrLPtFrQsmmKc1wBgUFSOrW
 reTz+vcY83wsO8kS4M/qwxENW+tVpip47hpYJcs/3/mqAr8sHe7LOSwok0JxRQFfWWPr
 tNIg==
X-Gm-Message-State: AGi0Pubib1VVxFWmYSmARpFmLTzaSazUHRcbkYBbUoOzy5FZMRVggnuO
 g85ZwetIjLydi1xEy5Vp5Ex6Fg==
X-Google-Smtp-Source: APiQypLbr5FD3QQNUzyqmShvcsCxrF4kOZIPzVCLBHzvVa/Y+r3gb9nY3twq+7k9AGrktEF5gjMi8Q==
X-Received: by 2002:a63:ef04:: with SMTP id u4mr312580pgh.280.1588617469673;
 Mon, 04 May 2020 11:37:49 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id 1sm9259922pff.151.2020.05.04.11.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 11:37:49 -0700 (PDT)
Subject: Re: [PATCH 2/2] hw/display/edid: Add missing 'qdev-properties.h'
 header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <huth@tuxfamily.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20200504082003.16298-1-f4bug@amsat.org>
 <20200504082003.16298-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <59e5a700-e2fe-b053-3bbd-71c36134c116@linaro.org>
Date: Mon, 4 May 2020 11:37:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504082003.16298-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
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
X-List-Received-Date: Mon, 04 May 2020 18:37:52 -0000

On 5/4/20 1:20 AM, Philippe Mathieu-Daudé wrote:
> To use the DEFINE_EDID_PROPERTIES() macro we need the
> definitions from "hw/qdev-properties.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/display/edid.h | 1 +
>  1 file changed, 1 insertion(+)

Does this not currently build?  I'm not sure what you're fixing.


r~

