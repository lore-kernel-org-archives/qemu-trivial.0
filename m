Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hYork-0005Us-FO
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jun 2019 05:39:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41658)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYori-0005TT-EQ
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 05:39:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYorh-0003EC-DE
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 05:39:22 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:37055)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hYore-00037z-Lr; Thu, 06 Jun 2019 05:39:18 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
	1MbTCr-1gxYA40ej3-00bvCV; Thu, 06 Jun 2019 11:38:49 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>, 
	Alex Williamson <alex.williamson@redhat.com>, qemu-s390x@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Walle <michael@walle.cc>, Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <rth@twiddle.net>
References: <20190528164020.32250-1-philmd@redhat.com>
	<20190528164020.32250-6-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <590c0f4f-5044-e57d-76d7-5a4029675463@vivier.eu>
Date: Thu, 6 Jun 2019 11:38:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190528164020.32250-6-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:liROLdYs7VUTAQVNjV3J2UUvVBtFeb6r4VysXiZAi8mHnWTaWFE
	5qag6abnyvyfP1zhccyrbYOZZpMHRF9WsUAfagjeEinASsMxnsZlgUmQ0/oATuet0NWuZwN
	CbhC6I703vWcLpVZ0crq+wzuG6Q+Hn3XWbc7hJjue4WpPVbPdus1obBP4EGcnOFcE9fG6dO
	/gEmMS5KGoJzuRiYnB5Rg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7XTOMsauMGA=:1J0ul96SBCM1gwDog7oGTC
	k2359+5GGnHoXSeZ3urfoUI8E32izm9gE4mjHoTSJT6RwHRWz1XhJFW5S2/LDWAoZvDzg6Mih
	/NJHrTOgJAozsuu0bVv2BliXo3Yxw8sBYlJQ3q2Mrl8yh/hRmEC5k1aAei0nbRf9gs+lrugpU
	6H2Ljhzqe2NQwEu77ek1Vh4/ne4sqsviAfG9ZINwAk4B3unAZZNfHX7w+0/TKETpwJFHQblaQ
	4pgYCujAnIXarrYgmP+tvUBZ7SYB682M52FgWeiWYKaj24yBSVPvquAM7udUVhBs7rrm2YpTw
	y4u4MaPXl7XhPlnOt+FSGdIu6ALhdZB8bIwiwLGtiMSA7cLksjDr/haZuvhKkdt+Qwl1sOObi
	VW0D/NsGR/23zx5H+uaH+eF88Ho1v3TQ+rWYGJu5xLiYd6blQ/Y1hquEp2BS57DtdU30DCN5X
	IzB1AeKuwqR0nQQmS2MbmeLDLJhPgzL3/TRttr4j5rgLHIEuuGutP0hQpi/+D3BxmOWYgRSyb
	ctYqYl+QCKY5RRaYiSUB2RgBDPaCIz108WJIutfX1dGZMOyBAIBAM1iuyv3ews/cFoeK2GOuC
	PGWH5/IB6erKBxlhPOC8bhf1Tq0nDqjLOBNCZc9sJW8VqzbiHo01lYawEhDwi/3i3H4OHSTix
	dNB4XR2zvot+T4aevhfl0X6/T+N87iMgZ1Bv4OcRRkNcsMbFsa2MAoodx/DMKELj9fY3TVWKO
	9jSrVbEJSOTL03OnUKDiOn1AkuwOEQnKrwgTi/X0ywgTJNthrLoPUCqO8Xk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: Re: [Qemu-trivial] [PATCH v2 05/10] hw/sd: Use the QOM BUS() macro
 to access BusState.qbus
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
X-List-Received-Date: Thu, 06 Jun 2019 09:39:23 -0000

Le 28/05/2019 à 18:40, Philippe Mathieu-Daudé a écrit :
> Rather than looking inside the definition of a BusState with "s->bus.qbus",
> use the QOM prefered style: "BUS(&s->bus)".
> 
> This patch was generated using the following Coccinelle script:
> 
>     // Use BUS() macros to access BusState.qbus
>     @use_bus_macro_to_access_qbus@
>     expression obj;
>     identifier bus;
>     @@
>     -&obj->bus.qbus
>     +BUS(&obj->bus)
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/sd/milkymist-memcard.c | 2 +-
>  hw/sd/ssi-sd.c            | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
> index df42aa1c54..dd1ba649d9 100644
> --- a/hw/sd/milkymist-memcard.c
> +++ b/hw/sd/milkymist-memcard.c
> @@ -277,7 +277,7 @@ static void milkymist_memcard_realize(DeviceState *dev, Error **errp)
>      /* FIXME use a qdev drive property instead of drive_get_next() */
>      dinfo = drive_get_next(IF_SD);
>      blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
> -    carddev = qdev_create(&s->sdbus.qbus, TYPE_SD_CARD);
> +    carddev = qdev_create(BUS(&s->sdbus), TYPE_SD_CARD);
>      qdev_prop_set_drive(carddev, "drive", blk, &err);
>      object_property_set_bool(OBJECT(carddev), true, "realized", &err);
>      if (err) {
> diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
> index 623d0333e8..25e1009277 100644
> --- a/hw/sd/ssi-sd.c
> +++ b/hw/sd/ssi-sd.c
> @@ -249,7 +249,7 @@ static void ssi_sd_realize(SSISlave *d, Error **errp)
>      /* Create and plug in the sd card */
>      /* FIXME use a qdev drive property instead of drive_get_next() */
>      dinfo = drive_get_next(IF_SD);
> -    carddev = qdev_create(&s->sdbus.qbus, TYPE_SD_CARD);
> +    carddev = qdev_create(BUS(&s->sdbus), TYPE_SD_CARD);
>      if (dinfo) {
>          qdev_prop_set_drive(carddev, "drive", blk_by_legacy_dinfo(dinfo), &err);
>      }
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

