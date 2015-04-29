Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnLpc-0002Xr-F7
	for mharc-qemu-trivial@gnu.org; Wed, 29 Apr 2015 02:50:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58036)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnLpZ-0002Us-J6
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 02:50:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnLpY-0003CB-MU
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 02:50:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45402)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YnLpR-00039J-OA; Wed, 29 Apr 2015 02:50:42 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 07FE542A60;
	Wed, 29 Apr 2015 09:50:41 +0300 (MSK)
Message-ID: <55407F40.3050608@msgid.tls.msk.ru>
Date: Wed, 29 Apr 2015 09:50:40 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Thomas Huth <thuth@redhat.com>
References: <1430153944-24368-1-git-send-email-thuth@redhat.com>	<55407B8B.1010803@msgid.tls.msk.ru>
	<20150429084335.24fbeb31@thh440s>
In-Reply-To: <20150429084335.24fbeb31@thh440s>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] kvm: Silence warning from valgrind
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
X-List-Received-Date: Wed, 29 Apr 2015 06:50:50 -0000

29.04.2015 09:43, Thomas Huth wrote:
> On Wed, 29 Apr 2015 09:34:51 +0300
> Michael Tokarev <mjt@tls.msk.ru> wrote:
[]
>> Hm.  So, what's the difference?  The same fields are assigned the same
>> values, why in first case we have some uninitialized data and in second
>> case everything is initialized?  Does struct initializer zero-fills all
>> other places (alignments, missing fields etc) ?
> 
> Right, the struct initializer fills the remaining fields with zeros.

Okay, point taken.  I just didn't know.

>> If yes, there's no need to assign zero to flags, btw ;)
> 
> True. Shall I sent a patch without that line?

I think it is better for readability to have it in.

Applied to -trivial, thank you!

/mjt

