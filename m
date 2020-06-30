Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jqIt1-0005G1-AQ
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jun 2020 12:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <devnexen@gmail.com>)
 id 1jqIt0-0005Fi-2s; Tue, 30 Jun 2020 12:13:30 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:42280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <devnexen@gmail.com>)
 id 1jqIsy-0002I2-Hq; Tue, 30 Jun 2020 12:13:29 -0400
Received: by mail-ed1-x543.google.com with SMTP id z17so16776953edr.9;
 Tue, 30 Jun 2020 09:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=asGqyFDgXBO5HHBJncFFK1r0bI+Sapmxhmp1PCPxUW0=;
 b=aW/1WB5rwA/8eJ5EFeF3hnUuKYipXHGlLcpiHZSvNzkvNlr57sTO/0//AZWIr6JF6X
 m/zkoqrOfj4Z62K3kmlTryQvtax9QG32batISfJmvv2oVqk3UZn8onFzBaCrD1b+rb4m
 4zfwJCdoCpriRgdFupo2m4vkToG8VA4/5OH2zxhj7pg1k+/rVvz2sn7eyA9e/2UvH4et
 UwWycj19lGp6FSzbCm8IJvI7AZE6zwNYJ8ded0PCI1YkN1IK+/RW4HAgyXS5QSu+ANt1
 6xTo6nJstSxb+shi0sQ8OXwLzXjdV/fAsckNKCFD/CIK/jywSR8Y/pEwwLTmXoPQM41P
 jl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=asGqyFDgXBO5HHBJncFFK1r0bI+Sapmxhmp1PCPxUW0=;
 b=hZ5YTmXvaEkncYzF3AK/5jxZ/uTeVTgFhWyA513vPWSByff+TPCdsQgN4flKfobaM8
 j9fKvrugQ99alXlSXq3/1AWfZX0RcD4K2gemjJwqRFWaU70VQAKsDJ1akS5HyU6PDIRn
 SD3upfRsWGU9JkeluZhAdBz0DFIbCobcvppSxtiUXHr9LB6s1B5xxDGGmNfr2fjxDcv9
 55aQ+RZsDBNQthYy8jNcIbzGWgRPVm1numVeR+XTxN8LCqYQ/U1qd3cvEl2QWd61Zu07
 8hAJpaFd3wvPwuKAmTeGPYh3iUb+2Af2QcIgG8r/3K4HmtMxWDbT3ta1OjpjgzkmECVv
 j+mA==
X-Gm-Message-State: AOAM533JdVceD4j1jJWxy4ijRlWYeS2BIIB5kTmDtyDMkG4ZGSwa3KSA
 CtsQUtBIRWcX1GlYveH1GebRpYoL2A1PFFvqIgE=
X-Google-Smtp-Source: ABdhPJyRuMkHlXIEC47E55fayyGWqkjRtEdNtU7H5RSPDzYbk82m7BCJJdDYOtQmp0RzJX8dlFWQ/RZiPlxfIDiS+YI=
X-Received: by 2002:a05:6402:3049:: with SMTP id
 bu9mr10037162edb.232.1593533606630; 
 Tue, 30 Jun 2020 09:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqzjjrfxXeSENBQuHzTe4TRMWV5GOdqPkD3bo17T3ufR1A@mail.gmail.com>
 <1058ccbd-b4bb-9413-abc5-ae89076a58e1@redhat.com>
 <20200630082301.6vybzwmg4pviuwob@sirius.home.kraxel.org>
 <a482bd09-28c8-7de7-de06-dba60d1c8160@redhat.com>
 <20200630154825.k7ut6m3trfhwlmas@sirius.home.kraxel.org>
 <CA+XhMqyANFyTxm8j_1hyLskeA1inDBCtpf3iR5sNR1PTwDUt1g@mail.gmail.com>
In-Reply-To: <CA+XhMqyANFyTxm8j_1hyLskeA1inDBCtpf3iR5sNR1PTwDUt1g@mail.gmail.com>
From: David CARLIER <devnexen@gmail.com>
Date: Tue, 30 Jun 2020 17:13:15 +0100
Message-ID: <CA+XhMqydMd204Cf4vB+JxL9h2KX=2+fR6ra9YGat7+FgEM2q4g@mail.gmail.com>
Subject: Re: [PATC 7/9] Skipping drm build, unsupported
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>, 
 Eric Blake <eblake@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=devnexen@gmail.com; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 30 Jun 2020 16:13:30 -0000

Otherwise, if it is ok if not all patches are accepted (like this one)
but at least most of them would be nice then Haikuport can decrease
needed local patches.

Regards.

On Tue, 30 Jun 2020 at 16:55, David CARLIER <devnexen@gmail.com> wrote:
>
> 1/ It does not compile on Haiku has dirent does not contain d_type
> field (among other things).
> 2/ does not support drm anyway.
> 3/ Haiku is less portable than a illumos or NetBSD system, even with
> the BSD compatibility layer.
>
> On Tue, 30 Jun 2020 at 16:48, Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > On Tue, Jun 30, 2020 at 10:46:59AM +0200, Philippe Mathieu-Daud=C3=A9 w=
rote:
> > > On 6/30/20 10:23 AM, Gerd Hoffmann wrote:
> > > > On Tue, Jun 30, 2020 at 08:44:24AM +0200, Philippe Mathieu-Daud=C3=
=83=C2=A9 wrote:
> > > >> +Gerd
> > > >>
> > > >> On 6/29/20 11:48 PM, David CARLIER wrote:
> > > >>> From 157a0374093371719de42e99364352d64190f52a Mon Sep 17 00:00:00=
 2001
> > > >>> From: David Carlier <devnexen@gmail.com>
> > > >>> Date: Mon, 29 Jun 2020 22:20:06 +0000
> > > >>> Subject: [PATCH 7/9] Skipping drm build, unsupported.
> > > >
> > > > --verbose please.
> > >
> > > David has difficulties understanding how to send patches,
> > > so you missed the cover/context. This is for the Haiku OS
> > > which apparently is POSIX.1-2001 compatible.
> >
> > That doesn't explain why he thinks this patch is needed.
> > It should build just fine on Haiku ...
> >
> > take care,
> >   Gerd
> >

