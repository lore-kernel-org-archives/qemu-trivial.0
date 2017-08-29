Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dmhO4-0000BN-3W
	for mharc-qemu-trivial@gnu.org; Tue, 29 Aug 2017 10:21:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53079)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1dmhNy-00006o-KP
	for qemu-trivial@nongnu.org; Tue, 29 Aug 2017 10:21:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1dmhNu-00033f-Lk
	for qemu-trivial@nongnu.org; Tue, 29 Aug 2017 10:20:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39026)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1dmhNh-0002vg-GI; Tue, 29 Aug 2017 10:20:41 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 67EC480099;
	Tue, 29 Aug 2017 14:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 67EC480099
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=berrange@redhat.com
Received: from redhat.com (unknown [10.33.36.95])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3522D6E8BF;
	Tue, 29 Aug 2017 14:20:38 +0000 (UTC)
Date: Tue, 29 Aug 2017 15:20:36 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Longpeng <longpeng2@huawei.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Message-ID: <20170829142036.GD25801@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <20170828113737.12199-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20170828113737.12199-1-f4bug@amsat.org>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 29 Aug 2017 14:20:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] tests: fix incorrect size_t format in
 benchmark-crypto
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
X-List-Received-Date: Tue, 29 Aug 2017 14:21:02 -0000

On Mon, Aug 28, 2017 at 08:37:37AM -0300, Philippe Mathieu-Daud=C3=A9 wro=
te:
>   $ make check-speed
>   tests/benchmark-crypto-hash.c: In function 'test_hash_speed':
>   tests/benchmark-crypto-hash.c:44:5: error: format '%ld' expects argum=
ent of type 'long int', but argument 2 has type 'size_t' [-Werror=3Dforma=
t=3D]
>        g_print("Testing chunk_size %ld bytes ", chunk_size);
>        ^
>   tests/benchmark-crypto-hash.c: In function 'main':
>   tests/benchmark-crypto-hash.c:62:9: error: format '%lu' expects argum=
ent of type 'long unsigned int', but argument 4 has type 'size_t' [-Werro=
r=3Dformat=3D]
>            snprintf(name, sizeof(name), "/crypto/hash/speed-%lu", i);
>            ^
>   cc1: all warnings being treated as errors
>   rules.mak:66: recipe for target 'tests/benchmark-crypto-hash.o' faile=
d
>   make: *** [tests/benchmark-crypto-hash.o] Error 1
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> testing v2.10.0-rc4
>=20
>  tests/benchmark-crypto-cipher.c | 4 ++--
>  tests/benchmark-crypto-hash.c   | 4 ++--
>  tests/benchmark-crypto-hmac.c   | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)

Thanks, added to my crypto queue, unless it merges through -trivial
first.


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

