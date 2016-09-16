Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bkv2t-0000ww-V1
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 11:27:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bkv2q-0000ty-OT
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 11:27:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bkv2o-0000zq-Nx
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 11:27:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53920)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1bkv2j-0000v2-UE; Fri, 16 Sep 2016 11:27:10 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6195C1BE2A9;
	Fri, 16 Sep 2016 15:27:08 +0000 (UTC)
Received: from redhat.com (vpn1-4-24.ams2.redhat.com [10.36.4.24])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GFR5Pp016629
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 16 Sep 2016 11:27:07 -0400
Date: Fri, 16 Sep 2016 16:27:05 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20160916152704.GD9654@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 16 Sep 2016 15:27:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 00/26] trivial: use
 exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
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
X-List-Received-Date: Fri, 16 Sep 2016 15:27:17 -0000

On Fri, Sep 16, 2016 at 03:55:51PM +0200, Laurent Vivier wrote:
> This series is the result of coccinelle patch
> scripts/coccinelle/exit.cocci
> provided by the first patch of the series.
> 
> It replaces exit(0) by exit(EXIT_SUCCESS)
> and exit(1) by exit(EXIT_FAILURE).

Some places use '_exit' and should have had the same
change applied AFAICT.

> All other exit() are not modified as we don't want
> to change the behavior.

IMHO, modifying the other exit() calls is precisely
what would make this series useful.

eg there's a bunch of places which arbitrarily use
'-1' instead of '1' as the value for no good reason.

Consolidating the inconsistent use of -1 and 1 would
have functional benefit.

Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://autobuild.org       -o-         http://search.cpan.org/~danberr/ :|
|: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc :|

