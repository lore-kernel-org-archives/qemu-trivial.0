Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqLf7-00041e-L7
	for mharc-qemu-trivial@gnu.org; Mon, 17 Nov 2014 07:44:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1XqLez-0003fk-KU
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 07:44:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1XqLet-0005I2-DS
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 07:44:01 -0500
Received: from cantor2.suse.de ([195.135.220.15]:50040 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1XqLeU-0005Ea-9R; Mon, 17 Nov 2014 07:43:30 -0500
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 12D8575018;
	Mon, 17 Nov 2014 12:43:27 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (1.0)
From: Alexander Graf <agraf@suse.de>
X-Mailer: iPhone Mail (12B411)
In-Reply-To: <1416196496-10637-1-git-send-email-aik@ozlabs.ru>
Date: Mon, 17 Nov 2014 13:43:24 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <1C4EF2B8-76EF-4E4B-AFF8-9063DA607A25@suse.de>
References: <1416196496-10637-1-git-send-email-aik@ozlabs.ru>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Gavin Shan <gwshan@linux.vnet.ibm.com>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [RFC PATCH] spapr-pci: Enable huge BARs
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
X-List-Received-Date: Mon, 17 Nov 2014 12:44:08 -0000




> Am 17.11.2014 um 04:54 schrieb Alexey Kardashevskiy <aik@ozlabs.ru>:
>=20
> At the moment sPAPR only supports 512MB window for MMIO BARs. However
> modern devices might want bigger 64bit BARs.
>=20
> This adds another 64bit MMIO window per PHB and advertises it via
> the PHB's "ranges" property in the device tree. The new window is 1TB long=

> and starts from 1TB offset on a PCI address space.
>=20
> Older (<3.12) kernels expect BARs to have the same offset on both bus
> and memory address spaces. Since we are getting now another MMIO region,
> we either have to add (0xA000.0000 - 0x8000.0000) offset to
> its bus offset OR simply put MMIO range at the same offset as on the bus.
> This puts 32bit MMIO space at 0x8000.0000 offset in RAM and IO space
> at 0xA000.0000 (used to be vice versa).
>=20
> While we are here, let's increase PHB address spacing from 64GB to 16TB
> in order not to touch it again any time soon.
>=20
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

I'll have to digthrough the compatibility matrix details myself still, but p=
lease make sure that you don't change address space layouts for pseries-2.2.=



Alex


