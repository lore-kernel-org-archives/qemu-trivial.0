Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOihL-00020Q-L9
	for mharc-qemu-trivial@gnu.org; Mon, 28 Feb 2022 11:16:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOihK-0001z9-Oe
 for qemu-trivial@nongnu.org; Mon, 28 Feb 2022 11:16:30 -0500
Received: from [2607:f8b0:4864:20::112b] (port=42221
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOihJ-00056f-Cv
 for qemu-trivial@nongnu.org; Mon, 28 Feb 2022 11:16:30 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2d6923bca1aso114230787b3.9
 for <qemu-trivial@nongnu.org>; Mon, 28 Feb 2022 08:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AQSZDw9b1T/oiQrSEJHQ1wpMoimfZoKwpkWd4JQLWkU=;
 b=F5xVswrVPEhnylMMcriXkDzU7R6MxvWbsPYTzIR/6YGbY3N6USm5z65zmP9dnCEqL5
 qJ28JWMpwO7+ie3G2Odh6EPpcBh8nbVRv3+T7IbsuCq0YfQ3wUkrMA+n2n7VlZbv4FLQ
 31S9JYJkD8abdBtxE6uO0N3Kg1Zhsr5e35oEGidt8nInxiwosdmODKNAp95AZPrh5dSI
 NlEy49x/Z6+zZP3h1dr8yVp8VriI0uLjKtmaIWs7nBWa9O3EEp8Exp03giroYtzctRDy
 mTGZlhysyFjkCpiuaCgfyCSvtG/lowk534WVkCks6a6p3pJNOlWUsyLZZ1/3hxDhAXun
 0q3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AQSZDw9b1T/oiQrSEJHQ1wpMoimfZoKwpkWd4JQLWkU=;
 b=rlNjPI37NcU/jcc+dlq2ok7JDsrw8T5bEqe4IzCQIvZOiiXt8RPqoRWrjtpGhB/aeU
 w75Kl94r9yltMHxgkuIySBSNw9bSkCRkEauDzOSgZT0qX947JCeVf+7EZiOXqqy5lCul
 Lcj5R4Yz9PMxxjLpuGm5DDj5w3TuzB6/Zc6GdAZqWE9V4PT/dmvtFlaRg2NkoR7xGQ4G
 J0DzLuZHTrqB8pn6DfrNgDiZtCCs4nDydZmnRWJIFV1YTuwUwzwaUJcKKpokd2SZ33In
 12F11B5fwyQmFJuHTsjhboglTBXsGhgCvkwF8W0FvOyTN881sux5y2/Ne5gDzXF6Icjb
 Jbsw==
X-Gm-Message-State: AOAM531pFo4vgRF88QQmlYnSrmL6jWn7gfApFN+bSyWCKFU4bW3DCuay
 kIOPcrl7EdXeqFaXbNxJzs35l/gxJi7fPZPxyEF9LA==
X-Google-Smtp-Source: ABdhPJx83dm1rMxhm1ITgk7WFNxdrC7AIdOyuWwXz8FfZkqKJ9WuPS+Hy5JNuy0tbMjAxTUw8WCMEh9LaH1rEQ3QIz4=
X-Received: by 2002:a05:690c:314:b0:2d6:b95b:bf41 with SMTP id
 bg20-20020a05690c031400b002d6b95bbf41mr20347309ywb.64.1646064987439; Mon, 28
 Feb 2022 08:16:27 -0800 (PST)
MIME-Version: 1.0
References: <a8bdb3e7-a877-070c-3ef5-6d14086a7f9b@mit.edu>
In-Reply-To: <a8bdb3e7-a877-070c-3ef5-6d14086a7f9b@mit.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Feb 2022 16:16:16 +0000
Message-ID: <CAFEAcA_jsunyeYOqu0aPtC3XrdD30b1Fk-6QsiDCTs=AJcvYVQ@mail.gmail.com>
Subject: Re: [PATCH] allow disabling tests
To: Simeon Schaub <schaub@mit.edu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
X-List-Received-Date: Mon, 28 Feb 2022 16:16:31 -0000

On Mon, 28 Feb 2022 at 16:10, Simeon Schaub <schaub@mit.edu> wrote:
>
> From b6ec17a85a8fb2431545f9c5093dbce9a090b522 Mon Sep 17 00:00:00 2001
> From: Simeon David Schaub <schaub@mit.edu>
> Date: Mon, 28 Feb 2022 10:51:04 -0500
> Subject: [PATCH] allow disabling tests
>
> Adds an option to avoid running tests as part of the build process. I
> ran `make update-buildoptions` to update the meson options, but this
> seemed to also change the `qga-vss` option. I assume this isn't intended
> to happen, any ideas what's going on there?

What tests are we running as part of the build process?
I wouldn't expect us to run any tests unless you ask for them
by running "make check".

We *build* the testcase binaries as part of the build process, which
perhaps is what you're running into ?

thanks
-- PMM

