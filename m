Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cr3Ea-00033k-Lq
	for mharc-qemu-trivial@gnu.org; Thu, 23 Mar 2017 09:57:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1cr3EY-00032K-AT
	for qemu-trivial@nongnu.org; Thu, 23 Mar 2017 09:56:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1cr3EX-0008Je-HY
	for qemu-trivial@nongnu.org; Thu, 23 Mar 2017 09:56:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35676)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1cr3ES-0008Id-HS; Thu, 23 Mar 2017 09:56:52 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 68949624A9;
	Thu, 23 Mar 2017 13:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 68949624A9
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=kraxel@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 68949624A9
Received: from nilsson.home.kraxel.org (ovpn-116-80.ams2.redhat.com
	[10.36.116.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 03E827D694;
	Thu, 23 Mar 2017 13:56:51 +0000 (UTC)
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 9EBC880CB2; Thu, 23 Mar 2017 14:56:46 +0100 (CET)
Message-ID: <1490277406.13302.1.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>, 
	Michael Roth <mdroth@linux.vnet.ibm.com>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, qemu-trivial@nongnu.org, Alexander Graf
	<agraf@suse.de>, qemu-devel@nongnu.org,  Philippe
	=?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Date: Thu, 23 Mar 2017 14:56:46 +0100
In-Reply-To: <87tw6ktban.fsf@dusky.pond.sub.org>
References: <20170322204844.446-1-f4bug@amsat.org>
	<20170322204844.446-2-f4bug@amsat.org>
	<87y3vw1o94.fsf@dusky.pond.sub.org>
	<1490255007.463.11.camel@redhat.com>
	<CAJ+F1CJNy+e83EHR_8uzAHURxDk6idnNTTL_FoD-krWPue7Lww@mail.gmail.com>
	<1490262680.463.27.camel@redhat.com>
	<87tw6ktban.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 23 Mar 2017 13:56:52 +0000 (UTC)
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
X-List-Received-Date: Thu, 23 Mar 2017 13:56:59 -0000

On Do, 2017-03-23 at 13:41 +0100, Markus Armbruster wrote:
> Gerd Hoffmann <kraxel@redhat.com> writes:
>=20
> >   Hi,
> >
> >>  oops, there are hard-coded calls with NULL/0. I suppose to fix clang
> >> warning, it would need to check if data !=3D null for memcpy.
> >
> > I'd check for len > 0, and in that if branch we can also assert on data
> > =3D=3D NULL and thereby check that len and data are consistent.
>=20
> If len is non-zero but data is null, memcpy() will crash just fine by
> itself, so why bother asserting.

To make clang happy?  But maybe clang is clever enough to figure data
can't be null at that point in case we call memcpy with len !=3D 0
only ...

cheers,
  Gerd


