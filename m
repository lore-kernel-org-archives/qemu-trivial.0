Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz4L1-0000sp-VI
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 09:03:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1Xz4Kw-0000jA-BL
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 09:03:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1Xz4Kq-0005KJ-GU
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 09:03:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33461)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1Xz4Kf-0005Go-Q9; Thu, 11 Dec 2014 09:03:05 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sBBE31rw030839
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 11 Dec 2014 09:03:02 -0500
Received: from work-vm (ovpn-116-122.ams2.redhat.com [10.36.116.122])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sBBE2wOw025193
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Thu, 11 Dec 2014 09:03:00 -0500
Date: Thu, 11 Dec 2014 14:02:58 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alex Benn?e <alex.bennee@linaro.org>
Message-ID: <20141211140257.GE2567@work-vm>
References: <1418298396-27089-1-git-send-email-dgilbert@redhat.com>
	<87oaracoa6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87oaracoa6.fsf@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] Sort
	include/qemu/typedefs.h
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
X-List-Received-Date: Thu, 11 Dec 2014 14:03:27 -0000

* Alex Benn?e (alex.bennee@linaro.org) wrote:
>=20
> Dr. David Alan Gilbert (git) <dgilbert@redhat.com> writes:
>=20
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >
> > Mainly to make it less likely to conflict during merges.
> >
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>=20
> I'm happy with the idea (having been adding stuff recently). However
> have you:
>=20
> a) checked for typedefs no longer used by the wider code base
> b) audited for others using opaque types pulling in full definitions?

Nope; I just sorted it - so it's nice and simple; but yes it's
probably worth doing those at some point.

> Otherwise:
>=20
> Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>

Thanks,

Dave

>=20
> Cheers,
>=20
> --=20
> Alex Benn=E9e
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

