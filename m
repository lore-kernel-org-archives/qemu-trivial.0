Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d41fa-00016L-72
	for mharc-qemu-trivial@gnu.org; Fri, 28 Apr 2017 04:54:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1d41fX-00014h-FU
	for qemu-trivial@nongnu.org; Fri, 28 Apr 2017 04:54:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1d41fW-0001hv-P6
	for qemu-trivial@nongnu.org; Fri, 28 Apr 2017 04:54:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58548)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1d41fR-0001g3-E1; Fri, 28 Apr 2017 04:54:21 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D2AF5C04BD28;
	Fri, 28 Apr 2017 08:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D2AF5C04BD28
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=berrange@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D2AF5C04BD28
Received: from redhat.com (unknown [10.36.118.36])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E20E28B14C;
	Fri, 28 Apr 2017 08:54:10 +0000 (UTC)
Date: Fri, 28 Apr 2017 09:54:07 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, thuth@redhat.com,
	dgilbert@redhat.com, famz@redhat.com
Message-ID: <20170428085407.GC23819@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <20170428022329.30726-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20170428022329.30726-1-eblake@redhat.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 28 Apr 2017 08:54:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests: Ignore another built
 executable
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
X-List-Received-Date: Fri, 28 Apr 2017 08:54:28 -0000

On Thu, Apr 27, 2017 at 09:23:29PM -0500, Eric Blake wrote:
> Commit 78f86a2b7 added a new test, but forgot to exclude the built
> binary from version control.

CC Fam

I wonder if the patchew test system could be made to report an error
if git identifies built files that are not ignored.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

