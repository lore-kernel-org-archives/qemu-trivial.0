Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RiUDH-0001CL-NM
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jan 2012 12:01:19 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1RiUDE-00017b-DJ
	for qemu-trivial@nongnu.org; Wed, 04 Jan 2012 12:01:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1RiUD4-00042x-Jp
	for qemu-trivial@nongnu.org; Wed, 04 Jan 2012 12:01:16 -0500
Received: from smtp.ctxuk.citrix.com ([62.200.22.115]:10018
	helo=SMTP.EU.CITRIX.COM) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stefano.Stabellini@eu.citrix.com>)
	id 1RiUD3-00042A-Pm; Wed, 04 Jan 2012 12:01:06 -0500
X-IronPort-AV: E=Sophos;i="4.71,456,1320624000"; 
   d="scan'208";a="9819282"
Received: from lonpmailmx01.citrite.net ([10.30.203.162])
	by LONPIPO01.EU.CITRIX.COM with ESMTP/TLS/RC4-MD5;
	04 Jan 2012 17:00:36 +0000
Received: from kaball.uk.xensource.com (10.80.2.59) by
	LONPMAILMX01.citrite.net (10.30.203.162) with Microsoft SMTP Server id
	8.3.213.0; Wed, 4 Jan 2012 17:00:36 +0000
Date: Wed, 4 Jan 2012 17:00:21 +0000
From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
X-X-Sender: sstabellini@kaball-desktop
To: Stefan Weil <sw@weilnetz.de>
In-Reply-To: <1324110459-3932-12-git-send-email-sw@weilnetz.de>
Message-ID: <alpine.DEB.2.00.1201041659580.3150@kaball-desktop>
References: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
	<1324110459-3932-12-git-send-email-sw@weilnetz.de>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 62.200.22.115
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Stefano Stabellini <Stefano.Stabellini@eu.citrix.com>
Subject: Re: [Qemu-trivial] [PATCH 11/11] configure: Improve Xen
 autodetection for hosts without Xen
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
X-List-Received-Date: Wed, 04 Jan 2012 17:01:17 -0000

On Sat, 17 Dec 2011, Stefan Weil wrote:
> With this patch, it only takes one test (instead of four)
> to detect that there is no Xen support at all.
> 
> For most build hosts, this will reduce the time configure needs.
> It will also reduce noisy output in config.log.
> 
> Build hosts with Xen now need up to five (instead of up to four)
> tests. They get improved diagnostics when Xen support fails.

good idea, thanks for the patch

