Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VW4fj-00010n-TK
	for mharc-qemu-trivial@gnu.org; Tue, 15 Oct 2013 09:28:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1VW4fd-0000op-50
	for qemu-trivial@nongnu.org; Tue, 15 Oct 2013 09:28:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1VW4fX-0004Qr-45
	for qemu-trivial@nongnu.org; Tue, 15 Oct 2013 09:28:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59028)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1VW4fK-0004PA-H3; Tue, 15 Oct 2013 09:28:02 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9FDRwoO019247
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 15 Oct 2013 09:27:59 -0400
Received: from localhost (ovpn-113-75.phx2.redhat.com [10.3.113.75])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r9FDRtOQ000708; Tue, 15 Oct 2013 09:27:56 -0400
Date: Tue, 15 Oct 2013 09:27:55 -0400
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Fam Zheng <famz@redhat.com>
Message-ID: <20131015092755.03a89e89@redhat.com>
In-Reply-To: <1381805919-11572-1-git-send-email-famz@redhat.com>
References: <1381805919-11572-1-git-send-email-famz@redhat.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] .gitignore: ignore qmp-commands.txt
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
X-List-Received-Date: Tue, 15 Oct 2013 13:28:27 -0000

On Tue, 15 Oct 2013 10:58:39 +0800
Fam Zheng <famz@redhat.com> wrote:

> This file is moved out from QMP/ to BUILD dir, change the ignore file
> too.
> 
> Signed-off-by: Fam Zheng <famz@redhat.com>

Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>

PS: Assuming this will be taken by Michael.

> ---
>  .gitignore | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitignore b/.gitignore
> index 8e1b73f..5584b5f 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -44,7 +44,7 @@ qemu-ga
>  qemu-bridge-helper
>  qemu-monitor.texi
>  vscclient
> -QMP/qmp-commands.txt
> +qmp-commands.txt
>  test-bitops
>  test-coroutine
>  test-int128


