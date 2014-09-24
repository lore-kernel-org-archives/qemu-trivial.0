Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XWktq-0000O7-5Y
	for mharc-qemu-trivial@gnu.org; Wed, 24 Sep 2014 07:38:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tklauser@sym2.noone.org>) id 1XWktj-0000G8-CL
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 07:38:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tklauser@sym2.noone.org>) id 1XWkte-00032P-B7
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 07:38:15 -0400
Received: from sym2.noone.org ([178.63.92.236]:36139)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tklauser@sym2.noone.org>)
	id 1XWktU-0002uz-8d; Wed, 24 Sep 2014 07:38:00 -0400
Received: by sym2.noone.org (Postfix, from userid 1002)
	id 4B9EB135A006; Wed, 24 Sep 2014 13:37:52 +0200 (CEST)
Date: Wed, 24 Sep 2014 13:37:51 +0200
From: Tobias Klauser <tklauser@distanz.ch>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140924113751.GA3408@distanz.ch>
References: <1411061124-21108-1-git-send-email-tklauser@distanz.ch>
	<542279B5.7070502@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <542279B5.7070502@msgid.tls.msk.ru>
X-Editor: Vi IMproved 7.3
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 178.63.92.236
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] disas/arm: Remove redefinition of
 ATTRIBUTE_UNUSED
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
X-List-Received-Date: Wed, 24 Sep 2014 11:38:20 -0000

On 2014-09-24 at 09:58:45 +0200, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 18.09.2014 21:25, Tobias Klauser wrote:
> > ATTRIBUTE_UNUSED is already defined in disas/bfd.h, which is included.
> > Thus, there is no need to redefine it.
> 
> Is there any harm in keeping it here?

No.

> While it really is a redifinition, I'm not sure what's the right thing
> here.  This whole code is not from qemu, it is an external source imported,
> and that source is being maintained (but under different license as has
> already been discussed, so keeping changes at minimum might not be that
> good idea anymore).  On the other hand this symbol is so common it should
> be defined in a common header.  Yet on another hand, for these external
> sources wich has public API, it might not be a good idea to define it in
> a header to start with, because it might clash with project-local define,
> so it might be better to define it in either private header or in individual
> source.

Ah, I didn't know it was non-qemu code (but now that I look at it again,
I probably should have realized that sooner ;). Thanks for the
explanation.

> Oh well, so much for so trivial thing... ;)

:) Sorry, it wasn't my intention to cause much discussion, trouble or
work for maintainers with that patch. I don't feel strongly about, I
just stumbled across it when browsing the source and found it odd to see
a macro defined just below the #include of a header which defines the
same macro.

Please just ignore the patch then :)

Thanks
Tobias

