Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mg9Jh-0005Jj-MN
	for mharc-qemu-trivial@gnu.org; Thu, 28 Oct 2021 13:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mg9JY-0005IB-KO; Thu, 28 Oct 2021 13:35:44 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:29627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mg9JU-0003qL-KK; Thu, 28 Oct 2021 13:35:43 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 95BEB7BE72;
 Thu, 28 Oct 2021 17:35:32 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HgCPw38k3z3syh;
 Thu, 28 Oct 2021 17:35:32 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 2EAACA533;
 Thu, 28 Oct 2021 17:35:32 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-pl1-f179.google.com with SMTP id v20so4940652plo.7;
 Thu, 28 Oct 2021 10:35:32 -0700 (PDT)
X-Gm-Message-State: AOAM530g6GLaB6WudUzG86XS7Lkd7TmHrhrsv3q5ebsW08umgaiC3wt7
 khK91e93GeGH20I4FP4SIKroAYmEtfQftenUMQU=
X-Google-Smtp-Source: ABdhPJy4uJ3UnnEmI4jleyzSGSpoCOg136UtWksSZrh7pxkA7MB/syib0okV/8C54VwXZ7a6wiSNNaeXwrejzdi6Oos=
X-Received: by 2002:a17:902:d2c4:b0:140:57d9:7fbd with SMTP id
 n4-20020a170902d2c400b0014057d97fbdmr5137305plc.87.1635442531000; Thu, 28 Oct
 2021 10:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-21-imp@bsdimp.com>
 <446e589d-7c49-f5fc-3891-195ba5a37c0f@linaro.org>
In-Reply-To: <446e589d-7c49-f5fc-3891-195ba5a37c0f@linaro.org>
From: Kyle Evans <kevans@freebsd.org>
Date: Thu, 28 Oct 2021 12:35:19 -0500
X-Gmail-Original-Message-ID: <CACNAnaFr1Mg5OTivWMLhN=fNy8MB284aRRGBub9vA=-1bHbFeQ@mail.gmail.com>
Message-ID: <CACNAnaFr1Mg5OTivWMLhN=fNy8MB284aRRGBub9vA=-1bHbFeQ@mail.gmail.com>
Subject: Re: [PATCH 20/24] bsd-user/arm/target_arch_signal.h: arm
 set_sigtramp_args
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Warner Losh <imp@bsdimp.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Stacey Son <sson@freebsd.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Kyle Evans <kevans@freebsd.org>, 
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 28 Oct 2021 17:35:47 -0000

On Thu, Oct 28, 2021 at 12:25 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/19/21 9:44 AM, Warner Losh wrote:
> > +    regs->regs[TARGET_REG_PC] = ka->_sa_handler;
>
> Surely there should be some handling of thumb addresses here.
>

Honestly, this wouldn't surprise me- we're kind of a thumb landmine.
The other thumb-ish support is relatively recent as we hit something
that had an entry point on a thumb instruction; but we don't typically
build/run binaries including thumb instructions.

