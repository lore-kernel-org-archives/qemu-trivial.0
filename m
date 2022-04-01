Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1naHtE-0007a3-Ee
	for mharc-qemu-trivial@gnu.org; Fri, 01 Apr 2022 10:04:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naHtB-0007UW-Pa
 for qemu-trivial@nongnu.org; Fri, 01 Apr 2022 10:04:34 -0400
Received: from [2607:f8b0:4864:20::b31] (port=34628
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naHt8-0005Kh-TH
 for qemu-trivial@nongnu.org; Fri, 01 Apr 2022 10:04:33 -0400
Received: by mail-yb1-xb31.google.com with SMTP id g9so5243615ybf.1
 for <qemu-trivial@nongnu.org>; Fri, 01 Apr 2022 07:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YJ+i0hhsWk13jaMzuSAJwOsKApnofRVbnuRUAcpKqrA=;
 b=GTMmewJWX5Lc+NiQBzPlnXBtEwahBpB7wQ9bX+gT0/YkYszamsNVlfBRd1xsO8Q+6R
 Uhh/8x07Zu8XIyHtubkboQ8e6BwMjc//zPRser6JIWnwHSWhC3w+b7+mb5hqLjmGLY07
 o7grIo8kqilW1RmVS+x+tEs+xaZbBNAM+TusJHCVwNJ8u89PlgQ/OQL6TT0qUy9dQJSH
 Ea2jv2mFtbfSl59gxovBvROfyRxtt5uTXH/ZMbEZD6oAbItXoTTgp+PMNA1PP26MUu9n
 apuetV+0SLZKvxw/bX3KJjxyYsM7EwEnhGEoazGV5Rl0Ccc0mjd2aCNmOpVEErW43jAg
 VEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YJ+i0hhsWk13jaMzuSAJwOsKApnofRVbnuRUAcpKqrA=;
 b=jT6P1K3qJ/36g31gnb2emAQceDkRHUp1D/W4IgD2GqDxfHTAxRLKeQWeMv6Otlvq7u
 UO8W/luqWxlD/i0hZQMBtc9tjwzdr036ezxNRZHAGnbGIMR/pQhvNtL4PGuOkUFeBZ/e
 DhIcqopbNRrEcgfTmBYPkOrDY4IpAQAJ24wpUhXaj1jC+e80Sb7BiuPrLym2AD/NFx4s
 YgXXlgogxvlj0z7eu39FPaKISv3Y9mTUH8rvcO3bWRn8k6qs9H1nWm9mBPQVT8kZvdmD
 ZDo3FRuXasB1bE1Q1k+XZr5P+fP/vFRkdrPX4SWnvtEgMEfue5CSQVDqXYNrBCJmUa4+
 KeHA==
X-Gm-Message-State: AOAM531WnEDD1Ns23/zWtRFS6w4LKVCq7x2tPUTnItsIh+dori1mBHQf
 Eq/eFjvixPeFHmPvKLn1mymd+duJVOyuOFNoNeoXEg==
X-Google-Smtp-Source: ABdhPJxsvk3zH9Cj9jETsQZoQhu95J/ccEo5zVpmv0uVU09OfxPjgko1mKcnJ9dGm90oKTxf6WrezCurxL/INxWMbGY=
X-Received: by 2002:a25:418c:0:b0:63d:84a2:2364 with SMTP id
 o134-20020a25418c000000b0063d84a22364mr856310yba.85.1648821869564; Fri, 01
 Apr 2022 07:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220331221857.433867-1-laurent@vivier.eu>
In-Reply-To: <20220331221857.433867-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Apr 2022 15:04:18 +0100
Message-ID: <CAFEAcA_6_z_PPV-KTCkNR1v+8ncDYFBwfiKmvL+C9_5noyyMVw@mail.gmail.com>
Subject: Re: [PULL 0/4] Trivial branch for 7.0 patches
To: Laurent Vivier <Laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
X-List-Received-Date: Fri, 01 Apr 2022 14:04:35 -0000

On Thu, 31 Mar 2022 at 23:21, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit cace6c6f3aca7b88afc42995f90bbefb37a0ed57:
>
>   Merge tag 'pull-qapi-2022-03-31' of git://repo.or.cz/qemu/armbru into staging (2022-03-31 11:56:52 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.0-pull-request
>
> for you to fetch changes up to 04cca669b237337cc8734788c3ad968aa8e0b57f:
>
>   tests/lcitool: Do not use a hard-coded /usr/bin/python3 as python interpreter (2022-03-31 21:32:49 +0200)
>
> ----------------------------------------------------------------
> Trivial branch pull request 20220401
>
> Fix sh4 linux-user build on Alpine
> and some trivial updates
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

