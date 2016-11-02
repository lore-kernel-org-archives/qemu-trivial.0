Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1wRM-0003jL-Sd
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 10:22:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1c1wRG-0003fJ-By
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 10:22:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1c1wRF-00011u-7n
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 10:22:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39968)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1c1wRA-00010y-PE; Wed, 02 Nov 2016 10:22:44 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E7E7C61BB7;
	Wed,  2 Nov 2016 14:22:43 +0000 (UTC)
Received: from redhat.com (vpn-239-241.phx2.redhat.com [10.3.239.241])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA2EMeZb002701
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 2 Nov 2016 10:22:42 -0400
Date: Wed, 2 Nov 2016 14:22:39 +0000
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Message-ID: <20161102142239.GA17900@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1478096330-18081-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1478096330-18081-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 02 Nov 2016 14:22:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] vl.c: move pidfile
 creation up the line
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
X-List-Received-Date: Wed, 02 Nov 2016 14:22:55 -0000

On Wed, Nov 02, 2016 at 05:18:50PM +0300, Michael Tokarev wrote:
> With current code, pid file is open after various
> sockets, chardevs, fsdevs and the like.  This causes
> interesting effects, for example when monitor is a
> unix-socket, and another qemu instance is already
> running, new qemu first "damages" the socket and
> next complain that it can't acquire the pid file and
> exits, making running qemu unreachable.
> 
> Move pid file creation earlier, right after the call
> to os_daemonize(), where we know our process id (pid).
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  vl.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Daniel P. Berrange <berrange@redhat.com>


Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://entangle-photo.org       -o-    http://search.cpan.org/~danberr/ :|

