Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zbpwx-0005ko-6y
	for mharc-qemu-trivial@gnu.org; Tue, 15 Sep 2015 09:07:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dddgogo000@gmail.com>) id 1Zbk5U-00060k-3F
	for qemu-trivial@nongnu.org; Tue, 15 Sep 2015 02:51:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dddgogo000@gmail.com>) id 1Zbk5S-0004Jm-UA
	for qemu-trivial@nongnu.org; Tue, 15 Sep 2015 02:51:32 -0400
Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a]:38681)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dddgogo000@gmail.com>)
	id 1Zbk5O-0004Ce-Gy; Tue, 15 Sep 2015 02:51:26 -0400
Received: by wiclk2 with SMTP id lk2so12994753wic.1;
	Mon, 14 Sep 2015 23:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=vA7MViISg+ETlAM2l7Bz+P5NG7glxJzj3NA7rYMNS4U=;
	b=x95Nv/L8ZH2gfSJnYIduIz2ESfYL/MHNiDPRbSMpY5RdI7jEuJey+QsKe4nuqSX6VW
	w63Ej4P/YX1ESiMKK7Ke9pQmgVedZhe03yg6eT6ZKiI8B/CeY2XQx0nuPaYolnanE+a1
	eJQxCcWSN4L5N76uHNRX3lnGAMfTyGlPR4qW9w2W6LdzRDjHiNztCtqHUeZQ4JiHJKtw
	4KefqzQNNhZUjy9jZUYsROj6D4XyyfwrvbTkr6a6iPwLrbkYq4KCOQrM9a9eIFL1e6dA
	RiEX/mcb2ZQIzDoV2dkJdlppcXWxteXumKR9bnmzZetwND4p9Y2IJMgkNr8wHn4CTMH4
	xm5A==
MIME-Version: 1.0
X-Received: by 10.180.20.166 with SMTP id o6mr3923432wie.48.1442299884828;
	Mon, 14 Sep 2015 23:51:24 -0700 (PDT)
Received: by 10.27.108.142 with HTTP; Mon, 14 Sep 2015 23:51:24 -0700 (PDT)
Date: Tue, 15 Sep 2015 14:51:24 +0800
Message-ID: <CAFuKiSqtU13bLgZzunsDbvqcRDuTzSy5ZRB9on0d7EtNR8n+Gg@mail.gmail.com>
From: tseng gogo <dddgogo000@gmail.com>
To: qemu-stable@nongnu.org, qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary=bcaec53f37014b7c90051fc39c49
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22a
X-Mailman-Approved-At: Tue, 15 Sep 2015 09:07:05 -0400
Subject: [Qemu-trivial] About qemu-kvm branch
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
X-List-Received-Date: Tue, 15 Sep 2015 06:51:33 -0000

--bcaec53f37014b7c90051fc39c49
Content-Type: text/plain; charset=UTF-8

Hi ,

    Sorry in advance that I am not sure that if I ask this question here is
appropriate. I am new to use KVM and want to do some research in qemu-kvm
live migration.

    In my environment, I install centos 7.0 with rpm install qemu-kvm
1.5.3, but what I want to do research is the source code. So I try to find
qemu-kvm 1.5.3 on the Internet, but there is nothing I can find.

    I tried to git clone to git://
git.kernel.org/pub/scm/virt/kvm/qemu-kvm.git, but the qemu-kvm which I git
clone is version 1.2.5.

    Can someone tell me that where can I find the qemu-kvm 1.5.3 source
code branch? Also what I have googled saying that qemu-kvm fork is
deprecated, is this mean that if we want to use the latest version
qemu-kvm, we should download the qemu and configure it?

    Thank everyone in advance!

--bcaec53f37014b7c90051fc39c49
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi ,</div><div><br></div><div>=C2=A0 =C2=A0 Sorry in =
advance that I am not sure that if I ask this question here is appropriate.=
 I am new to use KVM and want to do some research in qemu-kvm live migratio=
n.</div><div><br></div><div>=C2=A0 =C2=A0 In my environment, I install cent=
os 7.0 with rpm install qemu-kvm 1.5.3, but what I want to do research is t=
he source code. So I try to find qemu-kvm 1.5.3 on the Internet, but there =
is nothing I can find.</div><div><br></div><div>=C2=A0 =C2=A0 I tried to gi=
t clone to git://<a href=3D"http://git.kernel.org/pub/scm/virt/kvm/qemu-kvm=
.git">git.kernel.org/pub/scm/virt/kvm/qemu-kvm.git</a>, but the qemu-kvm wh=
ich I git clone is version 1.2.5.</div><div><br></div><div>=C2=A0 =C2=A0 Ca=
n someone tell me that where can I find the qemu-kvm 1.5.3 source code bran=
ch? Also what I have googled saying that qemu-kvm fork is deprecated, is th=
is mean that if we want to use the latest version qemu-kvm, we should downl=
oad the qemu and configure it?</div><div><br></div><div>=C2=A0 =C2=A0 Thank=
 everyone in advance!=C2=A0</div></div>

--bcaec53f37014b7c90051fc39c49--

