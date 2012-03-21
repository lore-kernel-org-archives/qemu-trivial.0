Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SAJrC-0006HR-MO
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2012 07:37:34 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SAJr6-00060a-AQ
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 07:37:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SAJqz-0001iC-RZ
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 07:37:27 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:43475)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SAJqr-0001Zl-Bo; Wed, 21 Mar 2012 07:37:13 -0400
Received: by iafj26 with SMTP id j26so1661925iaf.4
	for <multiple recipients>; Wed, 21 Mar 2012 04:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=0uxtbkeOxkEcqNartBhpUA1Oyenx8vK9kPdcwJtAZP0=;
	b=dIryQthKGWFEU1P059X/MTNPlmveCOoOKpD2XdmS/Nuvxx3wZJ8tilngb72aysrxWM
	bHt6nKjeksfWLDIG2h0gzV4bv/Vjk28Q6T9YzJtBZskK7HwyNE8BY+UTgBcr/DqS6FKh
	5A659h0CsroI2xiTQKvFUCaFOyu7qEr71LyoCWW9N+njWQUA5hSFAarpfWAZaNU3tg/5
	5djmdE7kyeDFdxD+M08QSG9y4v5P02B+E9wuO7xl1VfEZRS7pGcMczoAFFXp6JzmIqSc
	muAQFVd18r+y/p1u6SYmdbns7k+RIScn+dYtYO4f58irBDUt/GeuF3NOgCN/R11eGzgs
	3fuQ==
MIME-Version: 1.0
Received: by 10.50.88.165 with SMTP id bh5mr2498684igb.28.1332329831004; Wed,
	21 Mar 2012 04:37:11 -0700 (PDT)
Received: by 10.231.65.16 with HTTP; Wed, 21 Mar 2012 04:37:10 -0700 (PDT)
In-Reply-To: <1332202706-25061-1-git-send-email-mdroth@linux.vnet.ibm.com>
References: <1332202706-25061-1-git-send-email-mdroth@linux.vnet.ibm.com>
Date: Wed, 21 Mar 2012 11:37:10 +0000
Message-ID: <CAJSP0QXFP-M-d0yX91qY-3--YNse=O=kvRhytZ=+3hmgyuD4AQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/3] test: remove qemu-ga
	reference
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
X-List-Received-Date: Wed, 21 Mar 2012 11:37:32 -0000

On Tue, Mar 20, 2012 at 12:18 AM, Michael Roth
<mdroth@linux.vnet.ibm.com> wrote:
> This was added by mistake a while back.
>
> Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
> ---
> =A0tests/Makefile | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)

After applying your series and rebuilding, I get the following error.
I checked that there are no auto-generated files left around after
make distclean.

$ make distclean
$ ./configure --target-list=3Dx86_64-softmmu --disable-werror
$ make
  GEN   x86_64-softmmu/config-devices.mak
  GEN   config-all-devices.mak
  GEN   qemu-options.texi
  GEN   qemu-monitor.texi
  GEN   qemu-img-cmds.texi
  GEN   qemu-doc.html
  GEN   qemu-tech.html
  GEN   qemu.1
  GEN   qemu-img.1
  GEN   qemu-nbd.8
  GEN   QMP/qmp-commands.txt
  GEN   config-host.h
  GEN   trace.h
  GEN   qemu-options.def
  GEN   qmp-commands.h
  GEN   qapi-types.h
  GEN   qapi-visit.h
  GEN   /home/stefanha/qemu/qapi-generated/qga-qapi-types.h
  GEN   /home/stefanha/qemu/qapi-generated/qga-qapi-visit.h
  GEN   /home/stefanha/qemu/qapi-generated/qga-qmp-commands.h
  CC    qemu-ga.o
  CC    qga/commands.o
qga/commands.c:15:30: fatal error: qga-qmp-commands.h: No such file or dire=
ctory
compilation terminated.
make: *** [qga/commands.o] Error 1

