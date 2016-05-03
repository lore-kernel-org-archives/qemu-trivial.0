Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axUKE-0005LB-Qj
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 03:00:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1axUK5-00054O-HN
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 03:00:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1axUJt-000442-6k
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 03:00:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53205)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1axUJa-0003cH-Fg; Tue, 03 May 2016 03:00:14 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 930A8C05E175;
	Tue,  3 May 2016 06:59:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-46.ams2.redhat.com
	[10.36.116.46])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u436xtli009056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 3 May 2016 02:59:57 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3C7C61132D8A; Tue,  3 May 2016 08:59:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Christopher Friedt <chrisfriedt@gmail.com>
Cc: famz@redhat.com, mst@redhat.com, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <1462237265-61763-1-git-send-email-chrisfriedt@gmail.com>
	<1462237265-61763-3-git-send-email-chrisfriedt@gmail.com>
Date: Tue, 03 May 2016 08:59:55 +0200
In-Reply-To: <1462237265-61763-3-git-send-email-chrisfriedt@gmail.com>
	(Christopher Friedt's message of "Mon, 2 May 2016 21:01:05 -0400")
Message-ID: <87r3djbp90.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] [RESENT-INLINE] Remove
 unnecessary CONFIG_EVENTFD preprocessor conditional to satisfy link
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
X-List-Received-Date: Tue, 03 May 2016 07:00:53 -0000

Christopher Friedt <chrisfriedt@gmail.com> writes:

> The file ivshmem.c unconditionally references event_notifier_init_fd() in util/event_notifier-posix.c, even if CONFIG_EVENTFD is not defined. On platforms where CONFIG_POSIX is defined, but CONFIG_EVENTFD is not defined, that results in an undefined symbol referenced from ivshmem.c and the link fails. That applies to Mac OS X, but possibly other BSD-based distros.

ivshmem.c cannot work without CONFIG_EVENTFD, and therefore is not
compiled without it.

A link error for event_notifier_init_fd() from ivshmem.o indicates you
got CONFIG_EVENTFD=y for make (since ivshmem.o gets linked), but
!defined(CONFIG_EVENTFD) for C (or else event_notifier_init_fd() would
exist).  Your build tree is messed up, or the makefiles are broken.  Try
starting over with a fresh build tree.

See also
http://lists.nongnu.org/archive/html/qemu-devel/2016-04/msg01437.html

> Note: there is nothing specific to eventfd inside and event_notifier_init() also fails unconditionally if CONFIG_EVENTFD is not defined.

I'm afraid you're misreading the code.

event_notifier_init() has a working fallback: if the host doesn't
support eventfd (!defined(CONFIG_EVENTFD) or eventfd() fails with
ENOSYS), then we emulate eventfd with a pair of pipes.  Possible only
because pipes have special properties.

To support the emulation, we have two file descriptors, @rfd for reading
and @wfd for writing.  Design invariant: if they are the same file
descriptor, it must be a proper eventfd, and if they are different, they
must be a pair of pipes.  The only way to establish the invariant with
event_notifier_init_fd() is passing it an eventfd, as the function's
contract says.  Without CONFIG_EVENTFD, there is no way to use the
function correctly, so defining it would be nothing but a trap.

See also commit 330b583, which added the ifdef.

> Signed-off-by: Christopher Friedt <chrisfriedt@gmail.com>
> ---
>  util/event_notifier-posix.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/util/event_notifier-posix.c b/util/event_notifier-posix.c
> index c1f0d79..c9bb34d 100644
> --- a/util/event_notifier-posix.c
> +++ b/util/event_notifier-posix.c
> @@ -21,7 +21,6 @@
>  #include <sys/eventfd.h>
>  #endif
>  
> -#ifdef CONFIG_EVENTFD
>  /*
>   * Initialize @e with existing file descriptor @fd.
>   * @fd must be a genuine eventfd object, emulation with pipe won't do.
> @@ -31,7 +30,6 @@ void event_notifier_init_fd(EventNotifier *e, int fd)
>      e->rfd = fd;
>      e->wfd = fd;
>  }
> -#endif
>  
>  int event_notifier_init(EventNotifier *e, int active)
>  {

NAK

