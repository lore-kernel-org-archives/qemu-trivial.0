Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGsZn-0001Oy-Nv
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2020 19:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGsZm-0001Oc-Ag
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 19:35:30 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:41978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGsZk-00065X-Q1
 for qemu-trivial@nongnu.org; Fri, 11 Sep 2020 19:35:30 -0400
Received: by mail-pl1-x644.google.com with SMTP id m15so1605193pls.8
 for <qemu-trivial@nongnu.org>; Fri, 11 Sep 2020 16:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gy9ew762Kz8uAcIp89Zw7N6msNMi6asxKV4Mu1sd6/4=;
 b=Nobw/yhLj2jWrtf+pxiOb5rRm/xgka26iOmvDiSC3KT5QRYuPXqZu7yqEAPq3gbw00
 0sRD9sYmKOOohpNu5/wlZeDkWfanHzRyHhVKmYt0xkili02zcukPx4qd6ZSPRwC58DLz
 lWdmUbdOFOwMpSpNxSncpozdbv8IY3SWW7XLLeJXQthwvXSsOQCA8dtYAuzRhIpDqKMG
 OkMRCiL+csjgBw/Nvd59ywjqKY+agDeVnprtpuDUSFAW/0W1Mhwx8P1SuwH3qiUN6poS
 GYbYV6TXcLsKeBtc5c4h5QTC493aJfrm/oBIjr/l6rvbGFlwAYShDHMvUwxaDV1OOX+C
 Upzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gy9ew762Kz8uAcIp89Zw7N6msNMi6asxKV4Mu1sd6/4=;
 b=cqNiiIT4ZTOam50sLFpgewFpYoOELK4+/i4bQ6w03KeT0nTEAjdqkOItHVqAjXkioq
 udcTOO1FBqcEpHxqBCIS2nLZ5c7yQ8SEOaV+u43fInPCkPDYXJTGas+meF29u1Zy3Qld
 CqPPNqPiq8xesg4JL1qVroW9EY/romLWJgDuI0ob8g4yTp6uEJMT0pAy7/DPHz/4sU9q
 PRkeOVECJNeAfHLEjAB6CVCnerXTElIWYhtfB035tZHfYCmsa0wckKAAbDt+3iU5xa7c
 x+EB+NXNftPCJQvuPHm1o8Fo8tOKihXqpaUsYQOFtMuKdjG2o7am6BL/PKmqq8w9Z/ho
 LF1g==
X-Gm-Message-State: AOAM533HWbdhQ4hfJi4Kk5TqOQuzwWWModECxgw6CmsvJnv2Uiqg5Hh0
 m6Az8zRK1HzDSsqiP37PBpSgrw==
X-Google-Smtp-Source: ABdhPJw0E+YM8CiAuUzIr6bZ8d6WRqm7v8kuzmMaXnsqh8Or8HfKM/NcP+9SXRzX0SuiUDV0mWhX6A==
X-Received: by 2002:a17:902:a40e:: with SMTP id
 p14mr4158367plq.4.1599867327150; 
 Fri, 11 Sep 2020 16:35:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 63sm3298449pfw.42.2020.09.11.16.35.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 16:35:26 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] hw: Replace some impossible checks by assertions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
References: <20200910072325.439344-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7996e747-9163-649c-9477-3d437bfecf60@linaro.org>
Date: Fri, 11 Sep 2020 16:35:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910072325.439344-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.469,
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
X-List-Received-Date: Fri, 11 Sep 2020 23:35:30 -0000

On 9/10/20 12:23 AM, Philippe Mathieu-Daudé wrote:
> Trivial patches removing unreachable code.
> 
> Since v1:
> - dropped patches queued
> - replace dead code by assert (Peter)
> - use PCI_NUM_PINS definition (Cédric)
> 
> Philippe Mathieu-Daudé (2):
>   hw/gpio/max7310: Remove impossible check
>   hw/ppc/ppc4xx_pci: Replace magic value by the PCI_NUM_PINS definition
> 
>  hw/gpio/max7310.c   | 5 +----
>  hw/ppc/ppc4xx_pci.c | 2 +-
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


