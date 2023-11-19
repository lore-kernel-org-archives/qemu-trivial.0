Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r4oMW-0004m6-2B
	for mharc-qemu-trivial@gnu.org; Sun, 19 Nov 2023 15:25:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1r4oMU-0004ll-G4
 for qemu-trivial@nongnu.org; Sun, 19 Nov 2023 15:25:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1r4oMS-0001aB-R6
 for qemu-trivial@nongnu.org; Sun, 19 Nov 2023 15:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700425538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+PtcTIapM78r+eYfM6iYcINUllsD4Z4mVxqdpMTFjOA=;
 b=B0LDBpyb3nTxMa9dPo7+nGchbWQZt5sRkk9uH1omPYbxhThgnFXcubaX3oSLZaDUwP7FL+
 T+h4Mh6AKdNiPYoutNK4mu9ySae5kL8kWufF5OjHiH361JCXn/KLau68ohy9Jl0tFWIeFw
 YIa1G/AqODWaCEC8PS1FvGtT959b9CI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-1LeiP7H0N4ex5WZ4GLe8sw-1; Sun, 19 Nov 2023 15:25:36 -0500
X-MC-Unique: 1LeiP7H0N4ex5WZ4GLe8sw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40b23aef363so77405e9.1
 for <qemu-trivial@nongnu.org>; Sun, 19 Nov 2023 12:25:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700425535; x=1701030335;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+PtcTIapM78r+eYfM6iYcINUllsD4Z4mVxqdpMTFjOA=;
 b=ZxY7qWoKkAH+2KGXYA84N/bKxCIF1qR3R9+m9cbqplCN7T/WCzKpPE1nzIQlbSxNWv
 076jQUx03icPnQigeqp9dVqiMK+JBQxCuNLgU6YdRVC/ZY+wk94mP7yzSQa5qDK6og85
 mfI3Wvr9YpkeZRxhGmmFQ8bi0pWyPPBeCKFguutzEEIYDekXJvGXbJ6IDWlOiK0Ek4WK
 JHSpPJ53YOlpHL3q7wR7rByVMZ2OLOWO7T2BIdKixuC+/eJrGnMOJm284K32NF8jQDKm
 9WfUGqJD311s0NbKDIdiB/pSmPBGcIBaLc83bp9Tx7mGZOmDCG9cG0AHf3Q8Hs3K6rwP
 BTUg==
X-Gm-Message-State: AOJu0Yws0ln/uAKxR8jiRCflh7YC8eHixXKl3xxBtrVcNqkkcZu76E5q
 0nrwkdtDjNBDTu3DrDOuOI8iJbxuumSc9T2Faio7o7L154158H1sOs2Bs/iC9tdRVHDfZ2RwcG+
 aIGXf/QYrDqk8d4upKg==
X-Received: by 2002:a05:600c:4445:b0:40a:392c:5b79 with SMTP id
 v5-20020a05600c444500b0040a392c5b79mr4237568wmn.14.1700425535330; 
 Sun, 19 Nov 2023 12:25:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWjdHoPyrkf72qaVZJnHhEOnNFJfJrDc3Y/UGyXqAc+YzGNxBH1Cl9NkWdk62dHkt8fAA+7A==
X-Received: by 2002:a05:600c:4445:b0:40a:392c:5b79 with SMTP id
 v5-20020a05600c444500b0040a392c5b79mr4237560wmn.14.1700425535008; 
 Sun, 19 Nov 2023 12:25:35 -0800 (PST)
Received: from redhat.com ([2a02:14f:1f3:2252:367f:6745:f63f:d25])
 by smtp.gmail.com with ESMTPSA id
 gw18-20020a05600c851200b004064e3b94afsm15586683wmb.4.2023.11.19.12.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 12:25:34 -0800 (PST)
Date: Sun, 19 Nov 2023 15:25:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dan Hoffman <dhoff749@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH] hw/i386: fix short-circuit logic with non-optimizing
 builds
Message-ID: <20231119152434-mutt-send-email-mst@kernel.org>
References: <20231118182531.2619772-1-dhoff749@gmail.com>
 <20231119022223-mutt-send-email-mst@kernel.org>
 <CAFXChKJGE92WEfOWsE0=eSfSM55abCA4baOsoPE8V--iWU1GGg@mail.gmail.com>
 <20231119150225-mutt-send-email-mst@kernel.org>
 <CAFXChKJ5-QEG+9Jsd6ZjkHJtssB0UdKS2Uy2iq1DMPjucuwUfA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFXChKJ5-QEG+9Jsd6ZjkHJtssB0UdKS2Uy2iq1DMPjucuwUfA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 19 Nov 2023 20:25:46 -0000

On Sun, Nov 19, 2023 at 02:19:25PM -0600, Dan Hoffman wrote:
> Clang 16.0.6
> 
> I can re-submit with the compiler and version if that helps.

Worth mentioning this and the flags used I think.

> On Sun, Nov 19, 2023 at 2:02 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Sun, Nov 19, 2023 at 11:03:54AM -0600, Dan Hoffman wrote:
> > > On Sun, Nov 19, 2023 at 1:23 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Sat, Nov 18, 2023 at 10:25:31AM -0800, Daniel Hoffman wrote:
> > > > > `kvm_enabled()` is compiled down to `0` and short-circuit logic is
> > > > > used to remmove references to undefined symbols at the compile stage.
> > > > > Some build configurations with some compilers don't attempt to
> > > > > simplify this logic down in some cases (the pattern appears to be
> > > > > that the literal false must be the first term) and this was causing
> > > > > some builds to emit references to undefined symbols.
> > > > >
> > > > > Signed-off-by: Daniel Hoffman <dhoff749@gmail.com>
> > > >
> > > > Could we add a bit more detail here? Will help make sure
> > > > this does not break again in the future.
> > >
> > > The configuration script was ran as such:  ../configure
> > > --without-default-features --target-list=x86_64-softmmu,i386-softmmu
> > > --enable-debug --enable-tcg-interpreter --enable-debug-tcg
> > > --enable-debug-mutex
> > >
> > > I'm pretty sure the only relevant flags here are
> > > --without-default-features, --target-list including x86_64-softmmu and
> > > --enable-debug
> > >
> > > The only error I see is this: [...]/hw/i386/x86.c:422:(.text+0x1004):
> > > undefined reference to `kvm_hv_vpindex_settable' (the other
> > > kvm_enabled() was moved for the sake of consistency). My compiler is
> > > clang (16.0.6).
> > >
> > > I haven't looked into the heuristics or logic for how the compile-time
> > > short-circuit logic works, but I assumed only the first parameter is
> > > "guaranteed" to be checked for a literal false (guaranteed is in
> > > quotes because that's just how clang works, not because it's a feature
> > > of the language IIRC).
> > >
> > > This pattern relies on somes subtle behavior with the compiler, so my
> > > suggestion going forward would be to not rely on code optimizations
> > > removing undefined references based on short-circuit logic (instead
> > > have some configuration macro defined that disables all relevant
> > > code). I'm a new contributor, so I submitted the minimum to make it
> > > work on my machine.
> > >
> > > If you have any other questions, please let me know.
> > >
> > > Thanks!
> >
> > which compiler is this?
> >
> > --
> > MST
> >


