Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fT5zP-00008q-90
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 09:39:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fT5zL-0008Vu-3Z
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 09:39:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fT5zJ-0006FM-Ue
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 09:39:03 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46178 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fT5zA-0005is-7K; Wed, 13 Jun 2018 09:38:56 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC08587A7C;
	Wed, 13 Jun 2018 13:38:51 +0000 (UTC)
Received: from localhost (ovpn-117-110.ams2.redhat.com [10.36.117.110])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5827E201E8ED;
	Wed, 13 Jun 2018 13:38:51 +0000 (UTC)
Date: Wed, 13 Jun 2018 14:38:50 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Ben Warren <ben@skyportsystems.com>, zhang.zhanghailiang@huawei.com,
	Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org
Message-ID: <20180613133850.GM24528@stefanha-x1.localdomain>
References: <1528866321-23886-1-git-send-email-thuth@redhat.com>
	<1528866321-23886-3-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6Mt39TZj+HFMr11E"
Content-Disposition: inline
In-Reply-To: <1528866321-23886-3-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 13 Jun 2018 13:38:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 13 Jun 2018 13:38:51 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH 2/4] Replace '-enable-kvm' with '-accel
 kvm' in docs and help texts
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
X-List-Received-Date: Wed, 13 Jun 2018 13:39:04 -0000


--6Mt39TZj+HFMr11E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 13, 2018 at 07:05:19AM +0200, Thomas Huth wrote:
> The preferred way to select the KVM accelerator is to use "-accel kvm"
> these days, so let's be consistent in our documentation and help texts.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/COLO-FT.txt                  | 8 ++++----
>  docs/can.txt                      | 4 ++--
>  docs/multi-thread-compression.txt | 2 +-
>  docs/multiseat.txt                | 2 +-
>  docs/specs/tpm.txt                | 8 ++++----
>  hw/block/dataplane/virtio-blk.c   | 4 ++--
>  hw/scsi/virtio-scsi-dataplane.c   | 4 ++--
>  7 files changed, 16 insertions(+), 16 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--6Mt39TZj+HFMr11E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbIR5qAAoJEJykq7OBq3PIWLAH/1a6FjH2nmFqXr4saikAhrem
+aThMJjh36014I6fMdddK7B1oXmxrM4CTuwXxzd2i62ltKR2v2KjUkCjSZUY2p2D
VgDoNQyMTXnhYuWsp5TXjd004TZSr4pdPEpOoYp/GQslWAeFvF4iK+OBTESMDbiN
cBprcAxARTEdJow7vXJ0xju4cf2McwMZDmeZh+AeT79EKB7A3ThlNj0+XAG4tpAk
cAK+GL2xgZeOhBDlXsNTXAEv6CXf9rHLvtpNPlR490dzbycAOtf4ns41D9bG8oyT
Traa6ttjijzpbd79WVGPVQCFtcjlfrpM5OQLoxzq316QZDDsRQk8GRQ8X854GjY=
=TXST
-----END PGP SIGNATURE-----

--6Mt39TZj+HFMr11E--

