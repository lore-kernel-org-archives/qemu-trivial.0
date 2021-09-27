Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUnYb-0006It-7I
	for mharc-qemu-trivial@gnu.org; Mon, 27 Sep 2021 06:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUnYZ-0006FC-DQ
 for qemu-trivial@nongnu.org; Mon, 27 Sep 2021 06:08:19 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUnYX-000899-Gd
 for qemu-trivial@nongnu.org; Mon, 27 Sep 2021 06:08:19 -0400
Received: by mail-wr1-x436.google.com with SMTP id s21so10832192wra.7
 for <qemu-trivial@nongnu.org>; Mon, 27 Sep 2021 03:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J8q1dmv8ByfrswwLW/lDF2Zza3LpzQLATB8uhMs/KDU=;
 b=dV1GNm9jYFD3RIXiZMwhrWo3UOYaV4ryPHW34IXRtreubXwEEJB3lBZNdgUxXDtK/G
 PvNeCavW3qPFS6k82IhdsDlNgJyH80d6+2N9L1wjphDX5Mm5JBsx2auexqXxRvODcVYJ
 /MR+05fT3SdSsE/B+T1H3l+YRlAVNlRoB/IXzqdHyxnElGpD5CPG3tlDCY3HepJPG14+
 4WXQLHYxbM4xXkOuzgHI+GBH8bWPGZFlVaUbrU9jV9vgbxNnb/6pRoGCwCg51WUYZ0gv
 PM3xfoJrQvxE9XcNowwprfJWD0W9n9NMHxJomDUNM7N1p0w6MHWhN41atGw0tS6A2/ZB
 cBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J8q1dmv8ByfrswwLW/lDF2Zza3LpzQLATB8uhMs/KDU=;
 b=dPfa3iWhLns/QikReNuK7lZnHBVoi0agCZSXJAx9JsGM3zizBa1rDYbtbIX45yonkx
 0ERo6fopxuMtZWITA9H7+asUDqSqZL41l+jwcjjY5bBQfByZLGHoY6G2e0cMJAEiXfjx
 923KBntlCFTRf72CZRIi8TF7tMraKt+i+/8FXQNITr9jMDlLRBxyaQhUKNJ7i9DLaE3B
 3ReQFewUWK2HKwMk+ml+o4J8tsrs1NSKQoK9LQ0HdSeGc03ABfKpsdjh6CAFvG+iHqoF
 foPV2Yi+n2EEXemH1EcsdYEtJRFYibh++xDecQvwqHVKftnbOLFiKiMBDU33aHfbUTy8
 KOgA==
X-Gm-Message-State: AOAM531SX+o04Rz5CG+dYAwJezYgl5xRG4LNi/HxI3Wlw9qrg/PzMcFj
 rq1uhXjj9gCz4t1kMAiv/M/xK2G5ovw20RzhpHcsEw==
X-Google-Smtp-Source: ABdhPJxvC9vSjvJyPiIeBsQqDM7TAo01I7J8ksRozunD7IyL8oAJBG4egKYq+eddhBRnAwPtzdU+iv6km014siwiib4=
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr27029990wrr.149.1632737295525; 
 Mon, 27 Sep 2021 03:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210926220103.1721355-1-f4bug@amsat.org>
 <20210926220103.1721355-2-f4bug@amsat.org>
 <YVGUX6FZlFBhhgwn@redhat.com>
In-Reply-To: <YVGUX6FZlFBhhgwn@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 11:07:22 +0100
Message-ID: <CAFEAcA_FRAHy1Hq2QxO2DWkrLZbW_4g=zzCoac18rRNf2CD0kw@mail.gmail.com>
Subject: Re: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Kyle Evans <kevans@freebsd.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
X-List-Received-Date: Mon, 27 Sep 2021 10:08:19 -0000

On Mon, 27 Sept 2021 at 10:59, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
> If we look at linux-user/meson.build though things are more complex.
> There we have alot of sub-dirs, and meson.biuld in those dirs adds
> generators for various files. So conceivably skipping linux-user
> will mean we won't auto-generate files we don't need on non-Linux.

The top level meson.build doesn't call process on the
syscall_nr_generators[] list unless we're building linux-user
targets, so I don't think we will auto-generate anything we
don't need.

-- PMM

