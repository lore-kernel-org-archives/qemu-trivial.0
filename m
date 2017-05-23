Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dD4jA-0004vG-IB
	for mharc-qemu-trivial@gnu.org; Tue, 23 May 2017 03:59:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1dD4j9-0004uX-0U
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 03:59:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1dD4j8-0007J9-E0
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 03:59:35 -0400
Received: from hera.aquilenet.fr ([141.255.128.1]:32990)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1dD4j4-0007EE-4p; Tue, 23 May 2017 03:59:30 -0400
Received: from localhost (localhost [127.0.0.1])
	by hera.aquilenet.fr (Postfix) with ESMTP id B6396CB6C;
	Tue, 23 May 2017 09:59:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
	by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V-Hp4hNNIYEo; Tue, 23 May 2017 09:59:28 +0200 (CEST)
Received: from var.youpi.perso.aquilenet.fr (unknown
	[IPv6:2a01:cb19:181:c200:3602:86ff:fe2c:6a19])
	by hera.aquilenet.fr (Postfix) with ESMTPSA id 189B4CB6B;
	Tue, 23 May 2017 09:59:28 +0200 (CEST)
Received: from samy by var.youpi.perso.aquilenet.fr with local (Exim 4.89)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1dD4j1-0001qv-BC; Tue, 23 May 2017 09:59:27 +0200
Date: Tue, 23 May 2017 09:59:27 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, famz@redhat.com, qemu-trivial@nongnu.org,
	armbru@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>
Message-ID: <20170523075927.vhxqlurygwycfwsu@var.youpi.perso.aquilenet.fr>
References: <149546869825.1005.10210133978512879518@c05f1edc8ed1>
	<48dfeca5-0640-796f-66ce-8cab198fcaef@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <48dfeca5-0640-796f-66ce-8cab198fcaef@redhat.com>
Organization: I am not organized
User-Agent: NeoMutt/20170113 (1.7.2)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 141.255.128.1
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] tests/libqtest: Print
 error instead of aborting when env variable is missing
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
X-List-Received-Date: Tue, 23 May 2017 07:59:35 -0000

Thomas Huth, on mar. 23 mai 2017 09:25:30 +0200, wrote:
> > /tmp/qemu-test/src/slirp/tcp_input.c: In function =E2=80=98tcp_input=E2=
=80=99:
> > /tmp/qemu-test/src/slirp/tcp_input.c:219: warning: =E2=80=98save_ip.i=
p_p=E2=80=99 may be used uninitialized in this function
>=20
> I've never seen these warnings in tcp_input.c before ... and they also
> look like false positives too me ...=20

They are.  It's the classical false-positive:

int foo;
if (blah)
	foo =3D 1;
...
if (blah)
	f(foo);

where gcc doesn't realize it's the same condition between the
initialization and the use.

If that poses problem, we can force a dumb initialization...

Samuel

