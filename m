Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RWBZM-0004dK-H8
	for mharc-qemu-trivial@gnu.org; Thu, 01 Dec 2011 13:41:16 -0500
Received: from eggs.gnu.org ([140.186.70.92]:51240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1RWBZJ-0004Ta-Lt
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2011 13:41:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1RWBZI-0006ux-Cy
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2011 13:41:13 -0500
Received: from smtp.ctxuk.citrix.com ([62.200.22.115]:14652
	helo=SMTP.EU.CITRIX.COM) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1RWBZG-0006uE-9j; Thu, 01 Dec 2011 13:41:10 -0500
X-IronPort-AV: E=Sophos;i="4.71,279,1320624000"; 
   d="scan'208";a="9238274"
Received: from lonpmailmx01.citrite.net ([10.30.203.162])
	by LONPIPO01.EU.CITRIX.COM with ESMTP/TLS/RC4-MD5;
	01 Dec 2011 18:41:09 +0000
Received: from kaball.uk.xensource.com (10.80.2.59) by
	LONPMAILMX01.citrite.net (10.30.203.162) with Microsoft SMTP Server id
	8.3.213.0; Thu, 1 Dec 2011 18:41:09 +0000
Date: Thu, 1 Dec 2011 18:42:06 +0000
From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
X-X-Sender: sstabellini@kaball-desktop
To: Anthony Liguori <anthony@codemonkey.ws>
In-Reply-To: <4ED7C76A.6060407@codemonkey.ws>
Message-ID: <alpine.DEB.2.00.1112011838320.31179@kaball-desktop>
References: <4ED3F1C3.4060601@weilnetz.de>
	<1322606869-25865-1-git-send-email-mdroth@linux.vnet.ibm.com>
	<1322606869-25865-2-git-send-email-mdroth@linux.vnet.ibm.com>
	<CAJSP0QWaGrgZ5+xBckUwF+JRNmTY4rm4vnm9yo+0LZJtNWEx-g@mail.gmail.com>
	<alpine.DEB.2.00.1111301227570.31179@kaball-desktop>
	<4ED68B19.7050704@weilnetz.de>
	<alpine.DEB.2.00.1112011048150.31179@kaball-desktop>
	<4ED7C342.3060302@weilnetz.de> <4ED7C76A.6060407@codemonkey.ws>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 62.200.22.115
Cc: Stefano Stabellini <Stefano.Stabellini@eu.citrix.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] Makefile: use full path
 for qapi-generated directory
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
X-List-Received-Date: Thu, 01 Dec 2011 18:41:14 -0000

On Thu, 1 Dec 2011, Anthony Liguori wrote:
> On 12/01/2011 12:11 PM, Stefan Weil wrote:
> > Am 01.12.2011 16:19, schrieb Stefano Stabellini:
> >> On Wed, 30 Nov 2011, Stefan Weil wrote:
> >>> It's common to use either out-of-tree builds or in-tree builds,
> >>> but not to mix both variants with a common root directory.
> >>> I think QEMU should explicitly forbid that mixed scenario (like
> >>> other projects do).
> >>>
> >>> Even with your fix there can remain problems with generated
> >>> header files.
> >>
> >> Really? Can you provide more specific details?
> >
> > Yes. Suppose different generated header files with the same name
> > exist in the source directory tree and in the build directory tree.
> >
> > Then compiler options (the order of -I options) will determine
> > which of two header files with same name will be used in out-of-tree
> > builds. If the wrong one (that from the source directory tree) is used,
> > the compiler might fail or produce wrong code (for example when
> > macro values changed).
> >>> The mixed scenario creates unnecessary complexity.
> >>> Without the mixed scenario, your patch is not needed.
> >>
> >> I agree that supporting the mixed scenario shouldn't be a priority.
> >> However without this last patch a "make clean" on the main tree is not
> >> enough to allow out of tree builds.
> >>
> >> Try the following scenario:
> >>
> >> - cd qemu; ./configure; make
> >>
> >> - make clean
> >>
> >> - cd ../temp; ./configure --source-path=../qemu; make
> >
> > Which ./configure do you run in an empty temp directory?
> > This example (like similar ones in your previous mail) won't work.
> 
> Yes, you must do external builds only from a clean source directory.  This is a 
> perfectly normal requirement.  In fact, I can't think of a project that doesn't 
> require this.

Fair enough.

In that case, like Michael Roth wrote, the patch "Makefile: use full
path for qapi-generated directory" doesn't actually fix anything, so
probably we don't need it either, but I'll leave it up to you.

