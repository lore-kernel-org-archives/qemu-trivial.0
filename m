Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hDVX9-0004J3-5j
	for mharc-qemu-trivial@gnu.org; Mon, 08 Apr 2019 10:46:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hDVX7-0004HS-B7
	for qemu-trivial@nongnu.org; Mon, 08 Apr 2019 10:46:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hDVX6-000607-GV
	for qemu-trivial@nongnu.org; Mon, 08 Apr 2019 10:46:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53478)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hDVX0-0005uI-HM; Mon, 08 Apr 2019 10:45:54 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30F23C023D;
	Mon,  8 Apr 2019 14:45:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A92D163F76;
	Mon,  8 Apr 2019 14:45:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 256021138648; Mon,  8 Apr 2019 16:45:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org,  qemu-devel@nongnu.org,  Peter Maydell
	<peter.maydell@linaro.org>,  Jason Wang <jasowang@redhat.com>,  Gerd
	Hoffmann <kraxel@redhat.com>,  "Edgar E. Iglesias"
	<edgar.iglesias@gmail.com>, Rob Herring <robh@kernel.org>, Magnus Damm
	<magnus.damm@gmail.com>,  Joel Stanley <joel@jms.id.au>,  Richard
	Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>, Beniamino
	Galvani <b.galvani@gmail.com>,  qemu-arm@nongnu.org,  Peter Chubb
	<peter.chubb@nicta.com.au>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
	<clg@kaod.org>,  David Gibson <david@gibson.dropbear.id.au>,  Andrew
	Jeffery <andrew@aj.id.au>,  Bastian Koppelmann
	<kbastian@mail.uni-paderborn.de>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
	<f4bug@amsat.org>, Igor Mitsyanko <i.mitsyanko@gmail.com>, Michael Walle
	<michael@walle.cc>, qemu-ppc@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
	Aurelien Jarno <aurelien@aurel32.net>
References: <20190204231815.29661-1-philmd@redhat.com>
	<20190204231815.29661-2-philmd@redhat.com>
Date: Mon, 08 Apr 2019 16:45:45 +0200
In-Reply-To: <20190204231815.29661-2-philmd@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 5 Feb 2019 00:18:05
	+0100")
Message-ID: <87ftqso8rq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 08 Apr 2019 14:45:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 01/11] hw/arm/aspeed: Use
 TYPE_TMP105/TYPE_PCA9552 instead of hardcoded string
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
X-List-Received-Date: Mon, 08 Apr 2019 14:46:02 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/arm/aspeed.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

There's another one in hw/arm/nseries.c.  Not this patch's problem; it's
only about aspeed.

