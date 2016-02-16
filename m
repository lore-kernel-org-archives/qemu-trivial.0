Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aVjsM-0005SB-E7
	for mharc-qemu-trivial@gnu.org; Tue, 16 Feb 2016 12:57:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1aVjsJ-0005LQ-Bq
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 12:57:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1aVjsI-00031N-KG
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 12:57:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54252)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1aVjsG-00030b-QR; Tue, 16 Feb 2016 12:57:20 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 54406C0B66C0;
	Tue, 16 Feb 2016 17:57:20 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-108.phx2.redhat.com
	[10.3.113.108])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1GHvIYS022804; Tue, 16 Feb 2016 12:57:18 -0500
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455638581-5912-1-git-send-email-peter.maydell@linaro.org>
	<56C34F18.7090006@redhat.com> <56C3562C.8000503@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <56C362FD.7070008@redhat.com>
Date: Tue, 16 Feb 2016 18:57:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <56C3562C.8000503@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-options.hx: Improve
 documentation of chardev multiplexing mode
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
X-List-Received-Date: Tue, 16 Feb 2016 17:57:24 -0000

On 02/16/16 18:02, Paolo Bonzini wrote:
> 
> 
> On 16/02/2016 17:32, Laszlo Ersek wrote:
>> I'm a big fan of muxing the stdio backend between the (human) monitor
>> and the guest's serial console:
>>
>>   -chardev stdio,signal=off,mux=on,id=char0 \
>>   -mon chardev=char0,mode=readline,default \
>>   -serial chardev:char0 \
> 
> Or just "-serial mon:stdio". :)

For what reason on earth are these three *possible* at all to tie up
into a single command line option?

... I appreciate your teaching me ancient lores, but I think I just died
a little inside.

Laszlo


