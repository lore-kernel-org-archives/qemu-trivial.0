Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7z7A-0004mO-L2
	for mharc-qemu-trivial@gnu.org; Mon, 16 Apr 2018 04:03:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1f7z75-0004ey-Q3
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2018 04:03:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1f7z70-0005PS-9y
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2018 04:03:45 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42312 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1f7z6u-0005KA-IB; Mon, 16 Apr 2018 04:03:36 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98DD540676C0;
	Mon, 16 Apr 2018 08:03:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-151.ams2.redhat.com
	[10.36.117.151])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E1A87C48;
	Mon, 16 Apr 2018 08:03:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id C499D3EB8F; Mon, 16 Apr 2018 10:03:34 +0200 (CEST)
Date: Mon, 16 Apr 2018 10:03:34 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Message-ID: <20180416080334.uu74ibkzhgbtjoba@sirius.home.kraxel.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
	<20180415234307.28132-35-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180415234307.28132-35-f4bug@amsat.org>
User-Agent: NeoMutt/20180323
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 16 Apr 2018 08:03:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 16 Apr 2018 08:03:35 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH v3 34/41] hw/usb: Use the BYTE-based
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
X-List-Received-Date: Mon, 16 Apr 2018 08:03:51 -0000

On Sun, Apr 15, 2018 at 08:43:00PM -0300, Philippe Mathieu-Daud=E9 wrote:
> It eases code review, unit is explicit.
>=20
> Patch generated using:
>=20
>   $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include=
/hw/
>=20
> and modified manually.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


