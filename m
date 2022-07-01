Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o7HH2-0001Wu-2G
	for mharc-qemu-trivial@gnu.org; Fri, 01 Jul 2022 10:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7HGz-0001RC-RB
 for qemu-trivial@nongnu.org; Fri, 01 Jul 2022 10:05:29 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:37378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7HGy-0003Ju-2D
 for qemu-trivial@nongnu.org; Fri, 01 Jul 2022 10:05:29 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-31772f8495fso24816747b3.4
 for <qemu-trivial@nongnu.org>; Fri, 01 Jul 2022 07:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g5nq3h5zQ3f+Ne0GrHGrogLQsNDGfrAYbbuf27aUzR4=;
 b=kFs26YZy+BqljegvC4UgsHAbKAMUhUbfPlq+4Yw+8skrI5oUk+hkPI0x4ECd2SsQYc
 EpqyKNxc1cP/N7SISrzV4vB4bcGvvsaWYt5G7bPzU4SgOezJBwaWkEcdFS3sTPiL68QR
 kp10o6yv9lSHneMqN3N5FFLXGdJKhNtnZ9CCKITJubJHnLvlTYLI/ZSOb0l8sGFAmw76
 ZNx5HpYiOIxxAQTMWph/1rM+bnUhSNZzB2fZ6eBTUIykD4rdAZhEa4k/e/8eeEwYzYCi
 1dDbbJqRJwEqUFcHTVAA8LNI2X/SQ+iifFvnn25PZRLI9FCnJLitvriiQ6otntepJGzI
 DWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g5nq3h5zQ3f+Ne0GrHGrogLQsNDGfrAYbbuf27aUzR4=;
 b=6jQ/pmTbMru7tBWUMbDgIHclIa0wYapeN1fz4jc0OsyITCd+iuysnDbMcwkIHWSV/7
 pLXwxKKZ1jzkfOW7i4c/kHSqw0+3lVfQT8SNttOsuPkmSmhnFJthx7/7YetjQGl0CCPz
 8E/fNrMC4YrwTEiGF9B8fDboluM3fCi4/9VLNiYoRdMh4c4KQeCLexo8jkR1HJg4oK+Y
 OBfRlVfXz9oTug8NpffFseyPT2Afv9KDsyFDORK52vDTK4/hfqmrpWaKa66J2vAgOs3f
 7r4UIi3cpVlOL8t+TJGDYyMMIH9GW86Nel7d7qGBXDSBB6+VIxHgJf0ywygc1T6jt9RM
 ID0w==
X-Gm-Message-State: AJIora+aRkk+/gFeZFdxpwzFWMZIwisaCddMNLOShdjGGgWq6+Yt2xLr
 po8GBOG+3lkfFkVsK4BtwGqgVF0aN6nmZBoYInvZ9w==
X-Google-Smtp-Source: AGRyM1sqb8+YIPt3oqutSG4qkvUF3ITgEdVDymiDfP3gOYNeF9+x/9EBKd240pd1K7oOAJhmpuQAYHlTUhfg5Ysbi3U=
X-Received: by 2002:a0d:ca16:0:b0:31b:7adf:d91 with SMTP id
 m22-20020a0dca16000000b0031b7adf0d91mr16796686ywd.455.1656684326652; Fri, 01
 Jul 2022 07:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220527190658.169439-1-i@hexchain.org>
 <MWHPR11MB0031081716C325EBE19F8ACA9BDC9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsRKNN4PkNBQEGEPpsFhFM7xLD6rVxfAk+QfwsbMoB+sA@mail.gmail.com>
In-Reply-To: <CACGkMEsRKNN4PkNBQEGEPpsFhFM7xLD6rVxfAk+QfwsbMoB+sA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 15:04:48 +0100
Message-ID: <CAFEAcA-7gj3=+bOrYheXPUxvO_sFRw0TR6UquUCm419orsym3A@mail.gmail.com>
Subject: Re: [PATCH] ebpf: replace deprecated bpf_program__set_socket_filter
To: Jason Wang <jasowang@redhat.com>
Cc: "Zhang, Chen" <chen.zhang@intel.com>, Haochen Tong <i@hexchain.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Andrew Melnychenko <andrew@daynix.com>, 
 Yuri Benditovich <yuri.benditovich@daynix.com>, 
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 01 Jul 2022 14:05:30 -0000

On Wed, 8 Jun 2022 at 09:17, Jason Wang <jasowang@redhat.com> wrote:
>
> On Tue, May 31, 2022 at 1:40 PM Zhang, Chen <chen.zhang@intel.com> wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: Qemu-devel <qemu-devel-
> > > bounces+chen.zhang=intel.com@nongnu.org> On Behalf Of Haochen Tong
> > > Sent: Saturday, May 28, 2022 3:07 AM
> > > To: qemu-devel@nongnu.org
> > > Cc: qemu-trivial@nongnu.org; Haochen Tong <i@hexchain.org>
> > > Subject: [PATCH] ebpf: replace deprecated bpf_program__set_socket_filter
> > >
> > > bpf_program__set_<TYPE> functions have been deprecated since libbpf 0.8.
> > > Replace with the equivalent bpf_program__set_type call to avoid a
> > > deprecation warning.
> > >
> > > Signed-off-by: Haochen Tong <i@hexchain.org>
> >
> > It looks good to me.
> > By the way, add eBPF maintainers.
> > Reviewed-by: Zhang Chen <chen.zhang@intel.com>
>
> Applied.

Hi -- did this patch get lost somewhere ? We just had a
report about it on irc and it doesn't seem to be in master yet.

thanks
-- PMM

