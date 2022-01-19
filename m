Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA9SQ-0002HT-0S
	for mharc-qemu-trivial@gnu.org; Wed, 19 Jan 2022 06:48:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nA9SM-0002FK-KC
 for qemu-trivial@nongnu.org; Wed, 19 Jan 2022 06:48:50 -0500
Received: from [2a00:1450:4864:20::32a] (port=37725
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nA9SK-0003vG-S3
 for qemu-trivial@nongnu.org; Wed, 19 Jan 2022 06:48:50 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso13944622wmj.2
 for <qemu-trivial@nongnu.org>; Wed, 19 Jan 2022 03:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=biWLxbWsAetNpihAQQdR1JYGualxpxdxVeQ6h0bH8TE=;
 b=x05/1bH+nNbp2zEPrY4lnQuK5obYMCdnkukCNdrVw78Bum8QphNoLYlzDcH21Bal+0
 EyunnQdxJclDScOmKqD7VlBUmpDeCec/zNNuUbnvl6VSgS8M3lbOZIuXj0LGn+4CUI3S
 RVi3FnKAu+zBK3K0/kE4I6YSClMC4K/QFO63eVpqvgcfteCtEJXaxUjO7RHX7AAJQ9fg
 fWb0FeTfGzWbSkyiDW3zP4mUz5gn7+JM6Ccjm8QkoIbv65KrWmWKaXtaLG9n3ETNzjJZ
 KNtmfkhXEEpCJym6gmiYloQlVxFJynuHw6mO5229G9uTkQt4e27N/1ivZSyP2/uzJCjB
 GXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=biWLxbWsAetNpihAQQdR1JYGualxpxdxVeQ6h0bH8TE=;
 b=j7/BWh3uBWWaEDA4S7p+cmVSQUeYxzwezAsPy3RI55Mrvvx9+ZB5tp6PuSiHOOF4Hf
 ggl4nxA0pcpI7iKx3/7KlEHZH1Li4loU0fE0d09Cda+btX/+JMDOh8MjDFB1x/QX00pJ
 qgxvXf7v4IPDNF1TSi7nC1mbauqT3/MBchqXVeyz+xrIYAM0s6QoNroy08RI5zGhQLK5
 BNlHqRvmpFiwFjIVUquxZYWFyqfe9LHRUjDlNdv/RWV/DcDrOs+OTmKuk5vB+Zkzi6ol
 KB36b8cNl6OP0ewN458oLGn21s3+spxrgK2R++C7VzWEGv6ii15J2Py173uKeJ/RhrS2
 Wlkg==
X-Gm-Message-State: AOAM531adAowrQDE+4Ve5izsV75muhX63M1E0wjmClcNvIBLV/LeYgVN
 lShh42YSV6mtHTWWh3x4YDq+OnGKlcbIGbgG9UJ/KQ==
X-Google-Smtp-Source: ABdhPJwXgvKTBD0+sqZzj67t/LY24sZ3T6jsBOWl7RVCE/2ypkX5G4QeUd8ocPW0JHO1U5Xf87KF46icdG4ycoCe/nE=
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr17212739wrp.295.1642592926258; 
 Wed, 19 Jan 2022 03:48:46 -0800 (PST)
MIME-Version: 1.0
References: <20220118122847.636461-1-laurent@vivier.eu>
In-Reply-To: <20220118122847.636461-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Jan 2022 11:48:35 +0000
Message-ID: <CAFEAcA9fNx6VR+v2E0yr-DKfHF8uSnHVuibpk=vaCpPPTTjfNw@mail.gmail.com>
Subject: Re: [PULL 0/9] Trivial branch for 7.0 patches
To: Laurent Vivier <Laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 19 Jan 2022 11:48:51 -0000

On Tue, 18 Jan 2022 at 13:32, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 6621441db50d5bae7e34dbd04bf3c57a27a71b32:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-20220115' into staging (2022-01-16 20:12:23 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.0-pull-request
>
> for you to fetch changes up to bfadf13f63d63d099bf2be14c9b1863f25a091a2:
>
>   linux-user: Remove MAX_SIGQUEUE_SIZE (2022-01-18 12:44:44 +0100)
>
> ----------------------------------------------------------------
> trivial patches pull request 20220118
>
> Fix comments and typos
> Add vmstate for ETRAX timers
> Use ldst in megasas


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

