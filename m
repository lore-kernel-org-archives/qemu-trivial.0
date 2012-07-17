Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sr8Db-0003xs-MN
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jul 2012 09:53:39 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1Sr8DS-0003W6-RJ
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2012 09:53:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1Sr8DN-0001JI-24
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2012 09:53:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38030)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1Sr8DA-0001Gy-Lx; Tue, 17 Jul 2012 09:53:12 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6HDrA4O024119
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 17 Jul 2012 09:53:11 -0400
Received: from dhcp-5-188.str.redhat.com (vpn1-6-35.ams2.redhat.com
	[10.36.6.35])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q6HDr8K7025396
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 17 Jul 2012 09:53:09 -0400
Message-ID: <50056E43.1060106@redhat.com>
Date: Tue, 17 Jul 2012 15:53:07 +0200
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Pavel Hrdina <phrdina@redhat.com>
References: <3d1ec0fd89b439e704cc1f6d2e7b841a64cecb47.1342436496.git.minovotn@redhat.com>
In-Reply-To: <3d1ec0fd89b439e704cc1f6d2e7b841a64cecb47.1342436496.git.minovotn@redhat.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Michal Novotny <minovotn@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-options.hx: Fix
 set_password and expire_password description
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
X-List-Received-Date: Tue, 17 Jul 2012 13:53:37 -0000

Am 16.07.2012 15:19, schrieb Pavel Hrdina:
> From: Michal Novotny <minovotn@redhat.com>
> 
> The description for set_password and expire_password commands is
> incomplete. This patch fixes the man page that is being generated
> to match the real behaviour of these functions.
> 
> Signed-off-by: Michal Novotny <minovotn@redhat.com>
> ---
>  qemu-options.hx |   17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)

This one probably qualifies for qemu-trivial, copied the list.

Kevin

> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index ecf7ca1..679e3ca 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1030,8 +1030,21 @@ is a TCP port number, not a display number.
>  @item password
>  
>  Require that password based authentication is used for client connections.
> -The password must be set separately using the @code{change} command in the
> -@ref{pcsys_monitor}
> +
> +The password must be set separately using the @code{set_password} command in
> +the @ref{pcsys_monitor}. The syntax to change your password is:
> +@code{set_password <protocol> <password>} where <protocol> could be either
> +"vnc" or "spice".
> +
> +If you would like to change <protocol> password expiration, you should use
> +@code{expire_password <protocol> <expiration-time>} where expiration time could
> +be one of the following options: now, never, +seconds or UNIX time of
> +expiration, e.g. +60 to make password expire in 60 seconds, or 1335196800
> +to make password expire on "Mon Apr 23 12:00:00 EDT 2012" (UNIX time for this
> +date and time).
> +
> +You can also use keywords "now" or "never" for the expiration time to
> +allow <protocol> password to expire immediately or never expire.
>  
>  @item tls
>  

