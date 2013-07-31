Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V4X5W-0005pf-B7
	for mharc-qemu-trivial@gnu.org; Wed, 31 Jul 2013 10:09:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V4X5P-0005o9-6B
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 10:09:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V4Td7-0007jT-0w
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 06:27:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59545)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V4Tcy-0007gc-9N; Wed, 31 Jul 2013 06:27:32 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A59D243568;
	Wed, 31 Jul 2013 14:27:27 +0400 (MSK)
Message-ID: <51F8E68F.4030006@msgid.tls.msk.ru>
Date: Wed, 31 Jul 2013 14:27:27 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130704 Icedove/17.0.7
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1375266255-22207-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1375266255-22207-1-git-send-email-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-ga: build it even if !system
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
X-List-Received-Date: Wed, 31 Jul 2013 14:09:13 -0000

31.07.2013 14:24, Michael Tokarev wrote:
> Move qemu-ga build check out of if softmmu.. into if tools section.
> We want to build qemu-ga for _guest_ even if system build isn't
> done.  It is controlled separately using --enable-guest-agent.

Actually the more I think about it... Maybe it shouldn't depend
on --enable-tools either, but should be an independent option.
Because it isn't really a tool.

The initial issue is - hopefully - clear.  Some obscure guest
which however supports virtio - it needs a guest agent, even
if qemu-system does not build on it.  Example is s390 (not s390x).

/mjt

> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   configure |    8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/configure b/configure
> index f0761ea..0105fd2 100755
> --- a/configure
> +++ b/configure
> @@ -3430,6 +3430,9 @@ if test "$want_tools" = "yes" ; then
>     tools="qemu-img\$(EXESUF) qemu-io\$(EXESUF) $tools"
>     if [ "$linux" = "yes" -o "$bsd" = "yes" -o "$solaris" = "yes" ] ; then
>       tools="qemu-nbd\$(EXESUF) $tools"
> +    if [ "$guest_agent" = "yes" ]; then
> +      tools="qemu-ga\$(EXESUF) $tools"
> +    fi
>     fi
>   fi
>   if test "$softmmu" = yes ; then
> @@ -3444,11 +3447,6 @@ if test "$softmmu" = yes ; then
>         virtfs=no
>       fi
>     fi
> -  if [ "$linux" = "yes" -o "$bsd" = "yes" -o "$solaris" = "yes" ] ; then
> -    if [ "$guest_agent" = "yes" ]; then
> -      tools="qemu-ga\$(EXESUF) $tools"
> -    fi
> -  fi
>   fi
>
>   # Mac OS X ships with a broken assembler
>


