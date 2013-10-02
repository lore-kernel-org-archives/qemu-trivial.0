Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VRPQH-0006Mn-Ez
	for mharc-qemu-trivial@gnu.org; Wed, 02 Oct 2013 12:37:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VRPQ8-0006CI-M1
	for qemu-trivial@nongnu.org; Wed, 02 Oct 2013 12:37:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VRPQ2-0000k1-Gh
	for qemu-trivial@nongnu.org; Wed, 02 Oct 2013 12:37:04 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47755)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VRPPq-0000iY-8h; Wed, 02 Oct 2013 12:36:46 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 78C8E40587;
	Wed,  2 Oct 2013 20:36:45 +0400 (MSK)
Message-ID: <524C4B9D.5000100@msgid.tls.msk.ru>
Date: Wed, 02 Oct 2013 20:36:45 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1380626897-500-1-git-send-email-berrange@redhat.com>
In-Reply-To: <1380626897-500-1-git-send-email-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Anthony Liguori <anthony@codemonkey.ws>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [PATCH] hw/9pfs: Fix errno value for xattr
	functions
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
X-List-Received-Date: Wed, 02 Oct 2013 16:37:12 -0000

01.10.2013 15:28, Daniel P. Berrange =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> From: "Daniel P. Berrange" <berrange@redhat.com>
>
> If there is no operation driver for the xattr type the
> functions return '-1' and set errno to '-EOPNOTSUPP'.
> When the calling code sets 'ret =3D -errno' this turns
> into a large positive number.
>
> In Linux 3.11, the kernel has switched to using 9p
> version 9p2000.L, instead of 9p2000.u, which enables
> support for xattr operations. This on its own is harmless,
> but for another change which makes it request the xattr
> with a name 'security.capability'.
>
> The result is that the guest sees a succesful return
> of 95 bytes of data, instead of a failure with errno
> set to 95. Since the kernel expects a maximum of 20
> bytes for an xattr return this gets translated to the
> unexpected errno ERANGE.
>
> This all means that when running a binary off a 9p fs
> in 3.11 kernels you get a fun result of:
>
>    # ./date
>    sh: ./date: Numerical result out of range
>
> The only workaround is to pass 'version=3D9p2000.u' when
> mounting the 9p fs in the guest, to disable all use of
> xattrs.

Thanks, applied to the trivial patches queue.

/mjt

