Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WCnz6-0001Cl-3M
	for mharc-qemu-trivial@gnu.org; Mon, 10 Feb 2014 05:21:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1WCnyz-00014N-Vt
	for qemu-trivial@nongnu.org; Mon, 10 Feb 2014 05:21:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1WCnyv-0008Qy-47
	for qemu-trivial@nongnu.org; Mon, 10 Feb 2014 05:20:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:25285)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1WCnyk-0008PJ-Jq; Mon, 10 Feb 2014 05:20:42 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1AAKcEE018324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 10 Feb 2014 05:20:38 -0500
Received: from localhost ([10.34.251.12])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s1AAKZpu007176; Mon, 10 Feb 2014 05:20:37 -0500
Date: Mon, 10 Feb 2014 11:20:34 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140210102034.GA15227@stefanha-thinkpad.brq.redhat.com>
References: <1391700611-32893-1-git-send-email-agraf@suse.de>
	<52F485C5.1020107@msgid.tls.msk.ru>
	<0C8B4C82-8DB7-4B5E-81F0-0C321856BB70@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0C8B4C82-8DB7-4B5E-81F0-0C321856BB70@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Dmitry Fleytman <dmitry@daynix.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	Alexander Graf <agraf@suse.de>, Anthony Liguori <aliguori@amazon.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net: Include iov.h in
	checksum.h
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Feb 2014 10:21:02 -0000

On Fri, Feb 07, 2014 at 08:54:00AM +0100, Alexander Graf wrote:
> 
> 
> > Am 07.02.2014 um 08:05 schrieb Michael Tokarev <mjt@tls.msk.ru>:
> > 
> > 06.02.2014 19:30, Alexander Graf wrote:
> >> The checksum calculation header exports a function that refers to struct
> >> iov which is defined in iov.h. Include the header so that the compiler
> >> knows what this struct is about.
> > 
> > Alternatively (and I sometimes prefer it this way), one can just
> > declare `struct iovec;' instead of including whole header, because
> > we don't actually use any definitions from there, and users of
> > checksum.h wont be including extra dependencies which they don't
> > use...  Like this:
> 
> Either way works for me :)

Yes, please take one of them via -trivial.

Stefan

