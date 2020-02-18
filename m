Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j46Il-0001Sw-By
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 12:04:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50234)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j46Ii-0001PH-Cd
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 12:04:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j46If-0000AA-8U
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 12:04:46 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42781
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j46If-00008Y-5R
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 12:04:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582045483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2544dIPgl1aKA4Z7K5Z4971BiGCIl2iah54j9kjCL4E=;
 b=aqMRnoRnnLWvYfkehrrkmYYhxkFheCNpyYLGxvDKjeXGBWpW2jkgk1PXJiGkkFKfWCls+F
 bU3lmpkC7a3STGsY5IMic7Tsrwh/MiaCR1izd7BZVCdzsZOoGjXCSZ0x+pjNoQVrIFut1s
 55BWSiYkJaJ6H7rcHWDhzhk3azRCoOI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-hl9ELWSAOGe6au0JwxShSQ-1; Tue, 18 Feb 2020 12:04:30 -0500
Received: by mail-wm1-f71.google.com with SMTP id f66so302427wmf.9
 for <qemu-trivial@nongnu.org>; Tue, 18 Feb 2020 09:04:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jf3dlEYrCzOw89Pny9+wuZ6snqo+K0B74r4yZz2W9gY=;
 b=aA/5HrOdRnya6eTqpOWuKdHtiTkMibeS+gxDKZ4dgczzK5ldDT+KE5fCLst/zMOn3x
 9JrWh8dzkOlL6XGKRuY6UMwEhxqoVcgl8cxU6aTcwUcqu5OskNMhPgBOGGr6xh3RU+Sj
 uafx2IPgxwTHWo09iDbtp1ONlSGJWLtAEn/f5lGMXEOr15ljrhST2XAdbBVqAbXYlwR1
 K2XK4MLjhJrNqJNdlPdaXbD/siilDc34IBZ2wWimDOeyBhC868EZ5GHJSBnix7HqAcmz
 oQPN6hNKSwUNgYY/sXo5UR2MZ3uYiHaB8xhv22raCNVJP/1BULUyIGSUS1y/NhFBcP9O
 dhzw==
X-Gm-Message-State: APjAAAWNWMt4CabmKDfJewKvMrVTVTBhxmqTcAuQQPZ7PaDGJwkF+3lj
 WM9l2Sp8zpJ8J4sb9J9KyR5HwL021IjuujngMDP6jiB0vxQ7UEpHIFKGTMCSmEVkJh81ny9brB9
 5priIWcbFV7zdt+tHKQ==
X-Received: by 2002:adf:f80c:: with SMTP id s12mr30272986wrp.1.1582045469025; 
 Tue, 18 Feb 2020 09:04:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqyw9dUela3NtrkDeg0CyJlDb3coV6O3bBYGN64fh+CVkb+urV5Aj5z58vwpPB/Qnk2J8h/55A==
X-Received: by 2002:adf:f80c:: with SMTP id s12mr30272937wrp.1.1582045468711; 
 Tue, 18 Feb 2020 09:04:28 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:59c7:c3ee:2dec:d2b4?
 ([2001:b07:6468:f312:59c7:c3ee:2dec:d2b4])
 by smtp.gmail.com with ESMTPSA id a16sm7026333wrt.30.2020.02.18.09.04.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2020 09:04:28 -0800 (PST)
Subject: Re: [PATCH RESEND 00/13] trivial: Detect and remove superfluous
 semicolons in C code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Julia Suvorova <jusual@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Gerd Hoffmann
 <kraxel@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20200218094402.26625-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <55411270-83ae-d6aa-362f-07018b44c0e1@redhat.com>
Date: Tue, 18 Feb 2020 18:04:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: hl9ELWSAOGe6au0JwxShSQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Tue, 18 Feb 2020 17:04:50 -0000

On 18/02/20 10:43, Philippe Mathieu-Daud=C3=A9 wrote:
> Luc noticed a superfluous trailing semicolon:
> https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg04593.html
>=20
> Prevent that by modifying checkpatch.pl and clean the codebase.
>=20
> Philippe Mathieu-Daud=C3=A9 (13):
>   scripts/checkpatch.pl: Detect superfluous semicolon in C code
>   audio/alsaaudio: Remove superfluous semicolons
>   block: Remove superfluous semicolons
>   block/io_uring: Remove superfluous semicolon
>   hw/arm/xlnx-versal: Remove superfluous semicolon
>   hw/m68k/next-cube: Remove superfluous semicolon
>   hw/scsi/esp: Remove superfluous semicolon
>   hw/vfio/display: Remove superfluous semicolon
>   migration/multifd: Remove superfluous semicolon
>   ui/input-barrier: Remove superfluous semicolon
>   target/i386/whpx: Remove superfluous semicolon
>   tests/qtest/libqos/qgraph: Remove superfluous semicolons
>   contrib/rdmacm-mux: Remove superfluous semicolon
>=20
>  audio/alsaaudio.c           | 4 ++--
>  block.c                     | 4 ++--
>  block/io_uring.c            | 2 +-
>  contrib/rdmacm-mux/main.c   | 2 +-
>  hw/arm/xlnx-versal-virt.c   | 2 +-
>  hw/m68k/next-cube.c         | 2 +-
>  hw/scsi/esp.c               | 2 +-
>  hw/vfio/display.c           | 2 +-
>  migration/multifd.c         | 2 +-
>  target/i386/whpx-all.c      | 2 +-
>  tests/qtest/libqos/qgraph.c | 4 ++--
>  ui/input-barrier.c          | 2 +-
>  scripts/checkpatch.pl       | 5 +++++
>  13 files changed, 20 insertions(+), 15 deletions(-)
>=20

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Laurent, can you queue this in qemu-trivial?


