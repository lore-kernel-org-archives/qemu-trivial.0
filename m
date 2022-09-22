Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obK6O-0008UV-5K
	for mharc-qemu-trivial@gnu.org; Thu, 22 Sep 2022 07:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obK5c-0008A0-C1
 for qemu-trivial@nongnu.org; Thu, 22 Sep 2022 07:10:11 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:34559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obK5W-0006cY-T8
 for qemu-trivial@nongnu.org; Thu, 22 Sep 2022 07:09:53 -0400
Received: by mail-ej1-x634.google.com with SMTP id y3so20250570ejc.1
 for <qemu-trivial@nongnu.org>; Thu, 22 Sep 2022 04:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=DBxu8oBCazvdB2SbjQpjzcq6y/5GSsJwjR9oyLAsvp0=;
 b=YmZ7hGCm6qyWfHGM8guRCCMCiz7RUUL94N+1XE3WjJzFhpF9JmnjxH+tpzAR5YqQQa
 KHTWfKd89jrJRpRGUK76HRUsESRNTpxUEOwhGLM/PER9ozfAj8zyQZvoT48FCxcVeOqV
 r/xEm4PCtvBVGTUxDKYpRZftQ2xqik+BHaqVdFjUsqDPFwmzX/FnoAsENOt5KO4t43OV
 YC+H8dgbA/BnUkZOLzTa+eKs1ReLGQMLc3NiYxH81EGX3QORnhV6pN2SjHDxOke2fkzG
 LSgLEbAL2ipPuj5AFQflIu6kKLbaJzo4ykzGk+2vlI9tIb4xO2jHVM4n7amHsl/7tx0A
 7zkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=DBxu8oBCazvdB2SbjQpjzcq6y/5GSsJwjR9oyLAsvp0=;
 b=jqPPEJAjxYUS+TBrlNEolclqQiPSqTeODykJaT8nL2GieWNyZgIrYv6tnAKKNvp/ev
 ORpfVNZOfdipGCiwpQCuDm05w0OXCOLNA9aJB/9rJicKyz0aHt4+7aiJvfHZF8A7mMjd
 eIzQBipd4Sh4Vy2yoi6xjXhAq2wDHiTdDkwc+9IOIL5x44dDbVQAayWX8P1IhQubEAPJ
 BTRHxcH5lR4Va8vB7ol87pOsbvUyRPjO68AtKk5l94EGkWswnWSkpzG4eHdcU7HwBReh
 RND1GAQ+1xYMwIczrh0a01XpQkSFnKY4420Bknf4eA63a9eFOUrSTdMOzPwSJjOtBhIg
 2i7Q==
X-Gm-Message-State: ACrzQf2uUyF5lBsj/u8XPtTxMu3ON/Zlof/ixvKywieulc8Dm1KpQOC6
 zP3cT7YF7nHqiYPglMfD1eKYwAI+6boqnNWVAWsF/A==
X-Google-Smtp-Source: AMsMyM62ESiD3F99OGbcGMcZBAboiuIz8h51AJkDM1WdTxVVjuo6ZDja6kLauIxXporJN138NN9juSlhYS3Jyz+QS6c=
X-Received: by 2002:a17:906:db05:b0:741:5730:270e with SMTP id
 xj5-20020a170906db0500b007415730270emr2222292ejb.609.1663844985713; Thu, 22
 Sep 2022 04:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220816094957.31700-1-zhukeqian1@huawei.com>
 <20220824170433.7ba675ca@redhat.com>
 <CAFEAcA8jdjkZc24FqXBbw+LBJZ5HiCygqY3Y0S2TtmRzdx1P-A@mail.gmail.com>
 <20220921152218.7b55dc76@redhat.com>
In-Reply-To: <20220921152218.7b55dc76@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 12:09:34 +0100
Message-ID: <CAFEAcA_jgrcrhJjxuBRUR0w2Z6-4kaPJHD=3oqUGWePnhSX5GQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/acpi: Add ospm_status hook implementation for
 acpi-ged
To: Igor Mammedov <imammedo@redhat.com>
Cc: Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 qemu-trivial@nongnu.org, Eric Auger <eric.auger@redhat.com>, 
 Peter Xu <peterx@redhat.com>, wanghaibin.wang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 22 Sep 2022 11:10:27 -0000

On Wed, 21 Sept 2022 at 14:22, Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Tue, 20 Sep 2022 14:15:36 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > On Wed, 24 Aug 2022 at 16:04, Igor Mammedov <imammedo@redhat.com> wrote:
> > >
> > > On Tue, 16 Aug 2022 17:49:57 +0800
> > > Keqian Zhu <zhukeqian1@huawei.com> wrote:
> > >
> > > > Setup an ARM virtual machine of machine virt and execute qmp "query-acpi-ospm-status"
> > > > causes segmentation fault with following dumpstack:
> > > >  #1  0x0000aaaaab64235c in qmp_query_acpi_ospm_status (errp=errp@entry=0xfffffffff030) at ../monitor/qmp-cmds.c:312
> > > >  #2  0x0000aaaaabfc4e20 in qmp_marshal_query_acpi_ospm_status (args=<optimized out>, ret=0xffffea4ffe90, errp=0xffffea4ffe88) at qapi/qapi-commands-acpi.c:63
> > > >  #3  0x0000aaaaabff8ba0 in do_qmp_dispatch_bh (opaque=0xffffea4ffe98) at ../qapi/qmp-dispatch.c:128
> > > >  #4  0x0000aaaaac02e594 in aio_bh_call (bh=0xffffe0004d80) at ../util/async.c:150
> > > >  #5  aio_bh_poll (ctx=ctx@entry=0xaaaaad0f6040) at ../util/async.c:178
> > > >  #6  0x0000aaaaac00bd40 in aio_dispatch (ctx=ctx@entry=0xaaaaad0f6040) at ../util/aio-posix.c:421
> > > >  #7  0x0000aaaaac02e010 in aio_ctx_dispatch (source=0xaaaaad0f6040, callback=<optimized out>, user_data=<optimized out>) at ../util/async.c:320
> > > >  #8  0x0000fffff76f6884 in g_main_context_dispatch () at /usr/lib64/libglib-2.0.so.0
> > > >  #9  0x0000aaaaac0452d4 in glib_pollfds_poll () at ../util/main-loop.c:297
> > > >  #10 os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:320
> > > >  #11 main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:596
> > > >  #12 0x0000aaaaab5c9e50 in qemu_main_loop () at ../softmmu/runstate.c:734
> > > >  #13 0x0000aaaaab185370 in qemu_main (argc=argc@entry=47, argv=argv@entry=0xfffffffff518, envp=envp@entry=0x0) at ../softmmu/main.c:38
> > > >  #14 0x0000aaaaab16f99c in main (argc=47, argv=0xfffffffff518) at ../softmmu/main.c:47
> > > >
> > > > Fixes: ebb62075021a ("hw/acpi: Add ACPI Generic Event Device Support")
> > > > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> > >
> > > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> >
> > I notice this doesn't seem to have gone in yet -- whose tree is it
> > going to go via?
>
> I'd guess ARM tree (due to almost sole user virt-arm).
> (there are toy users like microvm and new loongarch)

OK; applied to target-arm.next, thanks.

-- PMM

