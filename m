Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjyzD-0008CO-7N
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2013 17:41:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1UjyzA-0008Bd-4y
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 17:41:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1Ujyz9-0005gv-19
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 17:41:44 -0400
Received: from mx4-phx2.redhat.com ([209.132.183.25]:45241)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1Ujyz8-0005go-Q7; Tue, 04 Jun 2013 17:41:42 -0400
Received: from zmail15.collab.prod.int.phx2.redhat.com
	(zmail15.collab.prod.int.phx2.redhat.com [10.5.83.17])
	by mx4-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id r54LfflF009118;
	Tue, 4 Jun 2013 17:41:41 -0400
Date: Tue, 4 Jun 2013 17:41:41 -0400 (EDT)
From: Alon Levy <alevy@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <378221460.14313718.1370382101151.JavaMail.root@redhat.com>
In-Reply-To: <51AE5808.6000000@redhat.com>
References: <1370377419-31788-1-git-send-email-alevy@redhat.com>
	<51AE5808.6000000@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.5.82.11]
X-Mailer: Zimbra 8.0.3_GA_5664 (ZimbraWebClient - FF21 (Linux)/8.0.3_GA_5664)
Thread-Topic: oslib-posix: add qemu_pipe_non_block
Thread-Index: KxIGBlqbszGh4Le13+/fntUViwEEZg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 209.132.183.25
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/5] oslib-posix: add
	qemu_pipe_non_block
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
X-List-Received-Date: Tue, 04 Jun 2013 21:41:46 -0000

> On 06/04/2013 02:23 PM, Alon Levy wrote:
> > Used by the followin patch.
> 
> s/followin/following/

Thanks.

> 
> >  
> > +int qemu_pipe_non_block(int pipefd[2])
> > +{
> > +    int ret;
> > +
> > +    ret = qemu_pipe(pipefd);
> 
> qemu_pipe() already uses pipe2() when available; it seems like it would
> be nicer to use pipe2's O_NONBLOCK option directly in one syscall (where
> supported) instead of having to make additional syscalls after the fact.
>  Would it just be smarter to change the signature of qemu_pipe() to add
> a bool block parameter, and then change the 5 existing callers to pass
> false with your later patch in the series passing true, and do it
> without creating a new wrapper?

Answered below.

> 
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +    if (fcntl(card->pipe[0], F_SETFL, O_NONBLOCK) == -1) {
> > +        return -errno;
> > +    }
> > +    if (fcntl(card->pipe[1], F_SETFL, O_NONBLOCK) == -1) {
> > +        return -errno;
> 
> Leaks fds.  If you're going to report error, then you must close the fds
> already created.

As Peter pointed out, I should not go here, so I'll drop these checks, instead doing naked fcntl calls, so no fd leak possible (no returns).

> 
> > +    }
> > +    if (fcntl(card->pipe[0], F_SETOWN, getpid()) == -1) {
> > +        return -errno;
> 
> Same comment about fd leaks.
> 
> This part seems like a useful change, IF you plan on using SIGIO and
> SIGURG signals; and it is something which pipe2() cannot optimize, so I
> can see why you are adding a new function instead of changing
> qemu_pipe() and adjust all its callers to pass an additional parameter.
>  But are you really planning on using SIGIO/SIGURG?

I don't plan on using those signals, so I'll add a parameter instead.

> 
> Furthermore, this is undefined behavior.  According to POSIX, use of
> F_SETOWN is only portable on sockets, not pipes.  It may work on Linux,
> but you'll need to be aware of what it does on other platforms.
> http://pubs.opengroup.org/onlinepubs/9699919799/functions/fcntl.html
> --
> Eric Blake   eblake redhat com    +1-919-301-3266
> Libvirt virtualization library http://libvirt.org
> 
> 

