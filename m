Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XPps6-0002Uq-Is
	for mharc-qemu-trivial@gnu.org; Fri, 05 Sep 2014 05:31:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1XPps0-0002T7-CK
	for qemu-trivial@nongnu.org; Fri, 05 Sep 2014 05:31:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1XPpru-0006tF-Vn
	for qemu-trivial@nongnu.org; Fri, 05 Sep 2014 05:31:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34191)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1XPpru-0006t6-Mm; Fri, 05 Sep 2014 05:31:46 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s859VeQI025617
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 5 Sep 2014 05:31:41 -0400
Received: from [10.36.116.46] (ovpn-116-46.ams2.redhat.com [10.36.116.46])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s859Vc1K032221; Fri, 5 Sep 2014 05:31:39 -0400
Message-ID: <1409909497.20018.9.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Date: Fri, 05 Sep 2014 11:31:37 +0200
In-Reply-To: <87bnqujv51.fsf@blackfin.pond.sub.org>
References: <1409115651-3612-1-git-send-email-john.liuli@huawei.com>
	<87iolefn36.fsf@blackfin.pond.sub.org> <53FD8B7D.7030301@huawei.com>
	<54091432.4050904@huawei.com> <87bnqujv51.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Li Liu <john.liuli@huawei.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-char: fix terminal
 crash when using "-monitor stdio -nographic"
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
X-List-Received-Date: Fri, 05 Sep 2014 09:31:57 -0000

On Fr, 2014-09-05 at 11:04 +0200, Markus Armbruster wrote:
> Li Liu <john.liuli@huawei.com> writes:
> 
> > Ping, any more comments? Thanks.
> 
> I'd like to hear Gerd's opinion (cc'ed).
> 
> >>> But is having multiple character devices use the same terminal valid?

No (guess we should catch that case in stdio init).

Beside the tty initialization and cleanup you also have the problem that
both users are racing for input.  Well, maybe not in the qemu case as it
is the same process and it very well might be that it polls the two
chardevs in a well defined order, so one of them gets all input and the
other gets nothing.  With two processes reading from the terminal (try
'cat | less') it is actually random though.

> >> I'm not sure. But I have found such comments in vl.c
> >> "According to documentation and historically, -nographic redirects
> >> serial port, parallel port and monitor to stdio"

In that case mux chardev is used (that is the piece which handles the
input switching between serial and monitor via 'Ctrl-A c').  There is
one stdio instance, and one mux instance, the mux is chained to stdio,
and mux allows multiple backends to connect.

You can construct it on the command line this way:

qemu -nographic -nodefaults \
   -chardev stdio,mux=on,id=terminal \
   -serial chardev:terminal \
   -monitor chardev:terminal

[ serial is default, so no output here, unless you boot a guest
  with serial console configured ]

[ Hit 'Ctrl-A h' now ]

C-a h    print this help
C-a x    exit emulator
C-a s    save disk data back to file (if -snapshot)
C-a t    toggle console timestamps
C-a b    send break (magic sysrq)
C-a c    switch between console and monitor
C-a C-a  sends C-a

[ Hit 'Ctrl-A c' now ]

QEMU 2.1.50 monitor - type 'help' for more information
(qemu) info chardev
terminal: filename=mux
terminal-base: filename=stdio
(qemu) 

HTH,
  Gerd



