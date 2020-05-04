Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVelA-00043H-F5
	for mharc-qemu-trivial@gnu.org; Mon, 04 May 2020 13:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVel7-00041t-NJ
 for qemu-trivial@nongnu.org; Mon, 04 May 2020 13:20:02 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:34200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVel6-0003bv-DT
 for qemu-trivial@nongnu.org; Mon, 04 May 2020 13:20:01 -0400
Received: by mail-pg1-x544.google.com with SMTP id s8so74995pgq.1
 for <qemu-trivial@nongnu.org>; Mon, 04 May 2020 10:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zZVm1hsjJOS2dQ7dW9OoeOwkjogB/hb3t0l+Bm65tww=;
 b=Fk+l2J9Mh1hmrDmclYjn054qX72sK8aMp/F7IAEOcQtXIjRCiqQl0Hh3O/Wkn7xuuv
 ys3+QsA3+gMGp1JjRZELYsevpWycniQQQRg/WB1yoZ0CavoiFFBkxTtv99OYWNBkxM32
 Lqrn+DRMr7lzL6OXOU2wW+/MXdsaB4EFWzwgphpjMyM9/k50Y7gcfEEvgcyosA6GpIDR
 NP0dEHx0+5cuI4SLHURjQFlNPkcxYNz1jAv0ePmcH3if1fn6duX500lH9yRGswtNnvdh
 sQAmcBicho5fLrrJeSDFuGhdQswZGKTLLdXLSl77yuQ8cmQTcqVYCdsCl4DXYA2krtlg
 Bpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zZVm1hsjJOS2dQ7dW9OoeOwkjogB/hb3t0l+Bm65tww=;
 b=BANT0AQzFpJXfJ/fRmisfoa+nwDCyPjwaWI3Ma/I4Xr5MWVfZtD/Ma1dF3D09BUKVI
 qlRXeBLOOgsOiYYePFxIoX4jGriXGScEceXiIsDuKSeamI74wo4jUthOIiR38kB5NNdn
 e2FIfmr1lmguxQLBOK6qVfBoLPVr9uYvAGBmtT+KMRGu8gf8Va93dwlOo5ui+ZstS7Q5
 CQD+xtYBbNH4fdskpcKUYt9ahX3X78RH2zIUGYvA0P3D/WeI6mRmmMawcB9ridH6Om1o
 OHJuBMOU8gzVjeVAGA5vSnRTbpZrUEo0c6farwn14bkvqxUro7nfMkmogbn6YLBID0yC
 Q37Q==
X-Gm-Message-State: AGi0PubEOXfXNKCF9MFktxr1tyBmkwnlDrZAf/gxv7Atp+A7RUiHkPsH
 TvrKbY1ce8MHtR5Kav23fL2WVQ==
X-Google-Smtp-Source: APiQypJtK6ZbyvcZHHYS2rPDtF+Za+aUjBzuVzWqoMBgQl8H5jWo9waeYtCBpHG8A8zjpaqt81uF9Q==
X-Received: by 2002:a62:2cd7:: with SMTP id
 s206mr17912726pfs.183.1588612798895; 
 Mon, 04 May 2020 10:19:58 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id a23sm9286109pfo.145.2020.05.04.10.19.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 10:19:58 -0700 (PDT)
Subject: Re: [PATCH 1/3] hw/sh4: Use MemoryRegion typedef
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Magnus Damm <magnus.damm@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20200504081653.14841-1-f4bug@amsat.org>
 <20200504081653.14841-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1fda6a7c-3b29-3a71-5143-a61b879477c5@linaro.org>
Date: Mon, 4 May 2020 10:19:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504081653.14841-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
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
X-List-Received-Date: Mon, 04 May 2020 17:20:02 -0000

On 5/4/20 1:16 AM, Philippe Mathieu-Daudé wrote:
> Use the MemoryRegion type defined in "qemu/typedefs.h",
> to keep the repository style consistent.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/sh4/sh.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


