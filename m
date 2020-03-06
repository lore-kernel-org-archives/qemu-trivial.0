Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jA9Ef-0007bj-Ki
	for mharc-qemu-trivial@gnu.org; Fri, 06 Mar 2020 04:25:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50392)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jA9Ed-0007af-3S
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 04:25:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jA9Eb-0001eH-Ri
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 04:25:34 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26903
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jA9Eb-0001Z2-Mz
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 04:25:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583486732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nzc9HssRfKHne+dft43u7ezXI/4b2GdpCxZ5YqtvbBg=;
 b=XK2mNFPlCCbTI6g3pmsPeCOj7DHwfuKsqtLlqSvgCfDuhHPUlsNcac5R2PuVv8XFmRPg1K
 IrYayzJdOZcKfYBsLXlgq3Ysk1qPyvV9fuu9U6HKIRkSn/6L3akvLDX8iU7XPP19UbTn3m
 isbzJjhatPwWU+LqcV/IXZQoHtmeXJ8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-3iczrwE2MY-nkD3BGbMQ9g-1; Fri, 06 Mar 2020 04:25:28 -0500
X-MC-Unique: 3iczrwE2MY-nkD3BGbMQ9g-1
Received: by mail-wm1-f72.google.com with SMTP id r19so653768wmh.1
 for <qemu-trivial@nongnu.org>; Fri, 06 Mar 2020 01:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=69HyzKQXTq/3adX7H3koH6Lnv+3vUkLmUyAPsnCtjwM=;
 b=Z2fzp5JWvvBGYb5PPLFyyl0VFLx9iWK4iI03v+wVl91nI4BhkE6bI3sIgh6CbPa/kb
 p48lofeoHIr1R9MNRN8Z+XMy8pXYMb1dNJt26DZU2xNN8Sfp+BNZ/79nNz8hF4QLKuYV
 O3WT7CbfqiZdZqiO/20FIZc4kQYjobAow0Fv3DX7wcdGnH61Slzi3jmN3pK/+uq2PMip
 w4Hq5VWfQju8EOA7ak0LLSpu+0WPpXED1meX42KsN3dTdUpp8T48564FoNrKiA95t9tH
 gndO8megOhVC0pMjGkRoeN9WCV6N4etlBaaVE7eznjtRpOAZmCnjRwQQZHu7ZqvH+1Qj
 eMNg==
X-Gm-Message-State: ANhLgQ1/rZilEnLLD6BFucIbZVohhzXK26OvIkKwe9yM81DVQPgtrnXQ
 ZnIwMOWJfJeC9w9xMYZ2NoMxOIDm0lqboULHk/mUlPR7IzBjaRbG1jkWlX2o06P6atRVGGKK07t
 /VdF4rPKOdXtrVk/Vyw==
X-Received: by 2002:a7b:c081:: with SMTP id r1mr2855008wmh.12.1583486727379;
 Fri, 06 Mar 2020 01:25:27 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsOJpYH4iiUcAHj+8L8OWJb8CYoeA6jbDiRGnWJbTGDHyN67ZZnHWjGP89RTJU2L12IwXFDmg==
X-Received: by 2002:a7b:c081:: with SMTP id r1mr2854992wmh.12.1583486727163;
 Fri, 06 Mar 2020 01:25:27 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:b99a:4374:773d:f32e?
 ([2001:b07:6468:f312:b99a:4374:773d:f32e])
 by smtp.gmail.com with ESMTPSA id v7sm41615291wrm.49.2020.03.06.01.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2020 01:25:26 -0800 (PST)
Subject: Re: [PATCH 0/3] hw/net,virtfs-proxy-helper: Reduce .data footprint
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Jason Wang <jasowang@redhat.com>
References: <20200305010446.17029-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <92a0e3c4-2d50-49a6-f794-c5df57e1b3fc@redhat.com>
Date: Fri, 6 Mar 2020 10:25:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200305010446.17029-1-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Fri, 06 Mar 2020 09:25:36 -0000

On 05/03/20 02:04, Philippe Mathieu-Daud=C3=A9 wrote:
> More memory footprint reduction, similar to:
> https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg00984.html
>=20
> The elf-dissector tool [1] [2] helped to notice the big array.
>=20
> [1] https://phabricator.kde.org/source/elf-dissector/
> [2] https://www.volkerkrause.eu/2019/06/22/elf-dissector-aarch64-support.=
html
>=20
> Philippe Mathieu-Daud=C3=A9 (3):
>   hw/net/e1000: Add readops/writeops typedefs
>   hw/net/e1000: Move macreg[] arrays to .rodata to save 1MiB of .data
>   virtfs-proxy-helper: Make the helper_opts[] array const
>=20
>  fsdev/virtfs-proxy-helper.c | 2 +-
>  hw/net/e1000.c              | 6 ++++--
>  hw/net/e1000e_core.c        | 6 ++++--
>  3 files changed, 9 insertions(+), 5 deletions(-)
>=20

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

These can certainly go through qemu-trivial.

Paolo


