Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j39S8-00052J-He
	for mharc-qemu-trivial@gnu.org; Sat, 15 Feb 2020 21:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44000)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j39S6-00050x-8B
 for qemu-trivial@nongnu.org; Sat, 15 Feb 2020 21:14:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j39S5-00072d-DJ
 for qemu-trivial@nongnu.org; Sat, 15 Feb 2020 21:14:34 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:38628)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j39S5-00071f-6X
 for qemu-trivial@nongnu.org; Sat, 15 Feb 2020 21:14:33 -0500
Received: by mail-pg1-x541.google.com with SMTP id d6so7174389pgn.5
 for <qemu-trivial@nongnu.org>; Sat, 15 Feb 2020 18:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8eDW90H2hUqqT/nAm7OhpJSAhb2ESBKhGdR08HxPPIA=;
 b=u9QM5HIN5JAvVhllpLOziGR22GeSVQwgtuMlcE/sfiUZrJ5h+UG1IGd5t27+I8gMdI
 ed4cwh2D8bGnlgQA4z6Guk+gG26c83gLe/D2NbZ7ywZnUjvcU3bcRnBHvVrCRn1tQ5yu
 z8+DVqyWIExHxeWgpaUFl6NVAhmlF5Wf4y/UF0KsSWwm9Sq+Lpn9z2t5fOHiZS5LTD0I
 jSnUQwY0opV0KYBqscgGfXLLWdyY7kOY80Do2e9XEXJj4D7RNlcTUyGO6OsZvpNTlywu
 zSlvjg39/GS+AhRFw6/5J1MjTiZe5wuRP3oE8bhXVg226wwym495guPDCyynIf8EG65o
 dqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8eDW90H2hUqqT/nAm7OhpJSAhb2ESBKhGdR08HxPPIA=;
 b=UFZ3sT3s6aiT1KnzL0BKaiWwY6REQalgD4fm1BWCfJbiyYdMM3YqXC5vMOSIWFSk7Q
 qLXMaGZ4LN/9e1KlPMOsHRp67jSF79jvIkfjfDAgTVPFrC4lW1tlueFmclI0QDY24yXF
 RPuvJOVZnJq7MCRvgqIPiruYhwshwmpFWKY+NtLAoyMJ95SIIQbHVq5ZpTn58cig+kER
 f8ouDxAyuZ74vo5arP1DwOhBzNB+5T+6XaQvXh15bmZKZDil3A/qR0PHJy22b6TGHWWE
 5COEGAnMGwPICXLIcRfBzHuz+3D71dZr1tBfPatz26GRXGWj90EkS6z9q47rCwbZ55aR
 BsXg==
X-Gm-Message-State: APjAAAUl48qmjaH9CwT0TDnH0EIVFYG/4yV5dWEQY7IiaGhhwg4T6ybk
 a/n+pvzIoHO6sRB90w8fT5WI9w==
X-Google-Smtp-Source: APXvYqwbdlidE1xcxQXgi2GmPFOLoY4yjjiboqwREW2WiQ+3aEbYXytywt5kNvm5meyTsfXzLq4CPw==
X-Received: by 2002:a63:a541:: with SMTP id r1mr11006821pgu.118.1581819272152; 
 Sat, 15 Feb 2020 18:14:32 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 13sm11932082pgo.13.2020.02.15.18.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Feb 2020 18:14:31 -0800 (PST)
Subject: Re: [PATCH 3/3] hw/block/pflash_cfi02: Remove unneeded variable
 assignment
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, Max Reitz
 <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20200215161557.4077-1-philmd@redhat.com>
 <20200215161557.4077-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6b6993b0-26a3-4fde-8ceb-5aba42bf5d49@linaro.org>
Date: Sat, 15 Feb 2020 18:14:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200215161557.4077-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-List-Received-Date: Sun, 16 Feb 2020 02:14:35 -0000

On 2/15/20 8:15 AM, Philippe Mathieu-Daudé wrote:
> Fix warning reported by Clang static code analyzer:
> 
>     CC      hw/block/pflash_cfi02.o
>   hw/block/pflash_cfi02.c:311:5: warning: Value stored to 'ret' is never read
>       ret = -1;
>       ^     ~~
> 
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/block/pflash_cfi02.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

