Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1opB15-0007zl-Ot
	for mharc-qemu-trivial@gnu.org; Sun, 30 Oct 2022 12:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1opB0u-0007xr-9X
 for qemu-trivial@nongnu.org; Sun, 30 Oct 2022 12:18:20 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1opB0s-0008Hp-Bv
 for qemu-trivial@nongnu.org; Sun, 30 Oct 2022 12:18:20 -0400
Received: by mail-pl1-x636.google.com with SMTP id g24so8852930plq.3
 for <qemu-trivial@nongnu.org>; Sun, 30 Oct 2022 09:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=mc7zqi7C2SOXM4f6dhTQR8O5K8s+kIGWHA/Kr4VUa+I=;
 b=sm1T89GBIyFkN5e7mL2pzd6auPSzlRIevK6OVb8/RPKdyHHFBBm62phsDSy1OWiTiR
 UX2FsnGMmMtlolPLr94rd/SxmKlsSuj5c01is8xhDB7jI2RrhdkTmQhUQ2uJeQHxPrH8
 bKYOzp/ZXEEO5jm9/LzS3ONgmAnIk4A7Kw6KzwEO8tYL1gNaOcPhrMyxSEE8z2mQwVsk
 Fzew/VWEhM+ilh3dnR6OypPMc12BCNzTV4tDYl/AVb9l1KCcIda7nu8Jt6n/DZq0YeSc
 QpoaJBZ/ksaVj5/I8JLrgzdPzNR6DCYeBZqhCvc4Ox31hr/+DRnqBELugkLgxmzRkNkP
 0n6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mc7zqi7C2SOXM4f6dhTQR8O5K8s+kIGWHA/Kr4VUa+I=;
 b=XhCllRBpSZbBOsg863VQCSqC2KbufbVwWV+cmLfeJtu0pVHhspxifBEvlXOthesvP1
 gXHIWiCdEQ/yj++0/eiVhLIauV5ia6ZCWhi1Jk+ShxJhlJgp6psff0aFB9iJaHEhbWWW
 143Zwgn00QQTU18OfWXBMAM416pzMD57rHt6BwWutmtJjIB/fqHDXqia0Rn13fBnQgt7
 yuV7NtqQtgvHRX8z41WPWKQiJGe1NFXqIMFQ6vY82ub8iiROXS9ANsmMRM77Kcc0hXpH
 Mt295QxjjN/A60gcrf4eUP9/bX/HFiN3ak6NDX5zIEVPmvBNbXDg/qBKRiSRIm8KW2yH
 a04A==
X-Gm-Message-State: ACrzQf0oX/THuxWv7IiY14jSpu8trnXdGK21E54VaDbddMr5BB0lk9gx
 un6IybPZDOAMMVnw2VXZ93KFKw==
X-Google-Smtp-Source: AMsMyM6M2Tv021Pgx/rUklXn8OOBeZStIyqMpzGhaNEJkPoEg/3PLpZHIUFawIuI7UCxhT2RxmlO9w==
X-Received: by 2002:a17:90a:930b:b0:20b:a5d:35d6 with SMTP id
 p11-20020a17090a930b00b0020b0a5d35d6mr27286881pjo.146.1667146695640; 
 Sun, 30 Oct 2022 09:18:15 -0700 (PDT)
Received: from ani-ubuntu ([156.146.57.39])
 by smtp.googlemail.com with ESMTPSA id
 k13-20020aa7998d000000b005622f99579esm2818600pfh.160.2022.10.30.09.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 09:18:15 -0700 (PDT)
Date: Sun, 30 Oct 2022 21:48:08 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
To: "Michael S. Tsirkin" <mst@redhat.com>
cc: B <shentey@gmail.com>, qemu-devel@nongnu.org, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>, qemu-trivial@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 3/3] hw/i386/acpi-build: Resolve north rather than
 south bridges
In-Reply-To: <20221030121158-mutt-send-email-mst@kernel.org>
Message-ID: <1ef31b1-edac-cda8-4560-f633c63a9244@anisinha.ca>
References: <20221028103419.93398-1-shentey@gmail.com>
 <20221028103419.93398-4-shentey@gmail.com>
 <CAARzgwyMiEQUc=DEd5iJb=hgsoMn8tQaNeOnzKAG8qaxWhdRYw@mail.gmail.com>
 <8EA83461-41EC-40E1-AD22-C4107216870B@gmail.com>
 <CAARzgwyRJbQuUFBOSsnm_PHLWoOBcKYX8WucKk7_VeQ=Xan0kg@mail.gmail.com>
 <20221029043803-mutt-send-email-mst@kernel.org>
 <fe7a1bbb-9993-4eee-6543-5e7e8391b6c@anisinha.ca>
 <20221030121158-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 30 Oct 2022 16:18:20 -0000



On Sun, 30 Oct 2022, Michael S. Tsirkin wrote:

> On Sun, Oct 30, 2022 at 09:15:44PM +0530, Ani Sinha wrote:
> >
> >
> > On Sat, 29 Oct 2022, Michael S. Tsirkin wrote:
> >
> > > On Fri, Oct 28, 2022 at 10:18:43PM +0530, Ani Sinha wrote:
> > > > On Fri, Oct 28, 2022 at 9:45 PM B <shentey@gmail.com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > Am 28. Oktober 2022 10:58:07 UTC schrieb Ani Sinha <ani@anisinha.ca>:
> > > > > >On Fri, Oct 28, 2022 at 4:05 PM Bernhard Beschow <shentey@gmail.com> wrote:
> > > > > >>
> > > > > >> The code currently assumes Q35 iff ICH9 and i440fx iff PIIX. Now that more
> > > > > >> AML generation has been moved into the south bridges and since the
> > > > > >> machines define themselves primarily through their north bridges, let's
> > > > > >> switch to resolving the north bridges for AML generation instead. This
> > > > > >> also allows for easier experimentation with different south bridges in
> > > > > >> the "pc" machine, e.g. with PIIX4 and VT82xx.
> > > > > >
> > > > > >Unfortunately this patch does not apply on the latest master. Also the
> > > > > >code seems to be off. Can you rebase and rework the patch?
> > > > >
> > > > > I've rebased onto Igor's series to avoid merge conflicts,
> > > >
> > > > Ok I will let Igor deal with this then since I have not followed his patchset.
> > >
> > > should you want to review this, it's all in my tree right now.
> >
> > I tried your "next" branch from
> > git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git
> >
> > and it does not apply there either.
>
>
> commit 87bbbe87c259414864a02e8385a0c8becd269ea5
> It is already applied there.

Hmm, I am not seeing it :

ani@ani-ubuntu:~/workspace/qemu-mst$ git show
87bbbe87c259414864a02e8385a0c8becd269ea5
fatal: bad object 87bbbe87c259414864a02e8385a0c8becd269ea5
ani@ani-ubuntu:~/workspace/qemu-mst$ git branch -vv
  master 7457fe9541 [origin/master] Update version for v1.7.0-rc2 release
* next   e336a0d550 [origin/next] ack! hw/ide/piix: Ignore writes of hardwired PCI command register bits


