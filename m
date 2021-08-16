Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mFgij-00089T-2a
	for mharc-qemu-trivial@gnu.org; Mon, 16 Aug 2021 13:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFgih-00086Z-E6
 for qemu-trivial@nongnu.org; Mon, 16 Aug 2021 13:48:19 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:42818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFgie-0002eo-NU
 for qemu-trivial@nongnu.org; Mon, 16 Aug 2021 13:48:19 -0400
Received: by mail-pl1-x62d.google.com with SMTP id w6so14561427plg.9
 for <qemu-trivial@nongnu.org>; Mon, 16 Aug 2021 10:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=da5b6EAzCg1VuPVtZq3IevHtf3cSK+b+kn0mFeEIPn0=;
 b=C+UUIjflW3Om2HumaBbiyG8rXNYBZaHwVGH/xqiuSUvHbpCT+zeMJ4ZbnHbOIQRRpN
 s38gFefFYMmapS0i4NkDjQVDBciH6anGT55Xt2xtxh1wL6BkXuaj00p9T05iyFSMCsCU
 PpAe9lsSoPPQpbXyMp9pOakAiWkbqpT+Kap5ygQQsV4QqVXQAo4l2Z5ncBM4ntYcZWk6
 Z4b/cg4DNsA+L5TSmtfDA9BzbZO/7OCXDIqDJELuOEsjEnV0qlJrp+zxjS9Yn3aqzHXo
 bJrIcdbA+tBcCpJOVDKGDj/sTOtcqGFwjGPc4K1X780nPAh69VYxGhE6K21WxGIA3JiW
 +Fjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=da5b6EAzCg1VuPVtZq3IevHtf3cSK+b+kn0mFeEIPn0=;
 b=ABzdOAyXfIOoroAdRzQpAtPOci+ys4I1H7DcL0wMdO8wTVFvYzYOEi8mckUPqs6QJx
 +bHkD83kqg1HDqDGiVJHqWd/AUF3qOxMZ1qKW0I67MGNenO+MxmWnaFtGDrl//CaKXoG
 gqb6KAGfm2yPCPiZ0bBLSvxtXjkdF1ACIUAR9zSSCyl+bfPuEgkQ7ysc/hvisZDNmU1U
 FoSW6PJ43im9sz0TikhM+ncWTd2tUkdKXNqtx5pTuFO4ItP4clMJRW0tHHnJJzTCZ+EN
 dnHzwrkz091sIkfmGomYjkGx/JcWAnOhStFBfztTkcmgxGcp8eSEkkJgoOYK+B2Nw/RJ
 RthA==
X-Gm-Message-State: AOAM530CWcabvNVpNc6iGuqkeU5dZX20yoHTixP/vFs4W07cnSiFe75J
 7W72Y0OF5kaZhEIH2VtcvzzVag==
X-Google-Smtp-Source: ABdhPJx6KiO6+ZZ3R0Ru00cYaAjn88dm1ka2krGuE7HoVoL8JkNCcbwZvsk2UyiSa4XX6Ukj19iVrg==
X-Received: by 2002:a17:902:e786:b029:12d:2a7:365f with SMTP id
 cp6-20020a170902e786b029012d02a7365fmr10926plb.21.1629136095086; 
 Mon, 16 Aug 2021 10:48:15 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id k130sm18245pfd.219.2021.08.16.10.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 10:48:14 -0700 (PDT)
Subject: Re: [PATCH] accel/tcg: remove redundant TCG_KICK_PERIOD define
To: Luc Michel <lmichel@kalray.eu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210811141229.12470-1-lmichel@kalray.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <04c9f979-fbf5-bdec-711b-595436e9b6f3@linaro.org>
Date: Mon, 16 Aug 2021 07:48:11 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210811141229.12470-1-lmichel@kalray.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.71,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 16 Aug 2021 17:48:19 -0000

On 8/11/21 4:12 AM, Luc Michel wrote:
> The TCG_KICK_PERIOD macro is already defined in tcg-accel-ops-rr.h.
> Remove it from tcg-accel-ops-rr.c.
> 
> Signed-off-by: Luc Michel<lmichel@kalray.eu>
> ---
>   accel/tcg/tcg-accel-ops-rr.c | 2 --
>   1 file changed, 2 deletions(-)

Queued.

r~

