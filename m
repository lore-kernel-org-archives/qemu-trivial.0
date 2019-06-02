Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hXKaQ-0002l5-MT
	for mharc-qemu-trivial@gnu.org; Sun, 02 Jun 2019 03:07:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmitry.fleytman@gmail.com>) id 1hXKaO-0002iL-Em
	for qemu-trivial@nongnu.org; Sun, 02 Jun 2019 03:07:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dmitry.fleytman@gmail.com>) id 1hXKaM-00083U-H9
	for qemu-trivial@nongnu.org; Sun, 02 Jun 2019 03:07:20 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:53917)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <dmitry.fleytman@gmail.com>)
	id 1hXKVQ-00040q-Ha; Sun, 02 Jun 2019 03:02:12 -0400
Received: by mail-wm1-x343.google.com with SMTP id d17so743425wmb.3;
	Sun, 02 Jun 2019 00:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Ff3SbIC2oYbwKyRMp8wOI3tAidWWzOi9ekCP5dP+dDI=;
	b=IBqtlwvZRsOuoL3Cb8c1omXdgQlxtXXawawuAK078MZR9OB48xnEcIaSkDGccSmyXa
	DZZhSDeffei6JrsgHshoIdeoHh3c9IoaodVJ9FLCFE9g/bFBApf+45zd4CiXdtrzja88
	hgZif5ERllHLtSQcYG1wcWuHCmjdmwQUpYVtoJFdPGenNMFPn0imH/GTPPMMq+kOsHVb
	28hd1Xbmatem+at1GrymuDoL/OBiwTNadwbF3Dn3Q02G9+zVAzX6x1+/ZPY0rYXdJy6u
	yw93o+Z6Scth5uKgaAqIAaPsahg1DfOt6R7T4OGbF4onCow4zHFf3HWtX3X+QRxkqXcF
	N+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Ff3SbIC2oYbwKyRMp8wOI3tAidWWzOi9ekCP5dP+dDI=;
	b=QfjjNK5vA3PNaFR2NR2TBgQMLo58YvZywGHmRiASQN+aIdAK9AVg01p9km+z+8SP9h
	3TTMvhJcpW8x+KLSp/4h8qKtxI3WKghUIDFUg6hzGZrkwDrKSKDbjdFxWo5uccQp5T/F
	Qsm2ACAYtoCrVJJ3m1VW+5w9GYTtv9tki7QAW5zBM43UsztBqIY5/yabVaUoYXIOG3Vi
	x3PI9hvaSE/fIxc8jJQBqbr/EIdtxZwPJmOAtTwQ+u/NCLTCY5G/xVlSPOZRS2OaTXUp
	dNcDulW4qoHuhYaxPQwBQWQgeBRhkcHf2DfJZw2Dyq1X+3LCPXIJRTd1YYAcNFKE4T/8
	0psQ==
X-Gm-Message-State: APjAAAUaa8HcdrbkRIidpiZB2BcdbbVoqd9xys7Dp3aJEV+dmtURZ/ya
	NfPFazlTVBOo+7cWWAxxiHU=
X-Google-Smtp-Source: APXvYqx0AfilS4n7flrjI5uIU6RPXTWI9ueenfIUJjCy+952OyROoMPDyQxv4UY2DRI9MdNEK5v/jg==
X-Received: by 2002:a7b:cb94:: with SMTP id m20mr10174059wmi.144.1559458930361;
	Sun, 02 Jun 2019 00:02:10 -0700 (PDT)
Received: from [10.0.1.34] ([141.226.29.227])
	by smtp.gmail.com with ESMTPSA id d2sm8579330wmb.9.2019.06.02.00.02.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Jun 2019 00:02:09 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: Dmitry Fleytman <dmitry.fleytman@gmail.com>
In-Reply-To: <20190528164020.32250-2-philmd@redhat.com>
Date: Sun, 2 Jun 2019 10:02:06 +0300
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Halil Pasic <pasic@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Walle <michael@walle.cc>, Richard Henderson <rth@twiddle.net>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <fam@euphon.net>,
	qemu-s390x@nongnu.org, Markus Armbruster <armbru@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7E6AA829-F9C0-4C03-AF5A-E0E115D626C1@gmail.com>
References: <20190528164020.32250-1-philmd@redhat.com>
	<20190528164020.32250-2-philmd@redhat.com>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-trivial] [PATCH v2 01/10] hw/scsi/vmw_pvscsi: Use
 qbus_reset_all() directly
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
X-List-Received-Date: Sun, 02 Jun 2019 07:07:21 -0000

Reviewed-by: Dmitry Fleytman <dmitry.fleytman@gmail.com>

> On 28 May 2019, at 19:40, Philippe Mathieu-Daud=C3=A9 =
<philmd@redhat.com> wrote:
>=20
> Since the BusState is accesible from the SCSIBus object,
> it is pointless to use qbus_reset_all_fn.
> Use qbus_reset_all() directly.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: Use BUS() macro (Peter Maydell)
>=20
> One step toward removing qbus_reset_all_fn()
> ---
> hw/scsi/vmw_pvscsi.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
> index 584b4be07e..c39e33fa35 100644
> --- a/hw/scsi/vmw_pvscsi.c
> +++ b/hw/scsi/vmw_pvscsi.c
> @@ -440,7 +440,7 @@ static void
> pvscsi_reset_adapter(PVSCSIState *s)
> {
>     s->resetting++;
> -    qbus_reset_all_fn(&s->bus);
> +    qbus_reset_all(BUS(&s->bus));
>     s->resetting--;
>     pvscsi_process_completion_queue(s);
>     assert(QTAILQ_EMPTY(&s->pending_queue));
> @@ -848,7 +848,7 @@ pvscsi_on_cmd_reset_bus(PVSCSIState *s)
>     trace_pvscsi_on_cmd_arrived("PVSCSI_CMD_RESET_BUS");
>=20
>     s->resetting++;
> -    qbus_reset_all_fn(&s->bus);
> +    qbus_reset_all(BUS(&s->bus));
>     s->resetting--;
>     return PVSCSI_COMMAND_PROCESSING_SUCCEEDED;
> }
> --=20
> 2.20.1
>=20


