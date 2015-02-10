Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL6zY-0006xh-S5
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 04:20:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YL6zW-0006uj-S6
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 04:20:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YL6zW-0002ug-5D
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 04:20:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35810)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1YL6zV-0002uS-QS; Tue, 10 Feb 2015 04:20:22 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1A9KJRI027299
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 10 Feb 2015 04:20:19 -0500
Received: from [10.36.112.30] (ovpn-112-30.ams2.redhat.com [10.36.112.30])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1A9JwTA024480
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Tue, 10 Feb 2015 04:20:06 -0500
Message-ID: <54D9CD3C.5050307@redhat.com>
Date: Tue, 10 Feb 2015 10:19:56 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
	<a7fa2e9783ee957635d23ddab151a8be97df5b2a.1423549659.git.mjt@msgid.tls.msk.ru>
	<CAFEAcA-wWs1sTvVwOTi6Q0rXAXOOO5kWMAaZ0se5asu97B4S5Q@mail.gmail.com>
In-Reply-To: <CAFEAcA-wWs1sTvVwOTi6Q0rXAXOOO5kWMAaZ0se5asu97B4S5Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 14/46] cpu-exec: drop dead
	assignment
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
X-List-Received-Date: Tue, 10 Feb 2015 09:20:23 -0000



On 10/02/2015 10:15, Peter Maydell wrote:
> > -                        tb = (TranslationBlock *)(next_tb & ~TB_EXIT_MASK);
> >                          next_tb = 0;
> >                          break;
> >                      case TB_EXIT_ICOUNT_EXPIRED:
>
> True, I guess, but presumably this means we're doing unnecessary
> work in the next time round the loop re-finding the tb which we
> already had...

This is the TB_EXIT_REQUESTED case though: once the iothread runs who
knows what happens.  You might get an interrupt or a system reset that
diverts execution away from tb.

Paolo

