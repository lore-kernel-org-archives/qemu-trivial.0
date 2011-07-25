Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlIC5-0006Qg-VQ
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jul 2011 06:15:25 -0400
Received: from eggs.gnu.org ([140.186.70.92]:46364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QlIC3-0006JT-Kp
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 06:15:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QlIC2-0002q0-JC
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 06:15:23 -0400
Received: from mail-gx0-f173.google.com ([209.85.161.173]:62448)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QlIC0-0002pa-Ne; Mon, 25 Jul 2011 06:15:20 -0400
Received: by gxk26 with SMTP id 26so2526574gxk.4
	for <multiple recipients>; Mon, 25 Jul 2011 03:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=CJHwlivSmyJvlCsKtKcyLIA8LAybRGz9yafdcQnkjUM=;
	b=SQly/0U+muoPGA5jMBULGA1SuvYLM4MU7qpY6Amaa5bnbr29IwdpN+PyHbT+5ZWUv3
	gqnBvWr03muhVXFb5XIJw/CkAxzO6qjy8jkCTkmv5z+oU/KVmZdVs5EXPdZixbY5tI8W
	dIUUtxaEAd3X8oOqmFISXjyRmF0vi/bgdcEJQ=
MIME-Version: 1.0
Received: by 10.147.52.22 with SMTP id e22mr3819123yak.39.1311588920019; Mon,
	25 Jul 2011 03:15:20 -0700 (PDT)
Received: by 10.147.125.14 with HTTP; Mon, 25 Jul 2011 03:15:19 -0700 (PDT)
In-Reply-To: <1311223307-29486-1-git-send-email-cerbere@gmail.com>
References: <1311223307-29486-1-git-send-email-cerbere@gmail.com>
Date: Mon, 25 Jul 2011 11:15:19 +0100
Message-ID: <CAJSP0QWn_wU_3q8r=q4Fqey=jSgzi__V_iJ1EyY0OA6Nnu_-8Q@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alexandre Raymond <cerbere@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Makefile: fix out-of-tree builds
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
X-List-Received-Date: Mon, 25 Jul 2011 10:15:24 -0000

On Thu, Jul 21, 2011 at 5:41 AM, Alexandre Raymond <cerbere@gmail.com> wrot=
e:
> This patch fixes a minor bugs which prevented QEMU from being built
> out of tree.
>
> Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
> ---
> =A0Makefile | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)

I don't normally use --source-path but it still seems broken to me
after applying your patch?

$ cd /tmp; mkdir out; cd out
$ ~/qemu/configure --source-path=3D$HOME/qemu
$ make
  GEN   config-all-devices.mak
cat: i386-softmmu/config-devices.mak: No such file or directory
cat: x86_64-softmmu/config-devices.mak: No such file or directory
cat: alpha-softmmu/config-devices.mak: No such file or directory

Stefan

