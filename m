Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Stftn-0006Y0-1E
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jul 2012 10:15:43 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Stftf-0006Cs-8o
	for qemu-trivial@nongnu.org; Tue, 24 Jul 2012 10:15:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1StftZ-0005To-7z
	for qemu-trivial@nongnu.org; Tue, 24 Jul 2012 10:15:35 -0400
Received: from cantor2.suse.de ([195.135.220.15]:45740 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1StftI-0005SI-Na; Tue, 24 Jul 2012 10:15:12 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id A79A2A329D;
	Tue, 24 Jul 2012 16:15:11 +0200 (CEST)
Message-ID: <500EADEC.8000800@suse.de>
Date: Tue, 24 Jul 2012 16:15:08 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120601 Thunderbird/13.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1343139027-23659-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1343139027-23659-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.4.2
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
	patches@linaro.org, qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/escc: Drop duplicate
 definition of 'disabled' property
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jul 2012 14:15:41 -0000

Am 24.07.2012 16:10, schrieb Peter Maydell:
> Drop a duplicate definition of the 'disabled' property from
> the escc qdev property list: this redefinition is currently
> effectively ignored but will become an error. (The duplication
> was inadvertently introduced in 2009 in commit ec02f7dec2.)
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

The mentioned commit turned 7 properties into 8, so it's no typo.

Acked-by: Andreas F=E4rber <afaerber@suse.de>

/-F

> ---
> Other than the armv7m_nvic, this is the only other case of an
> attempt to set a duplicate property that I could find in my
> "start every machine QEMU implements" test...
>=20
>  hw/escc.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
>=20
> diff --git a/hw/escc.c b/hw/escc.c
> index 4d8a8e8..e1f5e73 100644
> --- a/hw/escc.c
> +++ b/hw/escc.c
> @@ -905,7 +905,6 @@ static Property escc_properties[] =3D {
>      DEFINE_PROP_UINT32("frequency", SerialState, frequency,   0),
>      DEFINE_PROP_UINT32("it_shift",  SerialState, it_shift,    0),
>      DEFINE_PROP_UINT32("disabled",  SerialState, disabled,    0),
> -    DEFINE_PROP_UINT32("disabled",  SerialState, disabled,    0),
>      DEFINE_PROP_UINT32("chnBtype",  SerialState, chn[0].type, 0),
>      DEFINE_PROP_UINT32("chnAtype",  SerialState, chn[1].type, 0),
>      DEFINE_PROP_CHR("chrB", SerialState, chn[0].chr),
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg



