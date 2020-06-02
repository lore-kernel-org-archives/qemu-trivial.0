Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jfuPn-0007pw-CQ
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2020 20:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jfuPm-0007pj-C8
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 20:04:22 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jfuPl-0000Iv-2n
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 20:04:21 -0400
Received: by mail-pg1-x541.google.com with SMTP id s10so4236506pgm.0
 for <qemu-trivial@nongnu.org>; Mon, 01 Jun 2020 17:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j1M9zAXPkWvYRdEpExwmerllx1EZ1fUYeIdq+MamthA=;
 b=R7LNRGYfz8TBcBXqZd5awvoIF46r+vMjBuP6TAqhtagPnUz4LDtsmvJNVXCcABvKaH
 Oyq8ScgtN/UA6xmjdZjdqES4E3R0fterS90KuyGZeijZX0YIHB4Y9vKxpbXik0Ewho8T
 XQ0hCmhEUFnY2g+5JXqE9PG6bMttRt2xDZG0I7DEZL9ajA9u5vgsNk+FUF2/et1nkmaA
 upcVrk1nFAkt8j3T3KE9J25J/K2P6XvXzHBe36KvHxv2ALoqALh9KhqOVP4n3tIifNLz
 EBa5dufcobzW/rDUq8k6hD1bb9zGdOAUgzKC8GHAxnoLiVF065QP911P8ven2xpVo67q
 vqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j1M9zAXPkWvYRdEpExwmerllx1EZ1fUYeIdq+MamthA=;
 b=tWh8NaUshWV7Jy9dXxggF0y574KIDy7lElUKBeRA63KTlwbs826f74h9zvVYs2dDNn
 AvCv80NBa85RpIkiaPRwVfPQbjuR2vXom0nQKkHRzPzE1vnwhYe2n/GctdFkJB09/tzA
 OirLNEpxQVamC/olvgfwLoOLqaIshsG0XaMCQcxVSvt03CIxmUiV+CacexrsU0L0NipX
 MZ5rZYDsdvTVH4zq0LRsmh7H3aDYThIrES9XHPnJPMCNv30OwQ1RI0ie794HTcEnImKc
 KuIZmxbHpjJ11FkpE9dJpucxPRwSC7l9ztgD4Niez9D3OPSo3GdUv47DTycOmLmiI/y9
 5KSA==
X-Gm-Message-State: AOAM533cFcqz35Fux35jCh2GCfmJ3XSJuCm98vyF76b7TVmoS0MAkPfR
 lM3KAmbSBik4tF8z1waC6eK4OQ==
X-Google-Smtp-Source: ABdhPJxv/zHbNONk0k5E8rAvIDQQ0qTNyEAT7T2sBSnhBEHMpCIZ0Y+KlPjG3WKgUx2bM+CNV+qFkQ==
X-Received: by 2002:a63:e60a:: with SMTP id g10mr22166792pgh.210.1591056258962; 
 Mon, 01 Jun 2020 17:04:18 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id h7sm492258pgg.17.2020.06.01.17.04.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 17:04:18 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] exec/memory: Remove unused MemoryRegionMmio type
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
References: <20200601141536.15192-1-f4bug@amsat.org>
 <20200601141536.15192-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8cf677b5-75b8-a0ed-7951-44c75d9f102e@linaro.org>
Date: Mon, 1 Jun 2020 17:04:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601141536.15192-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 02 Jun 2020 00:04:22 -0000

On 6/1/20 7:15 AM, Philippe Mathieu-Daudé wrote:
> Since commit 62a0db942dec ('memory: Remove old_mmio accessors')
> this structure is unused. Remove it.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/exec/memory.h | 6 ------
>  1 file changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



