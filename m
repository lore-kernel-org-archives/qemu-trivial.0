Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZtGsU-0008Be-0D
	for mharc-qemu-trivial@gnu.org; Mon, 02 Nov 2015 10:18:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1ZtGsR-00088b-9E
	for qemu-trivial@nongnu.org; Mon, 02 Nov 2015 10:18:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1ZtGsQ-0003EJ-BY
	for qemu-trivial@nongnu.org; Mon, 02 Nov 2015 10:18:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52096)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>)
	id 1ZtGsI-00037j-T9; Mon, 02 Nov 2015 10:18:22 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 7E85FA2872;
	Mon,  2 Nov 2015 15:18:21 +0000 (UTC)
Received: from [10.3.113.61] (ovpn-113-61.phx2.redhat.com [10.3.113.61])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA2FIKQ8018693; Mon, 2 Nov 2015 10:18:20 -0500
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1446473439-10701-1-git-send-email-pbonzini@redhat.com>
From: Cole Robinson <crobinso@redhat.com>
Message-ID: <56377EBC.5030402@redhat.com>
Date: Mon, 2 Nov 2015 10:18:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1446473439-10701-1-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-sockets: do not test
 path with access() before unlinking
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
X-List-Received-Date: Mon, 02 Nov 2015 15:18:32 -0000

On 11/02/2015 09:10 AM, Paolo Bonzini wrote:
> Using access() is a time-of-check/time-of-use race condition.  It is
> okay to use them to provide better error messages, but that is pretty
> much it.
> 
> This is not one such case, so just drop the call.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  util/qemu-sockets.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 9142917..2833c70 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -751,8 +751,7 @@ int unix_listen_opts(QemuOpts *opts, Error **errp)
>          qemu_opt_set(opts, "path", un.sun_path, &error_abort);
>      }
>  
> -    if ((access(un.sun_path, F_OK) == 0) &&
> -        unlink(un.sun_path) < 0) {
> +    if (unlink(un.sun_path) < 0) {
>          error_setg_errno(errp, errno,
>                           "Failed to unlink socket %s", un.sun_path);
>          goto err;
> 

This is a serious semantic change, after this patch you will get:

$ ./x86_64-softmmu/qemu-system-x86_64 -vnc unix:/tmp/idontexist.sock
qemu-system-x86_64: -vnc unix:/tmp/idontexist.sock: Failed to start VNC
server: Failed to unlink socket /tmp/idontexist.sock: No such file or directory

Previously it would 'just work'. Common libvirt usage depends on this as well

Yeah there's a TOCTTOU race here, but it's very minor: if sun_path is created
after the access() check, qemu is just going to fail to start since bind()
will barf if the unix socket path exists.

- Cole

