Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b0EcW-0007np-41
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 16:51:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <belczyk@foxtrot.belo.io>) id 1b0D6J-0008IH-7a
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 15:13:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <belczyk@foxtrot.belo.io>) id 1b0D6H-0006Bi-Rk
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 15:13:47 -0400
Received: from foxtrot.belo.io ([62.121.136.4]:12787)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <belczyk@foxtrot.belo.io>)
	id 1b0D62-00067V-SR; Tue, 10 May 2016 15:13:31 -0400
Received: by foxtrot.belo.io (Postfix, from userid 31337)
	id 6EE8813A53; Tue, 10 May 2016 21:13:24 +0200 (CEST)
Date: Tue, 10 May 2016 21:13:24 +0200
From: =?iso-8859-2?Q?Micha=B3?= Belczyk <belczyk@bsd.krakow.pl>
To: Alex Bligh <alex@alex.org.uk>
Cc: Eric Blake <eblake@redhat.com>,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	qemu block <qemu-block@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	Quentin Casasnovas <quentin.casasnovas@oracle.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20160510191324.GF94801@foxtrot.belo.io>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
	<5731FE53.6010602@redhat.com>
	<C84A91D0-D90A-4B7B-B72D-A33E1C189354@alex.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Disposition: inline
In-Reply-To: <C84A91D0-D90A-4B7B-B72D-A33E1C189354@alex.org.uk>
User-Agent: Mutt/1.6.1 (2016-04-27)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 62.121.136.4
X-Mailman-Approved-At: Tue, 10 May 2016 16:51:04 -0400
Subject: Re: [Qemu-trivial] [Nbd] [Qemu-devel] [PATCH] nbd: fix trim/discard
 commands with a length bigger than NBD_MAX_BUFFER_SIZE
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
X-List-Received-Date: Tue, 10 May 2016 19:13:48 -0000

On Tue, May 10, 2016 at 04:41:27PM +0100, Alex Bligh wrote:
>
>On 10 May 2016, at 16:29, Eric Blake <eblake@redhat.com> wrote:
>
>> So the kernel is currently one of the clients that does NOT honor bloc=
k
>> sizes, and as such, servers should be prepared for ANY size up to
>> UINT_MAX (other than DoS handling).
>
>Interesting followup question:
>
>If the kernel does not fragment TRIM requests at all (in the
>same way it fragments read and write requests), I suspect
>something bad may happen with TRIM requests over 2^31
>in size (particularly over 2^32 in size), as the length
>field in nbd only has 32 bits.
>
>Whether it supports block size constraints or not, it is
>going to need to do *some* breaking up of requests.

Doesn't the kernel break TRIM requests at max_discard_sectors?

I remember testing the following change in the nbd kmod long time ago:

#if 0
		disk->queue->limits.max_discard_sectors =3D UINT_MAX;
#else
		disk->queue->limits.max_discard_sectors =3D 65536;
#endif

The problem with large TRIM requests is exactly the same as with other=20
(READ/WRITE) large requests -- they _may_ take loads of time and if the c=
lient=20
wants to support a fast switch over to another replica it must put some=20
constraints on the timeout value... which may be very easily broken if yo=
u=20
allow things like a 1GB trim request on the server using DIO on the other=
 side=20
(and say heavily fragmented sparse file over XFS, never mind).

I don't think it's the problem of QEMU NBD server to fix that, the constr=
aint=20
on the server side is perfectly fine, the problem is to note that a chang=
e on=20
the client side is required to limit the maximum size of the TRIM request=
s.
The reason for the patch I pasted above was that at the time I looked int=
o it=20
there was no other way to change the TRIM request size via=20
/sys/block/$dev/queue/max_discard_sectors, but maybe the more recent kern=
els=20
allow that?
Not to mention that the NBD client option to set that at NBD queue setup =
time=20
would be nice...

Just my 2p.

--=20
Micha=B3 Belczyk Snr

