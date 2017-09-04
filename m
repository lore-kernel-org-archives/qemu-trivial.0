Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1doo3U-0006Cy-Nl
	for mharc-qemu-trivial@gnu.org; Mon, 04 Sep 2017 05:52:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1doo3S-0006BA-JB
	for qemu-trivial@nongnu.org; Mon, 04 Sep 2017 05:52:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1doo3L-0004Eh-5C
	for qemu-trivial@nongnu.org; Mon, 04 Sep 2017 05:52:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42800)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcel@redhat.com>)
	id 1doo38-000498-Bu; Mon, 04 Sep 2017 05:52:10 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 462D580F9C;
	Mon,  4 Sep 2017 09:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 462D580F9C
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=marcel@redhat.com
Received: from mapfelba-osx.local (unknown [10.35.206.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D7A2956B6;
	Mon,  4 Sep 2017 09:52:00 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170830215523.25278-1-f4bug@amsat.org>
	<20170830215523.25278-10-f4bug@amsat.org>
From: Marcel Apfelbaum <marcel@redhat.com>
Message-ID: <e99108db-bf6a-b0de-696d-102634cc1066@redhat.com>
Date: Mon, 4 Sep 2017 12:51:58 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20170830215523.25278-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 04 Sep 2017 09:52:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 09/17] MAINTAINERS: add missing PCI
 entries
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
X-List-Received-Date: Mon, 04 Sep 2017 09:52:31 -0000

On 31/08/2017 0:55, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dd5e2c2b6b..bbe1191883 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -928,6 +928,8 @@ F: include/hw/pci/*
>   F: hw/misc/pci-testdev.c
>   F: hw/pci/*
>   F: hw/pci-bridge/*
> +F: docs/pci*
> +F: docs/specs/*pci*
>  =20
>   ACPI/SMBIOS
>   M: Michael S. Tsirkin <mst@redhat.com>
>=20

  Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>

Thanks,
Marcel

