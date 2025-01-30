Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tdcUu-0004tp-Q1
	for mharc-qemu-trivial@gnu.org; Thu, 30 Jan 2025 16:54:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdcUu-0004th-5x
 for qemu-trivial@nongnu.org; Thu, 30 Jan 2025 16:54:52 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdcUm-0002tg-BH
 for qemu-trivial@nongnu.org; Thu, 30 Jan 2025 16:54:51 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3862a921123so960779f8f.3
 for <qemu-trivial@nongnu.org>; Thu, 30 Jan 2025 13:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738274081; x=1738878881; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X6cOHChUiLm1Lkp1lZc4xhZKxfhQwGE8VXRWiTHbK8U=;
 b=FxXvDED8E9ouukrj+802KDupcFGPxAiI8Bmhd0pz6R5N/I+lRoC/DykJPlAo3yBDxD
 ubiMmkT7rep8krM+j5CXYL298oOF3jeTUx4sIdNjVt0FQSGeuKXlYY1L2YQ0zxIAzrM2
 Mj1poscPQWiH597e3asv2u3cav5P9s6a3ozTEBk9Ev1JSxZblsO3X5oOiJPrJxYlOgXz
 ziH8nX4wVw4WScc1mp3lri8qhTSp90hAxvTBru31LlCzg8at6RqTZo8MBMLn72cGjSl3
 iEvx4MfMtHG0xOy+hgVOdob30iLKsnGeIPH6qLtogVFnpFqUCrwFCVQgg4xC3nV/AFWW
 C2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738274081; x=1738878881;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X6cOHChUiLm1Lkp1lZc4xhZKxfhQwGE8VXRWiTHbK8U=;
 b=bGlP/7+qIDadiQMNK9gNMoYhPbeLzEpd7hIGPEynD0TiDwkH0kNX+Cs50Qn7Rr5/VE
 IG3O9Tadgc+dtTZ8EwGYMxibsuQ3Ceud1QnBmwBh5gXO1oSWMJeYBACKNubZ4xFvNJZi
 miAaCxAhBINwz0aOK8ULNCan5f/rJXTGFQyxl4TXGAdTlX72pJsgUd9eV9L0yrbJPKAU
 yjpEEi0MmCWQal7i3u1OZan8BUm5x5cSwM1P/1erOqrDksKnEXVIpjDF6oYoXLzQa8Rb
 OvMfm15MaXFbSi+yT6+0pLo7qwUVRP5q5rL7BKZF0P92G5JoHoqBlKvEAdxQD6M/oIBD
 tcRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURxEcANT9P3oJY6kIJpsp6SIgVPpfSK61FWdazNpDA540xBbZztEcjZ5XH5iQFcZ7R19q3KrD/luypYv4=@nongnu.org
X-Gm-Message-State: AOJu0Yxj7cDzEV9SIXERwTxBMB5DLANVRSs1Hn64/xgsfsfwNNCMTx9V
 YggH89WmZFDb67/MkW/vSW1K07SNUh78vmJGXCZ0ho35PHnV/YNRxlGC6O1BH53LoighmlnZeaH
 8zG0=
X-Gm-Gg: ASbGnctfGlSD5MNMTlaLWcIav7o8FvyuFjiz43SO9NLSmUXKNYebQHJtDBYK/rDgbnk
 6cY2mUHXuF+E3kqqFCz/3NjLUg7RrhiBNtu6WxSpMcfVper5W/2fU/cS9EzjuWiXywJXE8axpt8
 8q0RYo0DaSyMY0MzZWGAI78iqnPtOhR4y/ytXQlHHU/E/qYOXl10OaLACN5JnSBcSBBefIp1saP
 ZKTVorcmaQt/9fqagBjhyTKRHQpaU+yT2Tv3DwxqP1i4RZwBLdYCbngoLFEO2l7oF01ngR2RsXR
 BbtyL3ioxBnqbEXUwY64l8ZhhZurYxgkJ+LZRJUh84m3U+uBz9oR6HUJOWE=
X-Google-Smtp-Source: AGHT+IGmfuE34/iS7t/ABilOONPgh204qTrBC5hThmK7Epdqbo9BO6wPS9yuRfYvPmiHjsHNMN5woA==
X-Received: by 2002:a05:6000:1862:b0:38c:5d42:1528 with SMTP id
 ffacd0b85a97d-38c5d4218cemr3425899f8f.40.1738274081479; 
 Thu, 30 Jan 2025 13:54:41 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1cf560sm2994173f8f.89.2025.01.30.13.54.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 13:54:40 -0800 (PST)
Message-ID: <883592af-e85a-4140-b728-1380b764ce28@linaro.org>
Date: Thu, 30 Jan 2025 22:54:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hw/usb/hcd-ehci: Fix debug printf format string
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20250124124713.64F8C4E6031@zero.eik.bme.hu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250124124713.64F8C4E6031@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-List-Received-Date: Thu, 30 Jan 2025 21:54:52 -0000

On 24/1/25 13:47, BALATON Zoltan wrote:
> The variable is uint64_t so needs %PRIu64 instead of %d.
> 
> Fixes: 3ae7eb88c47 ("ehci: fix overflow in frame timer code")
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v3: Fixed commit message to match what the patch actually does
> 
>   hw/usb/hcd-ehci.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Patch queued, thanks.

