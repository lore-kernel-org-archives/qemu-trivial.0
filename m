Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TXquK-0005BS-Tw
	for mharc-qemu-trivial@gnu.org; Mon, 12 Nov 2012 05:06:20 -0500
Received: from eggs.gnu.org ([208.118.235.92]:60835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1TXquF-000599-Jg
	for qemu-trivial@nongnu.org; Mon, 12 Nov 2012 05:06:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1TXquC-0000Jf-HG
	for qemu-trivial@nongnu.org; Mon, 12 Nov 2012 05:06:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:20119)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1TXquC-0000JY-9c; Mon, 12 Nov 2012 05:06:12 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qACA6Adx010397
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 12 Nov 2012 05:06:10 -0500
Received: from dhcp-5-188.str.redhat.com (vpn1-5-133.ams2.redhat.com
	[10.36.5.133])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id qACA67df018163
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 12 Nov 2012 05:06:08 -0500
Message-ID: <50A0CA0F.102@redhat.com>
Date: Mon, 12 Nov 2012 11:06:07 +0100
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1352027374-30796-1-git-send-email-sw@weilnetz.de>
	<20121105055739.GA2452@stefanha-thinkpad.redhat.com>
In-Reply-To: <20121105055739.GA2452@stefanha-thinkpad.redhat.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] block: Workaround for older versions of
 MinGW gcc
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
X-List-Received-Date: Mon, 12 Nov 2012 10:06:18 -0000

Am 05.11.2012 06:57, schrieb Stefan Hajnoczi:
> On Sun, Nov 04, 2012 at 12:09:34PM +0100, Stefan Weil wrote:
>> Versions before gcc-4.6 don't support unnamed fields in initializers
>> (see http://gcc.gnu.org/bugzilla/show_bug.cgi?id=10676).
>>
>> Offset and OffsetHigh belong to an unnamed struct which is part of an
>> unnamed union. Therefore the original code does not work with older
>> versions of gcc.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>
>> This patch is needed for Debian's amd64-mingw32msvc-gcc-4.4.4
>> which I use for MinGW-w64 cross compilation.
>>
>> Regards
>> Stefan W.
>>
>>  block/win32-aio.c |   10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Thanks, applied to the block branch.

Kevin

