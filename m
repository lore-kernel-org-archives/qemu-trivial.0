Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dazNg-0007pd-Gv
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 03:08:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dazNe-0007oA-0Y
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 03:08:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dazNd-0003sZ-85
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 03:08:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36056)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dazNY-0003oK-Eq; Fri, 28 Jul 2017 03:08:08 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47F0FC07D1D6;
	Fri, 28 Jul 2017 07:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 47F0FC07D1D6
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A54AD5E245;
	Fri, 28 Jul 2017 07:08:05 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Dmitry Fleytman <dmitry@daynix.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-16-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a4a9c830-1047-c0f1-918d-d1543c881cd6@redhat.com>
Date: Fri, 28 Jul 2017 09:08:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20170728053610.15770-16-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 28 Jul 2017 07:08:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [RFC PATCH 15/47] MAINTAINERS: add
 missing VMWare entry
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
X-List-Received-Date: Fri, 28 Jul 2017 07:08:15 -0000

On 28.07.2017 07:35, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>=20
> RFC because I'm not sure about tests/

I think that should be fine, we've got a couple of such entries already
in the MAINTAINERS file.

>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d8aef164ca..9670a3901a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1140,6 +1140,7 @@ M: Dmitry Fleytman <dmitry@daynix.com>
>  S: Maintained
>  F: hw/net/vmxnet*
>  F: hw/scsi/vmw_pvscsi*
> +F: tests/vmxnet3-test.c
> =20

Reviewed-by: Thomas Huth <thuth@redhat.com>

