Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tkk64-0002In-2K
	for mharc-qemu-trivial@gnu.org; Wed, 19 Feb 2025 08:26:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tkk62-0002IQ-Q7
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2025 08:26:38 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tkk60-00011n-SG
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2025 08:26:38 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38f2f783e4dso4000371f8f.3
 for <qemu-trivial@nongnu.org>; Wed, 19 Feb 2025 05:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739971595; x=1740576395; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ApzCe6gw52Vr0U4qKaBlvpA6sFckj62Uh/SJHb4xlaE=;
 b=jYKQra0Jsgdwn+6NKjG0zlYNwPg+ercOeix5b2qJsKjeoZy8UehreVWOxySaywKR1J
 gZ9Ra56ZAPN1zg9XDs8BoEKWZyoPy6imwfcDNkJ6biA5QzRJLOGZ+S+/+PBkuBiedUWX
 yEH2qnt98ppLgfJ5pptuQ0hfFTH5euyi1HIFXIi5mCP2WiFDg9haXdMQDeuGLoHD1aGX
 FyeFd6gNjRaPO1ZMu6yjo0QWXsUjhK6licavvxRVqptdOUJMQroMkkmSXxngPHLlEZ1p
 frFCDp6O/zgFSI8CBuoD2nJjAzekqGQoAI3aq9hikiZdKsEX8k/MEtVTYKKsfItlIuAN
 3ULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739971595; x=1740576395;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ApzCe6gw52Vr0U4qKaBlvpA6sFckj62Uh/SJHb4xlaE=;
 b=m51SW0Ax9aC6IsuoiDMf+1NBmo47XUx+YJjPHgEqPJhm1gbKn1MD7md2h6u5Xr7CIP
 DYWTAeraXnrfTpsT6aGYZbwcQTTNHZXogPMKSSJCEp4EgmHk2a2aQnpya8d9gYOkBDxX
 GJ/snA5MA4EtFzYGU5pFKaOzc9SQQDY1OoYK8I319OCSjWELoXpHlOinSewD6nyCgahp
 /YBDzcztgekO1N8lk154jPLsdw1VPXl7xQmvybiVJz5KjcfTLMLGKKfhmGrhw+7xlli4
 EXq79QdxHHbnph6UM4dkrBS1upb+iOhu4IJfuNe56VD3TefWIkHk+pOrrfFgaOYHq3ap
 ns+w==
X-Gm-Message-State: AOJu0Yz1Q72mOAMwQo3XzwYt9IJbORSZPXRivngIL6nPlPc4IGPc475m
 frZKJiJMOGLca6TS09+uXgTG1/5wrOl8Ik9FTQzAc1a1EkLEjwrj4IKKwmu/RLzX1ZZHxpgc93n
 6cJk=
X-Gm-Gg: ASbGncv/9ikN5L+dZidXTWL1iXm933ElhqA5zAMVhyTPAk7eFzWp2Y4tXTUVP7LIRIJ
 f/fUpQppgoblpzKAUg+DMyCj8JNAHGyQs6y/JEs9scjI7AqWrI+Pj+Frk6Lx2s6pDJP7Mfi6GAj
 02txUV42ewxI7b1O/EKemy+h+LIvGZna3SI/8WudikNgY+UxhMfwVtMQZ0rnsYU/pAyGmxbG8po
 V/vAKvJaSCysmVLUdUA7VMz1933cfSk1tG9n+KaK4x/g8n1FCVeZrFwjfceIaJuGHa0AvpiZDPz
 ehyjy/oJxhb+UNhoHpXL1yfXsJ3K8VFEFTpPOErQn7SGVFVUsJRPQA9IQzc=
X-Google-Smtp-Source: AGHT+IFBeJWfpV2S8N6NGt0tYK5PIGuOzTQEfA1RfCb5WB/AsLSez+XcDsc4SRHd9bB7ByA8JaQiQg==
X-Received: by 2002:a05:6000:2a8:b0:38f:4f07:fad6 with SMTP id
 ffacd0b85a97d-38f58782ba2mr3021638f8f.5.1739971595380; 
 Wed, 19 Feb 2025 05:26:35 -0800 (PST)
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258fc8b4sm18076299f8f.50.2025.02.19.05.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 05:26:34 -0800 (PST)
Message-ID: <b1843604-2fb8-4a17-bb2a-b827a5d28a71@linaro.org>
Date: Wed, 19 Feb 2025 14:26:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH trivial] Makefile: "make dist" generates a .xz, not .bz2
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20250219130009.342000-1-mjt@tls.msk.ru>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250219130009.342000-1-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
X-List-Received-Date: Wed, 19 Feb 2025 13:26:39 -0000

On 19/2/25 14:00, Michael Tokarev wrote:
> Fixes: 9bc9e9511944 (make-release: switch to .xz format by default)
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   Makefile | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


