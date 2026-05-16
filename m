Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB06CD4F21
	for <qemu-trivial@archiver.kernel.org>; Sat, 16 May 2026 10:14:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wOC1n-00071J-6X; Sat, 16 May 2026 06:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOC1k-00070g-E2
 for qemu-trivial@nongnu.org; Sat, 16 May 2026 06:13:48 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOC1h-0000W7-Ud
 for qemu-trivial@nongnu.org; Sat, 16 May 2026 06:13:48 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43d7645adbdso317914f8f.1
 for <qemu-trivial@nongnu.org>; Sat, 16 May 2026 03:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778926424; x=1779531224; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aV/1cApKNwYVvN0e/S/LdinI4hIS4q6XIGhm/zlypPQ=;
 b=WIi1Wln5OcVmzNYzQMfFN4pZu5Gto8vuYKmzp683DoZh/sv28da9h0+HGlbqWwuv/o
 odspf+HPebPpRNu0I7hnav0WqBYo7SU7UWA/+5lUm3ZUsXMfTG6sgYcI0mp5TMmgHyOE
 e6XbUDebCmvrd2a0qq6qhDPQTZIykfUpLJbcxGKnC3Xk/MB/YTk8iLy/pvU1VwoUrdj3
 EVR/V6mt9PsYGrr0SFibPpjiiFvtcD55SNg/MUrntF3f6AyqLnEYtj2ssNhKau+czc/G
 pWlmAPAXQzxYhf8BTgQhub9bJCVMxSy1oJPyP+BzPkzqFIZGLfj05ZKwRULU0J6UaqOT
 lNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778926424; x=1779531224;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aV/1cApKNwYVvN0e/S/LdinI4hIS4q6XIGhm/zlypPQ=;
 b=WEpityKzQiN45mBJ9EGLnrrPOXkq3M3xhbpIfl9JK+HJJU2wZL5IK/RxSxRytIdV4s
 GCdeMxEKXSoMhO/Ybms4tjh0VjAoLsC3DJcPvApaxJEAeN24ICC3Ddilm7URAs4JSqEe
 AV/fJzp9HPNId4uAk9hZKnFSKwNcKsTeBGTj5LV0JH8OyILjSrPZ91FWpToxtVIhsYNL
 YsSfTL7TVP0cNfu8AA+fWSX2VF+zK5z+KLyOo1xHYJNtwZzcup9SWp3d4j4OR4Dcuk5D
 aMw9VISe9wUc3WffMejuTsklvhPyxQylEshUe68cDuUPwOHqPidCtWRyhH/3R1ouPf2U
 lKjw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+xtOkLGjpcJv8fLZAcNhkjNvW5rIC8l5bybt+K8yqWALuQTpxjAt+AvPLscSHUTxvStxlHj7JNEqRKLv0=@nongnu.org
X-Gm-Message-State: AOJu0YyWSd6fkksonS5Xns1oKfTQbr1ObX4vG9kQ3q4MLQvN0P8vdjdt
 Yr2iX1KNH3QEVrds08XlskONBmgI/omFxU427gD95SzNWIejBCXi0Nu3QVdwx76nZf4=
X-Gm-Gg: Acq92OEy+9ncXpJRdg02W45yWUsS1ugW/IWmXRgc5HGUCngRiWPk9jwPOtTnPIzfeMN
 POi0QCF36zpq8L1CjwySydBjFaKmwixczgf9DQMaLM91BtwSAD0L0yyeQXbkIJ987DyVHV8J/U+
 yecumUs0cpWXKF+JBhuasO6B1auO8aT0sS3+WOi/A/5d9/M8jopJtMGGEadBxEBQQCUCoYOGvyH
 aP7ViEh9wJLn4+DPvAu5eyybHbqclZFPPMiMC2RFMELmWQDyFIw9447L+bPICFMDczwmgH7qtzX
 VwT/0iq16xZBkhdINBtVB7T07lUU5uZtBy5C9EWPnk0HoQDicS7WbLyZ/ub85G6+LFxFT1Ops+Z
 H0FaqyqJNGBNQKhRqLnTF+cMwwgMvIhbibaahgbBoIRU9PNpCLrTlOBcWwIZ7PH7dCCalavVa8A
 ilgxenOWpuuBLqNPVg82f4Tceicfql9jW5/Xzk5dJ/ZHKY+NkAi+41O+ffmCEVqPzA7Q==
X-Received: by 2002:a05:6000:290f:b0:43c:f52b:8003 with SMTP id
 ffacd0b85a97d-45e5c5a576dmr10138116f8f.36.1778926424004; 
 Sat, 16 May 2026 03:13:44 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a1a22csm20352838f8f.19.2026.05.16.03.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 May 2026 03:13:43 -0700 (PDT)
Message-ID: <1aec7543-ea5a-482c-a42e-fb1cdb0e7498@linaro.org>
Date: Sat, 16 May 2026 12:13:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] system/vl: Free allocate memory for pid file name in case
 realpath() failed
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Cc: f.ebner@proxmox.com, qemu-trivial@nongnu.org
References: <20260515143854.2010741-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260515143854.2010741-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 15/5/26 16:38, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> In case realpath() fails, the code returns early in the function
> qemu_maybe_daemonize(), without freeing the allocated memory. Add
> a g_free() here to fix it.
> 
> Fixes: dee2a4d4d2f ("vl: defuse PID file path resolve error")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   system/vl.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/system/vl.c b/system/vl.c
> index d2f4044e5d8..7e2ed898240 100644
> --- a/system/vl.c
> +++ b/system/vl.c
> @@ -2670,6 +2670,7 @@ static void qemu_maybe_daemonize(const char *pid_file)
>                   warn_report("not removing PID file on exit: cannot resolve PID "
>                               "file path: %s: %s", pid_file, strerror(errno));
>               }
> +            g_free(pid_file_realpath);
>               return;
>           }
>   

Don't we also need to release the other paths?

  - qemu_unlink_pidfile()
  - pid_file_init()
  - pid_file_cleanup()

