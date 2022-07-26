Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGM0x-0006Rz-Au
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jul 2022 10:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGM0v-0006OO-En
 for qemu-trivial@nongnu.org; Tue, 26 Jul 2022 10:58:25 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:33465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGM0t-0001dt-UQ
 for qemu-trivial@nongnu.org; Tue, 26 Jul 2022 10:58:25 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id 7so25831776ybw.0
 for <qemu-trivial@nongnu.org>; Tue, 26 Jul 2022 07:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OPm0BPkHwfEjwockYFc0GAABybyewroH36qwIUhnDyY=;
 b=dRN0dwD6m/dMw5UZpCaDe0v6sFiumdEGl3S/2yEsUeByp/uQBxCQ5IuKOYJ5yx/swe
 VUkW4RhFWfh1G1DvwzVmNmFQ/LsVLIFs2ZUvqzTv231jZ8jL975M21OAN4ZB13/sPPqQ
 tJGAinpXGVQV/+uqxrhpziAgdc89s81s08TEyvPiogiEH/R3iH6Up1nS5/1U16VJV0KP
 9oLJsqY0u4MzG0LFcN/wSs5C8yTRNoHPldjkoQ2nvibzIqwwtYhT0pXttQFatDzetr+B
 8fcQIjToHYOC6LRn+Jla+okrfnD3Umz+hLbq19nJwuwxUB3nJmmqg57mOb9zHXBfkz+z
 rngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OPm0BPkHwfEjwockYFc0GAABybyewroH36qwIUhnDyY=;
 b=baAe1SIIab6hqGGR9tnW4U7g3UdmGBGnqAHY4ubX8YoO7xRQ3kuR8dJf3v/B/7FBUb
 Pgzgi2O0DsEU+I3T2qPFd1ExEbYaJZtUeccnSSrSYQDdoa2c1A1Gz4wsEUXErwLBjZTr
 ThsRfbmVK56Gd1t/6Ry/scuO5//dN1zjFAcY/qad4uiDHzsHqfMh1X3A7kDDuncwARWK
 uZZSqefGwAeQogxNEhKrkcvtNnSU9wtSq3OEzGymyl0dua1NEc9fiEM2/9hxKc5A4gAD
 bo9lVt8YHJlJe9eJNFT+ZLvfm3C5/9QNLNlHEcQ28X7Qm+tm1aK2rO8PHXftXytHV0XB
 6HXA==
X-Gm-Message-State: AJIora/rPOSicxxGe/pjSAWGMjgkuJ+zzALLbXss9L7y4aBllQXwKExA
 RjkiIm95PPmEtV6+KiTSq8eYHCsfmZEpJpx+PtC06A==
X-Google-Smtp-Source: AGRyM1thbN3cp7UiJKAqyi2eeO5IJv7AeYDIT//yITN6nAEkFaja5pgBnGJA+bhKyXFO3tfeUX1dluP/cT04iyhRsaM=
X-Received: by 2002:a25:d617:0:b0:671:79bd:69bf with SMTP id
 n23-20020a25d617000000b0067179bd69bfmr1690869ybg.85.1658847502768; Tue, 26
 Jul 2022 07:58:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220630085219.1305519-1-armbru@redhat.com>
 <20220701043032.GA28338@raphael-debian-dev>
 <87wncx2xw4.fsf@pond.sub.org>
In-Reply-To: <87wncx2xw4.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jul 2022 15:57:42 +0100
Message-ID: <CAFEAcA993Z7ty7FvxEX7JjLZCFWrcPRuy2eMJKwoVTZJ1Z7_vQ@mail.gmail.com>
Subject: Re: [PATCH] contrib/vhost-user-blk: Clean up deallocation of
 VuVirtqElement
To: Markus Armbruster <armbru@redhat.com>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>, 
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
X-List-Received-Date: Tue, 26 Jul 2022 14:58:25 -0000

On Fri, 1 Jul 2022 at 06:41, Markus Armbruster <armbru@redhat.com> wrote:
> Could we use a contrib/README with an explanation what "contrib" means,
> and how to build and use the stuff there?

I would rather we got rid of contrib/ entirely. Our git repo
should contain things we care about enough to really support
and believe in, in which case they should be in top level
directories matching what they are (eg tools/). If we don't
believe in these things enough to really support them, then
we should drop them, and let those who do care maintain them
as out-of-tree tools if they like.

subprojects/ is similarly vague.

thanks
-- PMM

