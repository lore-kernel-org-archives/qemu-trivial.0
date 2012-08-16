Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T20mb-0008SL-R3
	for mharc-qemu-trivial@gnu.org; Thu, 16 Aug 2012 10:10:45 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1T20mY-0008I3-2P
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2012 10:10:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1T20mT-00039z-Dc
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2012 10:10:41 -0400
Received: from cantor2.suse.de ([195.135.220.15]:53713 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1T20mK-00037s-8s; Thu, 16 Aug 2012 10:10:28 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 8F626A2FD6;
	Thu, 16 Aug 2012 16:10:26 +0200 (CEST)
Message-ID: <502CFF4F.3040003@suse.de>
Date: Thu, 16 Aug 2012 16:10:23 +0200
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
References: <1345122741-32492-1-git-send-email-sw@weilnetz.de>
	<20120816133226.GA22676@stefanha-thinkpad.localdomain>
In-Reply-To: <20120816133226.GA22676@stefanha-thinkpad.localdomain>
X-Enigmail-Version: 1.5a1pre
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org,
	"xen-devel@lists.xensource.com Devel" <xen-devel@lists.xensource.com>,
	qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Spelling fixes in comments
 and macro names (ressource -> resource)
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
X-List-Received-Date: Thu, 16 Aug 2012 14:10:43 -0000

Am 16.08.2012 15:32, schrieb Stefan Hajnoczi:
> On Thu, Aug 16, 2012 at 03:12:21PM +0200, Stefan Weil wrote:
>> Macro XEN_HOST_PCI_RESOURCE_BUFFER_SIZE is only used locally,
>> so the change should be safe.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>  hw/xen-host-pci-device.c |    6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> Thanks, applied to the trivial patches tree:
> https://github.com/stefanha/qemu/commits/trivial-patches

CC'ing the Xen folks.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

