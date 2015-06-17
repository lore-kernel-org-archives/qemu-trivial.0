Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z5JEc-0004FL-JY
	for mharc-qemu-trivial@gnu.org; Wed, 17 Jun 2015 15:42:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z5JEZ-00048s-Lt
	for qemu-trivial@nongnu.org; Wed, 17 Jun 2015 15:42:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z5JEY-0004gB-Ob
	for qemu-trivial@nongnu.org; Wed, 17 Jun 2015 15:42:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39098)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z5JES-0004dY-KF; Wed, 17 Jun 2015 15:42:44 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 80B8E4186B;
	Wed, 17 Jun 2015 22:42:43 +0300 (MSK)
Message-ID: <5581CDB3.2030300@msgid.tls.msk.ru>
Date: Wed, 17 Jun 2015 22:42:43 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
References: <1433258768-28946-1-git-send-email-berrange@redhat.com>
In-Reply-To: <1433258768-28946-1-git-send-email-berrange@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Add .dir-locals.el file to configure
	emacs coding style
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
X-List-Received-Date: Wed, 17 Jun 2015 19:42:52 -0000

So, what is the consensus here?

Everyone who talked wants the emacs mode, but everyone
offers their own mode.

I'd pick the stroustrup variant suggested by Marcus
since it is shortest, but while being shortest, it
is looks a bit "magical".  On the other hand, variant
from Peter Maydell (https://wiki.linaro.org/PeterMaydell/QemuEmacsStyle)
explicitly defines everything.

Thanks,

/mjt

02.06.2015 18:26, Daniel P. Berrange wrote:
> The default emacs setup indents by 2 spaces and uses tabs
> which is counter to the QEMU coding style rules. Adding a
> .dir-locals.el file in the top level of the GIT repo will
> inform emacs about the QEMU coding style, and so assist
> contributors in avoiding common style mistakes before
> they submit patches.
> 
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  .dir-locals.el | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 .dir-locals.el
> 
> diff --git a/.dir-locals.el b/.dir-locals.el
> new file mode 100644
> index 0000000..ddb2fae
> --- /dev/null
> +++ b/.dir-locals.el
> @@ -0,0 +1,8 @@
> +(
> + (c-mode . (
> +            (c-file-style . "K&R")
> +            (indent-tabs-mode . nil)
> +            (c-indent-level . 4)
> +            (c-basic-offset . 4)
> +            ))
> +)
> 


