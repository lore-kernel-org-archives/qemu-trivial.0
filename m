Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQhed-0006qN-0M
	for mharc-qemu-trivial@gnu.org; Sun, 29 May 2011 11:11:47 -0400
Received: from eggs.gnu.org ([140.186.70.92]:49770)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QQheb-0006l8-6E
	for qemu-trivial@nongnu.org; Sun, 29 May 2011 11:11:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QQhea-0004bz-DC
	for qemu-trivial@nongnu.org; Sun, 29 May 2011 11:11:45 -0400
Received: from fmmailgate03.web.de ([217.72.192.234]:58396)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1QQheY-0004bb-Fz; Sun, 29 May 2011 11:11:42 -0400
Received: from smtp02.web.de  ( [172.20.0.184])
	by fmmailgate03.web.de (Postfix) with ESMTP id 46B1F18F92C27;
	Sun, 29 May 2011 17:11:41 +0200 (CEST)
Received: from [87.173.127.118] (helo=[10.0.1.1])
	by smtp02.web.de with asmtp (TLSv1:AES128-SHA:128) (WEB.DE 4.110 #2)
	id 1QQheX-0005LV-00; Sun, 29 May 2011 17:11:41 +0200
Message-Id: <FB7E4CC1-F865-4AF5-9264-11A817D3F456@web.de>
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
To: Alexandre Raymond <cerbere@gmail.com>
In-Reply-To: <1306516951-31105-5-git-send-email-cerbere@gmail.com>
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed; delsp=yes
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Apple Message framework v936)
Date: Sun, 29 May 2011 17:11:39 +0200
References: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
	<1306516951-31105-5-git-send-email-cerbere@gmail.com>
X-Mailer: Apple Mail (2.936)
Sender: andreas.faerber@web.de
X-Sender: Andreas.Faerber@web.de
X-Provags-ID: V01U2FsdGVkX19bJrGGrARnYzDQmn+s4Z2tkHJ/HIALe89rPbWL
	2mRwU58ypz7T+yVqhK2atTWXgkzFJHTs4gdBwRE9w4iFajJIwn
	lglb7nLYHjR99Ep8nYfw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.234
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/6] Fix missing prototype
	under cocoa for qemu_main
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
X-List-Received-Date: Sun, 29 May 2011 15:11:46 -0000

Am 27.05.2011 um 19:22 schrieb Alexandre Raymond:

> The following error message was encountered when compiling
> with cocoa support because qemu_main did not have a prototype.
>
> -----8<-----
> qemu/vl.c:2037: warning: no previous prototype for =91qemu_main=92
> -----8<-----
>
> Add its prototype in the COCOA ifdef, similar to what is done for SDL.
>
> Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
> ---
> vl.c |    1 +
> 1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/vl.c b/vl.c
> index b362871..b983646 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -107,6 +107,7 @@ int main(int argc, char **argv)
> #endif /* CONFIG_SDL */
>
> #ifdef CONFIG_COCOA
> +int qemu_main(int argc, char **argv, char **envp);
> #undef main
> #define main qemu_main
> #endif /* CONFIG_COCOA */

We've seen at least two different ways of fixing this.

I believe my last one was forgotten, waiting for someone to test with =20=

SDL. The idea was to have the prototype in a header shared between =20
vl.c and cocoa.m, so that we don't have to duplicate the prototype. =20
I'll see if I can dig it out or will post a new patch.

Andreas=

