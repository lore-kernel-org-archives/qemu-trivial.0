Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZtykJ-00012x-Pd
	for mharc-qemu-trivial@gnu.org; Wed, 04 Nov 2015 09:09:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZtykF-0000y8-PP
	for qemu-trivial@nongnu.org; Wed, 04 Nov 2015 09:09:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZtykB-0007qz-5N
	for qemu-trivial@nongnu.org; Wed, 04 Nov 2015 09:08:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33245)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Ztyk4-0007p4-Hz; Wed, 04 Nov 2015 09:08:48 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 26695811D8;
	Wed,  4 Nov 2015 14:08:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-44.ams2.redhat.com
	[10.36.116.44])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA4E8k63022904
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 4 Nov 2015 09:08:47 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E201F303F90E; Wed,  4 Nov 2015 15:08:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1446644927-8764-1-git-send-email-pbonzini@redhat.com>
Date: Wed, 04 Nov 2015 15:08:45 +0100
In-Reply-To: <1446644927-8764-1-git-send-email-pbonzini@redhat.com> (Paolo
	Bonzini's message of "Wed, 4 Nov 2015 14:48:47 +0100")
Message-ID: <87lhadluvm.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, crobinso@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qemu-sockets: do not
	test path with access() before unlinking
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
X-List-Received-Date: Wed, 04 Nov 2015 14:09:03 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> Using access() is a time-of-check/time-of-use race condition.  It is
> okay to use them to provide better error messages, but that is pretty
> much it.
>
> This is not one such case; on the other hand, access() *will* skip
> unlink() for a non-existent path, so ignore ENOENT return values from
> the unlink() system call.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  util/qemu-sockets.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 9142917..de9145a 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -751,8 +751,7 @@ int unix_listen_opts(QemuOpts *opts, Error **errp)
>          qemu_opt_set(opts, "path", un.sun_path, &error_abort);
>      }
>  
> -    if ((access(un.sun_path, F_OK) == 0) &&
> -        unlink(un.sun_path) < 0) {
> +    if (unlink(un.sun_path) < 0 && errno != ENOENT) {
>          error_setg_errno(errp, errno,
>                           "Failed to unlink socket %s", un.sun_path);
>          goto err;

Reviewed-by: Markus Armbruster <armbru@redhat.com>

