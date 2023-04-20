Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppUmW-0008Tr-EI
	for mharc-qemu-trivial@gnu.org; Thu, 20 Apr 2023 09:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUmT-0008NL-Pg
 for qemu-trivial@nongnu.org; Thu, 20 Apr 2023 09:57:02 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUmS-0005Ic-AD
 for qemu-trivial@nongnu.org; Thu, 20 Apr 2023 09:57:01 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f17b967bfbso19922215e9.1
 for <qemu-trivial@nongnu.org>; Thu, 20 Apr 2023 06:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681999019; x=1684591019;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A2kn8gM5GK/RBCNXb3Hfg+xGVzZ7hCfN/ENp4GY4y0w=;
 b=Fy08XjFwkhnUQg6QE6VJrSZNQVBIbRYHdX/gHSlQ31wHwdmNo109y1xWouy05yHoBF
 LjMfqMbCfESbCgcb99rg8Wfw2+W5VoeVmcaL8g5C5NfOXWnHdOoONEPpq7ZUNL9PDoZC
 nhyf3X4WDmXHSxIo5L5uXxRfGdw+eoYQ/jawQ0pAT9EoRoqtCXFBhNxBJgchJj/87Xc+
 KEwqYSeV9MhiOn/1Qe+qKEenEG6qu5IroDFLbOFO/VLg/q7pT96QW/21CwXoDysZ03+A
 7iK9FV+K14zFxShQ0kPgrjEAijJbwOojLdVJguoB/wyKxmI3d0zu2ZEYqyaS4jkZt0bA
 uekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681999019; x=1684591019;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A2kn8gM5GK/RBCNXb3Hfg+xGVzZ7hCfN/ENp4GY4y0w=;
 b=Xk6L5yZ2Tq4Zyd96fDayRrrzAaAdU6hyQzpmucGHuzKP9v4ZdG66XLZ1hRWGmpWEOz
 ZPKkhkhWlGNztKl4KncNbDiGkQXeCbpVmeXlx4FpMgsfvqqsqcFC66wwOhIUHlFgMoT0
 ATkhS4Z+58NlHK9dQOianRFSjjil7xjNy7avPxtVUe+9dzs+5n8IuHWqtK0n6WAXS44T
 MIU2NEJkBHbNd4MjXNSOXDXEkjC+y8N2k/gJ4bqu8AC4fln2QqAbSr145++VxuU/giG+
 wL587CDswv1ohO65aJrz5rlkK96D+CtqKGJnlemavDw+Jq/qoQvyI7fpmclIQd+QP2gH
 4EcQ==
X-Gm-Message-State: AAQBX9e8pHTHbqDzf6ic1kD+bksKH9Qf30O9KPA2KELHva9XXy2zREHq
 oYBnjF4l7TBTwf9b0Kyr6ROBOA==
X-Google-Smtp-Source: AKy350asLyTIKbYBNgEZmqg8ZXtng3ccUnwYewLpVAhEMVUBWPPSV1eEatTS5mgToC0a8E1CmBTiVw==
X-Received: by 2002:a5d:5551:0:b0:2f1:ef98:8d18 with SMTP id
 g17-20020a5d5551000000b002f1ef988d18mr1276102wrw.26.1681999018956; 
 Thu, 20 Apr 2023 06:56:58 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z17-20020adfdf91000000b002d97529b3bbsm1994509wrl.96.2023.04.20.06.56.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 06:56:58 -0700 (PDT)
Message-ID: <1a15dd65-b88f-341c-fb40-4fde56783d4f@linaro.org>
Date: Thu, 20 Apr 2023 15:56:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/rdma: Remove unused macros PG_DIR_SZ and PG_TBL_SZ
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>
Cc: qemu-trivial@nongnu.org
References: <20230419103018.627115-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230419103018.627115-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 20 Apr 2023 13:57:02 -0000

On 19/4/23 12:30, Thomas Huth wrote:
> They have apparently never been used.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/rdma/rdma_rm.c | 4 ----
>   1 file changed, 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


