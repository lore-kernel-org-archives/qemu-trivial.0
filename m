Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7vg9-00028O-5g
	for mharc-qemu-trivial@gnu.org; Mon, 16 Apr 2018 00:23:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1f7vg6-00026T-Mx
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2018 00:23:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1f7vg5-0007Ni-S6
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2018 00:23:42 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48190 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcel@redhat.com>)
	id 1f7vfz-0007KB-OU; Mon, 16 Apr 2018 00:23:35 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D312881A88D8;
	Mon, 16 Apr 2018 04:23:30 +0000 (UTC)
Received: from mapfelba-osx.local (unknown [10.35.206.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD29F111DCF8;
	Mon, 16 Apr 2018 04:23:26 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Yuval Shaia <yuval.shaia@oracle.com>
References: <20180415234307.28132-1-f4bug@amsat.org>
	<20180415234307.28132-39-f4bug@amsat.org>
From: Marcel Apfelbaum <marcel@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=marcel@redhat.com; prefer-encrypt=mutual; keydata=
	xsBNBFpwpFoBCAC66VT3ZMlr10I420na21Mdr6q/+v5XJ6w8QPOTFQMd4V4viNXT7rgJ8Qfv
	m4ViMaLoHBEmL6Kte4UNz3x28DUl91EcWpSRSMMGMa2oWj6Qv/9150byAByBYo2GijfIoayd
	NKyAZ+PnlsJ2uQgb1I0wLUZ5tDpMeZFkC2Wb8QC9fsv9N7gOA5kvT2Mea0XzNVWHowt9A0hv
	8+2O1YrqhqW7HVoLiET3XCec81rRPk+SbewVJtNIFkzamHBVruk4xozWZuluM8DNE4u+wlVx
	NsI6gxoJV9DKthh0QDqPVy01FpBPk3fHkIdQZeo3eaTE9EHU+OW8iDTXIG1HRLzt6SovABEB
	AAHNJE1hcmNlbCBBcGZlbGJhdW0gPG1hcmNlbEByZWRoYXQuY29tPsLAeAQTAQIAIgUCWnCk
	WgIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQNtTA8M8v5G2awAf/eb5BhjgTEoc6
	6En2oT2UnHvXvcGZlaMonfal9WDh/dgy3HmlV9nLdbc0xLEHywtIpthgXMRi+zN6tmOv6ddq
	I4HmhvXHWnqoxIoOqpkCSFsYI3eq/z8n80FE8wAudUA6IyS/riLfUUOfh3g90d3bnRYTHCGF
	ytFc9je4NmFvCJeIBJ9U/8QkmzZ5NXPP52HT0hSfIfOarxba2y91M05VMyAr38eskT0K2n0p
	O9nruETrUu+OfXRFlil+0TsVaKH5ZxREEO6OrFUFZc/CWvgaewrCDljckJB+xDib0eFaGb/A
	bhB8zVwJDyFgtvDfqHKfyx1BHskXxrRZdyjGTTAHAc7ATQRacKRaAQgAq5+6KAJvy6FTeHJU
	Y5G3fensizw6Zn+YJ2elPCFMVd9bivYBZnr9tdv2tJtEar/buk/azOUYxki2T3aEAok1IUXW
	yjCrwdwi8m8DAlvkZDDTA9i/cRJLd4otAB/TZWRrzT9oJN/odp4vpiwlu+0EkGCA1G/81Q0s
	f062diIxm4GCmrP6hSliz8vGXJPQwjJuMQrgQH0ZW3WVXTyRJUgKzeW0Eo2YaJSnwIOormAD
	pxuP5eHepg1+ph06XPkhujOW+/wD3qRSWbKmmemEP98w+lmsefDXGGTMzgkFaPooFfxo0tJe
	nVxSTZjWWhxmjCdi3oSvRVdJ/ey4XoTj1kWacwARAQABwsBfBBgBAgAJBQJacKRaAhsMAAoJ
	EDbUwPDPL+RtqH0H/34w4BflnhIxUpJYVdDQ1ypizk+UbmA9uI8ynMeeNqzSVZWihJ5syOGb
	ssc6HnPddNWnfRaSSdxNgxn7v0M5HmgBxoO4euxUGhG3o3T1N+PDRek7vP8FhREDDaslp9mF
	whJ/+/tjrAsMKSs+lVTAeuqQPo7BO9M7cugVPUEawq/OXTF6xnUq2oqVJtQ2wG0ZZNmuaN03
	fEK8NjVpYnqnvvj3RyRqDCcAEcFKiZgXS0JXtYSGxQspDb0wY827IrF6QGh+2CttUkAfN02h
	qYRsKqlZ4/hwJdGFuy10kqgHjjV6/bfQNjSmSbQaGjDR9afGm5TnP3s6ghQFB2aOJohd3G4=
Message-ID: <3c4dcab3-b75f-8e1a-b4f0-9d7a7bda63a7@redhat.com>
Date: Mon, 16 Apr 2018 07:23:24 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180415234307.28132-39-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 16 Apr 2018 04:23:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 16 Apr 2018 04:23:30 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'marcel@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH v3 38/41] hw/rdma: Use the BYTE-based
 definitions
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
X-List-Received-Date: Mon, 16 Apr 2018 04:23:43 -0000

On 16/04/2018 2:43, Philippe Mathieu-Daud=C3=A9 wrote:
> It eases code review, unit is explicit.
>=20
> Patch generated using:
>=20
>   $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include=
/hw/
>=20
> and modified manually.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/rdma/vmw/pvrdma.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/rdma/vmw/pvrdma.h b/hw/rdma/vmw/pvrdma.h
> index 8c173cb824..f17143f0e6 100644
> --- a/hw/rdma/vmw/pvrdma.h
> +++ b/hw/rdma/vmw/pvrdma.h
> @@ -16,6 +16,7 @@
>  #ifndef PVRDMA_PVRDMA_H
>  #define PVRDMA_PVRDMA_H
> =20
> +#include "qemu/units.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/msix.h"
> =20
> @@ -30,7 +31,7 @@
>  #define RDMA_MSIX_BAR_IDX    0
>  #define RDMA_REG_BAR_IDX     1
>  #define RDMA_UAR_BAR_IDX     2
> -#define RDMA_BAR0_MSIX_SIZE  (16 * 1024)
> +#define RDMA_BAR0_MSIX_SIZE  (16 * K_BYTE)
>  #define RDMA_BAR1_REGS_SIZE  256
>  #define RDMA_BAR2_UAR_SIZE   (0x1000 * MAX_UCS) /* each uc gets page *=
/
> =20
>=20

Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>

Thanks,
Marcel



