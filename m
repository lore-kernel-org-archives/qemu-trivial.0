Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kX0pw-0003aD-Jw
	for mharc-qemu-trivial@gnu.org; Mon, 26 Oct 2020 07:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kX0pv-0003a5-G4
 for qemu-trivial@nongnu.org; Mon, 26 Oct 2020 07:38:51 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:39503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kX0pu-0006oj-06
 for qemu-trivial@nongnu.org; Mon, 26 Oct 2020 07:38:51 -0400
Received: by mail-ed1-x544.google.com with SMTP id a6so7524901edx.6
 for <qemu-trivial@nongnu.org>; Mon, 26 Oct 2020 04:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8S2JinLb9lWGKscLwifjdAqWcMxstZyUBqU3LCeJXGo=;
 b=xFGbjG+WRzcNSnTy97NSIELrWn6WK7B10cNarI3kCpnT+oqrIMJvoz4S2tgUuhlfiI
 WVww3NDiX9aJiF0fhbTaf4l6fAvJQacIhnC7ec4NTMMx7qZClwT01YMmO3XZ22w8J+6M
 rwDu+n+0gYg3a3xWaS33VHtle7E/cEmgxh4f36zuDCRmP2rSMtL71qRue3P4X4Nibz4e
 oXy0dTnCvvu9Ier6WdB9A48xRsWH9fHhfzE98hqwGvb8MvM1LUj72XsZBj3fTdQxon+U
 Zwn7r2RNbU2pW8+JNH8+nsWcBY6M6Wj0aZAJAm7D+Mr/P4hDcDxO8R4TAt8kjaZcy4ZJ
 5vEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8S2JinLb9lWGKscLwifjdAqWcMxstZyUBqU3LCeJXGo=;
 b=YOXT1kg2Rpd5FfHZwUaNmS1psJbFmLaOBkLFE5akwwHb+dlJeEOHFFfUvDMyYafJ96
 ZmXlPmMIM2Dto/5Dhl2f5Pp8ydnU+9DErijAcP5x9Pw8v9LqmUWz5fNPtgSgBgk35AMS
 +uvMI7rHFwNy59hG4bXJpLdwcoCh41PEbof7pORZ2KEworzDVFwtpqvenqzJWrfvTbmc
 0svCrkXM2GKWrjj8wj3wRiuVyXH8KxkYOkHrovslCDGpNdpY+eoA97Bc188VF7dCuitV
 AnjiInPBgdj7iW3zNgoIrPzCQSoJggI250uqcbI9aJDYOltJyrorLN4zOjFvVmEVgxrf
 WNPA==
X-Gm-Message-State: AOAM533Hb6VYbvQY+QY+1IMTM3ik4Atpf5MGQbWAwtm5mW/rE6iGg0PW
 iVfmFYQPVQX01r8GKp0yM4N/kddfMO7x56dboSMk2g==
X-Google-Smtp-Source: ABdhPJwT723/U1O5ibpoIsKlla9tQ1SeiFoAQ3JiLRDP22LIewM89+sVCw1OwOxCLhNZWOnkRTTuB63gCq6omIyW808=
X-Received: by 2002:aa7:c683:: with SMTP id n3mr15018685edq.146.1603712328549; 
 Mon, 26 Oct 2020 04:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20201020105938.23209-1-thuth@redhat.com>
In-Reply-To: <20201020105938.23209-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Oct 2020 11:38:37 +0000
Message-ID: <CAFEAcA8hxhVgpBdTd24opRKtnYa_73NSuU67Y17F_Rpbup2cFg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/highbank: Silence warnings about missing
 fallthrough statements
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Rob Herring <robh@kernel.org>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 26 Oct 2020 11:38:51 -0000

On Tue, 20 Oct 2020 at 11:59, Thomas Huth <thuth@redhat.com> wrote:
>
> When compiling with -Werror=implicit-fallthrough, gcc complains about
> missing fallthrough annotations in this file. Looking at the code,
> the fallthrough is very likely intended here, so add some comments
> to silence the compiler warnings.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/highbank.c | 2 ++
>  1 file changed, 2 insertions(+)


Applied to target-arm.next, thanks.

-- PMM

