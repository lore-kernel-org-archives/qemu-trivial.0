Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RvpyO-0001Hg-IK
	for mharc-qemu-trivial@gnu.org; Fri, 10 Feb 2012 07:53:08 -0500
Received: from eggs.gnu.org ([140.186.70.92]:44739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Paul_Brook@mentor.com>) id 1RvpyF-0000oH-Qe
	for qemu-trivial@nongnu.org; Fri, 10 Feb 2012 07:53:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Paul_Brook@mentor.com>) id 1RvpyA-0001Ep-7w
	for qemu-trivial@nongnu.org; Fri, 10 Feb 2012 07:52:59 -0500
Received: from relay1.mentorg.com ([192.94.38.131]:40384)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Paul_Brook@mentor.com>)
	id 1Rvpy0-0001DU-Ep; Fri, 10 Feb 2012 07:52:44 -0500
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=EU1-MAIL.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Rvpxt-0002Cz-TG from Paul_Brook@mentor.com ;
	Fri, 10 Feb 2012 04:52:38 -0800
Received: from nowt.org ([172.30.64.210]) by EU1-MAIL.mgc.mentorg.com with
	Microsoft SMTPSVC(6.0.3790.1830); Fri, 10 Feb 2012 12:52:36 +0000
Received: from wren.localnet (wren.home [192.168.93.7])
	by nowt.org (Postfix) with ESMTP id 11F276EEE9;
	Fri, 10 Feb 2012 12:52:36 +0000 (GMT)
From: Paul Brook <paul@codesourcery.com>
Organization: Mentor Graphics
To: qemu-devel@nongnu.org
Date: Fri, 10 Feb 2012 12:52:35 +0000
User-Agent: KMail/1.13.7 (Linux/3.1.0-1-amd64; KDE/4.6.5; x86_64; ; )
References: <CAFKAgTdwXj_XZ3EOgwR0=x_biz6s=SJKVsKX5C+z38=SicWY2A@mail.gmail.com>
	<CAFKAgTe-7hZ1U-CE5khEQ792VxsEayuWG6rCmR2F0uuHi7O1PQ@mail.gmail.com>
	<20120210082350.GB17878@stefanha-thinkpad.localdomain>
In-Reply-To: <20120210082350.GB17878@stefanha-thinkpad.localdomain>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201202101252.35754.paul@codesourcery.com>
X-OriginalArrivalTime: 10 Feb 2012 12:52:36.0852 (UTC)
	FILETIME=[DD57C340:01CCE7F2]
X-detected-operating-system: by eggs.gnu.org: Solaris 10 (beta)
X-Received-From: 192.94.38.131
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	Andreas =?iso-8859-1?q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [TRIVIAL] sas_ss_flags bug for
	powerpc
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
X-List-Received-Date: Fri, 10 Feb 2012 12:53:05 -0000

> Changes which require knowledge of a specific device model are often not
> trivial to anyone who hasn't studied the specification.  So if the patch
> requires background knowledge of ppc ABI, hardware registers, etc then
> it's usually best sent to relevant subsystem maintainer (see
> ./MAINTAINERS).

I agree.

IMO It's important to distinguich between trivial patches, and simple patch=
es.
A trivial patch is one that can reasonably be approved by anyone.
If domain specific knowledge, or familiarity with particular code is requir=
ed=20
then a change is no longer trivial.  Even if it's a one-line change and the=
=20
right answer is "obvious" to the relevant maintainer.

> Basically I draw the line when it requires me too do too much background
> readying to be able to review the patch! ;

=46rom what I've seen you're doing a fairly good job at bouncing things bac=
k=20
when they aren't appropriate.

Paul

