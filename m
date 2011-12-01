Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RW8PH-0001eN-3L
	for mharc-qemu-trivial@gnu.org; Thu, 01 Dec 2011 10:18:39 -0500
Received: from eggs.gnu.org ([140.186.70.92]:43693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1RW8P9-0001AO-IO
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2011 10:18:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1RW8P8-00046G-Lm
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2011 10:18:31 -0500
Received: from smtp.ctxuk.citrix.com ([62.200.22.115]:62042
	helo=SMTP.EU.CITRIX.COM) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1RW8Ow-000424-Bc; Thu, 01 Dec 2011 10:18:18 -0500
X-IronPort-AV: E=Sophos;i="4.71,278,1320624000"; 
   d="scan'208";a="9233992"
Received: from lonpmailmx01.citrite.net ([10.30.203.162])
	by LONPIPO01.EU.CITRIX.COM with ESMTP/TLS/RC4-MD5;
	01 Dec 2011 15:18:15 +0000
Received: from kaball.uk.xensource.com (10.80.2.59) by
	LONPMAILMX01.citrite.net (10.30.203.162) with Microsoft SMTP Server id
	8.3.213.0; Thu, 1 Dec 2011 15:18:15 +0000
Date: Thu, 1 Dec 2011 15:19:12 +0000
From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
X-X-Sender: sstabellini@kaball-desktop
To: Stefan Weil <sw@weilnetz.de>
In-Reply-To: <4ED68B19.7050704@weilnetz.de>
Message-ID: <alpine.DEB.2.00.1112011048150.31179@kaball-desktop>
References: <4ED3F1C3.4060601@weilnetz.de>
	<1322606869-25865-1-git-send-email-mdroth@linux.vnet.ibm.com>
	<1322606869-25865-2-git-send-email-mdroth@linux.vnet.ibm.com>
	<CAJSP0QWaGrgZ5+xBckUwF+JRNmTY4rm4vnm9yo+0LZJtNWEx-g@mail.gmail.com>
	<alpine.DEB.2.00.1111301227570.31179@kaball-desktop>
	<4ED68B19.7050704@weilnetz.de>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 62.200.22.115
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Stefano Stabellini <Stefano.Stabellini@eu.citrix.com>
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
X-List-Received-Date: Thu, 01 Dec 2011 15:18:37 -0000

On Wed, 30 Nov 2011, Stefan Weil wrote:
> It's common to use either out-of-tree builds or in-tree builds,
> but not to mix both variants with a common root directory.
> I think QEMU should explicitly forbid that mixed scenario (like
> other projects do).
> 
> Even with your fix there can remain problems with generated
> header files.

Really? Can you provide more specific details?

> The mixed scenario creates unnecessary complexity.
> Without the mixed scenario, your patch is not needed.

I agree that supporting the mixed scenario shouldn't be a priority.
However without this last patch a "make clean" on the main tree is not
enough to allow out of tree builds.

Try the following scenario:

- cd qemu; ./configure; make

- make clean

- cd ../temp; ./configure --source-path=../qemu; make

this has to work, right? It does not without the patch to fix the
generation of config-devices.mak.

