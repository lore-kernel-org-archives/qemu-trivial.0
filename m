Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cqxPG-0000tG-4i
	for mharc-qemu-trivial@gnu.org; Thu, 23 Mar 2017 03:43:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1cqxPE-0000sd-Gc
	for qemu-trivial@nongnu.org; Thu, 23 Mar 2017 03:43:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1cqxPD-0004Xl-SX
	for qemu-trivial@nongnu.org; Thu, 23 Mar 2017 03:43:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:10944)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1cqxP9-0004XC-Ly; Thu, 23 Mar 2017 03:43:31 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E2D504E024;
	Thu, 23 Mar 2017 07:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E2D504E024
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=kraxel@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com E2D504E024
Received: from nilsson.home.kraxel.org (ovpn-116-80.ams2.redhat.com
	[10.36.116.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8365718510;
	Thu, 23 Mar 2017 07:43:29 +0000 (UTC)
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 707AC80C3F; Thu, 23 Mar 2017 08:43:27 +0100 (CET)
Message-ID: <1490255007.463.11.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Michael
	Roth <mdroth@linux.vnet.ibm.com>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>,  Alexander Graf <agraf@suse.de>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Thu, 23 Mar 2017 08:43:27 +0100
In-Reply-To: <87y3vw1o94.fsf@dusky.pond.sub.org>
References: <20170322204844.446-1-f4bug@amsat.org>
	<20170322204844.446-2-f4bug@amsat.org>
	<87y3vw1o94.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 23 Mar 2017 07:43:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH RESEND 1/3] usb-ccid: make
 ccid_write_data_block() cope with null buffers
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
X-List-Received-Date: Thu, 23 Mar 2017 07:43:37 -0000

  Hi,

> > +    if (len =3D=3D 0) {
> > +        return;
>=20
> Correct only if messages without data always have the same meaning as no
> message.  Gerd?

Not a ccid expert, but looking through the code it seems writing a
(reply) data block with status and without payload (data =3D NULL and len
=3D 0) is perfectly fine and can happen in case no (virtual) smartcard is
inserted into the card reader.  Which this patch breaks.  So,

NACK.

cheers,
  Gerd


