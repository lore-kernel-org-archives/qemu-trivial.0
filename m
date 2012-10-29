Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TSuj5-0000Yg-Hy
	for mharc-qemu-trivial@gnu.org; Mon, 29 Oct 2012 15:10:19 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1TSuj0-0000I8-5F
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2012 15:10:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1TSuix-0007w1-DN
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2012 15:10:13 -0400
Received: from cantor2.suse.de ([195.135.220.15]:47280 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1TSuik-0007YV-Js; Mon, 29 Oct 2012 15:09:58 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 31FB2A30ED;
	Mon, 29 Oct 2012 20:09:58 +0100 (CET)
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: text/plain; charset=us-ascii
From: Alexander Graf <agraf@suse.de>
In-Reply-To: <83c3d36b6b36a2d4c6f045c46023a091bc5156bf.1351422116.git.blauwirbel@gmail.com>
Date: Mon, 29 Oct 2012 20:09:55 +0100
Content-Transfer-Encoding: 7bit
Message-Id: <FAB76911-3ABB-4292-B55A-CF0DB11FBDD0@suse.de>
References: <cover.1351422116.git.blauwirbel@gmail.com>
	<83c3d36b6b36a2d4c6f045c46023a091bc5156bf.1351422116.git.blauwirbel@gmail.com>
To: Blue Swirl <blauwirbel@gmail.com>
X-Mailer: Apple Mail (2.1278)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 4/6] ppc: add missing static
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
X-List-Received-Date: Mon, 29 Oct 2012 19:10:17 -0000


On 28.10.2012, at 12:04, Blue Swirl wrote:

> Add missing 'static' qualifiers.
> 
> Signed-off-by: Blue Swirl <blauwirbel@gmail.com>

Acked-by: Alexander Graf <agraf@suse.de>


Alex


