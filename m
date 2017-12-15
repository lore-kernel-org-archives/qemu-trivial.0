Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePqKx-0006yP-Me
	for mharc-qemu-trivial@gnu.org; Fri, 15 Dec 2017 08:47:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePqKw-0006xI-6L
	for qemu-trivial@nongnu.org; Fri, 15 Dec 2017 08:47:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePqKv-0004F8-Fs
	for qemu-trivial@nongnu.org; Fri, 15 Dec 2017 08:47:38 -0500
Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242]:38414)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePqKt-00046s-Ft; Fri, 15 Dec 2017 08:47:35 -0500
Received: by mail-it0-x242.google.com with SMTP id r6so19057348itr.3;
	Fri, 15 Dec 2017 05:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=49PmacVbDRBffu9RUAUu1t6+j1tX9gzjiglfmuTrO0o=;
	b=J37kGwgXrozqs0R1zQu4DdarRfLOZryDPJ18eamoEWv6Vq9Te/zuSlgPeLWWv6ihf+
	vZvemafE4ETR15wu/2nIq9tHd7ZrPz3z1SBtP+6oqKkfZ/5bDwXfebkxAIU71GVvS3A+
	h6YUdQ+sngvvJw+xFePfmylgtLdz0oKVrRPbZIMkjUj6CyCTtOAh10bxn/lXdLcwRRxH
	1gz9Z5F7AEMTGBJMuVuBMdpxYzNbwGp7zI/Sv9PKYk2Hm0Vtf+WlzDfuXVtlsxhU4cOX
	Y6u2MXX1YRBObTRvf81/9JPzg7YhgGv+/IASLHL40i41GRoZWEGK8oCeMigl0M3QoL+0
	I7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=49PmacVbDRBffu9RUAUu1t6+j1tX9gzjiglfmuTrO0o=;
	b=OjQ+VTnDljKdaIg3uRGbZn3MB8JP9iIaIskagDg4owctvC7JHY3WOzyVhVEYt1iuKk
	wjQdCLfTAXdaZVDW5134f3tLvHXO0qNnPfqtUD4r5VjKgys36HK8Q2lVdVmizOHU5sOF
	kDKnjcTvw6nRLGruk/eYW4xA+uitQeddJ3WD690x+83IhoCtVruv2dHP6IP5jgKiJNqo
	BI1Q+SEQgOsh81hth0nYUJjGTPQblQsqrSUi4DpMIVUmt4kVrL0xQcTH597+EOj5Axnw
	WICaN42FT32Gs7YmXB4DNpMCQdR4mZrxmCXmuRVEMRMeVMV9rObgw02BxTH9LGCY2ZwZ
	JJTQ==
X-Gm-Message-State: AKGB3mKD9OaPM83eEkrPadXoUNpMvhyD4S0JN/fHeJGLjEYTZpH/LNXo
	cK/iyNeuU4t/e40jOAg9kd7UbzDkzWhzRUerjaeFj8oNtCY=
X-Google-Smtp-Source: ACJfBosE18UqhSDZe3qokPOhHbKEQOqgPM6RuCBEUAhWVPe20qrqmqnrOlojKw5VWUhkwNqQHHHmhEzma9yfut1rdC0=
X-Received: by 10.36.172.81 with SMTP id m17mr8335642iti.151.1513345654616;
	Fri, 15 Dec 2017 05:47:34 -0800 (PST)
MIME-Version: 1.0
Sender: philippe.mathieu.daude@gmail.com
Received: by 10.2.183.19 with HTTP; Fri, 15 Dec 2017 05:47:34 -0800 (PST)
In-Reply-To: <151331201863.120.11022156639051342885@449822a21bf0>
References: <20171215033015.738-1-f4bug@amsat.org>
	<151331201863.120.11022156639051342885@449822a21bf0>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 15 Dec 2017 10:47:34 -0300
X-Google-Sender-Auth: -GULJ9_xSUqEBJBH9A_BfigqEx8
Message-ID: <CAAdtpL6BmOx-rRJCRO4njm_mWuYgrs1i+uO_zjprj=Rm6m52hw@mail.gmail.com>
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Fam Zheng <famz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, 
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 00/43] remove i386/pc
 dependency from non-PC world (part 1)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Dec 2017 13:47:39 -0000

On Fri, Dec 15, 2017 at 1:27 AM,  <no-reply@patchew.org> wrote:
> Hi,
>
> This series failed build test on ppc host. Please find the details below.
>
> Subject: [Qemu-devel] [PATCH v4 00/43] remove i386/pc dependency from non=
-PC world (part 1)
> Type: series
> Message-id: 20171215033015.738-1-f4bug@amsat.org
[...]
>   CC      hw/i386/xen/trace.o
>   CC      hw/i386/trace.o
> In file included from hw/i386/trace.c:4:0:
> hw/i386/trace.h: In function =E2=80=98_nocheck__trace_vmport_ioport_read_=
unknown_command=E2=80=99:
> hw/i386/trace.h:2967:9: error: too many arguments for format [-Werror=3Df=
ormat-extra-args]
>          qemu_log_mask(LOG_TRACE,
>          ^
> cc1: all warnings being treated as errors
> make: *** [hw/i386/trace.o] Error 1

This has been fixed in the '[PATCH v5 0/2] remove i386/pc dependency
from non-PC world (part 1) fix' series which Paolo already took.

