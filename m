Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sW0QB-0005we-Qt
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jul 2024 17:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sW0Q9-0005lt-4f
 for qemu-trivial@nongnu.org; Mon, 22 Jul 2024 17:18:13 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sW0Q7-0007AX-HJ
 for qemu-trivial@nongnu.org; Mon, 22 Jul 2024 17:18:12 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4266ea6a412so34398585e9.1
 for <qemu-trivial@nongnu.org>; Mon, 22 Jul 2024 14:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721683090; x=1722287890; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u1Dxa2top5UQEMYVO1Gw0jihMKe4arXNF/fGqrXEzmo=;
 b=wAXd0okrdGQAkYVkdLKA5x2xNqGLusKMW4AuOHi8EXqadW3g7Gl4V8Hb7o5oATn0bz
 YHmPkm7vvIrL3fxnZCICbFCaCQcT6N48yKLHjybWCxGkHzlC1YVXj+jYjdErVWTYq+Ja
 MDgXn1Bp5M7INkcChN42AT7QxGhWtvl7P1Fgc1Mq5jXJl18g3vF+KQshMCjPIFBmvym8
 OsqQCviWNYrevmev16P8X+wEcyD22yMgLq6uYTNwAq8Oju9Qe1ZiQJLM/8WXUTcAGO6c
 FsqZ95JPjMWDyVFi5JfZ/Ye6GHdRJ+KW00a7IvvykQ1aZgYzmD7wxgHP502UhTnjUODB
 oZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721683090; x=1722287890;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u1Dxa2top5UQEMYVO1Gw0jihMKe4arXNF/fGqrXEzmo=;
 b=OKPRe6LRgO6o9C5t4NOejwDvhy3JzfgBm3+zcx9MvM0BaFP3rA7f2AYFjYwt+jTTSw
 YSQIIh4ZXLg7dKd+6E//p29vK6NC+DCwT9KBJJoqoAtpEgK8uQ1dBjqGEmAmZ3MXtKgE
 2ND4GGHr+a0Kn122eTG5i/EC4e+DuTEMKfEYLr6iwP4rECJnzc3pWGrEPETT1Kciuz0H
 JTW4ee3aRzvN+onV6O/W3uemnsvzgQtxyH46kaCtqDgRSWpFY0SKbIoN0p0SFYd7jwYt
 LGUvAxR3rS3AkmdR4esnVWlYni6SH+9UkoAjcM2fHzi8nWtzZSAU1P1W2PvDEJ/gMnlB
 MAMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8JcfzSwevAIdJZI2AOzYnCToyqu1LeCuF9zaBEeps4Q5oFyxIli4EOrH5QEp7YIMC2aPGswz0OJRskF+NICGb9hNAybrhZg==
X-Gm-Message-State: AOJu0YzJdg2Env+2NA7xVAHdhmPodMMzU9J2EN8ADSWZW0MjTY926swR
 WJ9YjgsQU+16WshXVVCHVITiwZUPlfPoqUa7dfEG+I9qcV5AfaJnUnFwJcIP/jw=
X-Google-Smtp-Source: AGHT+IHiSG3qi2oiKaEMQIieHjrkfSUz7nbulB3utZqdTTJWYrJ/l4Vv/Spde8TNQpC4/LSopn7qjQ==
X-Received: by 2002:a05:600c:4f8e:b0:427:98b4:624b with SMTP id
 5b1f17b1804b1-427df7aa65bmr44293115e9.24.1721683089753; 
 Mon, 22 Jul 2024 14:18:09 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.208.14])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a94380sm169998385e9.39.2024.07.22.14.18.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 14:18:09 -0700 (PDT)
Message-ID: <c2ad7aec-1d27-4ef5-a7df-a54e656e0d2a@linaro.org>
Date: Mon, 22 Jul 2024 23:18:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Cover guest-agent in QAPI schema
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Dehan Meng <demeng@redhat.com>,
 qemu-trivial@nongnu.org
References: <20240717140025.66397-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240717140025.66397-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Mon, 22 Jul 2024 21:18:13 -0000

On 17/7/24 16:00, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Patch queued.


