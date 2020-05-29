Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jei3Y-0002IN-HA
	for mharc-qemu-trivial@gnu.org; Fri, 29 May 2020 12:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jei3W-0002Gm-PG
 for qemu-trivial@nongnu.org; Fri, 29 May 2020 12:40:26 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:41863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jei3V-0006RI-JO
 for qemu-trivial@nongnu.org; Fri, 29 May 2020 12:40:26 -0400
Received: by mail-ot1-x343.google.com with SMTP id r24so2395726ota.8
 for <qemu-trivial@nongnu.org>; Fri, 29 May 2020 09:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e2M+Wwc1mwNcFUeT6IxqoZrHvnQq+IKdo92Er62pcuk=;
 b=pMXlqQYPoyYb9P2/PmnjktbAv3+6X18oT/KBbIEiV44vscLU5L9+/05LuitKVnwpR/
 bus4ppqjC9U3Gk7lOyJ8yYb8NP7LKov+ItzKAf3j6XnjfRqNAEI5oNnqu11LjUXxIT14
 v7spxgtGLbbUsfWfcl8Q5qs6hdPdY3VnZ6d085nR3zEuG8c87AK3LBeZJzfuPgKMgq8n
 tTBdQAogLF48aHRLGwoOeEYwDDxSS3z5LY2fJSxjmuc8kXD+ULJr+sL3cQ0NGJWNxCmk
 VZPyg7tFepeWjbkcJdcZGPPYRx7NqBglf0FaFkTHdWf2NrBQmBwRVVEjwNzLZiQRWX8K
 +Kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e2M+Wwc1mwNcFUeT6IxqoZrHvnQq+IKdo92Er62pcuk=;
 b=h6PG25Vbs2v16hkRyVZ2QxdB0e7t0hV6P3woGCy7v9WG52TVY/J52sBcn/PPbLq9ps
 CR8e0LEovtRKMtMpW5puFXW85IgVIIfyPHwdhRklpWNLY0QHB+Hda7RxRjw5eMyB7ekw
 uk4dyUtevGRECc/Xe6pMgc5Mw4srPkMsv0kY6D5uq0ec7A2BVMeyyQpZMUaWBYuKZMs5
 vp0WrIC7T8cItD/QWsfNgrF+tlas6LmLauxmZMwZTZWuIDbz6FYHO/+i+/yQ9DDdabSn
 4eEWGGoWIKxymNCZ/045e4cCZPlhI35n9Kfg0h8LTiqE+yGkICfcgv0glWnxaKbUmSoY
 0rzg==
X-Gm-Message-State: AOAM5331mxu98678uVliWfQyhJ5TWhrUGLzf6SRvle8sGa5G3t4niLQ1
 c0nWLfaeOoGeOsGreQaLvfmt7sLyfqLxCt+ppu87/g==
X-Google-Smtp-Source: ABdhPJw3zc5/KFIzARFhwhChrf9sDj1hVSANgCxST19qoKXhHWvlmm3kznuLQa/YoBMCeRBGzNYZQAK6nZlKT0nmF04=
X-Received: by 2002:a9d:3623:: with SMTP id w32mr6691253otb.91.1590770424218; 
 Fri, 29 May 2020 09:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200526185132.1652355-1-eblake@redhat.com>
 <m1d06msod9.fsf@redhat.com>
In-Reply-To: <m1d06msod9.fsf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 May 2020 17:40:13 +0100
Message-ID: <CAFEAcA9Huery0AeUFsLVrcK4bUGibg1f-m8gMuMiJgnr+Hj7CA@mail.gmail.com>
Subject: Re: [PATCH] or1k: Fix compilation hiccup
To: Christophe de Dinechin <dinechin@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
 Stafford Horne <shorne@gmail.com>, Jia Liu <proljc@gmail.com>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
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
X-List-Received-Date: Fri, 29 May 2020 16:40:27 -0000

On Fri, 29 May 2020 at 17:23, Christophe de Dinechin
<dinechin@redhat.com> wrote:
> On 2020-05-26 at 20:51 CEST, Eric Blake wrote...
> > diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> > index d08ce6181199..95011a8015b4 100644
> > --- a/hw/openrisc/openrisc_sim.c
> > +++ b/hw/openrisc/openrisc_sim.c
> > @@ -129,7 +129,7 @@ static void openrisc_sim_init(MachineState *machine)
> >      const char *kernel_filename = machine->kernel_filename;
> >      OpenRISCCPU *cpu = NULL;
> >      MemoryRegion *ram;
> > -    qemu_irq *cpu_irqs[2];
> > +    qemu_irq *cpu_irqs[2] = {};
>
> Why is the value [2] correct here? The loop that initializes loops over
> machine->smp.cpus. Is it always less than 2 on this machine?

Yes: openrisc_sim_machine_init() sets mc->max_cpus = 2.
My suggestion of adding an assert() is essentially telling the
compiler that indeed smp_cpus must always be in the range [1,2],
which we can tell but it can't.

thanks
-- PMM

