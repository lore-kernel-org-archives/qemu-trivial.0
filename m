Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eECAZ-0000Mw-ME
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 05:40:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1eECAS-0000Kn-Si
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 05:40:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1eECAS-0005Y9-8g
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 05:40:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50018)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1eECAN-0005V8-03; Mon, 13 Nov 2017 05:40:35 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EBB1B6A7CA;
	Mon, 13 Nov 2017 10:40:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-18.ams2.redhat.com
	[10.36.116.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7FBA468D93;
	Mon, 13 Nov 2017 10:40:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 72C3BA20D; Mon, 13 Nov 2017 11:40:32 +0100 (CET)
Date: Mon, 13 Nov 2017 11:40:32 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org
Message-ID: <20171113104032.mchst26f5sskka3e@sirius.home.kraxel.org>
References: <1510564905-6185-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1510564905-6185-1-git-send-email-thuth@redhat.com>
User-Agent: NeoMutt/20171027
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 13 Nov 2017 10:40:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] scripts/make-release: No need to delete
 pixman/.git anymore
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
X-List-Received-Date: Mon, 13 Nov 2017 10:40:46 -0000

On Mon, Nov 13, 2017 at 10:21:45AM +0100, Thomas Huth wrote:
> The pixman submodule has been removed in commit c12b6d70e384c769ca372e1,
> so there is no need anymore to delete pixman/.git while building a
> release tarball.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


