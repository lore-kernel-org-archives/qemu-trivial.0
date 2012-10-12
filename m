Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TMb2Q-0005x1-Pl
	for mharc-qemu-trivial@gnu.org; Fri, 12 Oct 2012 04:56:10 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TMb2N-0005oR-NQ
	for qemu-trivial@nongnu.org; Fri, 12 Oct 2012 04:56:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TMb2J-00007P-Li
	for qemu-trivial@nongnu.org; Fri, 12 Oct 2012 04:56:07 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:35517)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TMb29-00006X-DL; Fri, 12 Oct 2012 04:55:53 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so1219580bkc.4
	for <multiple recipients>; Fri, 12 Oct 2012 01:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tIH+rOeR6oJVDHvA7N3dYTSg3YAHbXpJFhfMkZ61nKI=;
	b=g200W76DwwVJlfmFH5lrEMp/VhlYOGl7BWqyCApUu83/HUVvN9L4a3L7iR0LbQ7rGP
	CrMmxWp01gPxnSBPs4UkTSDaOH4XB9Y6LbuKzLj7XyYxXVg3zOAIVqz+oSAmC3yvpVNZ
	MhOurFFTnMV73djQjhCjqOkZWEdiL38rDdlz01K/jV+OuZfvQMyruCCi/5+nWBynCeC8
	7/rWP6Xkye4TgAXIIES23tAFDRTXo/875ifG4p0hHUnDRUai5u0zEE2aV+DeMoz9UoRK
	xjrWk51VWLmrxKFCv9DcRgCLR2FsZk7yDJUbXk2vuRuyUNs3RDPH09tr+WGTClTeg/nr
	raOg==
Received: by 10.205.134.140 with SMTP id ic12mr1080506bkc.140.1350032152241;
	Fri, 12 Oct 2012 01:55:52 -0700 (PDT)
Received: from localhost ([89.204.139.161])
	by mx.google.com with ESMTPS id ia2sm5003943bkc.11.2012.10.12.01.55.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Oct 2012 01:55:51 -0700 (PDT)
Date: Fri, 12 Oct 2012 10:55:48 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20121012085548.GA15871@stefanha-thinkpad.redhat.com>
References: <1349872258-21952-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1349872258-21952-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] vnc: fix "info vnc" with "-vnc ...,
 reverse=on"
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
X-List-Received-Date: Fri, 12 Oct 2012 08:56:08 -0000

On Wed, Oct 10, 2012 at 02:30:58PM +0200, Paolo Bonzini wrote:
> When reverse connection is in use, there is no active VNC server
> socket.  Because of this, getsockopt(-1, ...) is attempted and
> the following error is emitted:
> 
>     $ socat TCP-LISTEN:5900,reuseaddr TCP-LISTEN:5901,reuseaddr &
>     $ x86_64-softmmu/qemu-system-x86_64 -vnc localhost:5900,reverse -monitor stdio
>     QEMU 1.2.50 monitor - type 'help' for more information
>     (qemu) info vnc
>     An undefined error has occurred
> 
> Because however the host, family, service and auth fields are
> optional, we can just exit if there is no active server socket.
> 
>     $ x86_64-softmmu/qemu-system-x86_64 -vnc localhost:5900,reverse -monitor stdio
>     QEMU 1.2.50 monitor - type 'help' for more information
>     (qemu) info vnc
>     Server:
>     Client:
>          address: 127.0.0.1:5900
>       x509_dname: none
>         username: none
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  ui/vnc.c | 4 ++++
>  1 file modificato, 4 inserzioni(+)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

