Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hxTuh-000556-OV
	for mharc-qemu-trivial@gnu.org; Tue, 13 Aug 2019 06:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33178)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hxTug-000532-2P
 for qemu-trivial@nongnu.org; Tue, 13 Aug 2019 06:20:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hxTuf-0002QD-8H
 for qemu-trivial@nongnu.org; Tue, 13 Aug 2019 06:20:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41320)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>)
 id 1hxTud-0002O4-Bq; Tue, 13 Aug 2019 06:20:19 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3567430A5422;
 Tue, 13 Aug 2019 10:20:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C40B927085;
 Tue, 13 Aug 2019 10:20:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3B45D16E08; Tue, 13 Aug 2019 12:20:15 +0200 (CEST)
Date: Tue, 13 Aug 2019 12:20:15 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20190813102014.qokjrrp3mjotdi7r@sirius.home.kraxel.org>
References: <20190718193441.12490-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190718193441.12490-1-sw@weilnetz.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 13 Aug 2019 10:20:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] audio: Add missing fall through comments
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Aug 2019 10:20:22 -0000

On Thu, Jul 18, 2019 at 09:34:41PM +0200, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Added to audio queue.

thanks,
  Gerd


