Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nFZqi-0003ll-JP
	for mharc-qemu-trivial@gnu.org; Thu, 03 Feb 2022 06:00:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFZqa-0003k0-8C
 for qemu-trivial@nongnu.org; Thu, 03 Feb 2022 06:00:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFZqM-00076c-SL
 for qemu-trivial@nongnu.org; Thu, 03 Feb 2022 06:00:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643885999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0TIqe/cGRzEX4Izfvzgine/IdnHCG3xMi6YcFdp9gE=;
 b=X91rFxpgDMel/6teiuNMRQIs5yUcprtacnJXcEROVYOiHQyltGZf+rklFL1xhsni/Q2FKo
 lNB8MA0DGfS0QG8MnF6UYoRcPK8tHDw4WniM5Fd2/RXXrPxFwwbDwpU46sjsMaG1+od1bA
 hmg6jJpN6Uk1lIvb4DeG8fW25GIm35E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-8NPDNMQMN0iButnvo19sNw-1; Thu, 03 Feb 2022 05:59:58 -0500
X-MC-Unique: 8NPDNMQMN0iButnvo19sNw-1
Received: by mail-wr1-f72.google.com with SMTP id
 r27-20020adfb1db000000b001d7567e33baso513913wra.12
 for <qemu-trivial@nongnu.org>; Thu, 03 Feb 2022 02:59:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=x0TIqe/cGRzEX4Izfvzgine/IdnHCG3xMi6YcFdp9gE=;
 b=w1InO24987z3C5aGoXJIZ0jA6T2Yj+EaU2YohnpDW6IWVxxHUEKYjYr6IprOM31Hu1
 Q8uvdkBsKAUjECMnDXWn333VAHth+Gujs84WLlOQwjGytFF7kL1pLONYer7pb7D1MBnp
 vnVVFm/kLcviD7gzwQ+EWjRio0iI8TXeX5HFsFB8niL0oOC8gX2cZGRIWDvowDAGOg4Y
 26azN5XCARGjSQAbYFbd72ANdw+JoorNCdc//1+aMSsiwWVge6p7z7KKQIJLKhcAyqym
 2uhoHhMNBfwEsW8bLORWzMyDJnj5VGX1skGWRktwgttoZlgRCWxNyBZvydVWGJuGxOwl
 YQHQ==
X-Gm-Message-State: AOAM530+k2upr1wXzZln6d0JSsuTMMqmoIlTBKlrIEYMSaGYgKKqBQyF
 bHHMw+PT7811jb0Q0Diu5F5OBEm9GPD3n9MQdv6RM4j4hazDPB8rQhTUzbE1b2ezRfpVUwbAppH
 v9gkGbsllaPtggTNAXw==
X-Received: by 2002:a5d:6d82:: with SMTP id l2mr29002047wrs.236.1643885996773; 
 Thu, 03 Feb 2022 02:59:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3uL/ax4Zt2sU0H+lbsyq/8uxbjSF1o1MMdr9NurfOfWNY1WvFocxlA6GR+TOnftCvqiHGNA==
X-Received: by 2002:a5d:6d82:: with SMTP id l2mr29002029wrs.236.1643885996521; 
 Thu, 03 Feb 2022 02:59:56 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id o14sm6812942wmr.3.2022.02.03.02.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 02:59:55 -0800 (PST)
Date: Thu, 3 Feb 2022 10:59:53 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, shorne@gmail.com, richard.henderson@linaro.org,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH v2] Fix %#0 misuses
Message-ID: <Yfu1qfCH73D4zA1l@work-vm>
References: <20220202183417.116478-1-dgilbert@redhat.com>
 <77c6899b-5892-5aaa-97ee-a79a74928c09@amsat.org>
MIME-Version: 1.0
In-Reply-To: <77c6899b-5892-5aaa-97ee-a79a74928c09@amsat.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 03 Feb 2022 11:00:19 -0000

* Philippe Mathieu-Daudé (f4bug@amsat.org) wrote:
> On 2/2/22 19:34, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > Joe Perches pointed out on lkml [1] that the format special %# (which
> > adds 0x) is included in the character count, i.e.:
> > 
> >    printf("0: %#08x\n0: %#08x\n", 0xabcdef01,1);
> > gives:
> > 0: 0xabcdef01
> > 0: 0x000001
> > 
> > rather than padding to the expected 8 data characters.
> > 
> > Replace all the '%#08' cases by '0x%08' and
> > also handle a '%#02'; there are some other cases mostly
> > in testing and a few that look like the authors have
> > thought about the size, that I've ignored for now.
> > 
> > (Note I've not managed to test most of these)
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > 
> > [1] https://lore.kernel.org/lkml/9499203f1e993872b384aabdec59ac223a8ab931.camel@perches.com/
> > 
> > Fixup %#
> > ---
> >   chardev/baum.c          | 2 +-
> >   disas/alpha.c           | 2 +-
> >   disas/sparc.c           | 2 +-
> >   hw/arm/omap1.c          | 2 +-
> >   hw/timer/a9gtimer.c     | 4 ++--
> >   include/hw/arm/omap.h   | 5 +++--
> >   softmmu/device_tree.c   | 2 +-
> >   target/openrisc/disas.c | 2 +-
> >   8 files changed, 11 insertions(+), 10 deletions(-)
> 
> Few more:
> 
> $ git grep -E '\%#[0-9]{1,2}[dDxX]'

Thanks, actually 1,3 is worth it :-)

> chardev/baum.c:369:            DPRINTF("Broken packet %#2x, tossing\n",
> req); \

Interestingly without the 0

> disas/alpha.c:1854:  (*info->fprintf_func) (info->stream, ".long %#08x",
> insn);
> hw/audio/ac97.c:244:    dolog ("bd %2d addr=%#x ctl=%#06x len=%#x(%d
> bytes)\n",
> hw/dma/i8257.c:265:        linfo ("write_cont: nport %#06x, ichan % 2d, val
> %#06x\n",
> hw/dma/i8257.c:290:    ldebug ("read_cont: nport %#06x, iport %#04x val
> %#x\n", nport, iport, val);

So some of these are a bit weird and might need thinking about; I
*think* they're 06 because the author realised the 0x was counted and
bumped it up from 04; but that actually means I'd need to understand the
device code before changing it.

> softmmu/device_tree.c:372:        error_report("%s: Couldn't set %s/%s =
> %#08x: %s", __func__,
> target/openrisc/disas.c:48:        output(".long", "%#08x", insn);
> tests/qemu-iotests/nbd-fault-injector.py:187: print('unrecognized command
> type %#02x' % req.type)
> tests/tcg/arm/fcvt.c:60:    printf("%02d   HALF: %#04x  (%#x => %s)\n",
> tests/tcg/multiarch/libs/float_helpers.c:72:    asprintf(&fmt, "f16(%#04x)",
> num);
> 
> In mood to add a regexp to checkpatch? :)

I think it already has one for new patches.

> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks!

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


