Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RG1tV-0003D4-CL
	for mharc-qemu-trivial@gnu.org; Tue, 18 Oct 2011 01:07:17 -0400
Received: from eggs.gnu.org ([140.186.70.92]:34087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <av1474@comtv.ru>) id 1RG1tR-0003Cx-PL
	for qemu-trivial@nongnu.org; Tue, 18 Oct 2011 01:07:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <av1474@comtv.ru>) id 1RG1tQ-0006qL-Lk
	for qemu-trivial@nongnu.org; Tue, 18 Oct 2011 01:07:13 -0400
Received: from fe01x03-cgp.akado.ru ([77.232.31.164]:62071 helo=akado.ru)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <av1474@comtv.ru>)
	id 1RG1tQ-0006q5-Fh; Tue, 18 Oct 2011 01:07:12 -0400
Received: from [10.0.66.9] ([10.0.66.9] verified)
	by fe01-cgp.akado.ru (CommuniGate Pro SMTP 5.2.13)
	with ESMTPS id 302642726; Tue, 18 Oct 2011 09:07:06 +0400
Date: Tue, 18 Oct 2011 09:06:57 +0400 (MSD)
From: malc <av1474@comtv.ru>
X-X-Sender: malc@linmac
To: Stefan Weil <sw@weilnetz.de>
In-Reply-To: <4E9CFE3C.80205@weilnetz.de>
Message-ID: <alpine.LNX.2.00.1110180906480.5837@linmac>
References: <1318903592-4851-1-git-send-email-trev.saunders@gmail.com>
	<4E9CFE3C.80205@weilnetz.de>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 77.232.31.164
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Jes Sorensen <Jes.Sorensen@redhat.com>, qemu-devel@nongnu.org,
	Trevor Saunders <trev.saunders@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] correctly null terminate
	the process name
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
X-List-Received-Date: Tue, 18 Oct 2011 05:07:14 -0000

On Tue, 18 Oct 2011, Stefan Weil wrote:

> Am 18.10.2011 04:06, schrieb Trevor Saunders:
> > strncpy() doesn't garentee the copied string will be null terminated if
> > the original is longer than the length to copy.
> > 
> > Signed-off-by: Trevor Saunders<trev.saunders@gmail.com>
> > ---
> >   os-posix.c |    2 +-
> >   1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/os-posix.c b/os-posix.c
> > index dbf3b24..92dcc97 100644
> > --- a/os-posix.c
> > +++ b/os-posix.c
> > @@ -149,8 +149,8 @@ void os_set_proc_name(const char *s)
> >       char name[16];
> >       if (!s)
> >           return;
> > -    name[sizeof(name) - 1] = 0;
> >       strncpy(name, s, sizeof(name));
> > +    name[sizeof(name) - 1] = 0;
> >       /* Could rewrite argv[0] too, but that's a bit more complicated.
> >          This simple way is enough for `top'. */
> >       if (prctl(PR_SET_NAME, name)) {
> 
> Reviewed-by: Stefan Weil <sw@weilnetz.de>

cutils.c has pstrcpy for that.

-- 
mailto:av1474@comtv.ru

