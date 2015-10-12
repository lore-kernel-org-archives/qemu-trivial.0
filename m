Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZmqXU-0004IR-1a
	for mharc-qemu-trivial@gnu.org; Thu, 15 Oct 2015 17:58:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riku.voipio@iki.fi>) id 1Zld4n-0003Np-2M
	for qemu-trivial@nongnu.org; Mon, 12 Oct 2015 09:23:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <riku.voipio@iki.fi>) id 1Zld4m-0003ON-5V
	for qemu-trivial@nongnu.org; Mon, 12 Oct 2015 09:23:40 -0400
Received: from jessie.kos.to ([212.47.231.226]:49665 helo=pilvi.kos.to)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riku.voipio@iki.fi>)
	id 1Zld4h-0003Iz-Jp; Mon, 12 Oct 2015 09:23:35 -0400
Received: from localhost (91-157-196-38.elisa-laajakaista.fi [91.157.196.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by pilvi.kos.to (Postfix) with ESMTPSA id 83A502C0021;
	Mon, 12 Oct 2015 13:23:33 +0000 (UTC)
From: Riku Voipio <riku.voipio@iki.fi>
To: Thomas Huth <thuth@redhat.com>
Date: Mon, 12 Oct 2015 16:23:32 +0300
MIME-Version: 1.0
Message-ID: <d150f8f9-07aa-4ceb-ad66-8f97e2efe926@iki.fi>
In-Reply-To: <1444406198-6521-5-git-send-email-thuth@redhat.com>
References: <1444406198-6521-1-git-send-email-thuth@redhat.com>
	<1444406198-6521-5-git-send-email-thuth@redhat.com>
User-Agent: Trojita/0.5-git; Qt/5.4.2; xcb; Linux;
	Debian GNU/Linux testing (stretch)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.47.231.226
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial]
	=?iso-8859-1?q?=5BQemu-devel=5D_=5BPATCH_v2_4/4=5D?=
	=?iso-8859-1?q?_linux-user/syscall=3A_Replace_g=5Fmalloc0_+_memcpy?=
	=?iso-8859-1?q?_with_g=5Fmemdup?=
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
X-List-Received-Date: Mon, 12 Oct 2015 13:23:48 -0000

On perjantaina 9. lokakuuta 2015 18.56.38 EEST, Thomas Huth wrote:
> No need to use g_malloc0 to zero the memory if we memcpy to
> the whole buffer afterwards anyway. Actually, there is even
> a function which combines both steps, g_memdup, so let's use
> this function here instead.

Applied to linux-user, thanks

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  linux-user/syscall.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 98b5766..f2ada0a 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -5325,8 +5325,7 @@ static abi_long=20
> do_open_by_handle_at(abi_long mount_fd, abi_long handle,
>          return -TARGET_EFAULT;
>      }
> =20
> -    fh =3D g_malloc0(total_size);
> -    memcpy(fh, target_fh, total_size);
> +    fh =3D g_memdup(target_fh, total_size);
>      fh->handle_bytes =3D size;
>      fh->handle_type =3D tswap32(target_fh->handle_type);
> =20


