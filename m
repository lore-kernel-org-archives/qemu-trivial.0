Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rTasz-00076h-J2
	for mharc-qemu-trivial@gnu.org; Sat, 27 Jan 2024 00:05:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rTasx-00075g-Rp
 for qemu-trivial@nongnu.org; Sat, 27 Jan 2024 00:05:43 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rTasw-0003cd-Bq
 for qemu-trivial@nongnu.org; Sat, 27 Jan 2024 00:05:43 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6e0d86d4659so822464a34.1
 for <qemu-trivial@nongnu.org>; Fri, 26 Jan 2024 21:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706331941; x=1706936741; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=weKuqzC9tp6/h7jatkkGZ0S6HamZ7GxJD+IJulFZky4=;
 b=JchK99UlXwNd4Mj5SIkGXTKjhGCNXpsx5qgENcOCQEKUMDzIgMbyHc9hPRqXwIyI4O
 7jD+8WvCcHKL7uu6LKT+0bdFrrU0lzYVjf6jJQlM5txTdOtohO68sCVjQzIMQTO1BLS1
 1CwEeZ0HL6y5Xf/fB7Kss92nZOvS7Obry6fmqjy6i3Cd3ZTZvmf6WpyFeqB1BAGoSsKJ
 AYWDVgVzaUz7xiLAzSHZg2euDvHApVBXqyKhLM597/FbLIeoe5tGH3686qwTNf/5Yjgk
 eIvvSzvU2j/z8AVbksK5uqlUkufBfbpwum258XQcHaxiWpRJwSWeb8Kg0a2xWaPUjpFD
 HJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706331941; x=1706936741;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=weKuqzC9tp6/h7jatkkGZ0S6HamZ7GxJD+IJulFZky4=;
 b=R7keP6w5dtSOe4Kpesy+GfXcvP76RTc21Y29jsplgucOOIVOk9pd4YqksE8B+Dg4SC
 y2J5kpJcRfOZZkYzUPxXLlhfV9l5LT4VspcPku6+/QJSoCzcARk4VNkaHRTz3lQ0Aym+
 en19H86WenLbylMEwG5WEM9mYGww9HhYooMWY08SkLo+gjA2Grom62dYjsdt91FN8jV0
 LTFld0KDZtnm8uGPFmpC2CQW5uswVRH3L/5WlQZDlv8qalcoH1f5K8H1bFXs7rIBuscF
 hdD0mVZCzL2yRPSuVVgbUp96LFiiQ8nvQHGX3tme8hMOEmpd4Qux8dDQ+qXRoBsx4EpV
 ashw==
X-Gm-Message-State: AOJu0Yx5YMSJW7S9cLK8k+8+25314diJrty57732o0FP0E9YSskljRf2
 AA46eeb+dtMmJv1IYt78vFi8ZYm3Ts9D6CKlJPsC2nQyPVJVHMtIDIS5CszQ+BI=
X-Google-Smtp-Source: AGHT+IFJgSbso49Rd1Px9udkRJgMmwapp2zH5ljWTOkiLQ2G6L/M5zi3oIsq/tgotTicmt3C+JTHdQ==
X-Received: by 2002:a9d:3e4d:0:b0:6dd:eebd:cd5f with SMTP id
 h13-20020a9d3e4d000000b006ddeebdcd5fmr959462otg.48.1706331941057; 
 Fri, 26 Jan 2024 21:05:41 -0800 (PST)
Received: from ?IPV6:2001:8003:c96c:3c00:b5dc:ba0f:990f:fb9e?
 ([2001:8003:c96c:3c00:b5dc:ba0f:990f:fb9e])
 by smtp.gmail.com with ESMTPSA id
 d3-20020aa78683000000b006ddc14c416dsm1974542pfo.95.2024.01.26.21.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 21:05:40 -0800 (PST)
Message-ID: <da1c3d20-2fa4-45d1-89e7-708b8437066e@linaro.org>
Date: Sat, 27 Jan 2024 15:05:38 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] aspeed: Clean up includes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20240125163408.1595135-1-peter.maydell@linaro.org>
 <20240125163408.1595135-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240125163408.1595135-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 27 Jan 2024 05:05:44 -0000

On 1/26/24 02:34, Peter Maydell wrote:
> This commit was created with scripts/clean-includes.
> 
> All .c should include qemu/osdep.h first.  The script performs three
> related cleanups:
> 
> * Ensure .c files include qemu/osdep.h first.
> * Including it in a .h is redundant, since the .c  already includes
>    it.  Drop such inclusions.
> * Likewise, including headers qemu/osdep.h includes is redundant.
>    Drop these, too.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/aspeed_eeprom.h     | 1 -
>   tests/qtest/qtest_aspeed.h | 2 --
>   hw/arm/aspeed_eeprom.c     | 1 +
>   3 files changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

