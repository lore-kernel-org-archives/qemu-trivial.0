Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rYrcb-0004It-N1
	for mharc-qemu-trivial@gnu.org; Sat, 10 Feb 2024 12:58:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rYrcX-0004HY-RU
 for qemu-trivial@nongnu.org; Sat, 10 Feb 2024 12:58:33 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rYrcV-0001sH-M5
 for qemu-trivial@nongnu.org; Sat, 10 Feb 2024 12:58:32 -0500
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6e08dd0fa0bso1125630b3a.1
 for <qemu-trivial@nongnu.org>; Sat, 10 Feb 2024 09:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707587910; x=1708192710; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XYf15tKUPsb3kcCtoOAKy2yGFOUnQ7MXkgJr6t1xRPQ=;
 b=NYPhmMMwIVppaPoyx42wue1a5uZ6/dY8oHVBBk4B8tTcl2nf78U+EQIuy8bSTI2EZb
 OeInTzGJqT+5sIgQma0q/bCtBk+t/xTZNdww4X52oCb5g/P6MbJVzpiDXxU4hr0vNVQI
 olq+nxXvQXLGawCHlWH4UhqQa+gZ59YFah7yjpILXJa+pxiU9Cm+NrWybb066Oxk8yT0
 Eu+wnOMy9p+Cwckpgyr8i4ot1TSuR1eN0FjIldfloQp0gJ3fgWy2alMv4nk+WzHBgTJI
 7kZ+eBstl9tdX4/eb9hlfnlk1whaG6vfIgBtpMR30l2WIqSi3kRGgUS31hefD9Yqi6Er
 kaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707587910; x=1708192710;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XYf15tKUPsb3kcCtoOAKy2yGFOUnQ7MXkgJr6t1xRPQ=;
 b=UuMNLNqPvQTakU6bWn6VeWZYVHmGbk6KuvuEzrAEHIZPVkKcL64BdzDS/OBk65h0r/
 m9UiCOZTRkGy6+3WSYbfz3QCgCS6N3kBDJKFTKDzp4cbE3mKDwqfkbEOD7vgNCoA5VGO
 PAGbkpOLunfOr/Df2ANapKcgh1OXuXU+3Eqm+5tgAkvRadGuG/N0nGy/rHjrCPE5M12n
 mdLz7KsFaKAQWXs2327hSC50zN/GXR7MiXOlNIHtF5uZu54wZTWzebCgf/hm5vkJ04Az
 UO1iPoIqvAL8Zy6E2G0id9MkKPzC53HAoEU0q6Zn9HdTp/8oIolZHZHva4/ShRFRFCXk
 nF7g==
X-Gm-Message-State: AOJu0YzsWHM7P4ptPJHUEMQPBxqoGjHv4MQtlqGR5ZmP3QwCKNMEs9Ah
 ol639eL1lCPaGA2JsTiy9FgXylaVX3ANeCHZzqybK60B7OKd6ea3EqhbjzkHh3RKnw+khrh/Bcs
 p
X-Google-Smtp-Source: AGHT+IEBtUhjmNED4qwKZEzQxdaxyu96lK8ix8pPp6ly4ZjrATIgmrwSNX6fX+qgGZctsCqyrhEVcg==
X-Received: by 2002:a05:6a20:47dd:b0:19e:ad09:a571 with SMTP id
 ey29-20020a056a2047dd00b0019ead09a571mr2360022pzb.29.1707587910217; 
 Sat, 10 Feb 2024 09:58:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWgndQwrzSeBqdQ7wRPJtWq7+bfMT5iv3KRBMJ8+kPV5hGqs6VyWu2JnkrH/eCjVFMBSP09O8uc43a5krRnk+T9Ikw0Yl8XoFcWhQ/8Vt0fTl5xaNuy3Bsg+R/GPhCr
Received: from [192.168.4.112] (066-027-223-101.inf.spectrum.com.
 [66.27.223.101]) by smtp.gmail.com with ESMTPSA id
 d9-20020a056a00198900b006e06b8548c3sm2558000pfl.139.2024.02.10.09.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Feb 2024 09:58:29 -0800 (PST)
Message-ID: <ef6ddfd5-8928-42aa-9d8a-cab382b7ad37@linaro.org>
Date: Sat, 10 Feb 2024 07:58:26 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] system: Move memory_ldst.c.inc to system
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20240209000505.B07D04E6049@zero.eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240209000505.B07D04E6049@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
X-List-Received-Date: Sat, 10 Feb 2024 17:58:34 -0000

On 2/8/24 14:05, BALATON Zoltan wrote:
> This file is only used by system/physmem.c so move them together.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   memory_ldst.c.inc => system/memory_ldst.c.inc | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename memory_ldst.c.inc => system/memory_ldst.c.inc (100%)
> 
> diff --git a/memory_ldst.c.inc b/system/memory_ldst.c.inc
> similarity index 100%
> rename from memory_ldst.c.inc
> rename to system/memory_ldst.c.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

