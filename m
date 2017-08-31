Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnLdR-0003f0-96
	for mharc-qemu-trivial@gnu.org; Thu, 31 Aug 2017 05:19:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1dnLdP-0003dN-7m
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 05:19:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1dnLdL-0008Gd-VB
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 05:19:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47983)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1dnLdC-0008CT-Bi; Thu, 31 Aug 2017 05:19:22 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6EE3EC9D30;
	Thu, 31 Aug 2017 09:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6EE3EC9D30
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=berrange@redhat.com
Received: from redhat.com (unknown [10.42.22.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1358F9ABBC;
	Thu, 31 Aug 2017 09:19:19 +0000 (UTC)
Date: Thu, 31 Aug 2017 10:19:17 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Longpeng <longpeng2@huawei.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Message-ID: <20170831091917.GD17315@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <20170830215523.25278-1-f4bug@amsat.org>
	<20170830215523.25278-16-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20170830215523.25278-16-f4bug@amsat.org>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 31 Aug 2017 09:19:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 15/17] MAINTAINERS: add missing
 Cryptography entry
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
X-List-Received-Date: Thu, 31 Aug 2017 09:19:36 -0000

On Wed, Aug 30, 2017 at 06:55:21PM -0300, Philippe Mathieu-Daud=C3=A9 wro=
te:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0b77590dc8..7a0c00550e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1526,6 +1526,7 @@ S: Maintained
>  F: crypto/
>  F: include/crypto/
>  F: tests/test-crypto-*
> +F: tests/benchmark-crypto-*
>  F: qemu.sasl
> =20
>  Coroutines

Acked-by: Daniel P. Berrange <berrange@redhat.com>

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

