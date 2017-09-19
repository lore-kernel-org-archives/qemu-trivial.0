Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1duMQ0-0008Uj-7f
	for mharc-qemu-trivial@gnu.org; Tue, 19 Sep 2017 13:34:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duKM8-00087W-KI
	for qemu-trivial@nongnu.org; Tue, 19 Sep 2017 11:22:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duKM4-0001sn-BB
	for qemu-trivial@nongnu.org; Tue, 19 Sep 2017 11:22:36 -0400
Received: from 5.mo3.mail-out.ovh.net ([87.98.178.36]:54927)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1duKM4-0001s5-5w
	for qemu-trivial@nongnu.org; Tue, 19 Sep 2017 11:22:32 -0400
Received: from player797.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id BE17215958A
	for <qemu-trivial@nongnu.org>; Tue, 19 Sep 2017 17:22:30 +0200 (CEST)
Received: from zorba.kaod.org (deibp9eh1--blueice1n4.emea.ibm.com
	[195.212.29.166]) (Authenticated sender: postmaster@kaod.org)
	by player797.ha.ovh.net (Postfix) with ESMTPSA id A19FC2E0091;
	Tue, 19 Sep 2017 17:22:24 +0200 (CEST)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "open list:PowerPC" <qemu-ppc@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>
References: <20170919141603.27713-1-eblake@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e5dbc278-f848-ade0-92c4-f144e6b27964@kaod.org>
Date: Tue, 19 Sep 2017 17:22:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170919141603.27713-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 3906309727485922278
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrheejgdeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.178.36
X-Mailman-Approved-At: Tue, 19 Sep 2017 13:34:43 -0400
Subject: Re: [Qemu-trivial] [Qemu-ppc] [PATCH] ppc/pnv: Improve macro
 parenthesization
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
X-List-Received-Date: Tue, 19 Sep 2017 15:22:37 -0000

On 09/19/2017 04:16 PM, Eric Blake wrote:
> Although none of the existing macro call-sites were broken,
> it's always better to write macros that properly parenthesize
> arguments that can be complex expressions, so that the intended
> order of operations is not broken.

yes.

> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

C.
> ---
>  include/hw/ppc/pnv_xscom.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
> index 3757b2cab9..38077b4796 100644
> --- a/include/hw/ppc/pnv_xscom.h
> +++ b/include/hw/ppc/pnv_xscom.h
> @@ -54,7 +54,7 @@ typedef struct PnvXScomInterfaceClass {
>   *   PCB SLAVE   0x110Fxxxx
>   */
>=20
> -#define PNV_XSCOM_EX_CORE_BASE(base, i) (base | (((uint64_t)i) << 24))
> +#define PNV_XSCOM_EX_CORE_BASE(base, i) ((base) | ((uint64_t)(i) << 24=
))
>  #define PNV_XSCOM_EX_CORE_SIZE    0x100000
>=20
>  #define PNV_XSCOM_LPC_BASE        0xb0020
>=20


