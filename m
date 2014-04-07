Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WX6KO-0000Kt-2P
	for mharc-qemu-trivial@gnu.org; Mon, 07 Apr 2014 05:58:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WX6KI-0000EL-En
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 05:58:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WX6KD-0000tX-Ur
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 05:58:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34241)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1WX6K4-0000qw-K7; Mon, 07 Apr 2014 05:58:36 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s379wYTA014616
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 7 Apr 2014 05:58:35 -0400
Received: from blackfin.pond.sub.org (ovpn-116-40.ams2.redhat.com
	[10.36.116.40])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s379wWGo023256
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 7 Apr 2014 05:58:33 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 84D04200D1; Mon,  7 Apr 2014 11:58:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1395834349-19001-1-git-send-email-pbonzini@redhat.com>
	<53426D1C.4030709@msgid.tls.msk.ru>
Date: Mon, 07 Apr 2014 11:58:31 +0200
In-Reply-To: <53426D1C.4030709@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Mon, 07 Apr 2014 13:17:16 +0400")
Message-ID: <87fvlpihq0.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
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
X-List-Received-Date: Mon, 07 Apr 2014 09:58:55 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 26.03.2014 15:45, Paolo Bonzini wrote:
>> This is the model file that is being used for the QEMU project's scans
>> on scan.coverity.com.  It fixed about 30 false positives (10% of the
>> total) and exposed about 60 new memory leaks.
>> 
>> The file is not automatically used; changes to it must be propagated
>> to the website manually by an admin (right now Markus, Peter and me
>> are admins).
>
> Applied to -trivial, thank you!
>
> Note: I haven't actually checked this file for correctness myself ;)

I checked v2.  I suggested a few minor improvements, and some of them
made it into this version.

Since Paolo's initial version comes in part from me, I guess it would be
proper to add

Signed-off-by: Markus Armbruster <armbru@redhat.com>

