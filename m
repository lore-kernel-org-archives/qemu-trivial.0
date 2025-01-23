Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tb5O7-0000En-BS
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jan 2025 17:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tb5O1-0000E4-6O
 for qemu-trivial@nongnu.org; Thu, 23 Jan 2025 17:09:20 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tb5Nw-00055F-Q2
 for qemu-trivial@nongnu.org; Thu, 23 Jan 2025 17:09:15 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4361f796586so15430375e9.3
 for <qemu-trivial@nongnu.org>; Thu, 23 Jan 2025 14:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737670151; x=1738274951; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=toakulm61GOmz1C+G6Cl0lHLUwBaHc7++f3+BYu1QlE=;
 b=v/Ya+V4gLFJtMjmS9jHPOSsNJaAmfm0THYg8muOaZqHHSa7p4YcIjvjc3w8ovxwp9A
 HHFpjSs2h+zjT5v/RXGyL54suh70LT9gniO/2AUP8tRnTrgKrTeXinZxqX2uqjdHKyv/
 hUYzy/YHqHvvQFPFD7Wzm9Xcd3WldGQZrQq+/vom0UrwzB71x7Lt08oriRbKo7PpmWD5
 Ufgi96fo1H11tde/hQBMhKWsa6SUiU5sH63LBVsdb2DncRNvXcnX7w59i3Y8GpnnEf5E
 hEQsUj4ut2lFM6sb3MNtVjLara3jYhkTFeT72DTrQAx8yYCh/UbapN1L5Pf8Tq5RB3NL
 AfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737670151; x=1738274951;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=toakulm61GOmz1C+G6Cl0lHLUwBaHc7++f3+BYu1QlE=;
 b=eGzPJjdztA2hZ5VKtnQNUYypbgliaY+5F4swCragDWc1jPGYQbErhmJe4fEhi7lBa3
 E3OiaZWTDYF+xe2LXMg0mo/3K3GsO+B5xp0b7gWFHduGZzIclTnXCNCnG+99sXptz3QP
 SxXDyozbMIvVWzQB0PHizJGbsVSN73eEdm6IwQXS2oZ6AzDCQwtDgjusP7lzuejhyz6I
 9OTshlMWfhBcxLnDQhVbZo2YJyqR6y09JjYps7RlxKW1NCkUGu+fUYsjBSrvAswNVnCf
 iwDeGhIRL4/dVTRFh0noadJH9zh1rdpUM2YhBf7dfI7ZMETyy9Y0TQVW1aZB4yFwuHLO
 xl8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsvUdojCkDLy1qrP6Yz5LP8/HI1ji05PTYb+Yhm0WWIcHA6FcNR/o392ApEcwVzTEvo4dMmZIiOpwa4i0=@nongnu.org
X-Gm-Message-State: AOJu0YzDcqV8ncSuk+fnDI4jbLV0Y21QLrdmV2LOxVwidEzUs1O7y/GM
 frsbnuJ/wi+9IWWxWBot1rltl9uCFppFzPnMB1uSHPLyXRm5A7us6bmtvhjKgtomJ0F8lBRsBGU
 WN3o=
X-Gm-Gg: ASbGnctqYI4nnfrYiL5je6O45G/UVMaHLQJE4UNhRZVEslCP9XdCbwvldzWRBDglOht
 QzklXIlF4CpKB4528Kc5QqoVUfQY1Tp6ZgeuingkJmDbKOA7iCaNQqyVJGlw6o3uWOYxtqiYrWU
 1MC4ojWuaRFX5qEiEw/fycJ8sr5UB3PdeDJJY70y5Q/QhLh/guUm0bTzsvqPCRBNq8QTc/7PLOY
 RQEhL2E4Jt+WkOJipOhfdQmt7ZufbAQrVr1bGvAe2WKZ3n0YL8teVvGECa3CFSEsOgYwn3Hdjq0
 /xJqoCAvwWhnnYTLj+WvwWa/GUlfuC4uqxygN+Mq5ikC6/sl
X-Google-Smtp-Source: AGHT+IEgwNfyFVjEC06KcZmhd6zPizj/s2bcBB/LXfAVoz5OCX6vwrl1aCd/u/Q+2V/mR9EvdYJ0Tg==
X-Received: by 2002:a5d:47a3:0:b0:382:3959:f429 with SMTP id
 ffacd0b85a97d-38bf5649664mr25655957f8f.5.1737670150778; 
 Thu, 23 Jan 2025 14:09:10 -0800 (PST)
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd54c0ecsm4617695e9.30.2025.01.23.14.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 14:09:10 -0800 (PST)
Message-ID: <afabb48c-2bf9-42dc-9aa9-f4341285ec38@linaro.org>
Date: Thu, 23 Jan 2025 23:09:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/usb/hcd-ehci: Fix debug printf format string
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20250123214831.401B54E601A@zero.eik.bme.hu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250123214831.401B54E601A@zero.eik.bme.hu>
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
X-List-Received-Date: Thu, 23 Jan 2025 22:09:20 -0000

Hi Zoltan,

On 23/1/25 22:48, BALATON Zoltan wrote:
> The variable is uint64_t so needs %ld instead of %d.
> 

Actually the format is PRIu64.

Fixes: 3ae7eb88c47 ("ehci: fix overflow in frame timer code")

> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/usb/hcd-ehci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
> index 6c4c14c895..23b3e20fdb 100644
> --- a/hw/usb/hcd-ehci.c
> +++ b/hw/usb/hcd-ehci.c
> @@ -2287,7 +2287,7 @@ static void ehci_work_bh(void *opaque)
>               ehci_update_frindex(ehci, skipped_uframes);
>               ehci->last_run_ns += UFRAME_TIMER_NS * skipped_uframes;
>               uframes -= skipped_uframes;
> -            DPRINTF("WARNING - EHCI skipped %d uframes\n", skipped_uframes);
> +            DPRINTF("WARNING - EHCI skipped %ld uframes\n", skipped_uframes);

Should we take the opportunity to convert to warn_report()?

>           }
>   
>           for (i = 0; i < uframes; i++) {


