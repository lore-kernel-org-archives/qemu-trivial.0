Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kM541-00088t-P7
	for mharc-qemu-trivial@gnu.org; Sat, 26 Sep 2020 03:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kM53z-00088P-Ok
 for qemu-trivial@nongnu.org; Sat, 26 Sep 2020 03:56:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kM53x-0008GS-J3
 for qemu-trivial@nongnu.org; Sat, 26 Sep 2020 03:56:11 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601106968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S4kV3T7hzPKK3/3oXJOpR3FlMCQqMO5CoJCEIAAx/K4=;
 b=QeLsbLcjdHz5BjiEPDdIUXi+1jb83MKGMHnvx/iuyTAjJOmWs1cF/JyEQjZkuxmF9lIxML
 RVIIb08WooE7To9mi7pfcB0ZR1ucykjpODO6bHBClkuKzsj0QrQxlzp2qMRyY6vdQFJKfB
 b5J25K4mp6jrt5U/jIp5oynsF2p07Zg=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-2evc-BYYNYGr8kEX-U8ktQ-1; Sat, 26 Sep 2020 03:56:06 -0400
X-MC-Unique: 2evc-BYYNYGr8kEX-U8ktQ-1
Received: by mail-oo1-f71.google.com with SMTP id a21so2406312oos.5
 for <qemu-trivial@nongnu.org>; Sat, 26 Sep 2020 00:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S4kV3T7hzPKK3/3oXJOpR3FlMCQqMO5CoJCEIAAx/K4=;
 b=eVVJlgFjVEqZIV5k+a1qGCZiFYcW+L9UqAwnstiB5P+4w0qGZg9kVof2JDe/RQfB6C
 azzmog4c/6/Ewmh21y4U2gHCmVQDhApnncUt9JPet5VJ8hzIx6YGwPl2gvHXwxg8x8fY
 IUwGzml2efNECeY6NAMgdLeDDVeljxGMKKA0Wmphs4wdhhwAet1zGLElgQdy1UNpN7Ve
 gA6Zyu7M7pJ6jK4UdZZRjOMAQuBFD1//C4tLUbITPFfqbOesnsd+7wPlJ654XHT7LaUB
 jOi+wCgz7mR+kqA1znKoV8B0QzH0Dj2cDtFMV5Hyg6nDYSclzVg21BVXW/rwXl1RZT7k
 DmUQ==
X-Gm-Message-State: AOAM5330IwFhYhjRQi1pB/5/TrvYLj9T6J6CUjiXEr2V9lj1rZRwwY5V
 3vlNOlcBpqGqOsUYj9qZHu7pzFi3ckwC5aFWairxZEsv2rMvWn+GGBm4Tu9HHfrOj43cTle5TZ4
 Qqk0Fdy+hinnKZgzygml5AiIJYhhDbnxQsA==
X-Received: by 2002:aca:5110:: with SMTP id f16mr750807oib.30.1601106965358;
 Sat, 26 Sep 2020 00:56:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQU6V4x31QZRjhA/rEuj9+m+wkqXbtsMxkjX3FzfvlqWeH6p8BjMGIr1tgmWg76SnkFXWt9W1mYmmZ+FiC39Y=
X-Received: by 2002:aca:5110:: with SMTP id f16mr750801oib.30.1601106965175;
 Sat, 26 Sep 2020 00:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqxQ3o_h7_Fwho7gu9x9Pw5jCw=z-goVMyzJgQYqZR-cgA@mail.gmail.com>
In-Reply-To: <CA+XhMqxQ3o_h7_Fwho7gu9x9Pw5jCw=z-goVMyzJgQYqZR-cgA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Sat, 26 Sep 2020 09:55:54 +0200
Message-ID: <CAP+75-XwpLiutpW6-J3DLKFGXOVd=tLF2fG2=0=nP9+KZ0UYug@mail.gmail.com>
Subject: Re: [PATCH 1/3] Include endian.h for Haiku to solve bswap* macros
 build
To: David CARLIER <devnexen@gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/26 03:02:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 26 Sep 2020 07:56:12 -0000

Hi David,

On Fri, Jun 26, 2020 at 4:08 PM David CARLIER <devnexen@gmail.com> wrote:
>
> From 95ef79ddff73eebd1f1bec6673c2c68209fab107 Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Fri, 26 Jun 2020 13:56:14 +0000
> Subject: [PATCH 1/3] Include endian.h for Haiku to solve bswap* macros build
>  failure.

Back to this patch, what version of Haiku are you using?
I couldn't find this information in your other emails.
Thanks,
Phil.

>
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  include/qemu/bswap.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
> index 2a9f3fe783..1d3e4c24e4 100644
> --- a/include/qemu/bswap.h
> +++ b/include/qemu/bswap.h
> @@ -8,6 +8,8 @@
>  # include <machine/bswap.h>
>  #elif defined(__FreeBSD__)
>  # include <sys/endian.h>
> +#elif defined(__HAIKU__)
> +# include <endian.h>
>  #elif defined(CONFIG_BYTESWAP_H)
>  # include <byteswap.h>
>
> --
> 2.26.0
>


