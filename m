Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFvZl-0001pW-C2
	for mharc-qemu-trivial@gnu.org; Sun, 22 Mar 2020 04:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47296)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jFvZj-0001ol-BA
 for qemu-trivial@nongnu.org; Sun, 22 Mar 2020 04:03:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jFvZi-0003LT-3S
 for qemu-trivial@nongnu.org; Sun, 22 Mar 2020 04:03:15 -0400
Received: from 2.mo1.mail-out.ovh.net ([178.32.119.250]:56187)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jFvZh-0003GW-UW
 for qemu-trivial@nongnu.org; Sun, 22 Mar 2020 04:03:14 -0400
Received: from player157.ha.ovh.net (unknown [10.108.54.36])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 188CC1B5EE2
 for <qemu-trivial@nongnu.org>; Sun, 22 Mar 2020 09:03:04 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id 9034D10AC7C42;
 Sun, 22 Mar 2020 08:02:22 +0000 (UTC)
Subject: Re: [PATCH-for-5.0 v2 07/11] hw/gpio/aspeed_gpio: Remove dead
 assignment
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Max Reitz <mreitz@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 Fam Zheng <fam@euphon.net>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
References: <20200321144110.5010-1-philmd@redhat.com>
 <20200321144110.5010-8-philmd@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6ae25fc2-5eca-8980-2072-f784bbeaaed3@kaod.org>
Date: Sun, 22 Mar 2020 09:02:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200321144110.5010-8-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 1997346435897789419
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudeghedgvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduheejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdhtrhhivhhirghlsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.32.119.250
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
X-List-Received-Date: Sun, 22 Mar 2020 08:03:16 -0000

On 3/21/20 3:41 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Fix warning reported by Clang static code analyzer:
>=20
>   hw/gpio/aspeed_gpio.c:717:18: warning: Value stored to 'g_idx' during=
 its initialization is never read
>       int set_idx, g_idx =3D *group_idx;
>                    ^~~~~   ~~~~~~~~~~
>=20
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

> ---
> v2: Do not declare g_idx in for() (Zoltan)
> ---
>  hw/gpio/aspeed_gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index 41e11ea9b0..bd19db31f4 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -714,7 +714,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr =
offset, uint64_t data,
>  static int get_set_idx(AspeedGPIOState *s, const char *group, int *gro=
up_idx)
>  {
>      AspeedGPIOClass *agc =3D ASPEED_GPIO_GET_CLASS(s);
> -    int set_idx, g_idx =3D *group_idx;
> +    int set_idx, g_idx;
> =20
>      for (set_idx =3D 0; set_idx < agc->nr_gpio_sets; set_idx++) {
>          const GPIOSetProperties *set_props =3D &agc->props[set_idx];
>=20


