Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hhwz7-0005pl-Jr
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jul 2019 10:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50307)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hhwz3-0005nW-Hi
 for qemu-trivial@nongnu.org; Mon, 01 Jul 2019 10:08:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hhwz2-0005gN-Bq
 for qemu-trivial@nongnu.org; Mon, 01 Jul 2019 10:08:41 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36363)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hhwz2-0005fY-62
 for qemu-trivial@nongnu.org; Mon, 01 Jul 2019 10:08:40 -0400
Received: by mail-wr1-f67.google.com with SMTP id n4so14061751wrs.3
 for <qemu-trivial@nongnu.org>; Mon, 01 Jul 2019 07:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d1BtY+n2SJPoGt3rBOyafGxigKB7TJ5SR8J1DQ3Hgq0=;
 b=fN0eH0debrUbRIVxUpYb/FPAagBvOnu+25kJkv3mEoMGQuNJpiHxED3z1VVbPHc3ej
 2PDNW4WrMMyEfeiv6qyVWgUKqYQ/EkhP8pCqnDQzEvfJG6yyTbJKdvyU5WbABO1Xiijj
 YJOlbHiY69X5admjJMLFXmLy6ulf9+P8NPN7U+XodKx41tA3CGLhdBoidFl3GIeLqrT5
 eJb7q8NHBCM8xI2KmeoTsV3oZdCC9kYgHyYP9l3iOfraGPAn+DsiLo9N7XyfBAnY3vkP
 XWJUqwaDX2boYmmQv/NUf6iJGUtgiRaWnkU/M/LcV02JTc9YRGAR8CdihQNulm5kEzPt
 fLug==
X-Gm-Message-State: APjAAAXppaM3HK6nCouDz5eS9/71PSVxEtv/R1QqtiNyb7eNHn43ozt2
 hzUvUTwn9f36fRWowqTOAB9Dbcnd94M=
X-Google-Smtp-Source: APXvYqx6VLq7Bji2v6U6C1l5EgagQIFkznlXdRJ8iZ7UW+rsSxNcZXsZ5txskkyxqfZkegzVpK6EBQ==
X-Received: by 2002:a5d:5386:: with SMTP id d6mr11264166wrv.207.1561990118908; 
 Mon, 01 Jul 2019 07:08:38 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id o6sm26025058wra.27.2019.07.01.07.08.37
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jul 2019 07:08:37 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Niels de Vos <ndevos@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Bharata B Rao <bharata@linux.ibm.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20190614100718.14019-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ffa261f9-0841-0c59-56c8-551f17fb61aa@redhat.com>
Date: Mon, 1 Jul 2019 16:08:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614100718.14019-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-trivial] [PATCH v2 0/9] configure: Fix softmmu --static
 linking
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
X-List-Received-Date: Mon, 01 Jul 2019 14:08:43 -0000

On 6/14/19 12:07 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> Apparently QEMU static linking is slowly bitroting. Obviously it
> depends the libraries an user has installed, anyway it seems there
> are not much testing done.
> 
> This series fixes few issues, enough to build QEMU on a Ubuntu
> 18.04 host.
> 
> Peter commented on v1:
> 
>   The main reason for supporting static linking is so we can build
>   the user-mode emulators. Almost always the problems with
>   static linking the softmmu binaries and the tools are
>   issues with the distro's packaging of the static libraries
>   (pkg-config files which specify things that don't work for
>   static is a common one).
> 
>   So we could put in a lot of checking of "is what pkg-config
>   tells us broken". Or we could just say "we don't support static
>   linking for anything except the usermode binaries". We
>   should probably phase in deprecation of that because it's
>   possible somebody's using it seriously, but it seems like
>   a fairly weird thing to do to me.
> 
> I share his view on this (restricting static linking to qemu-user)
> but since the work was already done when I read his comment, I still
> send the v2.

Alex, any comment?

Patch #1 could go via trivial@, the other should be made obsolete by the
Paolo's switch to Meson.

> Since v1:
> - pkg-config already use the '--static' argument, do not add it twice
> - Fixed x86_64 host builds (was missing GTK and OpenGL patches)
> - Added Niels R-b tag on the first patch
> - The Travis-CI job now succeeds:
>   https://travis-ci.org/philmd/qemu/jobs/545653697 (6 min 7 sec)
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (9):
>   configure: Only generate GLUSTERFS variables if glusterfs is usable
>   configure: Link test before auto-enabling GlusterFS libraries
>   configure: Link test before auto-enabling libusb library
>   configure: Link test before auto-enabling libusbredir library
>   configure: Link test before auto-enabling PulseAudio library
>   configure: Link test before auto-enabling OpenGL libraries
>   configure: Link test before auto-enabling GTK libraries
>   tests/docker: Kludge for missing libunistring.so symlink on Ubuntu
>     18.04
>   .travis.yml: Test softmmu static linking
> 
>  .travis.yml                                |   5 +
>  configure                                  | 121 ++++++++++++++++-----
>  tests/docker/dockerfiles/ubuntu1804.docker |   4 +
>  3 files changed, 100 insertions(+), 30 deletions(-)
> 

