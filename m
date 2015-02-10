Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLGHj-000285-Nf
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 14:15:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YLGHg-00025g-DT
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 14:15:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YLGHe-0002Zn-Mw
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 14:15:43 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:38503)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YLGHY-0002Sn-38; Tue, 10 Feb 2015 14:15:36 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3C776419B0;
	Tue, 10 Feb 2015 22:15:35 +0300 (MSK)
Message-ID: <54DA58D7.8080400@msgid.tls.msk.ru>
Date: Tue, 10 Feb 2015 22:15:35 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: "Richard W.M. Jones" <rjones@redhat.com>, qemu-trivial@nongnu.org
References: <1422618777-8832-1-git-send-email-rjones@redhat.com>
In-Reply-To: <1422618777-8832-1-git-send-email-rjones@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: lersek@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com
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
X-List-Received-Date: Tue, 10 Feb 2015 19:15:45 -0000

30.01.2015 14:52, Richard W.M. Jones wrote:
> In GCC 5 there is a new warning (-Wlogical-not-parentheses) which
> prevents you from writing:
>=20
>   if (<some implicitly boolean expression> =3D=3D <an int>) ...
>=20
> A typical error would be:
>=20
> kvm-all.c: In function =E2=80=98kvm_set_migration_log=E2=80=99:
> kvm-all.c:383:54: error: logical not is only applied to the left hand s=
ide of comparison [-Werror=3Dlogical-not-parentheses]
>          if (!!(mem->flags & KVM_MEM_LOG_DIRTY_PAGES) =3D=3D enable) {
>=20
> Fix a few places where the build is now broken in GCC 5.
>=20
> The warning isn't even consistent, as with the place in
> hw/net/virtio-net.c where I had to cast an obviously boolean
> expression to bool.

Richard, I'd like to apply hunks 2 and 3, but leave out hunk 1
for now.  As a start, the hunk 1 looks a bit, well, ugly, don't
you think?  But if I just drop hunk 1, the commit message will
be a bit misleading, since it describes exactly the hunk1 change...

Thanks,

/mjt

> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>  hw/net/virtio-net.c | 2 +-
>  kvm-all.c           | 2 +-
>  qemu-img.c          | 3 ++-
>  3 files changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 45da34a..ba6afb8 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -121,7 +121,7 @@ static void virtio_net_vhost_status(VirtIONet *n, u=
int8_t status)
>      }
> =20
>      if (!!n->vhost_started =3D=3D
> -        (virtio_net_started(n, status) && !nc->peer->link_down)) {
> +        (bool) (virtio_net_started(n, status) && !nc->peer->link_down)=
) {
>          return;
>      }
>      if (!n->vhost_started) {
> diff --git a/kvm-all.c b/kvm-all.c
> index 2f21a4e..b6d4387 100644
> --- a/kvm-all.c
> +++ b/kvm-all.c
> @@ -366,7 +366,7 @@ static void kvm_log_stop(MemoryListener *listener,
>      }
>  }
> =20
> -static int kvm_set_migration_log(int enable)
> +static int kvm_set_migration_log(bool enable)
>  {
>      KVMState *s =3D kvm_state;
>      KVMSlot *mem;
> diff --git a/qemu-img.c b/qemu-img.c
> index 4e9a7f5..acf70fa 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -977,7 +977,8 @@ static int is_allocated_sectors_min(const uint8_t *=
buf, int n, int *pnum,
>  static int compare_sectors(const uint8_t *buf1, const uint8_t *buf2, i=
nt n,
>      int *pnum)
>  {
> -    int res, i;
> +    bool res;
> +    int i;
> =20
>      if (n <=3D 0) {
>          *pnum =3D 0;
>=20


