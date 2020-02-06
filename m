Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1izjug-0001jY-W5
	for mharc-qemu-trivial@gnu.org; Thu, 06 Feb 2020 11:21:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45295)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1izjud-0001h5-Sa
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 11:21:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1izjuc-0007yl-IM
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 11:21:55 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:39863)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1izjuc-0007wI-Ad
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 11:21:54 -0500
Received: by mail-oi1-x233.google.com with SMTP id z2so5151637oih.6
 for <qemu-trivial@nongnu.org>; Thu, 06 Feb 2020 08:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v96A85hSQsl+Wuu8aZMC3P0Vbqv63ZTHZqXWH6WOBBQ=;
 b=jjExA/+lAdP0GFLnGUlqqZPgju3x+JrwDT4o6ie36ALHBcqxzCHLjHBm0EGKeZUfcR
 BO9xulremVUaVhDuPvmmSsZq8BWbKbVcpHxZGbNnWwbpvfuYTqfZnKTiFzjpueG+iWPI
 GFszHIYEope5cE3Noht9rLCRgxOEu3B2sdurN3vSOaihVSA2pmWrABVKVnvbO2QiOEvN
 Jqg2b+ovWWxYjECDwXdUibpobaj5h0EY4pI8KTZn33dSc6VZJuBSM+ao34/7b/uuzwg6
 P+MDWAhXSUvnO6BiZg3UFry4K/q/5krm+K32neAXKCbRTrgAaghwQ5zTDUr1MJOUOxM9
 Hxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v96A85hSQsl+Wuu8aZMC3P0Vbqv63ZTHZqXWH6WOBBQ=;
 b=A8rnD3KK9kMIPlkYU9AZqoCuM/ZYAuezHSo7re3zoTO7aQn4Z0+xV4y7wFU5x8jUBR
 +2W2D3k0NyniTfSv7lHnSnI3+UsN1ijtVeH3VFNFQOCGQeCjx2hw0nLKZr0PSlkpspWf
 DIzuZMijE//ReWosr7MxfKVgo2KZFPv2ywFXPUHWB5vMlpmEbBulRWpCQb+OV5Dj8yhT
 C2u/msQoft7kXCLUYjUzezmCLpoLzKIgy/IP6obTFER718Axi+TOy7vO9ULsZaW1oVq3
 1YzPK9MT9MBXc6RnOdcz462NzgDK9B3SfF4QH5KVQNGiLBGbyUBfmL/bfbAycVV3JJ6l
 XtEg==
X-Gm-Message-State: APjAAAX+UUzvreJS4zZjpjXfyKp0YdDLJtUnffCCefTgtdJehe6wu/+Y
 NQcwF/AfmU6l30tdTqqsyGRP1BaQBugTcXnLtjiClA==
X-Google-Smtp-Source: APXvYqy4Uiq/2N7lL/jTsZNffY5ATmhKfOfBmT5bOULjNf4D9KjDia8jCfYk39zMf1+BSiqlnoCF7kItsWmVApkUB6w=
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr7280033oie.146.1581006113321; 
 Thu, 06 Feb 2020 08:21:53 -0800 (PST)
MIME-Version: 1.0
References: <20200206125027.1926263-1-laurent@vivier.eu>
In-Reply-To: <20200206125027.1926263-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Feb 2020 16:21:42 +0000
Message-ID: <CAFEAcA_-8Qzamm7n6WBPZFHuMmMuHQ9fpzKZ+8TnBWQ0g=3vnQ@mail.gmail.com>
Subject: Re: [PULL 00/12] Trivial branch patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>, 
 qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, 
 Joel Stanley <joel@jms.id.au>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::233
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
X-List-Received-Date: Thu, 06 Feb 2020 16:21:57 -0000

On Thu, 6 Feb 2020 at 12:50, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 7bd9d0a9e26c7a3c67c0f174f0009ba19969b158:
>
>   Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2020-02-04' into staging (2020-02-04 16:12:31 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to 8ef350b32fe08d254f92a3a7efe89809397fff77:
>
>   MAINTAINERS: Cc the qemu-arm@nongnu.org for the ARM machines (2020-02-06 12:32:03 +0100)
>
> ----------------------------------------------------------------
> trivial patches 20200206
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

