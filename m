Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jb4AS-0007He-R4
	for mharc-qemu-trivial@gnu.org; Tue, 19 May 2020 11:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jb4AR-0007E9-B8
 for qemu-trivial@nongnu.org; Tue, 19 May 2020 11:28:31 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:46231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jb4AO-00038a-Bv
 for qemu-trivial@nongnu.org; Tue, 19 May 2020 11:28:31 -0400
Received: by mail-pg1-x542.google.com with SMTP id p21so6553951pgm.13
 for <qemu-trivial@nongnu.org>; Tue, 19 May 2020 08:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5qJv6cRYHCSoY2DRMd/7gIc7baIbvMyMHOR1QeolGxA=;
 b=UYHDO759dsFt7a8bVK/ji3X4XJhkpUkYj8AfBXJZPoLoR7ZkArMVEoTiXRTQdrmsYo
 rsJa9JtpPNEZOijsWw1cdwRR4OR3BsN+/PYeGqueTxgbVL3H92DsiPEQrcwgepl+9+dy
 MONzUdJkUpJbqGcrdC+b9gEZeM6FsnHOBDZntK0GNYAWMDXqCo0Kr2bBF2mgeqf/Ho9J
 B4YiAS+S3qzHdxWUohp7cQPJILLwJfnA7ZBXBCAYnLd0nQsIa67o/Uf7rtcqWJEHYgX0
 4yrvhW8Dy0arWfJ4YKXkXRLYIPgY24C+X5rMCd9htRA6p7WyGWldljWfeSXeUMg5qDmr
 pFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5qJv6cRYHCSoY2DRMd/7gIc7baIbvMyMHOR1QeolGxA=;
 b=O8Iqu5/Yb5CbJsqLiQK7bp6vynMF69xYyMEt+YkWtKtTACbuPtU+l8V+f13vwYQBG7
 03hJh9ugPX2EZZoBvPWdf6aul8qBEfR+R7lpmss5EEExfLNlJeFE/O8VZ7CnOf/iSfIu
 /tqPjcrhrpCOW0oAeB5Ne3RgsFdJRwTG2fYpHZe35XR0k+mj01KrELKLlSvQe0DVpRHr
 HpqqWqCWGwkTevFtwBcW7vJxngYAZJK06uXMpBeWdE8uUf9Q/TaVg2oY+reglsbrKRDR
 SMhnjkmmRxxgibRnQJ78/9NfnAX7SDZDGwSiitur5L+JlaghGc4xXyKEqU+bKa/swwkg
 8xGw==
X-Gm-Message-State: AOAM532tIAfq36P/rEQB4JAXLq6IyeyVdUNtv2US8QSTvEn21h+AiPoJ
 0tqluvC/7fGQu+2kfxiwJzc/OQ==
X-Google-Smtp-Source: ABdhPJw4wlRYDZ8yjQfhbs6wV4PCoTV5qhCRS6vltBa3NB71guqOcm2fS+0vLn903wQa98S8cXu2bg==
X-Received: by 2002:a62:e707:: with SMTP id s7mr8260869pfh.208.1589902106834; 
 Tue, 19 May 2020 08:28:26 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id i3sm11544992pfe.44.2020.05.19.08.28.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2020 08:28:26 -0700 (PDT)
Subject: Re: [PATCH v2] hw/display/edid: Add missing 'qdev-properties.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <huth@tuxfamily.org>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20200518174523.18076-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ce656f41-afa3-dee0-d5f4-0e8f47b9a5cb@linaro.org>
Date: Tue, 19 May 2020 08:28:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518174523.18076-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
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
X-List-Received-Date: Tue, 19 May 2020 15:28:31 -0000

On 5/18/20 10:45 AM, Philippe Mathieu-Daudé wrote:
> When trying to consume the DEFINE_EDID_PROPERTIES() macro
> by including "hw/display/edid.h", we get this build failure:
> 
>   include/hw/display/edid.h:24:5: error: implicit declaration of
>   function ‘DEFINE_PROP_UINT32’ [-Werror=implicit-function-declaration]
>      24 |     DEFINE_PROP_UINT32("xres", _state, _edid_info.prefx, 0),    \
>         |     ^~~~~~~~~~~~~~~~~~
> 
> Headers should be self-contained, and one shouldn't have to
> dig to find the missing headers.
> In this case "hw/qdev-properties.h" is missing. Add it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Since v1: reworded description (rth)
> 
> Supersedes: <20200504082003.16298-1-f4bug@amsat.org>
> ---
>  include/hw/display/edid.h | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

