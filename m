Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gH3mj-0004n6-2G
	for mharc-qemu-trivial@gnu.org; Mon, 29 Oct 2018 05:24:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gH3mg-0004m5-Rz
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2018 05:24:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gH3mg-0002hb-AR
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2018 05:24:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38768)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1gH3ma-0002VQ-Ae; Mon, 29 Oct 2018 05:24:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C740230001EE;
	Mon, 29 Oct 2018 09:24:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-158.ams2.redhat.com
	[10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 80267608EE;
	Mon, 29 Oct 2018 09:24:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id AD3BD7731; Mon, 29 Oct 2018 10:24:20 +0100 (CET)
Date: Mon, 29 Oct 2018 10:24:20 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sebastian Krzyszkowiak <dos@dosowisko.net>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20181029092420.oevomnhk2uvg3xdp@sirius.home.kraxel.org>
References: <20181024143748.4425-1-dos@dosowisko.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181024143748.4425-1-dos@dosowisko.net>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Mon, 29 Oct 2018 09:24:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] SDL: set a hint to not bypass the window
 compositor
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
X-List-Received-Date: Mon, 29 Oct 2018 09:24:31 -0000

On Wed, Oct 24, 2018 at 04:37:48PM +0200, Sebastian Krzyszkowiak wrote:
> Without that, window effects in KWin get suspended as soon as any
> qemu-sdl window becomes visible. While the SDL default makes sense
> for games, it's not really suitable for QEMU.
> 
> Signed-off-by: Sebastian Krzyszkowiak <dos@dosowisko.net>

Added to UI patch queue.

thanks,
  Gerd


