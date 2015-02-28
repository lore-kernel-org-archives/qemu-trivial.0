Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRe8M-0005ha-Ct
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 04:56:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YRe8K-0005ca-4v
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:56:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YRe8J-0003sI-7k
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:56:28 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:39953)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YRe8D-0003rs-7z; Sat, 28 Feb 2015 04:56:21 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7FB6843EE1;
	Sat, 28 Feb 2015 12:56:20 +0300 (MSK)
Message-ID: <54F190C4.4070205@msgid.tls.msk.ru>
Date: Sat, 28 Feb 2015 12:56:20 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, Cole Robinson <crobinso@redhat.com>, 
	qemu-devel@nongnu.org
References: <60b9a8741264d4fc7042ae560ea859cd62babd1e.1425050482.git.crobinso@redhat.com>
	<54F09C57.3030702@redhat.com>
In-Reply-To: <54F09C57.3030702@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] gitignore: Track common.env in iotests
	gitignore
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
X-List-Received-Date: Sat, 28 Feb 2015 09:56:29 -0000

27.02.2015 19:33, Eric Blake wrote:
> On 02/27/2015 08:21 AM, Cole Robinson wrote:
>> Rather than track it in the toplevel gitignore
>>
>> Signed-off-by: Cole Robinson <crobinso@redhat.com>
>> ---
>>  .gitignore                    | 1 -
>>  tests/qemu-iotests/.gitignore | 1 +
>>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> I think that the fact that we have multiple .gitignore is confusing, and
> would personally lean towards a patch that consolidates ALL ignores into
> a single top-level file, instead of having to hunt multiple files for
> patterns.  But my opinion on this matter is not strong enough for me to
> provide a patch at this time...

Since tests/ is kind of special because it generates so many
various files in there, I think it is reasonable to have separate
.gitignore files in there.

Thanks,

/mjt

