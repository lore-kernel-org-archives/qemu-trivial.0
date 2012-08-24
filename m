Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4uEc-0007Xp-0t
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 09:47:38 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1T4uEZ-0007X0-T1
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 09:47:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1T4uEX-0005Jd-SH
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 09:47:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:64881)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1T4uEX-0005JO-L3; Fri, 24 Aug 2012 09:47:33 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7ODlWmr009740
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 24 Aug 2012 09:47:32 -0400
Received: from doriath.home (ovpn-113-82.phx2.redhat.com [10.3.113.82])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q7ODlQPU032448; Fri, 24 Aug 2012 09:47:27 -0400
Date: Fri, 24 Aug 2012 10:48:13 -0300
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120824104813.4345db29@doriath.home>
In-Reply-To: <1345784583-25640-1-git-send-email-sw@weilnetz.de>
References: <1345784583-25640-1-git-send-email-sw@weilnetz.de>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 1.2] qemu-ga: Fix null
 pointer passed to unlink in failure branch
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
X-List-Received-Date: Fri, 24 Aug 2012 13:47:36 -0000

On Fri, 24 Aug 2012 07:03:03 +0200
Stefan Weil <sw@weilnetz.de> wrote:

> Clang reports this warning:
> 
> Null pointer passed as an argument to a 'nonnull' parameter
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>

> ---
>  qemu-ga.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/qemu-ga.c b/qemu-ga.c
> index 26671fe..7623079 100644
> --- a/qemu-ga.c
> +++ b/qemu-ga.c
> @@ -438,7 +438,9 @@ static void become_daemon(const char *pidfile)
>      return;
>  
>  fail:
> -    unlink(pidfile);
> +    if (pidfile) {
> +        unlink(pidfile);
> +    }
>      g_critical("failed to daemonize");
>      exit(EXIT_FAILURE);
>  #endif


