Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aJHbQ-0005uZ-1o
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jan 2016 04:20:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1aJHbN-0005rs-Ea
	for qemu-trivial@nongnu.org; Wed, 13 Jan 2016 04:20:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1aJHbM-0001w4-HQ
	for qemu-trivial@nongnu.org; Wed, 13 Jan 2016 04:20:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42209)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>)
	id 1aJHbD-0001rd-96; Wed, 13 Jan 2016 04:20:15 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id EF30919F202;
	Wed, 13 Jan 2016 09:20:14 +0000 (UTC)
Received: from [10.66.15.133] (dhcp-15-133.nay.redhat.com [10.66.15.133])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0D9K7VV020521
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 13 Jan 2016 04:20:11 -0500
To: Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>,
	qemu-devel@nongnu.org
References: <1452673262-11279-1-git-send-email-thuth@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <569616C2.5000004@redhat.com>
Date: Wed, 13 Jan 2016 17:20:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1452673262-11279-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-doc: Do not promote
 deprecated -smb and -redir options
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
X-List-Received-Date: Wed, 13 Jan 2016 09:20:26 -0000



On 01/13/2016 04:21 PM, Thomas Huth wrote:
> Since -smb and -redir are deprecated options, we should not
> use them as examples in the documentation anymore.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qemu-doc.texi | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Applied to my -net.

Thanks

>
> diff --git a/qemu-doc.texi b/qemu-doc.texi
> index 7bc3882..2596503 100644
> --- a/qemu-doc.texi
> +++ b/qemu-doc.texi
> @@ -1237,9 +1237,9 @@ echo 100 100 > /proc/sys/net/ipv4/ping_group_range
>  When using the built-in TFTP server, the router is also the TFTP
>  server.
>  
> -When using the @option{-redir} option, TCP or UDP connections can be
> -redirected from the host to the guest. It allows for example to
> -redirect X11, telnet or SSH connections.
> +When using the @option{'-netdev user,hostfwd=...'} option, TCP or UDP
> +connections can be redirected from the host to the guest. It allows for
> +example to redirect X11, telnet or SSH connections.
>  
>  @subsection Connecting VLANs between QEMU instances
>  
> @@ -1889,7 +1889,8 @@ correctly instructs QEMU to shutdown at the appropriate moment.
>  
>  @subsubsection Share a directory between Unix and Windows
>  
> -See @ref{sec_invocation} about the help of the option @option{-smb}.
> +See @ref{sec_invocation} about the help of the option
> +@option{'-netdev user,smb=...'}.
>  
>  @subsubsection Windows XP security problem
>  


