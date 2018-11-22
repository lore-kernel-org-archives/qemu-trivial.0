Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPngj-0005bv-DF
	for mharc-qemu-trivial@gnu.org; Thu, 22 Nov 2018 07:02:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gPngh-0005aa-2T
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 07:02:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gPngb-0005ln-1x
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 07:02:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38834)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1gPngO-0005Mo-GG; Thu, 22 Nov 2018 07:02:10 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4A3E63001567;
	Thu, 22 Nov 2018 12:02:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-59.ams2.redhat.com
	[10.36.116.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F2BEF27CA2;
	Thu, 22 Nov 2018 12:02:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id E1AF55BDF7; Thu, 22 Nov 2018 13:02:05 +0100 (CET)
Date: Thu, 22 Nov 2018 13:02:05 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20181122120205.jhmzcd6h2nmnytyu@sirius.home.kraxel.org>
References: <20181121203720.75916-1-r.bolshakov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181121203720.75916-1-r.bolshakov@yadro.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 22 Nov 2018 12:02:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] roms: seabios: Rename
 CROSS_COMPILE to CROSS_PREFIX
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
X-List-Received-Date: Thu, 22 Nov 2018 12:02:27 -0000

On Wed, Nov 21, 2018 at 11:37:21PM +0300, Roman Bolshakov wrote:
> SeaBIOS introduced CROSS_PREFIX in 2013 but it's not set in roms
> Makefile.

> -		CROSS_COMPILE=$(x86_64_cross_prefix) \
> +		CROSS_PREFIX=$(x86_64_cross_prefix) \

I'm wondering how that slipped though, IIRC I had actually tested
seabios crossbuilds ...

Queued up (for 4.0).

thanks,
  Gerd


