Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qlimk-0002BJ-7d
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jul 2011 10:39:02 -0400
Received: from eggs.gnu.org ([140.186.70.92]:49005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Qlimh-000208-Dt
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2011 10:39:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Qlimg-0005wl-DH
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2011 10:38:59 -0400
Received: from mail-gy0-f173.google.com ([209.85.160.173]:47232)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1Qlime-0005wT-46; Tue, 26 Jul 2011 10:38:56 -0400
Received: by gyg8 with SMTP id 8so346736gyg.4
	for <multiple recipients>; Tue, 26 Jul 2011 07:38:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.142.195.7 with SMTP id s7mr3822511wff.15.1311691134752; Tue,
	26 Jul 2011 07:38:54 -0700 (PDT)
Received: by 10.143.61.7 with HTTP; Tue, 26 Jul 2011 07:38:54 -0700 (PDT)
In-Reply-To: <1311690791.7898.6.camel@d941e-10>
References: <1311690791.7898.6.camel@d941e-10>
Date: Tue, 26 Jul 2011 15:38:54 +0100
Message-ID: <CAFEAcA9DGt79M91VM8=S218WOuq2bHdgWuZtYQigfWPWObFu3w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.160.173
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix a compilation error in
	xen-mapcache.c
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
X-List-Received-Date: Tue, 26 Jul 2011 14:39:00 -0000

On 26 July 2011 15:33, Stefan Berger <stefanb@linux.vnet.ibm.com> wrote:
> This patch fixes a compilation error in xen-mapcache.c .
>
> /home/stefanb/qemu/qemu-git/xen-mapcache.c: In function =E2=80=98xen_ram_=
addr_from_mapcache=E2=80=99:
> /home/stefanb/qemu/qemu-git/xen-mapcache.c:240:42: error: variable =E2=80=
=98pentry=E2=80=99 set but not used [-Werror=3Dunused-but-set-variable]
> cc1: all warnings being treated as errors

Juan posted a fix for this back on the 11th:

http://patchwork.ozlabs.org/patch/104254/

-- PMM

