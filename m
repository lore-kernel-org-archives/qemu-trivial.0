Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WX5gU-0008NJ-JD
	for mharc-qemu-trivial@gnu.org; Mon, 07 Apr 2014 05:17:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WX5gN-0008DL-8d
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 05:17:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WX5gI-0003S4-0T
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 05:17:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44954)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WX5g7-0003Qk-Kr; Mon, 07 Apr 2014 05:17:19 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C0C7C40C36;
	Mon,  7 Apr 2014 13:17:16 +0400 (MSK)
Message-ID: <53426D1C.4030709@msgid.tls.msk.ru>
Date: Mon, 07 Apr 2014 13:17:16 +0400
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
X-List-Received-Date: Mon, 07 Apr 2014 09:17:40 -0000

26.03.2014 15:45, Paolo Bonzini wrote:
> This is the model file that is being used for the QEMU project's scans
> on scan.coverity.com.  It fixed about 30 false positives (10% of the
> total) and exposed about 60 new memory leaks.
> 
> The file is not automatically used; changes to it must be propagated
> to the website manually by an admin (right now Markus, Peter and me
> are admins).

Applied to -trivial, thank you!

Note: I haven't actually checked this file for correctness myself ;)

/mjt

