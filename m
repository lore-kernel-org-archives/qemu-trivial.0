Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yan6s-0000Cy-P6
	for mharc-qemu-trivial@gnu.org; Wed, 25 Mar 2015 11:20:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Yan6q-00009s-3j
	for qemu-trivial@nongnu.org; Wed, 25 Mar 2015 11:20:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Yan6m-0008No-Oo
	for qemu-trivial@nongnu.org; Wed, 25 Mar 2015 11:20:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51076)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1Yan6m-0008Nf-AC; Wed, 25 Mar 2015 11:20:40 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2PFKd0c013995
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 25 Mar 2015 11:20:39 -0400
Received: from redhat.com (ovpn-116-130.ams2.redhat.com [10.36.116.130])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2PFKbvw006033; Wed, 25 Mar 2015 11:20:37 -0400
Date: Wed, 25 Mar 2015 16:20:36 +0100
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20150325161952-mutt-send-email-mst@redhat.com>
References: <1426871518-2761-1-git-send-email-sw@weilnetz.de>
	<5512D1A0.9020106@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5512D1A0.9020106@msgid.tls.msk.ru>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	t2PFKd0c013995
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] acpi: Add missing GCC_FMT_ATTR to local
	function
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Mar 2015 15:20:45 -0000

On Wed, Mar 25, 2015 at 06:17:52PM +0300, Michael Tokarev wrote:
> 20.03.2015 20:11, Stefan Weil wrote:
> > This fixes these gcc warnings (not enabled in default build):
> >=20
> > hw/acpi/aml-build.c:83:5: warning:
> >  function might be possible candidate for =E2=80=98gnu_printf=E2=80=99=
 format attribute [-Wsuggest-attribute=3Dformat]
> > hw/acpi/aml-build.c:88:5: warning:
> >  function might be possible candidate for =E2=80=98gnu_printf=E2=80=99=
 format attribute [-Wsuggest-attribute=3Dformat]
>=20
> Not very important but does not hurt, applied to -trivial, thanks!
>=20
> /mjt

I'm preparing a pull request with this one, it's already
signed and testing is going to complete soon.
So I think you needn't bother.

