Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnElE-0002gM-6Y
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jun 2013 17:08:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1UnB0t-0005wo-8y
	for qemu-trivial@nongnu.org; Thu, 13 Jun 2013 13:08:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1UnB0n-0008Hj-Ke
	for qemu-trivial@nongnu.org; Thu, 13 Jun 2013 13:08:43 -0400
Received: from mout.web.de ([212.227.17.11]:64977)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1UnB0n-0008HR-8o; Thu, 13 Jun 2013 13:08:37 -0400
Received: from envy.site ([195.135.221.2]) by smtp.web.de (mrweb102) with
	ESMTPSA (Nemesis) id 0MQNiS-1UulD53pym-00TpcE; Thu, 13 Jun 2013 19:08:30
	+0200
Message-ID: <51B9FC8A.7000108@web.de>
Date: Thu, 13 Jun 2013 19:08:26 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1371139489-31940-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1371139489-31940-1-git-send-email-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:q25Ytm2XV1joVKwsv4LdxNZZMqENtjrLPlutUXyS2hJvqff06kA
	yPlAehjtAp4UWswBeLr2Y8vNa/xmrveQUCiScE9diBTYnnPaR8hC2p00AeK9qdULY0w5uYX
	Jt6wK0/EnfiqLY6PtZIibCj3ZDBsvsxdJLKIdVL6RG/xrn+fsWm3uKN8Xq5GgE+f0Epsxa1
	y3PDYegHsegYeTPuGsIPA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 212.227.17.11
X-Mailman-Approved-At: Thu, 13 Jun 2013 17:08:43 -0400
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org, Brad Smith <brad@comstyle.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] create
 qemu_openpty_raw() helper function and move it to a separate file
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
X-List-Received-Date: Thu, 13 Jun 2013 17:08:44 -0000

Am 13.06.2013 18:04, schrieb Michael Tokarev:
> In two places qemu uses openpty() which is very system-dependent,
> and in both places the pty is switched to raw mode as well.
> Make a wrapper function which does both steps, and move all the
> system-dependent complexity into a separate file, together
> with static/local implementations of openpty() and cfmakeraw()
> from qemu-char.c.
> 
> It is in a separate file, not part of oslib-posix.c, because
> openpty() often resides in -lutil which is not linked to
> every program qemu builds.
> 
> This change removes #including of <pty.h>, <termios.h>
> and other rather specific system headers out of qemu-common.h,
> which isn't a place for such specific headers really.
> 
> This version has been verified to build correctly on Linux,
> OpenBSD, FreeBSD and OpenIndiana.  On the latter it lets qemu
> to be built with gtk gui which were not possible there due to
> missing openpty() and cfmakeraw().
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
> Changes since v1:
> 
> - added a forgotten #include <termios.h> for *BSD,
>   which was recently added into qemu-common.h by
>   Brad Smith, and which I intended to use in
>   qemu-openpty.c too, but somehow forgot.
> 
> Changes since v2:
> 
> - verified build on solaris (openindiana) and added
>   #include <termios.h> there too,
> 
> - removed trailing newline

Tested-by: Andreas Färber <andreas.faerber@web.de>

on OpenIndiana 151a.

Thanks,
Andreas

> This is trivial enough to warrant a -trivial tree.
> The diffstat below is large because of the comments
> in the new file.
> 
>  include/qemu-common.h |   15 +-----
>  qemu-char.c           |   77 ++--------------------------
>  ui/gtk.c              |   12 ++---
>  util/Makefile.objs    |    2 +-
>  util/qemu-openpty.c   |  135 +++++++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 146 insertions(+), 95 deletions(-)
>  create mode 100644 util/qemu-openpty.c


