Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hVqkB-0007Y1-Sq
	for mharc-qemu-trivial@gnu.org; Wed, 29 May 2019 01:03:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hVqk9-0007WB-JQ
	for qemu-trivial@nongnu.org; Wed, 29 May 2019 01:03:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hVqk8-0003rx-N0
	for qemu-trivial@nongnu.org; Wed, 29 May 2019 01:03:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38820)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1hVqk4-0003oq-Qw; Wed, 29 May 2019 01:03:12 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CB4DDC0AEE30;
	Wed, 29 May 2019 05:03:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-59.ams2.redhat.com
	[10.36.116.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5236F1001DF9;
	Wed, 29 May 2019 05:02:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 89E1511AAB; Wed, 29 May 2019 07:02:55 +0200 (CEST)
Date: Wed, 29 May 2019 07:02:55 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Halil Pasic <pasic@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Walle <michael@walle.cc>, Richard Henderson <rth@twiddle.net>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Fam Zheng <fam@euphon.net>, qemu-s390x@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Message-ID: <20190529050255.6ffo3rvig3za7uzg@sirius.home.kraxel.org>
References: <20190528164020.32250-1-philmd@redhat.com>
	<20190528164020.32250-9-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190528164020.32250-9-philmd@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 29 May 2019 05:03:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 08/10] hw/usb-storage: Use the QOM
 DEVICE() macro to access DeviceState.qdev
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
X-List-Received-Date: Wed, 29 May 2019 05:03:18 -0000

On Tue, May 28, 2019 at 06:40:18PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Rather than looking inside the definition of a DeviceState with
> "s->qdev", use the QOM prefered style: "DEVICE(s)".
>=20
> This patch was generated using the following Coccinelle script:
>=20
>     // Use DEVICE() macros to access DeviceState.qdev
>     @use_device_macro_to_access_qdev@
>     expression obj;
>     identifier dev;
>     @@
>     -&obj->dev.qdev
>     +DEVICE(obj)
>=20
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


