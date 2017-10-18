Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4nkp-0006c9-Qv
	for mharc-qemu-trivial@gnu.org; Wed, 18 Oct 2017 08:47:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4nkn-0006ae-Er
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 08:47:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4nkm-0003On-Lk
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 08:47:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:19624)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e4nkh-0003KT-Gq; Wed, 18 Oct 2017 08:47:15 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B4F699DAA;
	Wed, 18 Oct 2017 12:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6B4F699DAA
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.33.192.189] (dhcp-192-189.str.redhat.com [10.33.192.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2D725191D;
	Wed, 18 Oct 2017 12:47:07 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20171017164426.25277-1-f4bug@amsat.org>
	<20171017164426.25277-41-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <353e9bc4-ad88-c211-a8c3-4969c093cffd@redhat.com>
Date: Wed, 18 Oct 2017 14:47:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171017164426.25277-41-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 18 Oct 2017 12:47:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v3 40/42] i386/pc: move vmport.c to
 hw/i386/
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
X-List-Received-Date: Wed, 18 Oct 2017 12:47:22 -0000

On 17.10.2017 18:44, Philippe Mathieu-Daud=C3=A9 wrote:
> It's a x86-only device, so it does not make sense to keep it
> in the shared misc folder.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/{misc =3D> i386}/vmport.c | 0
>  hw/i386/Makefile.objs      | 1 +
>  hw/misc/Makefile.objs      | 2 --
>  3 files changed, 1 insertion(+), 2 deletions(-)
>  rename hw/{misc =3D> i386}/vmport.c (100%)

Reviewed-by: Thomas Huth <thuth@redhat.com>

