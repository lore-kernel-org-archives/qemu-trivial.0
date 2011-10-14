Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RElE6-0004Sq-Ox
	for mharc-qemu-trivial@gnu.org; Fri, 14 Oct 2011 13:07:18 -0400
Received: from eggs.gnu.org ([140.186.70.92]:47144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <karaghiozis@gmail.com>) id 1RElE3-0004HS-S7
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2011 13:07:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <karaghiozis@gmail.com>) id 1RElDy-0005lR-DK
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2011 13:07:15 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:56288)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <karaghiozis@gmail.com>)
	id 1RElDq-0005kA-FJ; Fri, 14 Oct 2011 13:07:02 -0400
Received: by qadb10 with SMTP id b10so1304508qad.4
	for <multiple recipients>; Fri, 14 Oct 2011 10:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=S+A83ekPiIYVTRH/QK4vR2kLJK8uckReXWqNdMe/cd0=;
	b=qQC5+zw9jcavH3batLHZdT4UPIuE7kNg/9jbXoxdYpVTdGBpmXe9f8jQdXrPhgsUQy
	jQ6RABodZ33xebzze0E1/cjO5i/JwogIOInnHwvrWEQPJZcA8r7VoaW/Ckt+zip5qzmd
	JiF4Rg7oVKJC7u+dBf/zARPHnl9fFEMJC37J8=
MIME-Version: 1.0
Received: by 10.229.67.159 with SMTP id r31mr2041855qci.92.1318612021892; Fri,
	14 Oct 2011 10:07:01 -0700 (PDT)
Received: by 10.229.89.145 with HTTP; Fri, 14 Oct 2011 10:07:01 -0700 (PDT)
In-Reply-To: <201110141604.40963.paul@codesourcery.com>
References: <CAKUHwZpxH2vUBb9Y_R0uPCMvPhcpNB=yJJFdmJFWfmtbG85_Nw@mail.gmail.com>
	<201110141604.40963.paul@codesourcery.com>
Date: Fri, 14 Oct 2011 21:07:01 +0400
Message-ID: <CAKUHwZp_HREOrjvFWMsraxYPohJy-8d9L9Cn3uwm1Se+sAfrXg@mail.gmail.com>
From: Dmitry Koshelev <karaghiozis@gmail.com>
To: Paul Brook <paul@codesourcery.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
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
X-List-Received-Date: Fri, 14 Oct 2011 17:07:17 -0000

On Fri, Oct 14, 2011 at 7:04 PM, Paul Brook <paul@codesourcery.com> wrote:
>> Fixes two trivial indices errors.
>
> No.
>
> You're doing two much in a single patch. While both happen to be bug in t=
he
> save/restore code involving arrays, these are not two instances of the sa=
me
> bug. =A0The justification for each change is completely different.

Sure. So should i resubmit it as 2 patches ?

>
> Even if each change was obviously correct, I believe putting them togethe=
r
> into a single commit makes the result non-trivial. =A0 The fact your patc=
h
> introduces a bug strongly suggests it shouldn't have been considered triv=
ial
> to start with.
>
>> @@ -53,7 +53,7 @@ void cpu_save(QEMUFile *f, void *opaque)
>> =A0 =A0 =A0if (arm_feature(env, ARM_FEATURE_VFP)) {
>> - =A0 =A0 =A0 =A0for (i =3D 0; =A0i < 16; i++) {
>> + =A0 =A0 =A0 =A0for (i =3D 16; =A0i < 32; i++) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0CPU_DoubleU u;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0u.d =3D env->vfp.regs[i];
>
> I'm pretty sure this is wrong.
>
> Paul
>

Oops, don't know how it got here lol. Bug is in cpu_load not in
cpu_save, of course.

