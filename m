Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WX4e0-0003GX-Gv
	for mharc-qemu-trivial@gnu.org; Mon, 07 Apr 2014 04:11:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1WX4ds-0002wy-1L
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 04:11:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1WX4dk-0006z9-RM
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 04:10:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:64370)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1WX4dk-0006yX-Iz; Mon, 07 Apr 2014 04:10:48 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s378AhdL012228
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 7 Apr 2014 04:10:44 -0400
Received: from work-vm (vpn1-6-73.ams2.redhat.com [10.36.6.73])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s378ADwR005812
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Mon, 7 Apr 2014 04:10:16 -0400
Date: Mon, 7 Apr 2014 09:10:13 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140407081012.GA2400@work-vm>
References: <1395834349-19001-1-git-send-email-pbonzini@redhat.com>
	<5340F620.2000607@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5340F620.2000607@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, armbru@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4] scripts: add sample
 model file for Coverity Scan
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
X-List-Received-Date: Mon, 07 Apr 2014 08:11:02 -0000

* Michael Tokarev (mjt@tls.msk.ru) wrote:
> 26.03.2014 15:45, Paolo Bonzini wrote:
> > This is the model file that is being used for the QEMU project's scans
> > on scan.coverity.com.  It fixed about 30 false positives (10% of the
> > total) and exposed about 60 new memory leaks.
> > 
> > The file is not automatically used; changes to it must be propagated
> > to the website manually by an admin (right now Markus, Peter and me
> > are admins).
> 
> While we don't have issues with the model itself, but really wonder if we
> should keep this file inside qemu sources.  It isn't used in there, as
> explicitly stated above, and maybe it is easier to maintain it "closer"
> to the website?

Given that the model file describes semantics of functions in the codebase
it needs to be kept consistent with the version of the code.
Hence it needs to be version controlled with the code, hence the best place
is inside the qemu sources.

Dave
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

