Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7mnj-0005CI-L3
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 12:45:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1b7mnd-00058n-D6
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:45:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1b7mnc-0005NC-Ca
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:45:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50170)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1b7mnW-0005ML-QD; Tue, 31 May 2016 12:45:42 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A532710BD;
	Tue, 31 May 2016 16:45:42 +0000 (UTC)
Received: from redhat.com (vpn1-7-198.ams2.redhat.com [10.36.7.198])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VGjdwN011139
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 31 May 2016 12:45:41 -0400
Date: Tue, 31 May 2016 17:45:38 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20160531164538.GF21628@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
	<1464712565-14857-7-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1464712565-14857-7-git-send-email-lvivier@redhat.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 31 May 2016 16:45:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 06/16] crypto: Use DIV_ROUND_UP
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
X-List-Received-Date: Tue, 31 May 2016 16:45:54 -0000

On Tue, May 31, 2016 at 06:35:55PM +0200, Laurent Vivier wrote:
> Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).
> 
> This patch is the result of coccinelle script
> scripts/coccinelle/round.cocci
> 
> CC: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  crypto/block-luks.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Daniel P. Berrange <berrange@redhat.com>


Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://autobuild.org       -o-         http://search.cpan.org/~danberr/ :|
|: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc :|

