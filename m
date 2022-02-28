Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOiqQ-0002U3-SF
	for mharc-qemu-trivial@gnu.org; Mon, 28 Feb 2022 11:25:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOiqP-0002To-0G
 for qemu-trivial@nongnu.org; Mon, 28 Feb 2022 11:25:53 -0500
Received: from [2607:f8b0:4864:20::1129] (port=39676
 helo=mail-yw1-x1129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOiqN-0002K6-Ei
 for qemu-trivial@nongnu.org; Mon, 28 Feb 2022 11:25:52 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2d07ae0b1bfso114438327b3.6
 for <qemu-trivial@nongnu.org>; Mon, 28 Feb 2022 08:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UtmoPfY14gyLzpaS2ZlX1hn8t0Iapwg850tKuUZJPm0=;
 b=btovMQEEB82IuKUDGArTBd9l/ZyjWi7TK5zJgvtRzunNoFPcaqiQEAOKimdHPff23S
 vbvo1K3rsNA9SzdAWkVxanyol4rS+lgZxTlqM1DyK1vmJGDwsFdvF6RmXRv7kWAXf/A/
 HZbtrQ5ALUQ1apj4n5zeiV7Qr8ump1H0MR1uJxzu/Ub9RJUIzoOPzWbcnSkitNuvXqGm
 oF+wIQaOntbyNC3WxbyCpS/CAJXKyNq38Pt9RpWVWjiHfUdE4abjFgWBUZGb2MHKdRPm
 SjCqNbz+waXm2PQgPCbbiJfu3yxg2GA1CMfJ924IRvC3QTSz/+Xs/JEa7UJYmohqCdaF
 qigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UtmoPfY14gyLzpaS2ZlX1hn8t0Iapwg850tKuUZJPm0=;
 b=MjnHwiEAwN81uxHwe1J7DCGkyJ+vOh5+mhf+kNQfv17eSkGroBGVDRdYfWjdyKwS50
 XXsbPozEl4YSdoIz+M+hsQXi5ctVEuA/LUzJ/YbGhsw70gnpNrumX2/wZeT70oj6HnDn
 LEyAQ8+CGPy7RKLLUmat+zcGylGNaxJDOQfQcm9z/Vfjdd7n8hjG+g7q6Kol+BrTaAyd
 5IEOPFtptfyQLkLgq/zJBUb1zN/Dg7dxNNayNzABXUSVcUtPOAaJi/O19yK+aIaFu1+u
 cJcl96P81YPts+xOLj2bK+1/F0Y1b96XQrr0+I+2U4lJGFLxPOmkIXEBmExmzojYaewD
 BPhA==
X-Gm-Message-State: AOAM531ngUxiENBEk7wtb1DfWBr5TC4T4CMZHXMt/An27dAQJyiAVlnx
 qNw6eIPVccbTrL5u0hIEKK/VbacDfGT56xA+Z7j2tA==
X-Google-Smtp-Source: ABdhPJxBghsHVocqojhsnsY8teoXIqtQBGoJduo2LmnGIvKsZBEBA0RKMWX6ZJJYdRs7FI+1moYfXZR1WNnZsazyvYg=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr20749798ywh.329.1646065550454; Mon, 28
 Feb 2022 08:25:50 -0800 (PST)
MIME-Version: 1.0
References: <a8bdb3e7-a877-070c-3ef5-6d14086a7f9b@mit.edu>
 <CAFEAcA_jsunyeYOqu0aPtC3XrdD30b1Fk-6QsiDCTs=AJcvYVQ@mail.gmail.com>
 <006d618a-07d5-f58c-fdce-18914c7c7625@mit.edu>
In-Reply-To: <006d618a-07d5-f58c-fdce-18914c7c7625@mit.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Feb 2022 16:25:39 +0000
Message-ID: <CAFEAcA_ps901W=Cwu0ev39B2+6YyWZtERfuGjCsDTz=G=iA9fQ@mail.gmail.com>
Subject: Re: [PATCH] allow disabling tests
To: Simeon Schaub <schaub@mit.edu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 28 Feb 2022 16:25:53 -0000

On Mon, 28 Feb 2022 at 16:22, Simeon Schaub <schaub@mit.edu> wrote:
>
> Ah, yes, sorry, I didn't check whether the tests were actually run. I
> can rename this to something more like `build-tests` if you think that's
> more informative.

What problem are you trying to solve here ? It shouldn't
matter whether we build the test binaries or not...

-- PMM

