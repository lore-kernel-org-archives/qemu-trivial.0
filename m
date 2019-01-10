Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghW4W-00010r-FG
	for mharc-qemu-trivial@gnu.org; Thu, 10 Jan 2019 03:52:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1ghW4U-0000zp-8Q
	for qemu-trivial@nongnu.org; Thu, 10 Jan 2019 03:52:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1ghW4T-0000EM-KR
	for qemu-trivial@nongnu.org; Thu, 10 Jan 2019 03:52:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:64264)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1ghW4Q-0000Cr-So; Thu, 10 Jan 2019 03:52:11 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 266CF796E2;
	Thu, 10 Jan 2019 08:52:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-203.ams2.redhat.com
	[10.36.116.203])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 53CC65D739;
	Thu, 10 Jan 2019 08:52:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id ED9D916E03; Thu, 10 Jan 2019 09:52:06 +0100 (CET)
Date: Thu, 10 Jan 2019 09:52:06 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, qemu-arm@nongnu.org
Message-ID: <20190110085206.ain25ervr4aduqyb@sirius.home.kraxel.org>
References: <1546614146-10525-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1546614146-10525-1-git-send-email-thuth@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 10 Jan 2019 08:52:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] hw/audio/marvell: Don't include
 unnecessary i2c.h header file
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
X-List-Received-Date: Thu, 10 Jan 2019 08:52:15 -0000

On Fri, Jan 04, 2019 at 04:02:26PM +0100, Thomas Huth wrote:
> This device does not use I2C, so no need to include the header file here.

Added to audio queue.

thanks,
  Gerd


