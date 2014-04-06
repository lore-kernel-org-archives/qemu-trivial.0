Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WWgi7-00012L-VV
	for mharc-qemu-trivial@gnu.org; Sun, 06 Apr 2014 02:37:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WWgi1-0000uG-I3
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 02:37:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WWghw-00020F-Gj
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 02:37:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39308)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WWghm-0001y0-CC; Sun, 06 Apr 2014 02:37:22 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A4EAB40AFB;
	Sun,  6 Apr 2014 10:37:21 +0400 (MSK)
Message-ID: <5340F620.2000607@msgid.tls.msk.ru>
Date: Sun, 06 Apr 2014 10:37:20 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1395834349-19001-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1395834349-19001-1-git-send-email-pbonzini@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, eblake@redhat.com, qemu-devel@nongnu.org,
	armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v4] scripts: add sample model file for
 Coverity Scan
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
X-List-Received-Date: Sun, 06 Apr 2014 06:37:42 -0000

26.03.2014 15:45, Paolo Bonzini wrote:
> This is the model file that is being used for the QEMU project's scans
> on scan.coverity.com.  It fixed about 30 false positives (10% of the
> total) and exposed about 60 new memory leaks.
> 
> The file is not automatically used; changes to it must be propagated
> to the website manually by an admin (right now Markus, Peter and me
> are admins).

While we don't have issues with the model itself, but really wonder if we
should keep this file inside qemu sources.  It isn't used in there, as
explicitly stated above, and maybe it is easier to maintain it "closer"
to the website?

Thanks,

/mjt

