Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iGrsX-0008Me-Cv
	for mharc-qemu-trivial@gnu.org; Sat, 05 Oct 2019 17:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47090)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iGrsU-0008La-JY
 for qemu-trivial@nongnu.org; Sat, 05 Oct 2019 17:46:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iGrsT-0000MU-0L
 for qemu-trivial@nongnu.org; Sat, 05 Oct 2019 17:46:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43058)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iGrsS-0000Lj-MP
 for qemu-trivial@nongnu.org; Sat, 05 Oct 2019 17:46:12 -0400
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B05654DB1F
 for <qemu-trivial@nongnu.org>; Sat,  5 Oct 2019 21:46:10 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id 11so10605396qkh.15
 for <qemu-trivial@nongnu.org>; Sat, 05 Oct 2019 14:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=w9cp5WOMnA8f6hUE+AzPrHfl7EdcqEtT+8UzwMy/tUA=;
 b=XsHBGU+6kAajgedP2TrS0xzf8P76aXInB74ZWOE7c26CVdhQXG1b4oyLaBEtfBOCd8
 jsScQBA+44SkCdpu91t3wt7tKmTet0GIJ46h4vJyI0NT/ALiXXLIH7QbVbJdCx0B/ljk
 jtMT96JCrvpbuIwKIVPP+UduB5J3unC4rfml4IUMxzgF5vcqbBat+dJhkaEPPh04X69P
 7bhcmqb/xBGIhRUwSweuOLUxeOLKQzK52OKOqh7QHeUJgQTrotWpoH+YPicYj0VjWMJz
 PYNZkOgs5EYbjckyODYATAyjc1J/I8UVGBHoZu43r44fLSTUWgS8vbbWTSqdLf/2joEa
 3CVQ==
X-Gm-Message-State: APjAAAUeSMsv/as37N+03uEwvQQgtxNfLnSHiXIBSBogsPmToxvFw166
 xWkqYNmJ4BdKl9thmVfQxHGBFeB+2IugAMjVeNZs/JbFyT7RpdFsC77QSbZS2Cf/iMqBvrfkNz7
 mbUKTXCXVGs0MEubLNw==
X-Received: by 2002:ad4:5572:: with SMTP id w18mr20866499qvy.220.1570311969969; 
 Sat, 05 Oct 2019 14:46:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyzUVmREyQGN2ebE9/p5KmnrPF3x0+kP/8mY6eUlFiD+kv5Ek7D6K1h7KzdijPfyFqbMnb4xA==
X-Received: by 2002:ad4:5572:: with SMTP id w18mr20866481qvy.220.1570311969747; 
 Sat, 05 Oct 2019 14:46:09 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
 by smtp.gmail.com with ESMTPSA id
 i30sm7337786qte.27.2019.10.05.14.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2019 14:46:09 -0700 (PDT)
Date: Sat, 5 Oct 2019 17:46:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH 00/11] hw: Convert various reset() handler to DeviceReset
Message-ID: <20191005174531-mutt-send-email-mst@kernel.org>
References: <20190926151733.25349-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190926151733.25349-1-philmd@redhat.com>
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Sat, 05 Oct 2019 21:46:16 -0000

On Thu, Sep 26, 2019 at 05:17:22PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Hi.
>=20
> Following the thread discussion between Peter/Markus/Damien about
> reset handlers:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg617103.html
> I started to remove qemu_register_reset() calls from few qdevified
> devices (the trivial ones).
>=20
> Regards,
>=20
> Phil.

How do you want these patches merged? Trivial tree?

> Philippe Mathieu-Daud=E9 (11):
>   hw/acpi/piix4: Convert reset handler to DeviceReset
>   hw/ide/piix: Convert reset handler to DeviceReset
>   hw/isa/piix4: Convert reset handler to DeviceReset
>   hw/pci-host/piix: Convert reset handler to DeviceReset
>   hw/ide/sii3112: Convert reset handler to DeviceReset
>   hw/ide/via82c: Convert reset handler to DeviceReset
>   hw/isa/vt82c686: Convert reset handler to DeviceReset
>   hw/input/lm832x: Convert reset handler to DeviceReset
>   hw/pci-host/bonito: Convert reset handler to DeviceReset
>   hw/timer/etraxfs: Convert reset handler to DeviceReset
>   hw/misc/vmcoreinfo: Convert reset handler to DeviceReset
>=20
>  hw/acpi/piix4.c          |  7 +++----
>  hw/ide/piix.c            |  8 +++-----
>  hw/ide/sii3112.c         |  7 +++----
>  hw/ide/via.c             | 10 ++++------
>  hw/input/lm832x.c        | 12 +++++-------
>  hw/isa/piix4.c           |  7 +++----
>  hw/isa/vt82c686.c        | 11 ++++-------
>  hw/misc/vmcoreinfo.c     |  5 ++---
>  hw/pci-host/bonito.c     |  8 +++-----
>  hw/pci-host/piix.c       |  8 +++-----
>  hw/timer/etraxfs_timer.c |  7 +++----
>  11 files changed, 36 insertions(+), 54 deletions(-)
>=20
> --=20
> 2.20.1

