Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqwWM-0005ks-W2
	for mharc-qemu-trivial@gnu.org; Tue, 05 Feb 2019 03:55:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gqwWL-0005jp-AF
	for qemu-trivial@nongnu.org; Tue, 05 Feb 2019 03:55:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gqwWD-0005Jx-QD
	for qemu-trivial@nongnu.org; Tue, 05 Feb 2019 03:55:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:63265)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1gqwVr-0004YS-EQ; Tue, 05 Feb 2019 03:55:27 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 836EF36807;
	Tue,  5 Feb 2019 08:55:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-249.ams2.redhat.com
	[10.36.116.249])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 35E34189E9;
	Tue,  5 Feb 2019 08:55:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 8974B9D85; Tue,  5 Feb 2019 09:55:25 +0100 (CET)
Date: Tue, 5 Feb 2019 09:55:25 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Message-ID: <20190205085525.jc6zj6p5jbcngcmk@sirius.home.kraxel.org>
References: <1549282241-23535-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1549282241-23535-1-git-send-email-thuth@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 05 Feb 2019 08:55:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2] ui/sdl_keysym: Remove obsolete SDL1.2
 related code
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
X-List-Received-Date: Tue, 05 Feb 2019 08:55:58 -0000

On Mon, Feb 04, 2019 at 01:10:41PM +0100, Thomas Huth wrote:
> sdl_keysym.h has only been included by sdl.c which has recently been
> removed recently with this commit:
> 
>   0015ca5cbabe0b31d31610ddfaafd90a9e5911a4
>   ("ui: remove support for SDL1.2 in favour of SDL2")
> 
> So we can drop this header file now completely, too.

Added to UI queue.

thanks,
  Gerd


