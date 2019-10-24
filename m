Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iNfOy-0001z4-O4
	for mharc-qemu-trivial@gnu.org; Thu, 24 Oct 2019 11:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51321)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iNfOu-0001rB-I2
 for qemu-trivial@nongnu.org; Thu, 24 Oct 2019 11:51:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iNfOt-0004gT-2Z
 for qemu-trivial@nongnu.org; Thu, 24 Oct 2019 11:51:48 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:35291)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iNfOs-0004er-Qx
 for qemu-trivial@nongnu.org; Thu, 24 Oct 2019 11:51:46 -0400
Received: by mail-ot1-x342.google.com with SMTP id z6so21112540otb.2
 for <qemu-trivial@nongnu.org>; Thu, 24 Oct 2019 08:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dQeMv4No2g8CptaRBeFEz57MC9IYLkA7yfHgldvmkQI=;
 b=v1EF2n19cHDweYSOCs8KF/H9Lz5/7ecOeuamD7fJ+RMN0oGjY6RrAfTMp5ijqbCVff
 oUNtYCwfKKGQm1trGDNYB5IzSaj0LJVEb0b9p4TsE9osQ0tWkmiDIiVJfLv4VY+30MbB
 NLxNCCP1HB3wQXScfGkaJy4iSt7w7HWDJl+/ozIKpbeIKPXzBcv4qXChkd2B6aRIs4PF
 04DSRYphRRj6FrTz9G3uYqDE8ndbBmbVPghebjMYAa8nznjbFLNbhBoxZESvxjlwVttc
 9RCOiOpFGVp2bXuYvq1I0DXTu027KkGwyEMUoGDWafbsemzUpYAlVIJaqw8LiTPxTUTw
 WMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dQeMv4No2g8CptaRBeFEz57MC9IYLkA7yfHgldvmkQI=;
 b=ZIBQn5KK1XJaYZa+lxoUSD2c4deWDwd85l0ClkV1VQVuRWjGMrsrKLDjfhJJsZJ/aa
 CReyQnTCmiCh8yS7PynMt1UVXKUsYHDItb2lN9CHwVJSzkGD4N8qSIG/6kf1uZmsb4L3
 0iwaPy2sXO2hI3rm0wfTe/qiLAHVEZfEO0AtKxJm8W2e/rXiNfwJyeopE/VkGnviOF5y
 JZuIkJPxk1q9mZaQmiKlUYm3RqIED5zGKATKvPFWRkyJL9N/D2lwQEGOPqzPFOtA/4+E
 tCwz38yY0Ev8GpX8Ky3V6/ZBD5L2+wtMKzHUYRmtPlwjmex0kC+yh8SSNJqhea94/sC3
 ZFeg==
X-Gm-Message-State: APjAAAUnN+iQS3/GuYMXamnFLpBR+77X8cNZlScqt6woEucSh0tnPikY
 8A79Sl0PgNMcqih00gHJKx0MGIBnn2ZKRXgOd8yY1Q==
X-Google-Smtp-Source: APXvYqzswhUfyogN2IJNUveW2pVcbXzkak0gkkHuKiGf7f8kosXlpDwKHZ8nBv+LkoQGu3SU5hhBK8aB85FOdXk4DZU=
X-Received: by 2002:a9d:708e:: with SMTP id l14mr12427465otj.135.1571932305937; 
 Thu, 24 Oct 2019 08:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <20191003230404.19384-1-philmd@redhat.com>
In-Reply-To: <20191003230404.19384-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Oct 2019 16:51:34 +0100
Message-ID: <CAFEAcA-rmPuKQyv8d-u-1UAMhy6yGAcF3csVDcvYVXMosZysYw@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] hw: Split RTC devices from hw/timer/ to hw/rtc/
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Joel Stanley <joel@jms.id.au>, qemu-ppc <qemu-ppc@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, 
 Helge Deller <deller@gmx.de>, Aurelien Jarno <aurelien@aurel32.net>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Richard Henderson <rth@twiddle.net>, Laurent Vivier <lvivier@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
X-List-Received-Date: Thu, 24 Oct 2019 15:51:51 -0000

On Fri, 4 Oct 2019 at 00:04, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> Since v1: https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg03334.=
html
> - addressed review comments (described in patches 3 and 4)
> - added R-b/A-b tags
>
> Whole series now reviewed.

for the arm parts:
Acked-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

