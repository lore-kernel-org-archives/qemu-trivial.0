Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sMW7D-0007Rg-Vb
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jun 2024 13:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMW7C-0007RL-LH
 for qemu-trivial@nongnu.org; Wed, 26 Jun 2024 13:07:26 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMW7B-0007DN-6n
 for qemu-trivial@nongnu.org; Wed, 26 Jun 2024 13:07:26 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-425624255f3so2481165e9.0
 for <qemu-trivial@nongnu.org>; Wed, 26 Jun 2024 10:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719421643; x=1720026443; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ujgvp9qy9kh4XNanVSe8dOExLRTgaDQ/D5cPA5rx/og=;
 b=XiLP7FjRpssPfoCRNiPxLhGjGEa5Ix5bjpfLFj5r31yvSCc3/u+wCrVW79ZvVzUfb8
 QNv7EujSIaZarY1ichIqG+GvV7S6tzyUsRrxR0AdPYQ0azae1tKkoNyTJEnBmrrOxNSa
 sQoqQPGN3yGg0xJfrMGx5Nmu9TaTj0oORipxUn4c4ZzE1NhbgsPVuGYFX5pjEm/xHdZr
 /wEIHTVtsBlVDFNPII6heOy3duoimSacZW2e+rt9e8acSZL81WVhQ7x9/rDaZYVBFZMG
 eSGi7ti6GetMFzjUKcd+o6IbLoySHJjvREEZ4X0BhMZmBE46FzzxUIHGdjVqzgqZFfzT
 dE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719421643; x=1720026443;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ujgvp9qy9kh4XNanVSe8dOExLRTgaDQ/D5cPA5rx/og=;
 b=VWz45KGPI8ot10lZosXd6mWFmsmzTNp5ZuOjpQRJRx4Grx0IdARC4P2N9qVA7OVjaE
 zhLyxggXMsVuucIdx2WtJ7mGGvG3wFQr3ZRQ2RpBh2KvtKKaBtEGzoOhVQtB8W13qo3C
 ZSMITgwHHjU7aORV1YZ/LOZlQo54qcjq6EY1Y9FzLIFg4nQr6z5alRILEe03jcnWNmak
 ZIziK31Rnw2IThQ0geSDRbpFZlLBxyV5nXqwLKpvFvzSJrBXuwMVHr76c3HeyoqKux2m
 dYxjR6lLFpH0Z87/R6ykU8qpchkm4k7s5HPwpQS9pSnJLUmQqdc8V/JB6MmmlXjwbqqu
 Vsug==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5e+wRezSnAs5XbU2Q7dDImwmcXYAEk7bAe0VjK4n9Va4G8w4ZXqVYFYy9doLaV/am1GzzwU/3yBfch2fyfzkVpdoHn/VoNQ==
X-Gm-Message-State: AOJu0Yys51Rk+gFt7RZXShDFb/+TPoIxqHcTR9ewhotv5+5gvbE9k02k
 8f/NZIdN7M1QvsVXaSPBHALu9TTka/OOLzVYS+yxpq27tEt+QxPphgFNrGWgVoc=
X-Google-Smtp-Source: AGHT+IEGKR6unT757x9SBaW08pNFQd8M+J7xs8S4DH4YwHzKdblKgfzIhuNXWLg53uNjCMh4TGtkJA==
X-Received: by 2002:a05:600c:68c6:b0:424:7443:e6d8 with SMTP id
 5b1f17b1804b1-425630fcde1mr2831885e9.9.1719421643603; 
 Wed, 26 Jun 2024 10:07:23 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.212.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c8266ae7sm31920535e9.20.2024.06.26.10.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 10:07:22 -0700 (PDT)
Message-ID: <ae8ae1e3-746d-4a38-9478-f765cbb3e2bb@linaro.org>
Date: Wed, 26 Jun 2024 19:07:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] vl.c: select_machine(): improve error message
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, qemu-trivial@nongnu.org, armbru@redhat.com
References: <20240626134305.432627-1-vsementsov@yandex-team.ru>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240626134305.432627-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-List-Received-Date: Wed, 26 Jun 2024 17:07:26 -0000

On 26/6/24 15:43, Vladimir Sementsov-Ogievskiy wrote:

> Vladimir Sementsov-Ogievskiy (3):
>    vl.c: select_machine(): use ERRP_GUARD instead of error propagation
>    vl.c: select_machine(): use g_autoptr
>    vl.c: select_machine(): add selected machine type to error message

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


