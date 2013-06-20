Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UpX8S-0005aG-Hf
	for mharc-qemu-trivial@gnu.org; Thu, 20 Jun 2013 01:10:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UpX8Q-0005Z1-VL
	for qemu-trivial@nongnu.org; Thu, 20 Jun 2013 01:10:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UpX8Q-0001YX-1Q
	for qemu-trivial@nongnu.org; Thu, 20 Jun 2013 01:10:14 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38383)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UpX8N-0001XF-NC; Thu, 20 Jun 2013 01:10:11 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0CD7941BFC;
	Thu, 20 Jun 2013 09:10:09 +0400 (MSK)
Message-ID: <51C28EB0.3040508@msgid.tls.msk.ru>
Date: Thu, 20 Jun 2013 09:10:08 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Alexander Graf <agraf@suse.de>
References: <1371676109-16313-1-git-send-email-sw@weilnetz.de>
	<44C4E791-957F-4B61-BE3D-DDB1E3F2238D@suse.de>
In-Reply-To: <44C4E791-957F-4B61-BE3D-DDB1E3F2238D@suse.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pseries: Fix compiler
 warning (conversion of pointer to integral value)
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
X-List-Received-Date: Thu, 20 Jun 2013 05:10:16 -0000

20.06.2013 01:40, Alexander Graf wrote:
> 
> On 19.06.2013, at 23:08, Stefan Weil wrote:
> 
>> This kind of type cast must use uintptr_t or target_ulong to be portable
>> for hosts with sizeof(void *) != sizeof(long).
>>
>> Here the value is assigned to a variable of type target_ulong.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> 
> Acked-by: Alexander Graf <agraf@suse.de>
> 
> I suppose this one goes through the trivial tree?

Anything which goes to -trivial can be applied directly or
into some other subsystem tree first.  When I send a pull
request I rebase trivial tree ontop of current master and
filter out anything which has been already applied, so that's
not an issue.  The only possible issue is when you applied
it to some other tree, and -trivial pull request were handled
before that other tree - how that will be handled by git?

Will it complain (so that the situation should be resolved
manually), will it apply nothing or will it appy an empty
patch?  (the patch signature will be different, with
different S-o-b.)  I think I've seen empty commits before
in qemu tree, with the same subject/author as some previous
commit.

Thanks,

/mjt

