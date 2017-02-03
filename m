Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cZamT-0002u8-9J
	for mharc-qemu-trivial@gnu.org; Fri, 03 Feb 2017 05:07:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1cZamN-0002pA-SS
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2017 05:07:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1cZamM-0000Wa-KT
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2017 05:07:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42366)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1cZamE-0000Ox-DP; Fri, 03 Feb 2017 05:07:34 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 608075455D;
	Fri,  3 Feb 2017 10:07:34 +0000 (UTC)
Received: from redhat.com (ovpn-117-145.ams2.redhat.com [10.36.117.145])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v13A7TeH011734
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 3 Feb 2017 05:07:32 -0500
Date: Fri, 3 Feb 2017 10:07:27 +0000
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, qemu-stable@nongnu.org
Message-ID: <20170203100727.GD10350@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1486115549-9398-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1486115549-9398-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 03 Feb 2017 10:07:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2] vnc: do not disconnect on EAGAIN
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
X-List-Received-Date: Fri, 03 Feb 2017 10:07:47 -0000

On Fri, Feb 03, 2017 at 12:52:29PM +0300, Michael Tokarev wrote:
> When qemu vnc server is trying to send large update to clients,
> there might be a situation when system responds with something
> like EAGAIN, indicating that there's no system memory to send
> that much data (depending on the network speed, client and server
> and what is happening).  In this case, something like this happens
> on qemu side (from strace):
> 
> sendmsg(16, {msg_name(0)=NULL,
>         msg_iov(1)=[{"\244\"..., 729186}],
>         msg_controllen=0, msg_flags=0}, 0) = 103950
> sendmsg(16, {msg_name(0)=NULL,
>         msg_iov(1)=[{"lz\346"..., 1559618}],
>         msg_controllen=0, msg_flags=0}, 0) = -1 EAGAIN
> sendmsg(-1, {msg_name(0)=NULL,
>         msg_iov(1)=[{"lz\346"..., 1559618}],
>         msg_controllen=0, msg_flags=0}, 0) = -1 EBADF
> 
> qemu closes the socket before the retry, and obviously it gets EBADF
> when trying to send to -1.
> 
> This is because there WAS a special handling for EAGAIN, but now it doesn't
> work anymore, after commit 04d2529da27db512dcbd5e99d0e26d333f16efcc, because
> now in all error-like cases we initiate vnc disconnect.
> 
> This change were introduced in qemu 2.6, and caused numerous grief for many
> people, resulting in their vnc clients reporting sporadic random disconnects
> from vnc server.
> 
> Fix that by doing the disconnect only when necessary, i.e. omitting this
> very case of EAGAIN.
> 
> Hopefully the existing condition (comparing with QIO_CHANNEL_ERR_BLOCK)
> is sufficient, as the original code (before the above commit) were
> checking for other errno values too.

There's no need to check WSAEWOULDBLOCK anymore - our win32 portability
code already remaps it to EAGAIN.

Checking EINTR is not required because QIOChannelSocket already
restarts the recvmsg/sendmsg when seeing EINTR

> Apparently there's another (semi?)bug exist somewhere here, since the
> code tries to write to fd# -1, it probably should check if the connection
> is open before. But this isn't important.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Fixes: 04d2529da27db512dcbd5e99d0e26d333f16efcc
> Cc: Daniel P. Berrange <berrange@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: qemu-stable@nongnu.org
> ---
> v2: previous patch was tab/space-damaged, fixing this now
> 
>  ui/vnc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/ui/vnc.c b/ui/vnc.c
> index cdeb79c..f2701e5 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -1256,12 +1256,13 @@ ssize_t vnc_client_io_error(VncState *vs, ssize_t ret, Error **errp)
>      if (ret <= 0) {
>          if (ret == 0) {
>              VNC_DEBUG("Closing down client sock: EOF\n");
> +            vnc_disconnect_start(vs);
>          } else if (ret != QIO_CHANNEL_ERR_BLOCK) {
>              VNC_DEBUG("Closing down client sock: ret %zd (%s)\n",
>                        ret, errp ? error_get_pretty(*errp) : "Unknown");
> +            vnc_disconnect_start(vs);
>          }
>  
> -        vnc_disconnect_start(vs);
>          if (errp) {
>              error_free(*errp);
>              *errp = NULL;

Reviewed-by: Daniel P. Berrange <berrange@redhat.com>

Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://entangle-photo.org       -o-    http://search.cpan.org/~danberr/ :|

