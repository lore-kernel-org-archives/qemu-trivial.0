Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1drLth-00050n-3V
	for mharc-qemu-trivial@gnu.org; Mon, 11 Sep 2017 06:24:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1drLte-0004zH-KE
	for qemu-trivial@nongnu.org; Mon, 11 Sep 2017 06:24:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1drLtd-0008HY-Oe
	for qemu-trivial@nongnu.org; Mon, 11 Sep 2017 06:24:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37758)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1drLtX-0008ES-Bl; Mon, 11 Sep 2017 06:24:47 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D78DCBB96;
	Mon, 11 Sep 2017 10:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5D78DCBB96
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=pbonzini@redhat.com
Received: from [10.32.181.85] (unknown [10.32.181.85])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF9E870523;
	Mon, 11 Sep 2017 10:24:44 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Hannes Reinecke <hare@suse.com>, qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Laszlo Ersek <lersek@redhat.com>
References: <20170910171557.12689-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0c1bf125-1431-cdf7-3e4b-7fb95113acfc@redhat.com>
Date: Mon, 11 Sep 2017 12:24:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170910171557.12689-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 11 Sep 2017 10:24:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: update email,
 add missing test entry for megasas
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
X-List-Received-Date: Mon, 11 Sep 2017 10:24:55 -0000

On 10/09/2017 19:15, Philippe Mathieu-Daud=C3=A9 wrote:
> and update maintainer email address
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Hannes Reinecke replied:
> I'm currently on vacation with no internet access, but will be happy to=
 answer your mail once I'm back at work on Sep, 12th.
>=20
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 36eeb42d19..371e23a9ff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1101,11 +1101,12 @@ F: hw/block/nvme*
>  F: tests/nvme-test.c
> =20
>  megasas
> -M: Hannes Reinecke <hare@suse.de>
> +M: Hannes Reinecke <hare@suse.com>
>  L: qemu-block@nongnu.org
>  S: Supported
>  F: hw/scsi/megasas.c
>  F: hw/scsi/mfi.h
> +F: tests/megasas-test.c
> =20
>  Network packet abstractions
>  M: Dmitry Fleytman <dmitry@daynix.com>
>=20

Queued, thanks.

Paolo

