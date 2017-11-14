Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eEXxl-0003gU-Pu
	for mharc-qemu-trivial@gnu.org; Tue, 14 Nov 2017 04:57:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1eEXxj-0003X9-5I
	for qemu-trivial@nongnu.org; Tue, 14 Nov 2017 04:57:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1eEXxi-0006U5-42
	for qemu-trivial@nongnu.org; Tue, 14 Nov 2017 04:56:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46342)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1eEXxP-0006Ed-8E; Tue, 14 Nov 2017 04:56:39 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1ADF776543;
	Tue, 14 Nov 2017 09:56:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-18.ams2.redhat.com
	[10.36.116.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC0FB2C311;
	Tue, 14 Nov 2017 09:56:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 01F18A1F4; Tue, 14 Nov 2017 10:56:31 +0100 (CET)
Date: Tue, 14 Nov 2017 10:56:30 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, alistair23@gmail.com,
	armbru@redhat.com, Andrzej Zaborowski <balrogg@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <famz@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
	qemu-block@nongnu.org, xen-devel@lists.xenproject.org
Message-ID: <20171114095630.2v4lzfxlmpom33mi@sirius.home.kraxel.org>
References: <cover.1510612380.git.alistair.francis@xilinx.com>
	<67465b2020def3680dfd15d6473d3316c3fc8be0.1510612380.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67465b2020def3680dfd15d6473d3316c3fc8be0.1510612380.git.alistair.francis@xilinx.com>
User-Agent: NeoMutt/20171027
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 14 Nov 2017 09:56:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v5 02/29] Replace all occurances of
 __FUNCTION__ with __func__
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Nov 2017 09:57:00 -0000

On Mon, Nov 13, 2017 at 02:34:42PM -0800, Alistair Francis wrote:
> Replace all occurs of __FUNCTION__ except for the check in checkpatch
> with the non GCC specific __func__.
> 
> One line in hcd-musb.c was manually tweaked to pass checkpatch.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Andrzej Zaborowski <balrogg@gmail.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Yongbok Kim <yongbok.kim@imgtec.com>
> Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Fam Zheng <famz@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-block@nongnu.org
> Cc: xen-devel@lists.xenproject.org
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

