Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yuh00-0007ig-KS
	for mharc-qemu-trivial@gnu.org; Tue, 19 May 2015 08:51:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Yugzu-0007Yz-Ss
	for qemu-trivial@nongnu.org; Tue, 19 May 2015 08:51:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Yugzq-00085n-SB
	for qemu-trivial@nongnu.org; Tue, 19 May 2015 08:51:50 -0400
Received: from cantor2.suse.de ([195.135.220.15]:35815 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Yugzi-000829-4Q; Tue, 19 May 2015 08:51:38 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 6F291ACC2;
	Tue, 19 May 2015 12:51:37 +0000 (UTC)
Message-ID: <555B31D9.2090806@suse.de>
Date: Tue, 19 May 2015 14:51:37 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE Linux GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Martin Cerveny <M.Cerveny@computer.org>, qemu-devel@nongnu.org
References: <1431519294-8873-1-git-send-email-M.Cerveny@computer.org>
	<1431519294-8873-2-git-send-email-M.Cerveny@computer.org>
In-Reply-To: <1431519294-8873-2-git-send-email-M.Cerveny@computer.org>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] scripts: qom-*: add
	network syntax
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
X-List-Received-Date: Tue, 19 May 2015 12:51:55 -0000

Am 13.05.2015 um 14:14 schrieb Martin Cerveny:
> Add network syntax parsing (ip address, port) to qom-* scripts.
>=20
> Signed-off-by: Martin Cerveny <M.Cerveny@computer.org>
> ---
>  scripts/qmp/qom-fuse |   13 ++++++++++++-
>  scripts/qmp/qom-get  |   12 +++++++++++-
>  scripts/qmp/qom-list |   12 +++++++++++-
>  scripts/qmp/qom-set  |   12 +++++++++++-
>  scripts/qmp/qom-tree |   12 +++++++++++-
>  5 files changed, 56 insertions(+), 5 deletions(-)

Could some Python guru please take a look at this?

Martin, could you clarify what this fixes or adds exactly so that we can
extend the commit message accordingly?

Thanks,
Andreas

>=20
> diff --git a/scripts/qmp/qom-fuse b/scripts/qmp/qom-fuse
> index 5c6754a..d49f36d 100755
> --- a/scripts/qmp/qom-fuse
> +++ b/scripts/qmp/qom-fuse
> @@ -134,5 +134,16 @@ class QOMFS(Fuse):
>  if __name__ =3D=3D '__main__':
>      import sys, os
> =20
> -    fs =3D QOMFS(QEMUMonitorProtocol(os.environ['QMP_SOCKET']))
> +    socket_path =3D os.environ['QMP_SOCKET']
> +    connection =3D socket_path.split(':')
> +    if len(connection) =3D=3D 2:
> +        try:
> +            port =3D int(connection[1])
> +        except ValueError:
> +            raise QMPBadPort
> +        connection =3D ( connection[0], port )
> +    else:
> +        connection =3D socket_path
> +
> +    fs =3D QOMFS(QEMUMonitorProtocol(connection))
>      fs.main(sys.argv)
> diff --git a/scripts/qmp/qom-get b/scripts/qmp/qom-get
> index 0172c69..f12eb52 100755
> --- a/scripts/qmp/qom-get
> +++ b/scripts/qmp/qom-get
> @@ -56,7 +56,17 @@ if len(args) > 0:
>  else:
>      usage_error("not enough arguments")
> =20
> -srv =3D QEMUMonitorProtocol(socket_path)
> +connection =3D socket_path.split(':')
> +if len(connection) =3D=3D 2:
> +    try:
> +         port =3D int(connection[1])
> +    except ValueError:
> +         raise QMPBadPort
> +    connection =3D ( connection[0], port )
> +else:
> +    connection =3D socket_path
> +
> +srv =3D QEMUMonitorProtocol(connection)
>  srv.connect()
> =20
>  rsp =3D srv.command('qom-get', path=3Dpath, property=3Dprop)
> diff --git a/scripts/qmp/qom-list b/scripts/qmp/qom-list
> index 1e7cc6c..fadcce4 100755
> --- a/scripts/qmp/qom-list
> +++ b/scripts/qmp/qom-list
> @@ -48,7 +48,17 @@ if not socket_path:
>      else:
>          usage_error("no QMP socket path or address given");
> =20
> -srv =3D QEMUMonitorProtocol(socket_path)
> +connection =3D socket_path.split(':')
> +if len(connection) =3D=3D 2:
> +    try:
> +         port =3D int(connection[1])
> +    except ValueError:
> +         raise QMPBadPort
> +    connection =3D ( connection[0], port )
> +else:
> +    connection =3D socket_path
> +
> +srv =3D QEMUMonitorProtocol(connection)
>  srv.connect()
> =20
>  if len(args) =3D=3D 0:
> diff --git a/scripts/qmp/qom-set b/scripts/qmp/qom-set
> index 54ecfec..b05fae3 100755
> --- a/scripts/qmp/qom-set
> +++ b/scripts/qmp/qom-set
> @@ -58,7 +58,17 @@ if len(args) > 1:
>  else:
>      usage_error("not enough arguments")
> =20
> -srv =3D QEMUMonitorProtocol(socket_path)
> +connection =3D socket_path.split(':')
> +if len(connection) =3D=3D 2:
> +    try:
> +         port =3D int(connection[1])
> +    except ValueError:
> +         raise QMPBadPort
> +    connection =3D ( connection[0], port )
> +else:
> +    connection =3D socket_path
> +
> +srv =3D QEMUMonitorProtocol(connection)
>  srv.connect()
> =20
>  print srv.command('qom-set', path=3Dpath, property=3Dprop, value=3Dsys=
.argv[2])
> diff --git a/scripts/qmp/qom-tree b/scripts/qmp/qom-tree
> index aea11d4..07f8a9d 100755
> --- a/scripts/qmp/qom-tree
> +++ b/scripts/qmp/qom-tree
> @@ -50,7 +50,17 @@ if not socket_path:
>      else:
>          usage_error("no QMP socket path or address given");
> =20
> -srv =3D QEMUMonitorProtocol(socket_path)
> +connection =3D socket_path.split(':')
> +if len(connection) =3D=3D 2:
> +    try:
> +         port =3D int(connection[1])
> +    except ValueError:
> +         raise QMPBadPort
> +    connection =3D ( connection[0], port )
> +else:
> +    connection =3D socket_path
> +
> +srv =3D QEMUMonitorProtocol(connection)
>  srv.connect()
> =20
>  def list_node(path):
>=20


--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Dilip Upmanyu, Graham Norton; HRB
21284 (AG N=FCrnberg)

