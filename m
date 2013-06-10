Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um9CO-000181-Hb
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 17:00:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Um9CL-00012U-BF
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 17:00:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Um9CF-0003U9-Vs
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 17:00:17 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44653)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Um99m-0002dI-0p; Mon, 10 Jun 2013 16:57:38 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5E3204114D;
	Tue, 11 Jun 2013 00:57:35 +0400 (MSK)
Message-ID: <51B63DBE.2010903@msgid.tls.msk.ru>
Date: Tue, 11 Jun 2013 00:57:34 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1370897240-23490-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1370897240-23490-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, "M. Mohan Kumar" <mohan@in.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH trivial] configure: explicitly disable
	virtfs if softmmu=no
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
X-List-Received-Date: Mon, 10 Jun 2013 21:00:19 -0000

11.06.2013 00:47, Michael Tokarev wrote:
> Or else
> 
>  ./configure --disable-system --enable-virtfs
> 
> (which makes no sense by its own but does not error out)
> will fail to build, because it will define CONFIG_VIRTFS,
> and the makefile will try to build virtfs-proxy-helper
> manpage (but not the executable).

The build fails in this case in a separate build tree, because
the fsdev directory is not created and scripts/texi2pod.pl
will be called with output = fsdev/virtfs-proxy-helper.pod,
which can't be created because fsdev/ does not exist.

> 
> Cc: qemu-trivial@nongnu.org
> Cc: M. Mohan Kumar <mohan@in.ibm.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  configure |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/configure b/configure
> index a3f0b7a..0ff0380 100755
> --- a/configure
> +++ b/configure
> @@ -3423,6 +3423,8 @@ if test "$softmmu" = yes ; then
>        tools="qemu-ga\$(EXESUF) $tools"
>      fi
>    fi
> +else
> +  virtfs=no
>  fi
>  
>  # Mac OS X ships with a broken assembler
> 


