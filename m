Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1otDxP-00075y-QC
	for mharc-qemu-trivial@gnu.org; Thu, 10 Nov 2022 15:15:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1otDxO-00075d-Ib
 for qemu-trivial@nongnu.org; Thu, 10 Nov 2022 15:15:26 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1otDxM-0008N9-M3
 for qemu-trivial@nongnu.org; Thu, 10 Nov 2022 15:15:26 -0500
Received: by mail-pf1-x42f.google.com with SMTP id k15so3039150pfg.2
 for <qemu-trivial@nongnu.org>; Thu, 10 Nov 2022 12:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7kU1Fmm9CcGPpOr2iltM31XctOgHOsMqtXntGdu/Ijo=;
 b=iK4ESxze4WRcP1I9avKzOONE+8yF2PH7h583DKiZG2B5pyOQY/sPGlacjrlxsBRWmQ
 55RLpsf5HbnorXUGjt9ZDqy5kTxdOlC3dOCyvU05DoVO9GlhCW0xhk0KC6+z9i13nEuw
 hmJrK3YeO2WGqKaKDoRn1zqCu/6aeQDX3XR7z3kQvvg1DB+iSJxu23dXq8rrwVJMtQcq
 PedV4r6cICNq1O9/9Akj91Lb21tY7rZlp1SrQwIuCPkOHc0+sFD8eV/physxOuQvOtaO
 hUCxRuJ9+du/p5Sj7JYUPUfcw87F1DMmi6HT+AovUcuGOB5/+z4yyVcWn1OGaKnvQS7k
 p0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7kU1Fmm9CcGPpOr2iltM31XctOgHOsMqtXntGdu/Ijo=;
 b=ORM0W1i57wrW92diVQlP5mtfZv0tpi/jCH79ogKFknvGxsooBoWsAG8DK4T5fEWc+l
 ++siFUDV6Xoq70/rIJt7eU8RdL6ckYGxIC+cNh0L5w0aM5RHGyxVpoROKeVicbal//jx
 fzZ9CsreOUeXsC/1ahy7TeHUPUCJUieq3MCpu8ZQz2vnUCBMcAg1UnM4vnuvEfpidN9p
 yeyL4oIPudsAzN0p6Yyeg2wczwr+fIp4Rt9Ocyf6gOsjrDmsErX3MYdxBw1NixcInWBJ
 c0wmgk8YDf8tcd3ygdXKvF8YGltggGosgcANxzXxtmR/972AeEAQOYG8cBtJgzosQNjG
 K6uA==
X-Gm-Message-State: ACrzQf2menF1o6MBI4BC2EtrdsycZqB2Hf+KIGJ2XaRRmoV3Nldyyyud
 2M1NZ3Kk3oPNxozxXwHGRnWV3XLvUlGAUfbNzaQoAQ==
X-Google-Smtp-Source: AMsMyM5yesfqJvEC5D1lmY2SF1qtqo9hzNcYZchexjfWttfwzk5Yn2fdpw9XgtMBILNgNns5ZTclTA4DvSIG3hXN3nA=
X-Received: by 2002:a63:1d1c:0:b0:46b:2753:2a60 with SMTP id
 d28-20020a631d1c000000b0046b27532a60mr3143167pgd.192.1668111322768; Thu, 10
 Nov 2022 12:15:22 -0800 (PST)
MIME-Version: 1.0
References: <20221110190825.879620-1-sw@weilnetz.de>
In-Reply-To: <20221110190825.879620-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Nov 2022 20:15:11 +0000
Message-ID: <CAFEAcA_wAt7Jq=uCXf1jBT5z4-xRPMX-GZzTBBiy15456hEa=Q@mail.gmail.com>
Subject: Re: [PATCH for-7.2] Fix several typos in documentation (found by
 codespell)
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, 
 Ani Sinha <ani@anisinha.ca>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42f.google.com
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
X-List-Received-Date: Thu, 10 Nov 2022 20:15:26 -0000

On Thu, 10 Nov 2022 at 19:09, Stefan Weil via <qemu-devel@nongnu.org> wrote:
>
> Those typos are in files which are used to generate the QEMU manual.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> I did not fix memory_region_init_resizeable_ram. That might be done after 7.2.

I think that's a UK vs US spellings one anyway... eg
https://dictionary.cambridge.org/dictionary/english/sizable
just says "mainly US spelling of sizeable" and cross refers to:
https://dictionary.cambridge.org/dictionary/english/sizeable

and I think resizeable/resizable is the same.

-- PMM

