Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLGYw-0003t0-8l
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 14:33:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1YLGYu-0003rf-06
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 14:33:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1YLGYp-0000xs-BC
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 14:33:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47164)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>)
	id 1YLGYp-0000xf-4K; Tue, 10 Feb 2015 14:33:27 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1AJXOwb012237
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 10 Feb 2015 14:33:24 -0500
Received: from localhost (vpn1-7-143.ams2.redhat.com [10.36.7.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1AJXNNf001523; Tue, 10 Feb 2015 14:33:23 -0500
Date: Tue, 10 Feb 2015 19:33:22 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20150210193322.GN11603@redhat.com>
References: <1422618777-8832-1-git-send-email-rjones@redhat.com>
	<54DA58D7.8080400@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <54DA58D7.8080400@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	t1AJXOwb012237
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, lersek@redhat.com, qemu-devel@nongnu.org,
	dgilbert@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] Fix comparisons between implicit
 booleans and integers.
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
X-List-Received-Date: Tue, 10 Feb 2015 19:33:33 -0000

On Tue, Feb 10, 2015 at 10:15:35PM +0300, Michael Tokarev wrote:
> 30.01.2015 14:52, Richard W.M. Jones wrote:
> > In GCC 5 there is a new warning (-Wlogical-not-parentheses) which
> > prevents you from writing:
> >=20
> >   if (<some implicitly boolean expression> =3D=3D <an int>) ...
> >=20
> > A typical error would be:
> >=20
> > kvm-all.c: In function =E2=80=98kvm_set_migration_log=E2=80=99:
> > kvm-all.c:383:54: error: logical not is only applied to the left hand=
 side of comparison [-Werror=3Dlogical-not-parentheses]
> >          if (!!(mem->flags & KVM_MEM_LOG_DIRTY_PAGES) =3D=3D enable) =
{
> >=20
> > Fix a few places where the build is now broken in GCC 5.
> >=20
> > The warning isn't even consistent, as with the place in
> > hw/net/virtio-net.c where I had to cast an obviously boolean
> > expression to bool.
>=20
> Richard, I'd like to apply hunks 2 and 3, but leave out hunk 1
> for now.  As a start, the hunk 1 looks a bit, well, ugly, don't
> you think?  But if I just drop hunk 1, the commit message will
> be a bit misleading, since it describes exactly the hunk1 change...

Please feel free to apply and bits and modify the commit message as
you wish.  I just want qemu to be fixed on gcc 5, I don't care how we
get there :-)

Rich.

--=20
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rj=
ones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html

