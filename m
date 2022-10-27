Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oo6cL-00088m-CU
	for mharc-qemu-trivial@gnu.org; Thu, 27 Oct 2022 13:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oo6cJ-00086x-HT
 for qemu-trivial@nongnu.org; Thu, 27 Oct 2022 13:24:31 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oo6cH-0008As-Uc
 for qemu-trivial@nongnu.org; Thu, 27 Oct 2022 13:24:31 -0400
Received: by mail-pl1-x62e.google.com with SMTP id io19so2225003plb.8
 for <qemu-trivial@nongnu.org>; Thu, 27 Oct 2022 10:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Kwfk3gz7PC13LMB2IWM5ktSZ8KPzYZNjFGpc+j9dang=;
 b=TOp+3teF/valMu22OFyHulMSXZwx2syQYPl2darOTgbqNBmlNFVbcV5zxq5sKJ7EFN
 9+uVVpiuwYE001Y8AIbUsnmINIXLbn2QnBV4hqCwdUH6TbUB+HTnl4laQ8FahVmN8BZy
 +Hv2RLCMuso1UAGaW4maUV/6iaMIzCUMnqjd6Ro5AfK5XYyR3G4wqwtslwY/cJAGVL4Q
 EJ2utOYUCeIhppScKbnmvHhKVa6D1CLhE+eED5OtJ655ogxpgqcgNWmxsyz3t8wB6GB0
 VKo1KPNieVgBJQJne2cLV37XSJ78w8JQ2MvtL/bB/zu4hc/7E2ybsxZf80BN3vqXpJJ/
 TGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kwfk3gz7PC13LMB2IWM5ktSZ8KPzYZNjFGpc+j9dang=;
 b=NN4D6wdZ28Hd/HXe2Lw5tj7xhX3R/2qysS1wOtect5OTsYlQIC14M/AEdjq7r1U7Le
 7Fx5OPvUfHKB6P8xQ09MzA5hZgt57IwNVxjS8ZtO/cgdpR3IIDpGBeOAkhEyr7X8BtbB
 UFi7xuf9WjcqtK301WKbMCYju57JZKqz4r25HMYzJlVSNNChP9UluOX8WV/9h5pF+f+q
 7W/ZQXobvWFGhVnWi6upLm5C6EswE8P3YsH9y+PM/hOQ2FZo8DbjGJtNv8zkT+FT7yhw
 MnFn2PmG7YZEV/lulGGyvLg594KgOy0kJvUaLYet6Mq979Znj3XJAobUfCV2kuzbT2D+
 0I8Q==
X-Gm-Message-State: ACrzQf2ugJ7+hPWGHN7/VEZV6d97+SCzMAyAf/ZXnjsAFByBpndAIKBh
 jSLqrs4PBZMpecyaEYLkcP9g1ktQ9z4FfG4cmx2XIg==
X-Google-Smtp-Source: AMsMyM7I9AsmV8XvX1JCWXghdrMnt2pIegOJgVYgnQ3w63ANiLIwLXIcwGlXVLUWLmJ6BLOagqeqXCPJDfmjSY2fyzU=
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr48734918pll.19.1666891468480; Thu, 27
 Oct 2022 10:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221025235006.7215-1-philmd@linaro.org>
 <87bkpxl4a1.fsf@pond.sub.org>
 <CAFEAcA_WefVz8fefKTVq8vkiOkdXhrXkcwj4G6bSZPaFoRTSMg@mail.gmail.com>
 <87r0ytjie3.fsf@pond.sub.org>
In-Reply-To: <87r0ytjie3.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Oct 2022 18:24:16 +0100
Message-ID: <CAFEAcA_-udYfzGNzfARvK1G2ZVKCP+_spEUKa3THroRQ+9SMMQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] target: Rename headers using .def extension to .h.inc
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, 
 Cornelia Huck <cohuck@redhat.com>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 27 Oct 2022 17:24:31 -0000

On Thu, 27 Oct 2022 at 18:17, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Thu, 27 Oct 2022 at 15:40, Markus Armbruster <armbru@redhat.com> wrote:
> >> I wonder why we use any of .def, .h.inc, .inc.h, .c.inc, .inc.c.  Why
> >> not .h and call it a day?  No need to configure each and every editor to
> >> tread these as C code.
> >
> > It says "this isn't actually a header in the usual sense". That's
> > useful for automated scripted checks (eg we don't want
> > scripts/clean-header-guards.pl to add the standard #include header
> > guards to this sort of file) and for humans (if you see one of these
> > files included as part of the normal #include block at the top of
> > a .c file that's probably a mistake; if you see it being used then
> > you know there's likely multiple-inclusion shenanigans going on.)
>
> scripts/clean-header-guards.pl needs exclude patterns anyway.

Yes, in theory instead of having a systematic convention for
filenames we could instead give the files names that don't
let you easily distinguish them from plain old header files and
require every use like this to update clean-header-guards.pl,
but that seems to me to be clearly worse than maintaining the
filename convention that we already have.

> Comments would likely work better for humans than obscure naming
> conventions.
>
> Make them stylized, and they work for scripts, too.

We already have a stylized convention, it's the filename...
Comments inside the .inc file are also helpful, of course.

-- PMM

