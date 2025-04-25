Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1u8GWs-0006Ed-Da
	for mharc-qemu-trivial@gnu.org; Fri, 25 Apr 2025 06:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8GWq-00066u-PW
 for qemu-trivial@nongnu.org; Fri, 25 Apr 2025 06:43:32 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8GWp-0000YX-4e
 for qemu-trivial@nongnu.org; Fri, 25 Apr 2025 06:43:32 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso14597365e9.2
 for <qemu-trivial@nongnu.org>; Fri, 25 Apr 2025 03:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745577808; x=1746182608; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ctMLHAH8RP3OZzhYF8QHmpkJ3aP35KVo0Te9zm3lY0Q=;
 b=GgjmFsFLjYM7ZmWKKnz9Wi48WwuIv92PuUeqxufxxuXG88V1adl2hgwy4/ondiv93P
 HTNeoCPP3CiLw/Q+QCfqe9cRkvFoZPTUoNzrBb5+ub3bYkY2Oh9ljFz/XbEUxOW7zcsA
 oF/xEh4JnxyA/CdEmWaR3o/C4RNPvpG2EJTyahRNcHTywtT2QFC7y0nsfXOKG6hL32gt
 XfBeq08hcIg+OFcJgwUm3wCF7h61CEk2nh3lpvcGzw0sXnxGpBkoQh6vfbV0NPF5MST+
 bjhlFL2XUiATG2/xV+JGe4Bi8KsgRp6TpZxf3fRWoQMa+3koZh3QO6mEvL/B+qGG8Pu3
 e6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745577808; x=1746182608;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ctMLHAH8RP3OZzhYF8QHmpkJ3aP35KVo0Te9zm3lY0Q=;
 b=a2N1tYkXdQ6nVAAH9L2Szsx6eAUNgB/9vvs8Y5npz4E6UmGM1xwQWXIAWlwgeuX2R1
 0WtYGAnrn3e0rw6mUYdtqKhnr8ZyxrhSyhaA24w+vA1n99IfsJAJTH5LFKi0xHfvQoPk
 OnGuMN6WOTpgTsz8OWPEVxsPS1riKCJb3f7iUhgRovykr36DOu2iDoo9iUB9SBzBE5ky
 Evh094S33KpvZIAtHELRvNvwLHYETJpxXF6zE0gYNglARH9VNDGL5xlFF6mcuFweKI1i
 HIHUgAvrbfJbwuxnYuLa3q5bIkjEGumkU1FSIbmlLc7zj7eOCVb9eRm3n5Al7/v0XyJE
 fNuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWyusyEwFyiEBEsb/qWjyubHKgK+R+9Wye3LbiwjUKCXspMjghKkY60a93Xh96vHOYcSwdhE9apmUYwYU=@nongnu.org
X-Gm-Message-State: AOJu0YxuCbfP6bzsDONi3Y5dzhJyCbK/kZFjKGd5D0bQQ1h3T3hX1SJ1
 tAFR8HWbO5GLgSo59KUSPNNrfkY6D6MwL2RM/ZjCtb+9E9qWoJd6vR6qN3X5dUrLi71o9OdC3BX
 e
X-Gm-Gg: ASbGnctOZf0shbwYC5b/acodeQWgvSDg4j/BNged9oJLxmb4Cd62DTLy5tmBE08DxKT
 dddiXVn9qHxMnbYT+EIaQ1o6ALvosmHWPAFtV8msm9cv9k1UYEIdBgvZTAX8CdsNWLhPUOZYb0r
 AfPOgS9tpL+o98URF7+0I6L+rSwrNmghOXFj0nzEBYDrfsfRDXtw3qLYMc6/AjP+6HGLmb0iTYx
 eUTUXxlyZSyFXAJeUFmpKkqNrFkSXqYytCoVRgmIzKfzSP/X6eFRTkDVoYDgs2CwbDvBjf5G5vi
 vt8SQzEUr63VCpx49bbfkU3xSIpqCFbJ1rHGoCCLm3B24xnyNDoszE5ipxvq/Au31/nXq2wOk16
 C/fWfVJI7
X-Google-Smtp-Source: AGHT+IFEKqrKVqoWyAvST75KvrPWfZW/LUag+p6hrQeU/QYCFUT7DpYo9k1uIwPoPxzlFELGvQ/btQ==
X-Received: by 2002:a05:600c:4e51:b0:43d:7a:471f with SMTP id
 5b1f17b1804b1-440a66059b0mr16289825e9.18.1745577808607; 
 Fri, 25 Apr 2025 03:43:28 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a530a6e9sm20463615e9.16.2025.04.25.03.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 03:43:28 -0700 (PDT)
Message-ID: <1cd89855-a8a0-4e69-81db-2ef0eab63506@linaro.org>
Date: Fri, 25 Apr 2025 12:43:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/intc/i8259: Remove unused DEBUG_PIC define
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20250423101125.B243A55C592@zero.eik.bme.hu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250423101125.B243A55C592@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-List-Received-Date: Fri, 25 Apr 2025 10:43:33 -0000

On 23/4/25 12:11, BALATON Zoltan wrote:
> The debug printfs were converted to traces so this define is now unused.
> 
> Fixes: 0880a87300 (i8259: convert DPRINTFs into trace)
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/intc/i8259.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)

Patch queued, thanks.

