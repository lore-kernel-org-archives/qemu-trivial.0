Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T0p3J-0005wy-UJ
	for mharc-qemu-trivial@gnu.org; Mon, 13 Aug 2012 03:27:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1T0p3E-0005fc-BY
	for qemu-trivial@nongnu.org; Mon, 13 Aug 2012 03:27:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1T0p39-0007wn-Ux
	for qemu-trivial@nongnu.org; Mon, 13 Aug 2012 03:27:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:30227)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1T0p30-0007v0-V9; Mon, 13 Aug 2012 03:26:47 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7D7Qhg0005105
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 13 Aug 2012 03:26:43 -0400
Received: from dhcp-5-188.str.redhat.com (dhcp-5-175.str.redhat.com
	[10.32.5.175])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q7D7QdBJ030348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO);
	Mon, 13 Aug 2012 03:26:41 -0400
Message-ID: <5028AC2E.9060807@redhat.com>
Date: Mon, 13 Aug 2012 09:26:38 +0200
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1344720275-26744-1-git-send-email-peter.maydell@linaro.org>
	<50278638.4070206@msgid.tls.msk.ru>
In-Reply-To: <50278638.4070206@msgid.tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] iov_send_recv(): Handle zero bytes case
 even if OS does not
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
X-List-Received-Date: Mon, 13 Aug 2012 07:27:05 -0000

Am 12.08.2012 12:32, schrieb Michael Tokarev:
> On 12.08.2012 01:24, Peter Maydell wrote:
>> POSIX allows sendmsg() and recvmsg() to fail EMSGSIZE if passed a zero
>> msg.msg_iovlen (in particular the MacOS X implementation will do this).
>> Handle the case where iov_send_recv() is passed a zero byte count
>> explicitly, to avoid accidentally depending on the OS to treat zero
>> msg_iovlen as a no-op.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> This is what was causing 'make check' to fail on MacOS X.
>> The other option was to declare that a zero bytecount was illegal, I guess.
> 
> Acked-by: Michael Tokarev <mjt@tls.msk.ru>
> 
> Kevin, does this fix the test-iov failure you're seeing on one of
> the build bots?

It's not on a build bot but on my test machine, but yes, this does fix
it indeed. Thanks for looking into it, Peter!

Kevin

