Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S283c-0005J9-Rd
	for mharc-qemu-trivial@gnu.org; Mon, 27 Feb 2012 16:24:32 -0500
Received: from eggs.gnu.org ([208.118.235.92]:42764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1S283Y-0005Ic-WB
	for qemu-trivial@nongnu.org; Mon, 27 Feb 2012 16:24:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1S283U-0006Fw-Fh
	for qemu-trivial@nongnu.org; Mon, 27 Feb 2012 16:24:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34378)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1S283U-0006Fc-6y; Mon, 27 Feb 2012 16:24:24 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1RLOLn8020761
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 27 Feb 2012 16:24:21 -0500
Received: from garlic.redhat.com (vpn-200-51.tlv.redhat.com [10.35.200.51])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q1RLOFma023192
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Mon, 27 Feb 2012 16:24:18 -0500
Date: Mon, 27 Feb 2012 23:24:14 +0200
From: Alon Levy <alevy@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120227212414.GQ7395@garlic.redhat.com>
Mail-Followup-To: Peter Maydell <peter.maydell@linaro.org>,
	Stefan Weil <sw@weilnetz.de>,
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
References: <1330263021-1339-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA_82UCPWVukhAWcxGjeRQfkb+_E7OOdx8fh9y-6Ya_OMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAFEAcA_82UCPWVukhAWcxGjeRQfkb+_E7OOdx8fh9y-6Ya_OMg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	q1RLOLn8020761
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] libcacard: Spelling and
 grammar fixes in documentation
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
X-List-Received-Date: Mon, 27 Feb 2012 21:24:31 -0000

On Sun, Feb 26, 2012 at 06:18:04PM +0000, Peter Maydell wrote:
> On 26 February 2012 13:30, Stefan Weil <sw@weilnetz.de> wrote:
> > @@ -217,10 +217,10 @@ the card using the following functions:
> > =A0 =A0 =A0 =A0 =A0VCardStatus vcard_add_applet(VCard *card, VCardApp=
let *applet);
> >
> > =A0 Add an applet onto the list of applets attached to the card. Once=
 an applet
> > - =A0has been added, it can be selected by it's aid, and then command=
s will be
> > + =A0has been added, it can be selected by its aid, and then commands=
 will be
>=20
> While you're changing this line, it looks like 'aid' here should be 'AI=
D'
> (it is capitalised elsewhere in the doc except where referring to a fun=
ction
> parameter name).
>=20
> > =A0 routed to it VCardProcessAPDU function. This function adopts the =
applet the
> > =A0 passed int applet.
>=20
> The sentence "This function..." clearly needs correcting as it doesn't
> make much sense as it stands, but I'm not sure what it should be change=
d to.

Asked Robert Relyea (rrelyea@redhat.com - I guess he should be in
MAINTAINERS, although he is not..) and the answer was:
 This function adopts the applet that is passed into it.

>=20
> > Note: 2 applets with the same AID should not be added to
> > - =A0the same card. It's permissible to add more than one applet. Mul=
tiple applets
> > + =A0the same card. It is permissible to add more than one applet. Mu=
ltiple applets
> > =A0 may have the same VCardPRocessAPDU entry point.
>=20
> -- PMM
>=20

