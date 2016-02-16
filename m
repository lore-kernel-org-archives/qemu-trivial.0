Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aVicK-0006IT-CU
	for mharc-qemu-trivial@gnu.org; Tue, 16 Feb 2016 11:36:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kchamart@redhat.com>) id 1aVicE-00065G-3n
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 11:36:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kchamart@redhat.com>) id 1aVicC-0007s9-Ou
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 11:36:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55254)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kchamart@redhat.com>)
	id 1aVic7-0007oG-8N; Tue, 16 Feb 2016 11:36:35 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 58049A2C34;
	Tue, 16 Feb 2016 16:36:34 +0000 (UTC)
Received: from tesla.localdomain (ovpn-116-71.ams2.redhat.com [10.36.116.71])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u1GGaWGo030451
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 16 Feb 2016 11:36:34 -0500
Received: by tesla.localdomain (Postfix, from userid 1000)
	id 2A27D24191F; Tue, 16 Feb 2016 17:36:31 +0100 (CET)
Date: Tue, 16 Feb 2016 17:36:31 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160216163631.GD19823@tesla.redhat.com>
References: <1455638581-5912-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455638581-5912-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-options.hx: Improve documentation
 of chardev multiplexing mode
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
X-List-Received-Date: Tue, 16 Feb 2016 16:36:46 -0000

On Tue, Feb 16, 2016 at 04:03:01PM +0000, Peter Maydell wrote:
> The current documentation of chardev mux=on is rather brief and opaque;
> expand it to hopefully be a bit more helpful.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> ---
> There was some discussion on #qemu yesterday evening about multiplexing,
> and "make the docs a bit less confusing" was one suggestion...
> ---

Thanks for following up with the clarifying write-up.

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

Just noting for convenience here, looking at an old commit[1 that
notes the syntax for multiplexing 'stdio', which you mention above in
prose:

    [...]
    Muxing can be done this way:
    
        -chardev stdio,id=mux,mux=on
        -serial chardev:mux
        -monitor chardev:mux"
    [...]

[1] http://git.qemu.org/?p=qemu.git;a=commitdiff;h=c845f40

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

Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>

-- 
/kashyap

