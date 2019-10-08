Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHm79-0002IL-Qg
	for mharc-qemu-trivial@gnu.org; Tue, 08 Oct 2019 05:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38800)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1iHm73-0002Gd-9T
 for qemu-trivial@nongnu.org; Tue, 08 Oct 2019 05:49:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1iHm70-0001MC-Jc
 for qemu-trivial@nongnu.org; Tue, 08 Oct 2019 05:48:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34434)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1iHm70-0001KJ-A5
 for qemu-trivial@nongnu.org; Tue, 08 Oct 2019 05:48:58 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EF0EE81DFF
 for <qemu-trivial@nongnu.org>; Tue,  8 Oct 2019 09:48:55 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id v17so8456876wru.12
 for <qemu-trivial@nongnu.org>; Tue, 08 Oct 2019 02:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BTsyp0rkfpFF+Stz0EkJoZ64+6dsBQF35YVuFlsuWls=;
 b=XuNA4Fgsihlwl0JVDYjak3ciLeyZWfTxi5WH96s3qKWQtCuXxJt+NOCxFz3PcSNQSz
 SmHoMtRaL95wXh0F8808GWzIujZA5pZnfIqz9ftQhe53vDwuFLrdMo36rjPnV7/A+LBr
 sN64oa902son53FglL+65tn2or9ZwIq7He+3wQRI8cDCLpnUTjC5DtXky/x3opeYbWSk
 KFE11xjpMnwExyBesfzYgYX8xddDrxIYGZ2XcouNM7KbDAvUfhKSIQ0jCKowaZDZ3yEs
 3Wm2APk5E+DuTzbsWDd1Wc0KNgX7zJ8Y7264IGIlRHRrT4y1xEEiURo6TqxHV7dfPVnk
 XOcQ==
X-Gm-Message-State: APjAAAU0j5oZeNVYyYj6YxRlz0FWsjIyQIq7zSnh2Yge36Y8XwzwfuRn
 7GCZG4jgYje3ccbz69agPtJo6WZjMtW+lHjk9xreXEEVGms9wnq5w/pwDv2mTFUWgGYMKPoZZMp
 WZqB3dDQWMAni9kAvRA==
X-Received: by 2002:adf:bb8e:: with SMTP id q14mr28425774wrg.74.1570528133852; 
 Tue, 08 Oct 2019 02:48:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqweRhpDhxmObUBqarqG14W+X+DsSDrPsDcCY72LLlhER1ZBFfIlhmHuKimLAjlYaH6EgrR1lw==
X-Received: by 2002:adf:bb8e:: with SMTP id q14mr28425746wrg.74.1570528133567; 
 Tue, 08 Oct 2019 02:48:53 -0700 (PDT)
Received: from steredhat (host174-200-dynamic.52-79-r.retail.telecomitalia.it.
 [79.52.200.174])
 by smtp.gmail.com with ESMTPSA id y186sm4825149wmb.41.2019.10.08.02.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 02:48:53 -0700 (PDT)
Date: Tue, 8 Oct 2019 11:48:50 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu devel list <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Vincenzo Maffione <vmaffione@freebsd.org>,
 Giuseppe Lettieri <giuseppe.lettieri@unipi.it>
Subject: Re: [PATCH] Test netmap on FreeBSD
Message-ID: <CAGxU2F61+TjSy_GJ_2673--VLstVyJjNoqqPdZw+ej22xbzk=Q@mail.gmail.com>
References: <20191008084931.12753-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008084931.12753-1-thuth@redhat.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Tue, 08 Oct 2019 09:49:03 -0000

Hi Thomas,

On Tue, Oct 8, 2019 at 10:49 AM Thomas Huth <thuth@redhat.com> wrote:
>
> FreeBSD offers a package for "netmap", thus let's install it in our
> FreeBSD tests to get some compile test coverage for net/netmap.c, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .cirrus.yml      | 2 +-
>  tests/vm/freebsd | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/.cirrus.yml b/.cirrus.yml
> index 8326a3a4b1..44fea2c29e 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -8,7 +8,7 @@ freebsd_12_task:
>      memory: 8G
>    install_script: pkg install -y
>      bash bison curl cyrus-sasl git glib gmake gnutls gsed
> -    nettle perl5 pixman pkgconf png usbredir
> +    netmap nettle perl5 pixman pkgconf png usbredir

>    script:
>      - mkdir build
>      - cd build
> diff --git a/tests/vm/freebsd b/tests/vm/freebsd
> index 2a19461a90..45821702bd 100755
> --- a/tests/vm/freebsd
> +++ b/tests/vm/freebsd
> @@ -54,6 +54,9 @@ class FreeBSDVM(basevm.BaseVM):
>          # libs: opengl
>          "libepoxy",
>          "mesa-libs",
> +
> +        # libs: network
> +        "netmap",

IIRC netmap is shipped with the FreeBSD kernel, so we shouldn't need to
install it.

I tried to understand what is the 'netmap' pkg and I found the following
in my FreeBSD 12 VM:

    # pkg search netmap
    netmap-0.1.3_1         Make a graphical representation of the surrounding network

I don't think we are installing the right 'netmap' (I know, it is a bit
confusing :) )

I'll tried "make vm-build-freebsd" without this patch and I noticed
"netmap support    yes" in the configure output. So I think we're
already compiling the netmap backend in the 'vm-buil-freebsd' target and
maybe also in cirrus.

Maybe Ed and Li-Wen can confirm (or not).

Thanks,
Stefano

