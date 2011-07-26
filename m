Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qli34-0006f7-0N
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jul 2011 09:51:50 -0400
Received: from eggs.gnu.org ([140.186.70.92]:55249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1Qli30-0006TV-8R
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2011 09:51:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1Qli2z-0005Qr-4h
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2011 09:51:46 -0400
Received: from mail-pz0-f43.google.com ([209.85.210.43]:36869)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1Qli2w-0005Ch-Cy; Tue, 26 Jul 2011 09:51:42 -0400
Received: by pzk1 with SMTP id 1so891276pzk.30
	for <multiple recipients>; Tue, 26 Jul 2011 06:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=Hq4SzZuTAuwWdZH/AIcKN44Ai4NGig29QvNR/xN+kJY=;
	b=iKic4LJBb6RhzOH5VhJDSrYaducUDit+rgJvONBKHAChmqsREDOEuWUI1pvshOecn0
	rDPSOknBwctz9oeSABfh5Vhzjmdqf2SsnyKze2c1SPJiy+Zl5d2Ur1k8/3FWbdeOy6JY
	iJZ73VLMUToj6OFfeGZ3H5sXkjIIcJ5VcNFOI=
Received: by 10.68.1.200 with SMTP id 8mr9363073pbo.47.1311688301044; Tue, 26
	Jul 2011 06:51:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.42.232 with HTTP; Tue, 26 Jul 2011 06:51:21 -0700 (PDT)
In-Reply-To: <m339htczcl.fsf@blackfin.pond.sub.org>
References: <1311652562-10794-1-git-send-email-cerbere@gmail.com>
	<1311652562-10794-2-git-send-email-cerbere@gmail.com>
	<m339htczcl.fsf@blackfin.pond.sub.org>
From: Alexandre Raymond <cerbere@gmail.com>
Date: Tue, 26 Jul 2011 09:51:21 -0400
Message-ID: <CAHWZs7UG9NrAQKAtJN2+eQtbOOGFZrotdfSg3PhQ+FD_mRX4-w@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.43
Cc: qemu-trivial@nongnu.org, Qemu Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] Makefile: distclean
 should clean all possible targets
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
X-List-Received-Date: Tue, 26 Jul 2011 13:51:47 -0000

Hi Markus,

> Well, I'd expect distclean to remove exactly what *this* makefile can
> build, and leave everything else alone.

I was expecting "distclean" to bring back the source directory to
however it was after checkout, removing anything that might have been
created by the build/configure process.


> Your patch adds a special case to that simple rule: also remove
> not-configured target directories. =C2=A0Other not-configured stuff is st=
ill
> left behind.
>
> Special cases need special justification, hence my question above.

This patch stems from the discussion in "Makefile: fix out-of-tree builds"
http://lists.gnu.org/archive/html/qemu-devel/2011-07/msg02707.html

What happens is that SRC_PATH is set in the VPATH variable in the
Makefile, which causes it to search for files inside the source
directory (and outside the current build directory).

Say you're building out-of-tree, and the Makefile happens to pick up
old files from your main source directory, it can lead to errors in
the build. If you are "unable" to delete old build data because you've
run a more restricted "configure" after an earlier build, this earlier
build data will not go away if you distclean.

For example:
---8<---
SUBDIR_DEVICES_MAK=3D$(patsubst %, %/config-devices.mak, $(TARGET_DIRS))
config-all-devices.mak: $(SUBDIR_DEVICES_MAK)
    $(call quiet-command,cat $(SUBDIR_DEVICES_MAK) | grep =3Dy | sort -u
> $@,"  GEN   $@")

...

%/config-devices.mak: default-configs/%.mak
...
---8<---

Let's say my sources are in ~/src/qemu/ and I build in /tmp/foo/.

Those rules can match i386-softmmu/config-devices.mak inside
~/src/qemu/ from a previous build if it doesn't exist in the current
build directory. Since this file is up to date wrt
~/src/qemu/default-configs/i386-softmu.mak, it won't be rebuilt in the
build directory. Then, when the recipe for config-all-devices.mak is
run, it will try to cat i386-softmmu/config-devices.mak, but "cat"
doesn't know about VPATH, so it will fail.

Alexandre


PS: if you're interested, here is the trace of this problem :

 Considering target file `config-all-devices.mak'.
  File `config-all-devices.mak' does not exist.
   Considering target file `i386-softmmu/config-devices.mak'.
    Looking for an implicit rule for `i386-softmmu/config-devices.mak'.
    Trying pattern rule with stem `i386-softmmu'.
    Trying implicit prerequisite `default-configs/i386-softmmu.mak'.
    Found prerequisite `default-configs/i386-softmmu.mak' as VPATH
`/Users/myuser/src/qemu/default-configs/i386-softmmu.mak'
    Found an implicit rule for `i386-softmmu/config-devices.mak'.
     Considering target file `default-configs/i386-softmmu.mak'.
      Looking for an implicit rule for `default-configs/i386-softmmu.mak'.
      No implicit rule found for `default-configs/i386-softmmu.mak'.
      Finished prerequisites of target file `default-configs/i386-softmmu.m=
ak'.
     No need to remake target `default-configs/i386-softmmu.mak';
using VPATH name
`/Users/myuser/src/qemu/default-configs/i386-softmmu.mak'.
    Finished prerequisites of target file `i386-softmmu/config-devices.mak'=
.
    Prerequisite
`/Users/myuser/src/qemu/default-configs/i386-softmmu.mak' is older
than target `i386-softmmu/config-devices.mak'.
   No need to remake target `i386-softmmu/config-devices.mak'; using
VPATH name `/Users/myuser/src/qemu/i386-softmmu/config-devices.mak'.
<---- ***this here is the problem***
  Finished prerequisites of target file `config-all-devices.mak'.
 Must remake target `config-all-devices.mak'.
Putting child 0x001278c0 (config-all-devices.mak) PID 1699 on the chain.
Live child 0x001278c0 (config-all-devices.mak) PID 1699
  GEN   config-all-devices.mak
cat: i386-softmmu/config-devices.mak: No such file or directory
<---- ***this is the error***

