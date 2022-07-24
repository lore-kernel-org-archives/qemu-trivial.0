Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oFSIt-0000wR-Ia
	for mharc-qemu-trivial@gnu.org; Sat, 23 Jul 2022 23:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFSIr-0000uC-Py
 for qemu-trivial@nongnu.org; Sat, 23 Jul 2022 23:29:13 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:38568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFSIp-0000JX-LP
 for qemu-trivial@nongnu.org; Sat, 23 Jul 2022 23:29:13 -0400
Received: by mail-pg1-x535.google.com with SMTP id e132so7504908pgc.5
 for <qemu-trivial@nongnu.org>; Sat, 23 Jul 2022 20:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Fk5/EHmltq8muk397Lh0BmtKD4Eiis0rT70GirW3F9M=;
 b=VDpnmEgbLzShTj55DG/yIFSpIGC/Yf1KQpNoGp+YYNZnmK9/v6bVgUfVBUFdSkfFK6
 PSjRTVSUqjvZ1UFf0mru2BIHvUv0cjPS+AJES81xvoqH+6zOjWH1aU9ZQaCCqqTknM6f
 x7DTZ59ABfF0x0Om3osPnjcGXUGlO2I4djUyZSuHrKx517kGVdyQW0EnLRFqYGjVJXY/
 XB9LOTdDm/YO1xb7RBHSIyHO70XaxazOXYyMiF2ykcurrlR5mfk4sS+cA+tMhv1T1y6q
 g0JHQq2veXM0gIhHtLmtp3pXOHTf1fyYyA76eqOO0l5OwFHRMFcQIIT5V0OM1qDoFj3t
 Uwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fk5/EHmltq8muk397Lh0BmtKD4Eiis0rT70GirW3F9M=;
 b=6S+aJy4S68BZslFo6S5zRC+2M2RIHDwkGTqmD+IRA4qxDsJEZo8ANK2sdI0HvdsNpq
 hksdK1uCzghi2V+ZnQOXkS5IeYxxzqHk5w0NHKlWDf0T0GFkYLG5kJocasZzsabazozn
 wtmt1wPJ9B72LBh0J1ZjP3KFZ1bfHPy1qmF3Y+5I/74S0gIxLzMKIzGtuxJMGmaFg5Ik
 46jD+twkEDwzPtsUsmzy58MW2C1Hf2NDUGSfFU9KezDhcbw2l90ZQgBU676OZge27kDL
 mGkIhl4oFrOjXS9sGsroDkqZ2OZnbB0ouNHe9QTixmbRbgKxMtZJiOW/fXlxyG/AAdcS
 /wyg==
X-Gm-Message-State: AJIora+ioTMzKd6h/OKWibOUOMDG5g6ufpqXICCj5LN2znxpdhXKg2Uh
 OVYy0mo4HVvOgO/OunhID1KX7Q==
X-Google-Smtp-Source: AGRyM1t5MNvwbeDIAoGcet5vI9vfDxxLjIIjNJKJSfUeqnMy+BunZh+KdVmGe8KejLyWt9HKZMK6Fw==
X-Received: by 2002:a05:6a00:b92:b0:52a:e60d:dfbb with SMTP id
 g18-20020a056a000b9200b0052ae60ddfbbmr7088588pfj.72.1658633350012; 
 Sat, 23 Jul 2022 20:29:10 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:f4b6:8b1e:fb15:2af6?
 ([2602:ae:1549:801:f4b6:8b1e:fb15:2af6])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a170903234400b0016bea26bb2asm4534409plh.245.2022.07.23.20.29.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 20:29:09 -0700 (PDT)
Message-ID: <40b70415-dd01-039e-9c69-e2fd566f5f6d@linaro.org>
Date: Sat, 23 Jul 2022 20:29:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] include/qemu/host-utils.h: Simplify the compiler check in
 mulu128()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20220721074809.1513357-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220721074809.1513357-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sun, 24 Jul 2022 03:29:14 -0000

On 7/21/22 13:18, Thomas Huth wrote:
> We currently require at least GCC 7.4 or Clang 6.0 for compiling QEMU.
> GCC has __builtin_mul_overflow since version 5 already, and Clang 6.0
> also provides this built-in function (see its documentation on this page:
> https://releases.llvm.org/6.0.0/tools/clang/docs/LanguageExtensions.html ).
> So we can simplify the #if statement here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

