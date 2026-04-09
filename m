Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AA3EA3C23
	for <qemu-trivial@archiver.kernel.org>; Thu,  9 Apr 2026 10:08:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wAmJT-00047V-HG; Thu, 09 Apr 2026 06:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAmJS-000477-Kk
 for qemu-trivial@nongnu.org; Thu, 09 Apr 2026 06:08:38 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAmJP-0001ab-Hc
 for qemu-trivial@nongnu.org; Thu, 09 Apr 2026 06:08:38 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43b949bf4easo370369f8f.0
 for <qemu-trivial@nongnu.org>; Thu, 09 Apr 2026 03:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775729309; x=1776334109; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=czwoU/ZfheHOAdi+mpOX47DQyo69hYcINikhCvUDFnw=;
 b=D/Q7uVVcmnIuwaOUGTZy5Zd3/fAvAHg7IzBGTAPP+NB38LaQe87Fe2H06Kt7WAOfRg
 z+G9ikNO2lQSahfs9uihWMfD7cnGPhJfePcOtwY4qL5Ouc6x+hPIH2XUHyOqbc1REsAw
 Lo3sQXqNSlbelw4pCkb+SyDeZsaB0xis7FE/IHZZRXizrwSNPtCH0V/JTJ8r+3aI9Oew
 0Q9luuxTOBtSEJBMi6E1Hm/nxFsCXljYQZSXD47AdE9Vha37ntbuKWx/c0/mBb85HUxP
 Qx8M0IPzmShE+9a8VbLLfOfDQa6Jcyja4DRw2fJA3wmKJWsQDA9179AIL1V7h0zBOlaF
 LLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775729309; x=1776334109;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=czwoU/ZfheHOAdi+mpOX47DQyo69hYcINikhCvUDFnw=;
 b=MDd8QfjEQwkCOEvaaowNH6fZQoeYN/eZAQImLrqcwla3izeVdZuUKH8bBcoTTLMOZY
 W8GGRkK9bYN6gYY6mQlsAMpr24lt/xf6ayn/gS2Rc/MVSEwM9Xb/3M+Pae8Fsa5iGs2S
 USuss6hhPPCxizm6uImD8O8krOg5BJxsVnZu4taRLYbDh00bYnu0SjFKuBlnCkzjhRhj
 +namSKvkFZbhA5QjjDdMDWqN+D/STwfN+EzMkLroXlaYIWv6qsqPq1zdLo5bF9z1dMf5
 XGkKqC8jQxumTNgORGeHocHD/SRA9OtbIPi9LmaVEKwrfGbgagJ1xowIiNwABuTOYFpz
 zmzA==
X-Gm-Message-State: AOJu0Yxte2xCUr22OhRE/qxi29pqtq/piYjFigEuvLpXl/88vEs+qtZa
 jiCj0x+4IUFqM6pNQQX3cJ3uTgGVGmfucJmF7AQn9fYVyWKF/snFJtasRsawZR9FpJM=
X-Gm-Gg: AeBDietU8oYFu55VFktpAdNwDmJm4GKQcj1QRN+yUFaOWvtcQ1UtqQvbE59Yo1Fn0Hb
 Ce6gcfj/3J9bIPSDqZ7ZzPm9CMSK2oDcURtYmu8nNifOEvUfwFZm3uiDFG+eTieHcRpbgg204OZ
 EpojGl0GkTObRvwFgAWoqZ8Ig3y1nVsJ20pqlH63b+KZVjhFyfY3lED70M0wp++B8VvcNZcR7BC
 xxvS+fXDcuULTiJiXRoOfQLziE7/ijHw/O3u/JVimiBbBByj29vPbIbm8FFjbOx9kpJzmp5jTu/
 AwSZFwc32cOUoC/Qthi1QX3U/JpcGco4X4Rpq5E6G34h/jdBG8nz8IaMoQOg4P6n2IY25WHuTj7
 SZkfcvwloDAh5AqHk0e/rzG0jyZZ0IjpNJfcBGdy6p/a5nlrNxs/9TW9ljhst6HzPZgo96FJ/S8
 k2uw4aip5zdhKXmBBLXwCOJf0igEHfgHhWk6Oo6sH/uMGlX2SoU6lurRC8DkQWryk4SA==
X-Received: by 2002:a05:6000:4804:b0:43d:21a:9a44 with SMTP id
 ffacd0b85a97d-43d595cd756mr4119926f8f.23.1775729308741; 
 Thu, 09 Apr 2026 03:08:28 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2a6f1esm64076836f8f.2.2026.04.09.03.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 03:08:28 -0700 (PDT)
Message-ID: <68377029-7ee8-4e8d-8ac9-9e278527725f@linaro.org>
Date: Thu, 9 Apr 2026 12:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] qemu-keymap: fix altgr modifier lookup for newer
 xkeyboard-config
Content-Language: en-US
To: Dietmar Maurer <dietmar@proxmox.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20260408091459.4001711-1-dietmar@proxmox.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260408091459.4001711-1-dietmar@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On 8/4/26 11:14, Dietmar Maurer wrote:
> xkeyboard-config 2.37 removed the "AltGr" virtual modifier in favor
> of mapping upper groups directly to Mod5. Since then,
> xkb_keymap_mod_get_index(map, "AltGr") returns XKB_MOD_INVALID, so
> AltGr-based keysyms were never generated.
> 
> See: https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/commit/473f9bc32f9ba869829cc0d06a75cd1f2560aa60
> 
> Try "AltGr" first, and fall back to "Mod5" for compatibility with
> both old and new xkeyboard-config versions.
> 
> Signed-off-by: Dietmar Maurer <dietmar@proxmox.com>
> ---
>   qemu-keymap.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/qemu-keymap.c b/qemu-keymap.c
> index 1c081db287..d4dccf456e 100644
> --- a/qemu-keymap.c
> +++ b/qemu-keymap.c
> @@ -230,6 +230,9 @@ int main(int argc, char *argv[])
>       shift = get_mod(map, "Shift");
>       ctrl = get_mod(map, "Control");
>       altgr = get_mod(map, "AltGr");
> +    if (!altgr) {
> +        altgr = get_mod(map, "Mod5");
> +    }
>       numlock = get_mod(map, "NumLock");
>   
>       state = xkb_state_new(map);

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


