Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZtGif-0002vE-Pp
	for mharc-qemu-trivial@gnu.org; Mon, 02 Nov 2015 10:08:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1ZtFyZ-0005L4-ED
	for qemu-trivial@nongnu.org; Mon, 02 Nov 2015 09:20:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1ZtFyU-0006tA-Ra
	for qemu-trivial@nongnu.org; Mon, 02 Nov 2015 09:20:47 -0500
Received: from mx3-phx2.redhat.com ([209.132.183.24]:33916)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>)
	id 1ZtFyU-0006sP-Gc; Mon, 02 Nov 2015 09:20:42 -0500
Received: from zmail17.collab.prod.int.phx2.redhat.com
	(zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
	by mx3-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id tA2EKYAn013869;
	Mon, 2 Nov 2015 09:20:34 -0500
Date: Mon, 2 Nov 2015 09:20:32 -0500 (EST)
From: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <mlureau@redhat.com>
To: arei gonglei <arei.gonglei@huawei.com>
Message-ID: <1638142759.891037.1446474032692.JavaMail.zimbra@redhat.com>
In-Reply-To: <1446426828-18084-1-git-send-email-arei.gonglei@huawei.com>
References: <1446426828-18084-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.3.113.117]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF41 (Linux)/8.0.6_GA_5922)
Thread-Topic: ivshmem-server: fix possible OVERRUN
Thread-Index: Wm2xog1du2w9T1Thxz0uUUauaOr5Cg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 209.132.183.24
X-Mailman-Approved-At: Mon, 02 Nov 2015 10:08:23 -0500
Cc: qemu-trivial@nongnu.org, marcandre lureau <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] ivshmem-server: fix possible OVERRUN
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
X-List-Received-Date: Mon, 02 Nov 2015 14:20:48 -0000

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

----- Original Message -----
> From: Gonglei <arei.gonglei@huawei.com>
>=20
> >>>     CID 1337991:  Memory - illegal accesses  (OVERRUN)
> >>>     Decrementing "i". The value of "i" is now 65534.
> 218         while (i--) {
> 219             event_notifier_cleanup(&peer->vectors[i]);
> 220         }
>=20
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  contrib/ivshmem-server/ivshmem-server.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/contrib/ivshmem-server/ivshmem-server.c
> b/contrib/ivshmem-server/ivshmem-server.c
> index 5e5239c..d9e26b0 100644
> --- a/contrib/ivshmem-server/ivshmem-server.c
> +++ b/contrib/ivshmem-server/ivshmem-server.c
> @@ -168,7 +168,9 @@ ivshmem_server_handle_new_conn(IvshmemServer *server)
>      }
>      if (i =3D=3D G_MAXUINT16) {
>          IVSHMEM_SERVER_DEBUG(server, "cannot allocate new client id\n");
> -        goto fail;
> +        close(newfd);
> +        g_free(peer);
> +        return -1;
>      }
>      peer->id =3D server->cur_id++;
> =20
> --
> 1.7.12.4
>=20
>=20
>=20

