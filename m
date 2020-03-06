Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jA9D9-0006Mh-QV
	for mharc-qemu-trivial@gnu.org; Fri, 06 Mar 2020 04:24:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47835)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jA9D6-0006Lx-Mw
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 04:24:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jA9D5-0005ek-Bd
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 04:24:00 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60566
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jA9D5-0005ct-7I
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 04:23:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583486638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZtVK4BFDHb7p+oiNFUrphKF7XMZoZh2XSFGhvTVLTls=;
 b=G6UzwGb4wnXsg3JR66YOuBCPY5/q+Cw39UpRGEHjRffJNjgWIf81De8yVCz0gzi6Qn9lOL
 3NUP9X76bJ+fIVsbegmOAUeS/QjTGpaZmcW5zzDyCjPEVNWoWyb4R27qsUqzRr5UXdJZDd
 B4qoOBy3zl6Z5QOdXU94NWD7Bu3Wotw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-WS19CQION4yZQR32eUS_YQ-1; Fri, 06 Mar 2020 04:23:57 -0500
X-MC-Unique: WS19CQION4yZQR32eUS_YQ-1
Received: by mail-wr1-f69.google.com with SMTP id b12so751849wro.4
 for <qemu-trivial@nongnu.org>; Fri, 06 Mar 2020 01:23:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QBsVmMlrTGuubKxpYEy/Asmz1QzMkBk1urMD4D5nG00=;
 b=eaOTFwnhBXne9JBZNqp36IyhecrSx+dUmKZcXYfZGglZoJTLT4FhfdVFF1iTb6pVdD
 M25dWfccRBEkr0An3FCaSnM+tyY9jymc0qXM0BtwfS6tnQzWgzKJlzW5ndfvYXEeypSH
 vdimep6lka9orH4MqTUPi97anW5eLxFAtTtsyfNXumJukwgambXWB+slGy5mQXY8Y/ki
 FqojYGreuMvX1VWK+3U4+xJwozkscX63gJlP5HJ/biy18AkWf/DW3g2dZIW7uLATGtcT
 umtcOoFJl95nF9cnEiavVVSlyEIZr1OkM9h6G5d3i7k9q+v1cFOXmaXCw9Uj7U/+RzQn
 qpcg==
X-Gm-Message-State: ANhLgQ2MsCAXwkWoTYYrk8HJu8Rn+z1LaNtYRU5Rpth6E4MG8ZG1OcYq
 KxdN5LiijDqiAuByOtTZjq/IkJUtqO+OOYDyJu8/IQtipJRpbqzCCOtIBvH/NiP9H6idWhpRBJN
 hs/BpSprQk3B15mt0MQ==
X-Received: by 2002:adf:f84d:: with SMTP id d13mr3136968wrq.92.1583486635529; 
 Fri, 06 Mar 2020 01:23:55 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtpFfwSkj6fMSCmjD72ZBzEe3exxjVpuLjiviqv9KguC8pDOIraaNAi1PGwP1f0erjco+hf8w==
X-Received: by 2002:adf:f84d:: with SMTP id d13mr3136938wrq.92.1583486635244; 
 Fri, 06 Mar 2020 01:23:55 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:b99a:4374:773d:f32e?
 ([2001:b07:6468:f312:b99a:4374:773d:f32e])
 by smtp.gmail.com with ESMTPSA id c16sm19382376wrm.24.2020.03.06.01.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2020 01:23:54 -0800 (PST)
Subject: Re: [PATCH 0/2] Makefile: Re-indent 'help' target and list tools
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-trivial@nongnu.org
References: <20200305004855.9665-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c1685d5d-9e74-4674-7e38-d3a0c618face@redhat.com>
Date: Fri, 6 Mar 2020 10:23:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200305004855.9665-1-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Fri, 06 Mar 2020 09:24:01 -0000

On 05/03/20 01:48, Philippe Mathieu-Daud=C3=A9 wrote:
> This series improves the 'make help' output:
> - re-indent current output
> - list tools targets:
>=20
>     $ make help
>     [...]
>=20
>     Architecture specific targets:
>       x86_64-softmmu/all             - Build for x86_64-softmmu
>=20
>     Tools targets:
>       qemu-ga                        - Build qemu-ga tool
>       qemu-keymap                    - Build qemu-keymap tool
>       elf2dmp                        - Build elf2dmp tool
>       ivshmem-client                 - Build ivshmem-client tool
>       ivshmem-server                 - Build ivshmem-server tool
>       qemu-nbd                       - Build qemu-nbd tool
>       qemu-img                       - Build qemu-img tool
>       qemu-io                        - Build qemu-io tool
>       qemu-edid                      - Build qemu-edid tool
>       fsdev/virtfs-proxy-helper      - Build virtfs-proxy-helper tool
>       scsi/qemu-pr-helper            - Build qemu-pr-helper tool
>=20
>     Cleaning targets:
>       clean                          - Remove most generated files but ke=
ep t=3D
> he config
>       distclean                      - Remove all generated files
>       dist                           - Build a distributable tarball
>=20
> Philippe Mathieu-Daud=3DC3=3DA9 (2):
>   Makefile: Align 'help' target output
>   Makefile: Let the 'help' target list the tools targets
>=20
>  Makefile | 49 ++++++++++++++++++++++++++++---------------------
>  1 file changed, 28 insertions(+), 21 deletions(-)
>=20
> --=3D20
> 2.21.1
>=20

Queued, thanks.

Paolo


