Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1duf8v-0000lg-5K
	for mharc-qemu-trivial@gnu.org; Wed, 20 Sep 2017 09:34:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1duf8m-0000db-0b
	for qemu-trivial@nongnu.org; Wed, 20 Sep 2017 09:34:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1duf8k-0008VC-Bm
	for qemu-trivial@nongnu.org; Wed, 20 Sep 2017 09:34:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58256)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1duf8b-0008P8-8P; Wed, 20 Sep 2017 09:34:01 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A139C074F0C;
	Wed, 20 Sep 2017 13:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1A139C074F0C
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=berrange@redhat.com
Received: from redhat.com (unknown [10.33.36.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5C6A60604;
	Wed, 20 Sep 2017 13:33:58 +0000 (UTC)
Date: Wed, 20 Sep 2017 14:33:55 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>,
	Jason Wang <jasowang@redhat.com>
Message-ID: <20170920133355.GB9947@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1495613046-6430-1-git-send-email-thuth@redhat.com>
	<5e647277-d688-071d-7def-bd8d57dd7e66@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5e647277-d688-071d-7def-bd8d57dd7e66@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 20 Sep 2017 13:34:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net: Mark the 'hubport'
 netdev as deprecated
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
X-List-Received-Date: Wed, 20 Sep 2017 13:34:19 -0000

On Wed, Sep 20, 2017 at 09:45:59AM +0200, Thomas Huth wrote:
> On 24.05.2017 10:04, Thomas Huth wrote:
> > The 'hubport' netdev is closely tied to the 'vlan' concept which
> > has been marked as deprecated in commit a2dbe1356faff3cb6 already.
> > Thus we should also mark the hubport netdevs as deprecated to make
> > the remaining users aware that they should not use this anymore.
> > 
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  net/hub.c       | 4 ++++
> >  qemu-options.hx | 6 ++++--
> >  2 files changed, 8 insertions(+), 2 deletions(-)

Needs to include a update to the qemu-doc.texi  "Deprecated features"
appendix

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

