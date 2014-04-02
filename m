Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WVMXO-0001ZE-ND
	for mharc-qemu-trivial@gnu.org; Wed, 02 Apr 2014 10:53:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1WVMXH-0001SM-No
	for qemu-trivial@nongnu.org; Wed, 02 Apr 2014 10:53:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1WVMXC-0007aV-8j
	for qemu-trivial@nongnu.org; Wed, 02 Apr 2014 10:53:03 -0400
Received: from cantor2.suse.de ([195.135.220.15]:60894 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1WVMWz-0007Zh-Si; Wed, 02 Apr 2014 10:52:46 -0400
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 5C0A2ACF4;
	Wed,  2 Apr 2014 14:52:44 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Alexander Graf <agraf@suse.de>
In-Reply-To: <1396450172-31322-1-git-send-email-chouteau@adacore.com>
Date: Wed, 2 Apr 2014 16:52:41 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <2B9CCD53-1C5A-48B7-90A0-C8C5D347E563@suse.de>
References: <1396450172-31322-1-git-send-email-chouteau@adacore.com>
To: Fabien Chouteau <chouteau@adacore.com>
X-Mailer: Apple Mail (2.1874)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] Fix typo in eTSEC Ethernet controller
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
X-List-Received-Date: Wed, 02 Apr 2014 14:53:09 -0000


On 02.04.2014, at 16:49, Fabien Chouteau <chouteau@adacore.com> wrote:

> IRQ are lowered when ievent bit is cleared, so irq_pulse makes no =
sense
> here...
>=20
> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>

Thanks, applied to ppc-next. Given that the wiring with boards is still =
missing I don't think this is a critical 2.0 fix.


Alex


