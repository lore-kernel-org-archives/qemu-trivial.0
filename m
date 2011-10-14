Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1REjJh-0004tq-0N
	for mharc-qemu-trivial@gnu.org; Fri, 14 Oct 2011 11:04:57 -0400
Received: from eggs.gnu.org ([140.186.70.92]:56547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Paul_Brook@mentor.com>) id 1REjJf-0004p1-AS
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2011 11:04:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Paul_Brook@mentor.com>) id 1REjJe-0003qm-DI
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2011 11:04:55 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:53008)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Paul_Brook@mentor.com>)
	id 1REjJX-0003pj-Dm; Fri, 14 Oct 2011 11:04:47 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=EU1-MAIL.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1REjJS-0005do-Ra from Paul_Brook@mentor.com ;
	Fri, 14 Oct 2011 08:04:43 -0700
Received: from nowt.org ([172.30.64.129]) by EU1-MAIL.mgc.mentorg.com with
	Microsoft SMTPSVC(6.0.3790.1830); Fri, 14 Oct 2011 16:04:41 +0100
Received: from wren.localnet (wren.home [192.168.93.7])
	by nowt.org (Postfix) with ESMTP id 30DDF6F345;
	Fri, 14 Oct 2011 16:04:41 +0100 (BST)
From: Paul Brook <paul@codesourcery.com>
Organization: Mentor Graphics
To: Dmitry Koshelev <karaghiozis@gmail.com>
Date: Fri, 14 Oct 2011 16:04:40 +0100
User-Agent: KMail/1.13.7 (Linux/3.0.0-1-amd64; KDE/4.6.5; x86_64; ; )
References: <CAKUHwZpxH2vUBb9Y_R0uPCMvPhcpNB=yJJFdmJFWfmtbG85_Nw@mail.gmail.com>
In-Reply-To: <CAKUHwZpxH2vUBb9Y_R0uPCMvPhcpNB=yJJFdmJFWfmtbG85_Nw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201110141604.40963.paul@codesourcery.com>
X-OriginalArrivalTime: 14 Oct 2011 15:04:41.0716 (UTC)
	FILETIME=[99C5CB40:01CC8A82]
X-detected-operating-system: by eggs.gnu.org: Solaris 10 (beta)
X-Received-From: 192.94.38.131
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ARM GIC and CPU state
	saving/loading fix
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
X-List-Received-Date: Fri, 14 Oct 2011 15:04:56 -0000

> Fixes two trivial indices errors.

No.

You're doing two much in a single patch. While both happen to be bug in the 
save/restore code involving arrays, these are not two instances of the same 
bug.  The justification for each change is completely different.

Even if each change was obviously correct, I believe putting them together 
into a single commit makes the result non-trivial.   The fact your patch 
introduces a bug strongly suggests it shouldn't have been considered trivial 
to start with.

> @@ -53,7 +53,7 @@ void cpu_save(QEMUFile *f, void *opaque)
>      if (arm_feature(env, ARM_FEATURE_VFP)) {
> -        for (i = 0;  i < 16; i++) {
> +        for (i = 16;  i < 32; i++) {
>              CPU_DoubleU u;
>              u.d = env->vfp.regs[i];

I'm pretty sure this is wrong.

Paul

