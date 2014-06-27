Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X0b19-0000ox-W5
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jun 2014 14:37:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1X0b12-0000b8-55
	for qemu-trivial@nongnu.org; Fri, 27 Jun 2014 14:36:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1X0b0v-0003hq-Vm
	for qemu-trivial@nongnu.org; Fri, 27 Jun 2014 14:36:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:9660)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>)
	id 1X0b0j-0003fl-L9; Fri, 27 Jun 2014 14:36:33 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s5RIaW3n022752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 27 Jun 2014 14:36:33 -0400
Received: from [10.3.113.59] (ovpn-113-59.phx2.redhat.com [10.3.113.59])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s5RIaWxx010589; Fri, 27 Jun 2014 14:36:32 -0400
Message-ID: <1403894192.31091.201.camel@ul30vt.home>
From: Alex Williamson <alex.williamson@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 27 Jun 2014 12:36:32 -0600
In-Reply-To: <1081899261.33608246.1403891502613.JavaMail.zimbra@redhat.com>
References: <1403879569-24256-1-git-send-email-pbonzini@redhat.com>
	<1403886899.31091.187.camel@ul30vt.home>
	<1081899261.33608246.1403891502613.JavaMail.zimbra@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	s5RIaW3n022752
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for 2.1] vfio: use correct runstate
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
X-List-Received-Date: Fri, 27 Jun 2014 18:36:58 -0000

On Fri, 2014-06-27 at 13:51 -0400, Paolo Bonzini wrote:
> ----- Messaggio originale -----
> > Da: "Alex Williamson" <alex.williamson@redhat.com>
> > A: "Paolo Bonzini" <pbonzini@redhat.com>
> > Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
> > Inviato: Venerd=C3=AC, 27 giugno 2014 18:34:59
> > Oggetto: Re: [PATCH for 2.1] vfio: use correct runstate
> >=20
> > On Fri, 2014-06-27 at 16:32 +0200, Paolo Bonzini wrote:
> > > io-error is for block device errors; it should always be preceded
> > > by a BLOCK_IO_ERROR event.
> >=20
> > Where does this requirement come from?  I only see a loose associatio=
n
> > of IO_ERROR to disk in libvirt and none in QEMU.
>=20
> See the RunState enum in qapi-schema.json:
>=20
> ##
> # @RunState
> #
> # An enumeration of VM run states.
> #
> # ...
> #
> # @internal-error: An internal error that prevents further guest execut=
ion
> # has occurred
> #
> # @io-error: the last IOP has failed and the device is configured to pa=
use
> # on I/O errors
> #
> # @paused: guest has been paused via the 'stop' command
>=20
> The point of io-error is that management can look at block devices, see=
 if
> any have an error reported, and then resume execution (see documentatio=
n of
> rerror=3Dstop and werror=3Dstop/enospc).  This is counter to the intent=
ions you
> have in vfio.
>=20
> > > I think vfio wants to use
> > > RUN_STATE_INTERNAL_ERROR instead.
> >=20
> > But that seems to put us into an "unknown" paused state in libvirt.
>=20
> I think paused is incorrect, because (unlike RUN_STATE_IO_ERROR), you c=
annot
> resume from RUN_STATE_INTERNAL_ERROR except with a reset.  QEMU enforce=
s that,
> and this matches the error you are reporting:
>=20
>     error_report("%s(%04x:%02x:%02x.%x) Unrecoverable error detected.  =
"
>                  "Please collect any data possible and then kill the gu=
est",
>                  __func__, vdev->host.domain, vdev->host.bus,
>                  vdev->host.slot, vdev->host.function);
>=20
> libvirt has a crashed state, I think that's what libvirt should call th=
e
> internal-error runstate.  IIRC on Xen you get to crashed when the proce=
ssor
> raises an error on vmentry, for example.
>=20
> Libvirt only knows about crashed/unknown, but one could add crashed/int=
ernal-error
> too.

Ok, I'll go with it.  I'll include this in the pull request I intend to
do on Monday.  Thanks,

Alex


