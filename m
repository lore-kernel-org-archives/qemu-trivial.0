Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V1HvH-0002Ij-Au
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jul 2013 11:21:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1V1BAb-00023H-Fr
	for qemu-trivial@nongnu.org; Mon, 22 Jul 2013 04:08:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1V1BAY-00025g-J0
	for qemu-trivial@nongnu.org; Mon, 22 Jul 2013 04:08:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54765)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1V1BAK-00023N-BL; Mon, 22 Jul 2013 04:08:20 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r6M88H8Q004621
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 22 Jul 2013 04:08:17 -0400
Received: from localhost (ovpn-112-38.ams2.redhat.com [10.36.112.38])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r6M88G1I010675; Mon, 22 Jul 2013 04:08:16 -0400
Date: Mon, 22 Jul 2013 10:08:15 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Ramkumar Ramachandra <artagnon@gmail.com>
Message-ID: <20130722080815.GA6069@stefanha-thinkpad.redhat.com>
References: <1374319389-7108-1-git-send-email-artagnon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1374319389-7108-1-git-send-email-artagnon@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Mon, 22 Jul 2013 11:21:13 -0400
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] qemu-options: mention C-a h in the
	-nographic doc
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
X-List-Received-Date: Mon, 22 Jul 2013 08:08:44 -0000

On Sat, Jul 20, 2013 at 04:53:09PM +0530, Ramkumar Ramachandra wrote:
> Otherwise, a new user will be wondering how to switch between the
> console and monitor.
> 
> Cc: Anthony Liguori <aliguori@us.ibm.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Marcelo Tosatti <mtosatti@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Ramkumar Ramachandra <artagnon@gmail.com>
> ---
>  qemu-options.hx | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 4e98b4f..06a5119 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -844,7 +844,8 @@ you can totally disable graphical output so that QEMU is a simple
>  command line application. The emulated serial port is redirected on
>  the console and muxed with the monitor (unless redirected elsewhere
>  explicitly). Therefore, you can still use QEMU to debug a Linux kernel
> -with a serial console.
> +with a serial console.  Use @key{C-a h} for help on switching between
> +the console and monitor.
>  ETEXI
>  
>  DEF("curses", 0, QEMU_OPTION_curses,

A candidate for the trivial patches queue.  Cced
qemu-trivial@nongnu.org.

Stefan

