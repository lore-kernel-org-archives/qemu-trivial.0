Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X0aJa-00025H-1i
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jun 2014 13:51:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1X0aJS-000258-KX
	for qemu-trivial@nongnu.org; Fri, 27 Jun 2014 13:51:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1X0aJN-0006SP-AF
	for qemu-trivial@nongnu.org; Fri, 27 Jun 2014 13:51:50 -0400
Received: from mx4-phx2.redhat.com ([209.132.183.25]:50057)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1X0aJN-0006SI-22; Fri, 27 Jun 2014 13:51:45 -0400
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx4-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id s5RHphJI019954;
	Fri, 27 Jun 2014 13:51:43 -0400
Date: Fri, 27 Jun 2014 13:51:42 -0400 (EDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Message-ID: <1081899261.33608246.1403891502613.JavaMail.zimbra@redhat.com>
In-Reply-To: <1403886899.31091.187.camel@ul30vt.home>
References: <1403879569-24256-1-git-send-email-pbonzini@redhat.com>
	<1403886899.31091.187.camel@ul30vt.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.5.82.11]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF30 (Linux)/8.0.6_GA_5922)
Thread-Topic: vfio: use correct runstate
Thread-Index: mKnkTM8K13/u5RJQmAu1w2OIhAu78g==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 209.132.183.25
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
X-List-Received-Date: Fri, 27 Jun 2014 17:51:56 -0000

----- Messaggio originale -----
> Da: "Alex Williamson" <alex.williamson@redhat.com>
> A: "Paolo Bonzini" <pbonzini@redhat.com>
> Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
> Inviato: Venerd=C3=AC, 27 giugno 2014 18:34:59
> Oggetto: Re: [PATCH for 2.1] vfio: use correct runstate
>=20
> On Fri, 2014-06-27 at 16:32 +0200, Paolo Bonzini wrote:
> > io-error is for block device errors; it should always be preceded
> > by a BLOCK_IO_ERROR event.
>=20
> Where does this requirement come from?  I only see a loose association
> of IO_ERROR to disk in libvirt and none in QEMU.

See the RunState enum in qapi-schema.json:

##
# @RunState
#
# An enumeration of VM run states.
#
# ...
#
# @internal-error: An internal error that prevents further guest execution
# has occurred
#
# @io-error: the last IOP has failed and the device is configured to pause
# on I/O errors
#
# @paused: guest has been paused via the 'stop' command

The point of io-error is that management can look at block devices, see if
any have an error reported, and then resume execution (see documentation of
rerror=3Dstop and werror=3Dstop/enospc).  This is counter to the intentions=
 you
have in vfio.

> > I think vfio wants to use
> > RUN_STATE_INTERNAL_ERROR instead.
>=20
> But that seems to put us into an "unknown" paused state in libvirt.

I think paused is incorrect, because (unlike RUN_STATE_IO_ERROR), you canno=
t
resume from RUN_STATE_INTERNAL_ERROR except with a reset.  QEMU enforces th=
at,
and this matches the error you are reporting:

    error_report("%s(%04x:%02x:%02x.%x) Unrecoverable error detected.  "
                 "Please collect any data possible and then kill the guest"=
,
                 __func__, vdev->host.domain, vdev->host.bus,
                 vdev->host.slot, vdev->host.function);

libvirt has a crashed state, I think that's what libvirt should call the
internal-error runstate.  IIRC on Xen you get to crashed when the processor
raises an error on vmentry, for example.

Libvirt only knows about crashed/unknown, but one could add crashed/interna=
l-error
too.

Paolo

