Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RVQSK-0008J8-VF
	for mharc-qemu-trivial@gnu.org; Tue, 29 Nov 2011 11:22:52 -0500
Received: from eggs.gnu.org ([140.186.70.92]:42648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1RVQSD-00080b-Sv
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2011 11:22:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1RVQS7-0002Sj-Ex
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2011 11:22:45 -0500
Received: from smtp.ctxuk.citrix.com ([62.200.22.115]:38240
	helo=SMTP.EU.CITRIX.COM) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1RVQRz-0002R5-ER; Tue, 29 Nov 2011 11:22:31 -0500
X-IronPort-AV: E=Sophos;i="4.69,591,1315180800"; 
   d="scan'208";a="9190702"
Received: from lonpmailmx01.citrite.net ([10.30.203.162])
	by LONPIPO01.EU.CITRIX.COM with ESMTP/TLS/RC4-MD5;
	29 Nov 2011 16:22:28 +0000
Received: from kaball.uk.xensource.com (10.80.2.59) by
	LONPMAILMX01.citrite.net (10.30.203.162) with Microsoft SMTP Server id
	8.3.213.0; Tue, 29 Nov 2011 16:22:28 +0000
Date: Tue, 29 Nov 2011 16:23:22 +0000
From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
X-X-Sender: sstabellini@kaball-desktop
To: Stefan Weil <sw@weilnetz.de>
In-Reply-To: <4ED3F1C3.4060601@weilnetz.de>
Message-ID: <alpine.DEB.2.00.1111291610510.31179@kaball-desktop>
References: <alpine.DEB.2.00.1111221726190.31179@kaball-desktop>
	<4ED3D428.7030704@weilnetz.de> <4ED3F1C3.4060601@weilnetz.de>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 62.200.22.115
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@us.ibm.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Stefano Stabellini <Stefano.Stabellini@eu.citrix.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fix out of tree build
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
X-List-Received-Date: Tue, 29 Nov 2011 16:22:50 -0000

On Mon, 28 Nov 2011, Stefan Weil wrote:
> The broken build can be reproduced with a source path containing at 
> least one dot.
> Source paths without any dot will show no problems. My source path was 
> ~/src/qemu/qemu.org/qemu.

Sorry for the build break, I didn't have any dots in my source path so
I didn't notice it :-/


> File scripts/qapi.py fails to create unique guard names when given a 
> filename with 2 or more dots:
> 
> def guardname(filename):
>      if filename.startswith('./'):
>          filename = filename[2:]
>      return filename.replace("/", "_").replace("-", 
> "_").split(".")[0].upper() + '_H'
> 
> The function always returns the same guard name (in my case 
> _HOME_STEFAN_SRC_QEMU_QEMU_H)
> which won't work when used for more than one header file.
> 
> I expect that blanks in the source path will also give unexpected results.
> 
> Even when this function were fixed, I think that
> qapi-dir := $(BUILD_DIR)/qapi-generated
> would be better.
 
Doing a more careful analysis of the out-of-tree build, I noticed that
the system actually works correctly if the source directory is
"distclean".
I don't think we support building qemu out-of-tree if the source dir
hasn't been cleaned properly, so I don't think is worth pursuing this
patch anymore.
Just be aware that a "make clean" is not enough.

