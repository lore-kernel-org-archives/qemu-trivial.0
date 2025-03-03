Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tp70I-0003sl-F5
	for mharc-qemu-trivial@gnu.org; Mon, 03 Mar 2025 09:42:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tp70F-0003rt-Js
 for qemu-trivial@nongnu.org; Mon, 03 Mar 2025 09:42:43 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tp70C-0004wS-Uf
 for qemu-trivial@nongnu.org; Mon, 03 Mar 2025 09:42:43 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43bc31227ecso6231915e9.1
 for <qemu-trivial@nongnu.org>; Mon, 03 Mar 2025 06:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741012959; x=1741617759; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ILFNrG5LIonTMGJ0xu5gDy49lD5moB9+kTODvXFQcmw=;
 b=M/ieqIuwDmY8AaboiYLwH2JfmKhD0MKzBMUxdUENNVjrwOL0J5hC8F4c5IIK/+YhBz
 aipqcc6c7JJE4IgwxBWcRVszfC/xYaHrd8JQo/uMSZnOyxkQJ90LiWtg99Bso/Nru1Pp
 xyukmNirUfN30FDTeHfwp24GwzfqJiMTnzLZYk7k10tTNsnLgjkJMnKLXOJC5sWIrLi4
 07FrLgD7ljXZRRKF2obBJpJxX9s8HfgQoXPRBFOmHj9sr1f5yazE5+pX+ZIZXi69GGhU
 eZcAjdMf40qlZSTm2MVe/RzhZ1PWm9vOYwqrEERM9lpdg4JZ+OyPuLdZMbZ13VJKOkbN
 a0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741012959; x=1741617759;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ILFNrG5LIonTMGJ0xu5gDy49lD5moB9+kTODvXFQcmw=;
 b=qThOid/WGUFoR+zG2VypduDArWzwlWrC+rETCHmPP45Sa5GYoILfnJO/uItWxDxaBj
 FHJmWTbfkX4C+uobJtOWX/dB7sa1E7BPK6b5Y2WI8gKH2skhWGETygDu6llfgtw7QRol
 PlAAzmfCxvYrtEQdWzQp5WvDvQRN+OaTtBepbnDuV+Ta1jVIzos7STgLbBGItdVVyMmC
 UYM1KYmlHRmco0oGQz7PqFrfBDFvCcxmOIKRI4v7kaygSHvxoH0gbTtvPmWItETLrUrj
 Ra4IYnbUX97/BRtjxoNB9UgEa7O9Ma9ncZJIK5iQpHYG6Uh+/LYbt9pYct5d3dNytXRT
 kkBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiKBGmrXR3h1bROugNyA6Qr/3y5Fxm5xXuLYsLGMfyqgW/t3oNYrdeJ/2tMETDA3Xxx2hmK28bfJxuC8M=@nongnu.org
X-Gm-Message-State: AOJu0YyVAFCzQ0h9Nfl1viub4I6BIOefar3fW72E9ld0lhYPmoNMsTX6
 ouFLLIW+AEly2B4oLGEN0awhenKkVfwRkbJdHq3zR4KwcSeUydIGeFl+3PA8H6M=
X-Gm-Gg: ASbGncv78hrJYSqDSXxxt2KG7GigfTm4AKezHhXogB+PKApStNluGVtP1fRv+xZLa8t
 nQY3PuLX+EqSIouXs+ENyfOmBh7r0+ThUJhXN4JIPyanYMv9WDvikARmTTI9hPhHwRz/fPZzXv7
 vGjbNePIV7DoZWoKqxcfWIX4VWp/bn1pcbiafo/2aoORWcIR9qIbHSlrs2lYwHHW8aMQl1XsBSN
 aEoLNQ+cKsfGcu1FvKuypR/olnxmJOgxkLIiNDNYaplWl/tXqI/Fgxi49kyJAGG/6oxcXqKdu8K
 jEkM2MYjEJXV7VlePYINXYWBm8af3b3uHRWM9Xgb3tRuh/D+u4GKeq4f1zbymx258SCDxmzuR6q
 VPWmfhCA8uFcB
X-Google-Smtp-Source: AGHT+IF3gPssxI3TY8xPhxi/5kVAVXHdGnhob9n9DFKGWn3ASrRTRBuUb7TtOtMPz9FWqCBCr1RVvQ==
X-Received: by 2002:a7b:cb10:0:b0:43b:b32e:f429 with SMTP id
 5b1f17b1804b1-43bb32ef8c0mr57907765e9.27.1741012958852; 
 Mon, 03 Mar 2025 06:42:38 -0800 (PST)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b736f8034sm168592555e9.4.2025.03.03.06.42.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 06:42:38 -0800 (PST)
Message-ID: <62cde4bd-ecc1-4dbd-981b-2998cdf66dd7@linaro.org>
Date: Mon, 3 Mar 2025 15:42:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/misc/macio: Improve trace logs
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jd Lyons <lyons_dj@yahoo.com>
References: <20250222122850.9D8B84E603D@zero.eik.bme.hu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250222122850.9D8B84E603D@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 03 Mar 2025 14:42:45 -0000

On 22/2/25 13:28, BALATON Zoltan wrote:
> Add macio_gpio_read trace event and use that in macio_gpio_read()
> instead of macio_gpio_write. Also change log message to match
> macio_timer_{read,write}.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/misc/macio/gpio.c       | 2 +-
>   hw/misc/macio/trace-events | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)

Patch queued.

