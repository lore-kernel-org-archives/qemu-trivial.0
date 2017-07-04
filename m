Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dSP5j-0006wX-So
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jul 2017 10:46:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1dSP5h-0006uu-JO
	for qemu-trivial@nongnu.org; Tue, 04 Jul 2017 10:46:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1dSP5g-0000Bm-Cw
	for qemu-trivial@nongnu.org; Tue, 04 Jul 2017 10:46:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34382)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1dSP5b-00008l-7L; Tue, 04 Jul 2017 10:46:07 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 238423DBDD;
	Tue,  4 Jul 2017 14:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 238423DBDD
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=kwolf@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 238423DBDD
Received: from noname.str.redhat.com (dhcp-192-175.str.redhat.com
	[10.33.192.175])
	by smtp.corp.redhat.com (Postfix) with SMTP id D1C1F53CC2;
	Tue,  4 Jul 2017 14:46:00 +0000 (UTC)
Date: Tue, 4 Jul 2017 16:46:00 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>
Message-ID: <20170704144600.GH4253@noname.str.redhat.com>
References: <1497863771-24929-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1497863771-24929-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 04 Jul 2017 14:46:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] qemu-doc: Add missing "@c man end"
 statements
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
X-List-Received-Date: Tue, 04 Jul 2017 14:46:14 -0000

Am 19.06.2017 um 11:16 hat Thomas Huth geschrieben:
> Since commit 3f2ce724f1f1 ("Move the qemu-ga description into a
> separate chapter"), the qemu.1 man page looks pretty much screwed
> up, e.g. the title was "qemu-ga - QEMU Guest Agent" instead of
> "qemu-doc - QEMU Emulator User Documentation". However, that movement
> of the gemu-ga chapter is not the real problem, it just triggered
> another bug in the qemu-doc.texi: There are some parts in the file
> which introduce a "@c man begin OPTIONS" section, but never close
> it again with "@c man end". After adding the proper end tags here,
> the title of the man page is right again and the previously wrongly
> tagged sections now also show up correctly in the man page, too.
> 
> Reported-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Michael, do you want to take this through qemu-trivial?

Kevin

