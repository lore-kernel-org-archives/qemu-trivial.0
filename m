Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0RSM-0002JM-Qh
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 08:10:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1e0RSH-0002HT-RZ
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 08:10:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1e0RSC-0004eg-2y
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 08:10:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46882)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <otubo@redhat.com>)
	id 1e0RS4-0004WZ-NP; Fri, 06 Oct 2017 08:10:00 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B77F513A42;
	Fri,  6 Oct 2017 12:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B77F513A42
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=otubo@redhat.com
Received: from vader (ovpn-117-77.ams2.redhat.com [10.36.117.77])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AEDCA6444B;
	Fri,  6 Oct 2017 12:09:49 +0000 (UTC)
Date: Fri, 6 Oct 2017 14:09:48 +0200
From: "Eduardo Otubo\"" <otubo@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>, Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>, qemu-trivial@nongnu.org,
	qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20171006120948.GA12173@vader>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922160111.31885-1-f4bug@amsat.org>
	<a6bedac0-0e58-8709-f549-a602914c9077@reactos.org>
	<400dde93-d110-ee49-b2a0-76ea633b4abe@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <400dde93-d110-ee49-b2a0-76ea633b4abe@amsat.org>
User-Agent: Mutt/1.8.3+47 (5f034395e53d) (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 06 Oct 2017 12:09:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 23/34] hw/dma/i8257: rename DMA_init() to
 i8257_dma_init()
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
X-List-Received-Date: Fri, 06 Oct 2017 12:10:17 -0000

On Fri, Sep 22, 2017 at 03:08:03PM -0300, Philippe Mathieu-Daud=C3=A9 wro=
te:
> On 09/22/2017 02:43 PM, Herv=C3=A9 Poussineau wrote:
> > Le 22/09/2017 =C3=A0 18:01, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit =
:
> [...]
> > > +void i8257_dma_init(ISABus *bus, int high_page_enable);
> > > +
> >=20
> > As you're changing the DMA_init prototype, can you add an Error **err=
p
> > parameter, and pass &error_abort in each caller?
> >=20
> > See http://lists.gnu.org/archive/html/qemu-devel/2017-09/msg00262.htm=
l
> > for more details
>=20
> If Eduardo doesn't have a patch ready I can do it.

Please go ahead.
You can also use my patch set (v2) for that as a base if you want.
https://lists.gnu.org/archive/html/qemu-devel/2017-09/msg08007.html

--=20
Eduardo Otubo
Senior Software Engineer @ RedHat

