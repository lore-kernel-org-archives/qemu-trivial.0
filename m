Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVyrL-0001gC-Hn
	for mharc-qemu-trivial@gnu.org; Tue, 05 May 2020 10:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVyrJ-0001dP-Nv
 for qemu-trivial@nongnu.org; Tue, 05 May 2020 10:47:45 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:33237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVyrH-0006M8-Gp
 for qemu-trivial@nongnu.org; Tue, 05 May 2020 10:47:45 -0400
Received: by mail-ot1-x333.google.com with SMTP id j26so1866833ots.0
 for <qemu-trivial@nongnu.org>; Tue, 05 May 2020 07:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s7mRA5n+wgQvl27+I+P286HANZt/7d7231ndilgUj48=;
 b=sP+gEJDod+gaYZxN0u8Jv7VhcyZfAhBhSfqpGvL5G0niA8MRPsP7jXMeFiMkDgBS93
 z63Z5eLkzH0Ld+ePvKCDGz88L7Q2zG6wVRwuAjUbQHEpfBw8rr4s1HtZ01U8EiW0PlWs
 a9Y+U4XL8qyY+LC5cmAib0ttaJntGEeEPwtkGstyzbr68hHRDxi9A6pgL/SkSdbktp4F
 8I6F+d5aqQM/Vtnf9fNW5Bfvi2bHHkp/3oRxToIDKpxnV5vNj4yrqSmhp4+gzKI7b94G
 kKGmDohPffzDD4HOTRkOHFYfLiQBES+6w8W6hahkpi8xEq1YEt85R3sj8kKuQLKLkUKQ
 Nd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s7mRA5n+wgQvl27+I+P286HANZt/7d7231ndilgUj48=;
 b=K0MKh4aW9BeqaqU3OdSA+XQs0eUJM6w+BSgx9Q6YKr21QnJHfJlOMAgionIpYNjCyS
 0o2630X25slhaF5/qRT3TDMtbRNVTqctankr9a+htUH/u1yF9/PT31mh83HVv9MW+qUD
 c/FHmZ7noDO1ZVbRN392w5Siqck3zvx6k2AGNHIxiJWUMDKhgTvcY+BUv6OK8LEV0bOp
 H7eP25wH6mXbpMLZG/fHqlTsGG2sOhGoVQIIisUc2G72Jv1/HnJA27z9dqzy5C9B75ck
 966UQuWc1oSPrJQTjF2GckJV3DELhzH7rB0Ok3omp6K1NEZZz8AcAv8K75WWIIoUuoHo
 Z6ag==
X-Gm-Message-State: AGi0PuZaLtSQnhObdgF501wQ8XSKLad9fiVOCrOoTYAX8CXR/29HbM3W
 xyiorwNdKF+hPOzfprLXXQQA3mh/qJDKvpGUc4jygA==
X-Google-Smtp-Source: APiQypJ1XEPRkmsrNbs7XruGeJ8gGgwZMrHw5yzQLoZRUKieatfyj4q7M1XjFkCurIgs73f/srSjA+U8svkqU2qQZyA=
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr2475635otj.91.1588690062012; 
 Tue, 05 May 2020 07:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200504155956.380695-1-laurent@vivier.eu>
In-Reply-To: <20200504155956.380695-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 May 2020 15:47:30 +0100
Message-ID: <CAFEAcA-Tu7BfvCgJW79fBAg2vS391FMwp=qPziJnWeLWhC6HXQ@mail.gmail.com>
Subject: Re: [PULL v2 00/19] Trivial branch for 5.1 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x333.google.com
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
X-List-Received-Date: Tue, 05 May 2020 14:47:46 -0000

On Mon, 4 May 2020 at 17:02, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 2ef486e76d64436be90f7359a3071fb2a56ce835:
>
>   Merge remote-tracking branch 'remotes/marcel/tags/rdma-pull-request' into s=
> taging (2020-05-03 14:12:56 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-5.1-pull-request
>
> for you to fetch changes up to e702fba83108519618046a2a09235a62e3a81595:
>
>   hw/timer/pxa2xx_timer: Add assertion to silent static analyzer warning (202=
> 0-05-04 14:43:24 +0200)
>
> ----------------------------------------------------------------
> trivial patches (20200504)
>
> Silent static analyzer warning
> Remove dead assignments
> Support -chardev serial on macOS
> Update MAINTAINERS
> Some cosmetic changes
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

