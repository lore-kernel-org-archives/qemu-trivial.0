Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aViYH-0007SU-Pi
	for mharc-qemu-trivial@gnu.org; Tue, 16 Feb 2016 11:32:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1aViYE-0007Nv-U5
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 11:32:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1aViYD-0006dj-U4
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 11:32:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53698)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1aViY6-0006cq-RF; Tue, 16 Feb 2016 11:32:27 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 788B75A43;
	Tue, 16 Feb 2016 16:32:26 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-108.phx2.redhat.com
	[10.3.113.108])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1GGWOqu026890; Tue, 16 Feb 2016 11:32:25 -0500
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455638581-5912-1-git-send-email-peter.maydell@linaro.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <56C34F18.7090006@redhat.com>
Date: Tue, 16 Feb 2016 17:32:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455638581-5912-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-options.hx: Improve
 documentation of chardev multiplexing mode
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
X-List-Received-Date: Tue, 16 Feb 2016 16:32:36 -0000

On 02/16/16 17:03, Peter Maydell wrote:
> The current documentation of chardev mux=on is rather brief and opaque;
> expand it to hopefully be a bit more helpful.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> There was some discussion on #qemu yesterday evening about multiplexing,
> and "make the docs a bit less confusing" was one suggestion...
> ---
>  qemu-options.hx | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 2f0465e..6b46dd4 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2162,8 +2162,26 @@ All devices must have an id, which can be any string up to 127 characters long.
>  It is used to uniquely identify this device in other command line directives.
>  
>  A character device may be used in multiplexing mode by multiple front-ends.
> +Specify @option{mux=on} to enable this mode.
> +A multiplexer is a "1:N" device, and here the "1" end is your specified chardev
> +backend, and the "N" end is the various parts of QEMU that can talk to a chardev.
> +If you create a chardev with @option{id=myid} and @option{mux=on}, QEMU will
> +create a multiplexer with your specified ID, and you can then configure multiple
> +front ends to use that chardev ID for their input/output. Up to four different
> +front ends can be connected to a single multiplexed chardev. (Without
> +multiplexing enabled, a chardev can only be used by a single front end.)
> +For instance you could use this to allow a single stdio chardev to be used by
> +two serial ports and the QEMU monitor.
> +
>  The key sequence of @key{Control-a} and @key{c} will rotate the input focus
> -between attached front-ends. Specify @option{mux=on} to enable this mode.
> +of a multiplexed character device between attached front-ends.
> +
> +You can have more than one multiplexer in a system configuration; for instance
> +you could have a TCP port multiplexed between UART 0 and UART 1, and stdio
> +multiplexed between the QEMU monitor and a parallel port.
> +
> +There is currently no support for multiplexing in the other direction
> +(where a single QEMU front end takes input and output from multiple chardevs).
>  
>  Every backend supports the @option{logfile} option, which supplies the path
>  to a file to record all data transmitted via the backend. The @option{logappend}
> 

I'm a big fan of muxing the stdio backend between the (human) monitor
and the guest's serial console:

  -chardev stdio,signal=off,mux=on,id=char0 \
  -mon chardev=char0,mode=readline,default \
  -serial chardev:char0 \

I think if you could mention the following in the above, that would be
even more helpful:
- how to enter a real Control-A character (relevant when typing at the
  guest's shell prompt, over serial)
- not strictly related, but a warning about using this in "screen"
  (I use "screen" all the time to capture serial IO) -- Control-A is
  also piggy-backed by "screen"
- how the initially active frontend gets selected
- the fact that frontends use different syntaxes to refer to the
  backend. You have two examples in the text being added ("for
  instance, ..."), so I think it would be really helpful to provide
  actual command line options for those.

Just my two cents. The patch looks great.

Thanks
Laszlo

