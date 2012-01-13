Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rljcp-0007Qt-FS
	for mharc-qemu-trivial@gnu.org; Fri, 13 Jan 2012 11:05:07 -0500
Received: from eggs.gnu.org ([140.186.70.92]:36927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Rljcg-00076p-Jw
	for qemu-trivial@nongnu.org; Fri, 13 Jan 2012 11:05:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Rljcf-0003FD-A0
	for qemu-trivial@nongnu.org; Fri, 13 Jan 2012 11:04:58 -0500
Received: from mail-qy0-f173.google.com ([209.85.216.173]:45008)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1RljcU-0003EJ-Mg; Fri, 13 Jan 2012 11:04:46 -0500
Received: by qcsc2 with SMTP id c2so372543qcs.4
	for <multiple recipients>; Fri, 13 Jan 2012 08:04:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.224.106.196 with SMTP id y4mr2461495qao.90.1326470685956; Fri,
	13 Jan 2012 08:04:45 -0800 (PST)
Received: by 10.229.39.134 with HTTP; Fri, 13 Jan 2012 08:04:45 -0800 (PST)
In-Reply-To: <1325527237-24146-6-git-send-email-pbonzini@redhat.com>
References: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
	<1325527237-24146-6-git-send-email-pbonzini@redhat.com>
Date: Fri, 13 Jan 2012 16:04:45 +0000
Message-ID: <CAFEAcA9qj8xxvceFvRQhzaOen0tT5iUp91MWhZ0gZK5Mo23DQQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 5/8] qemu-queue: really
	simplify QSIMPLEQ
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
X-List-Received-Date: Fri, 13 Jan 2012 16:05:04 -0000

On 2 January 2012 18:00, Paolo Bonzini <pbonzini@redhat.com> wrote:
> QSIMPLEQ is still relatively heavyweight when used as a free list,
> compared to a simple singly-linked list. =C2=A0One disadvantage is that
> it requires an initializer macro, unlike for example QLIST.
>
> The patch removes the double links so that there is a "really really
> simple" queue type.

I don't think we should have macros that follow the standard
BSD queue.h naming pattern but don't work the same way...
And as Stefan says, without the INSERT_TAIL operation it isn't
actually a queue any more.

If you actually want a singly linked list I think you should
probably pull in the SLIST macros from BSD queue.h.
(http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys/queue.h?rev=3D1.53)

I think we'll then have the full set of data structures back
again (having added back simple-queues in commit c616bbe1).

-- PMM

