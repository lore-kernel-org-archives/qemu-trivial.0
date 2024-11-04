Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1t7v8O-0001tj-DU
	for mharc-qemu-trivial@gnu.org; Mon, 04 Nov 2024 06:20:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t7v8C-0001sm-Tr
 for qemu-trivial@nongnu.org; Mon, 04 Nov 2024 06:20:28 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t7v89-000733-4w
 for qemu-trivial@nongnu.org; Mon, 04 Nov 2024 06:20:23 -0500
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2feeb1e8edfso19527151fa.1
 for <qemu-trivial@nongnu.org>; Mon, 04 Nov 2024 03:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730719209; x=1731324009; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K/4xij/BSc0rJ6+hR412YXm76FFQgcd6TU/8derDxSA=;
 b=wxcH+BJOoe54Sq7JGj6dIAAO7Y9ZBevULgN4Mf3fKbW+AJxvzLZVmG5M8jqX7yn3K1
 RNrqBLEW2gQVLeFxJ46EON4IVZhqYDayo7wXQT1jkg6rIOv3D8UF/j/MSf0JZ7WOOOlS
 6YurJ6BvOi4j4UV/lRkJTf031wQ6BnGSUJw1OJ6uXoLGIttERqwc/uJ/0s5NdbWf4MFw
 25UavReUt0+iAoewT47T4pcAA2I9vZJfIHior8GudieIGCb/4AqRFyII79ePFQugOC9J
 ZEKpIDS5ezUvcGVbpziqAth0dQDTYf1VtFgIUgJ6IrOXHlfCP4Yjsr5+VBuTQsW0F5cZ
 TH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730719209; x=1731324009;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K/4xij/BSc0rJ6+hR412YXm76FFQgcd6TU/8derDxSA=;
 b=uCEa1KGDK68PvWmMqVPfwC1J6CV6Ug8Z1IuQRdQ6Pc/ZipGLCO4cAFCX5xfKuffVil
 BUN6dlQ0D9LmgEphL6L5Rb+IbCIK0WaVNVyyN0MhUV4gbXcxqdSeQzspmigywViK1Tl9
 kwSCTWgyLGn47/1MIl1ha0TwEHxtulGgS7sJvc8RLg7m8O6mq+RoncWzkYbOQDSdlob2
 RGb9dneFWEoLBv9epATnEIDg9K0RrNfjh5xfZ0xshf8gCSGfDl4LicFBGB+RmMHl2NEy
 Vjj0Y3K+gzvdKomEpDuwN/YsbelXLmc3ncWrQDBh9gNgkhJ2YFq8C5bw5/OpywBpUJ1Y
 qQkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYz+Rt41rAi+dl9PIMsAOs7TrNnw/NYqD6GDBDl/a/pqoSjcX0dQVYjYrxM+DO9sPY2ffW7Yb4jNDs0nA=@nongnu.org
X-Gm-Message-State: AOJu0YxEq5+9ERLE4+2O++yNDCd05bbZlu6lU6qwiURqU0sd0NBoZw63
 DD4cXI1e3wuLKOqeb2OXb+kZ3gmAPsv7dM7zKUx5MW3IPozX0UlSK46n2PuMS7M=
X-Google-Smtp-Source: AGHT+IE3IsogVSwyj5NFNALcthBOyYToexUocjr8j1X4dm9Q72jV/mylgHkh7m0dTovWey4V+SUYLw==
X-Received: by 2002:a05:6512:3d05:b0:53b:154c:f75d with SMTP id
 2adb3069b0e04-53d65df2783mr6929224e87.31.1730719207654; 
 Mon, 04 Nov 2024 03:20:07 -0800 (PST)
Received: from [192.168.21.227] ([91.223.100.66])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e564c5348sm538074566b.49.2024.11.04.03.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 03:20:06 -0800 (PST)
Message-ID: <3aa616f2-8a77-49db-91be-adb4e261b44e@linaro.org>
Date: Mon, 4 Nov 2024 11:20:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] hw/watchdog/wdt_imx2: Remove redundant assignment
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Guenter Roeck <linux@roeck-us.net>
References: <20241103143330.123596-1-shentey@gmail.com>
 <20241103143330.123596-4-shentey@gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241103143330.123596-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 04 Nov 2024 11:20:31 -0000

On 11/3/24 14:33, Bernhard Beschow wrote:
> The same statement is executed unconditionally right before the if statement.
> 
> Cc: Guenter Roeck<linux@roeck-us.net>
> Reviewed-by: Guenter Roeck<linux@roeck-us.net>
> Signed-off-by: Bernhard Beschow<shentey@gmail.com>
> ---
>   hw/watchdog/wdt_imx2.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

