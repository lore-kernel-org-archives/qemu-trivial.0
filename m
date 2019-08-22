Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0jRP-00013B-59
	for mharc-qemu-trivial@gnu.org; Thu, 22 Aug 2019 05:31:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47617)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i0jRL-00012x-WD
 for qemu-trivial@nongnu.org; Thu, 22 Aug 2019 05:31:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i0jR4-0004Pd-MO
 for qemu-trivial@nongnu.org; Thu, 22 Aug 2019 05:31:21 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:36022)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i0jQy-0004Je-FL
 for qemu-trivial@nongnu.org; Thu, 22 Aug 2019 05:31:08 -0400
Received: by mail-oi1-x241.google.com with SMTP id n1so3856997oic.3
 for <qemu-trivial@nongnu.org>; Thu, 22 Aug 2019 02:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+mvF+u8nRF4B5UCflU874NSkhPdxuLqU4e0/vgUOCL0=;
 b=qC0LuhD/d+eS89XpAInGpPXCd8cGiABMZhzZZW0+qbix5nn9hjRXekPADslooZbqOh
 BDI3iFge6GV5SE3qmhdZggYAdA1WgDjnTgvbc/LyR7pL7fjoREbwuRX/dVwLqN2hh/d4
 boZmxrrpbjuGjNQGIW+sVHBRF4avAekfb8YcTtvoJg9rzINh0S9omsajBpCjD7pQuvZ7
 oWH1jGBb4WSQI6Rql9m406+e8sfup+V3jecHP3eJqdlBaypyVo65LO2cNTfqXF18i7CF
 XQzscBmHLDe3lCvSsw7+RjdxE5HB1xXcI00OIv78tSmG8hjFftei7my0tYjst9iTsXIh
 H6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+mvF+u8nRF4B5UCflU874NSkhPdxuLqU4e0/vgUOCL0=;
 b=TMNL2e+UjQMDsOx7ROZ8kVx/jKsGNYBw7gx8lGQ/tTnOfcUCYdj2qdsknu3ZrIpGik
 JQVOvLFMDzNURHTW3Iue6KCie9cWl40I8HiyAwaIDX8nKhGjFRYkJPu3YidDtAjGTprc
 bkuxQarN6t8Rhi6BFd/R+X8Yiw3+kCWqeWn3dkyd3PEhCZA2YTT4/u6bVlBKK/tPg68G
 Hgx5Xud24P95ixAzmr7N8pguiSCjpdoDGVeGKE1BJeHD8HhgKu8RMJz7OG7jn82KTF6h
 a/7z3t+ib8EB7Zij4AJZZ5scXjmWRuyRKprAMv1Ys7YVClfTUEWhYoxSztjRIwpTuncg
 3hzA==
X-Gm-Message-State: APjAAAXgiNHKhVL7Ahc93JL3iDzF1uuqpXifK78AUq5+jF8VNJ6l833Q
 8/XJAVQYbVQaifKe4aJ3/LUDy8x259eK1mm/FgEMRA==
X-Google-Smtp-Source: APXvYqy/izIJgUcqOP1MnDX5FoLVj+emD3FWyF8F94KLYcR+Y5XmGF8iDeztmLNlwOLSkRLPgLvySfokrIvnhqGKqkU=
X-Received: by 2002:aca:50cb:: with SMTP id e194mr2906769oib.48.1566466266287; 
 Thu, 22 Aug 2019 02:31:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190821111947.26580-1-laurent@vivier.eu>
In-Reply-To: <20190821111947.26580-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Aug 2019 10:30:55 +0100
Message-ID: <CAFEAcA_redM_6EGE_kMesD3RhKmABvoX0nW5m4X7t8sNBfZbwA@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Corey Minyard <minyard@acm.org>,
 Juan Quintela <quintela@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, 
 Jason Wang <jasowang@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>, 
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>, 
 David Gibson <david@gibson.dropbear.id.au>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-trivial] [PULL 00/14] Trivial branch patches
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
X-List-Received-Date: Thu, 22 Aug 2019 09:31:33 -0000

On Wed, 21 Aug 2019 at 12:20, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 17dc57990320edaad52ac9ea808be9719c91cea6:
>
>   Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2019-08-20' into staging (2019-08-20 14:14:20 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to 8a9224a250094222e9ff302b95e379c3e71d3c8a:
>
>   hw/display: Compile various display devices as common object (2019-08-21 13:17:22 +0200)
>
> ----------------------------------------------------------------
> Various trivial fixes
>
> ----------------------------------------------------------------

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

