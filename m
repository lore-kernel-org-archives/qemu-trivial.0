Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cwR9X-0001O7-1O
	for mharc-qemu-trivial@gnu.org; Fri, 07 Apr 2017 06:30:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1cwR9U-0001MG-UY
	for qemu-trivial@nongnu.org; Fri, 07 Apr 2017 06:30:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1cwR9U-0002Wd-74
	for qemu-trivial@nongnu.org; Fri, 07 Apr 2017 06:30:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46746)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1cwR9O-0002Ur-Sn; Fri, 07 Apr 2017 06:29:54 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D9D9C804E5;
	Fri,  7 Apr 2017 10:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D9D9C804E5
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=kraxel@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D9D9C804E5
Received: from nilsson.home.kraxel.org (ovpn-116-74.ams2.redhat.com
	[10.36.116.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 953FFAC169;
	Fri,  7 Apr 2017 10:29:53 +0000 (UTC)
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id CA90980C0E; Fri,  7 Apr 2017 12:29:52 +0200 (CEST)
Message-ID: <1491560992.26308.42.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 07 Apr 2017 12:29:52 +0200
In-Reply-To: <20170403114044.15762-1-lvivier@redhat.com>
References: <20170403114044.15762-1-lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 07 Apr 2017 10:29:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] virtio-gpu: replace PIXMAN_* by
 PIXMAN_BE_*
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
X-List-Received-Date: Fri, 07 Apr 2017 10:30:01 -0000

On Mo, 2017-04-03 at 13:40 +0200, Laurent Vivier wrote:
> This avoids a "#ifdef HOST_WORDS_BIGENDIAN" and this is the purpose
> of PIXMAN_BE_* macros.

Added to vga queue (for 2.10).

thanks,
  Gerd


