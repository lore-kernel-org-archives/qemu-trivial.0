Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eEGET-0005Ga-QE
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 10:01:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1eEGEM-00059M-EJ
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 10:01:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1eEGEJ-0001Lb-TI
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 10:00:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48224)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1eEGE7-0001F5-1v; Mon, 13 Nov 2017 10:00:43 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E53953D95D;
	Mon, 13 Nov 2017 15:00:41 +0000 (UTC)
Received: from localhost (ovpn-12-39.pek2.redhat.com [10.72.12.39])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 815E882482;
	Mon, 13 Nov 2017 15:00:39 +0000 (UTC)
Date: Mon, 13 Nov 2017 23:00:37 +0800
From: Fam Zheng <famz@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	peter.maydell@linaro.org, mdroth@linux.vnet.ibm.com, qemu-block@nongnu.org
Message-ID: <20171113145942.GA29617@lemon>
References: <151056619347.390.15270351875314848925@bafd83ae6430>
	<0241ad8e-dd22-a029-5918-62ed4c49cf47@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0241ad8e-dd22-a029-5918-62ed4c49cf47@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 13 Nov 2017 15:00:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] scripts/make-release: No
 need to delete pixman/.git anymore
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
X-List-Received-Date: Mon, 13 Nov 2017 15:01:04 -0000

On Mon, 11/13 10:48, Thomas Huth wrote:
> > 077         - output mismatch (see 077.out.bad)
> > --- /tmp/qemu-test/src/tests/qemu-iotests/077.out	2017-11-13 09:38:59.000000000 +0000
> > +++ /tmp/qemu-test/build/tests/qemu-iotests/077.out.bad	2017-11-13 09:41:20.601278693 +0000
> > @@ -56,9 +56,9 @@
> >  wrote XXX/XXX bytes at offset XXX
> >  XXX bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> >  blkdebug: Resuming request 'B'
> > +blkdebug: Resuming request 'A'
> >  wrote XXX/XXX bytes at offset XXX
> >  XXX bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> > -blkdebug: Resuming request 'A'
> >  wrote XXX/XXX bytes at offset XXX
> >  XXX bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> >  wrote XXX/XXX bytes at offset XXX
> That's certainly *not* caused by my patch. Is this already a known
> problem? Otherwise, Fam, could you please have a look at this?

I will try to fix the test.

Fam

