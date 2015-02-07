Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YKCAh-0003GH-V0
	for mharc-qemu-trivial@gnu.org; Sat, 07 Feb 2015 15:40:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YKCAf-0003D8-Kp
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 15:40:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YKCAe-0002MP-U8
	for qemu-trivial@nongnu.org; Sat, 07 Feb 2015 15:40:05 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:54288)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YKCAa-0002EP-SK; Sat, 07 Feb 2015 15:40:01 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id EB88B41468;
	Sat,  7 Feb 2015 23:39:57 +0300 (MSK)
Message-ID: <54D6781D.7030400@msgid.tls.msk.ru>
Date: Sat, 07 Feb 2015 23:39:57 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>	<54D5D416.6040704@msgid.tls.msk.ru>
	<54D66F36.5080200@redhat.com>
In-Reply-To: <54D66F36.5080200@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Amit Shah <amit.shah@redhat.com>,
	armbru@redhat.com, Juan Quintela <quintela@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 0/7] Six coverity fixes and a cleanup
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
X-List-Received-Date: Sat, 07 Feb 2015 20:40:06 -0000

07.02.2015 23:01, Paolo Bonzini wrote:
> On 07/02/2015 10:00, Michael Tokarev wrote:
>>>> Patch 2 is the cleanup.  The other six patches make the tcg, utils and
>>>> migration components clean.
>> Applied to -trivial patches 1,2,3,4 and 6, not applied 5 (due to
>> questionable errno checking addition) and 7, due to a discussion.
> 
> Thanks, will resubmit 5.
> 
> Juan/Amit, can you pick up 7 which Juan has already reviewed?

I've no prob with 7, but please let's agree which way we're taking
there -- whenever subsequent fixes are needed, should be made on
the top of this change, or whole thing should be done differently.

Thanks.

/mjt

