Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cg7DR-0003eG-Hj
	for mharc-qemu-trivial@gnu.org; Tue, 21 Feb 2017 04:58:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cg7DP-0003cb-0Q
	for qemu-trivial@nongnu.org; Tue, 21 Feb 2017 04:58:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cg7DO-0005jG-EQ
	for qemu-trivial@nongnu.org; Tue, 21 Feb 2017 04:58:35 -0500
Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233]:36363)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cg7DO-0005iu-7o
	for qemu-trivial@nongnu.org; Tue, 21 Feb 2017 04:58:34 -0500
Received: by mail-wr0-x233.google.com with SMTP id 89so74148336wrr.3
	for <qemu-trivial@nongnu.org>; Tue, 21 Feb 2017 01:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Gj1B0bl5LaoVrZNDzQuvqPs+E11mr0f1uXnCUD80mr0=;
	b=ZysM1hdBtD+31IjabOkqaigRnCkmSQT/ZNnGaSWjGrLfvuTKm068zOdCxBBITdx1EZ
	XIVZU4CC5EPlpwWxVU9Tn8MWwNn2ZZ4Rw9aw+HcLyDlOjtZdJbqSAC3d3GegnUtsVL4k
	xB703eDtx3fyhUP54ogpErBV1QIcvV9MkwLP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Gj1B0bl5LaoVrZNDzQuvqPs+E11mr0f1uXnCUD80mr0=;
	b=Lw+WpaWOZ+BTmkSepfTylM1U4QNQ9qZ8NeKacL8EapI/6LNeXX/WAsLzKZKcJcY+8T
	5PhH85vs3dWlselqt3v/jjxH+G58iBNPuHDLSWgJ3Gnz6g1dSwCEk9V9C38jZPElulKs
	dR3E55v3ZN5/uhffBaRUkBx15dcLZiNx59SKxdTj68xu3uBcLFx21sqx9tgI8Uny5F+y
	DE+rXb4LxmdFQeACuijIL8pakfUPlJOmuNw8kHjz/ebJIR+fdHmKl9/QHCBD0hC1lBEc
	UvNZvZZG0uybDSFi3c9vO9d1dThxJ8K04s0BxZCiNdTeOk9UIuEQAWaAqiyiYijlJiT7
	fx2w==
X-Gm-Message-State: AMke39lEXgWlZqC1mtWjZsitvSzKxK3s4vzHXlkOA1i9l6so/iBKGSzvYtrFX7VfI3EJ5YwrOL0pXE/jwgWQpCy6
X-Received: by 10.223.169.76 with SMTP id u70mr9255411wrc.187.1487671112986;
	Tue, 21 Feb 2017 01:58:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Tue, 21 Feb 2017 01:58:12 -0800 (PST)
In-Reply-To: <87wpcjlw32.fsf@dusky.pond.sub.org>
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
	<bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
	<CABHMSTUsZy0u4b1b84YC5CgafKvD-Zms5dCQ=31+XnQphUQxLA@mail.gmail.com>
	<20170217064327.GB21716@lemon.lan>
	<CAFEAcA8_f8SVX+rirAFBJ76ZiXaKUwh9uO0AeBFoR7G_q8pGDg@mail.gmail.com>
	<6ab86cf8-4780-ca76-f648-ac0ce211e27b@redhat.com>
	<CABHMSTWN2KdAXDjEEbyWio6rNM2FuDk_NUj40mFW0HdyZFu68g@mail.gmail.com>
	<fc3b6729-6739-5daf-5e78-85fbd7d3260d@redhat.com>
	<CABHMSTUS4Oi5WZt0NcYaOnX9_u8zQeu=CupLVX2LjvD+mTYATg@mail.gmail.com>
	<ac569867-6629-7b56-0bf1-85f15b52f143@redhat.com>
	<87wpcjlw32.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2017 09:58:12 +0000
Message-ID: <CAFEAcA8jC7swgVYN=pRhbFRD23t8eqrY5GuaLaO8MnUBKpLm5A@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, Chad Joan <chadjoan@gmail.com>,
	Fam Zheng <famz@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::233
Subject: Re: [Qemu-trivial] [Qemu-devel] Fix build break during
 configuration on musl-libc based Linux systems.
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Feb 2017 09:58:36 -0000

On 21 February 2017 at 09:41, Markus Armbruster <armbru@redhat.com> wrote:
> Eric Blake <eblake@redhat.com> writes:
>
> [...]
>> 'git send-email -s' can also add Signed-off-by: lines, if you didn't add
>> them earlier (but only if you use send-email, rather than attachments) :)
>
> That's fine, as you *should* use git send-email.

It has the disadvantage that checkpatch will complain at you
when you test your patches before sending them, because the
sign-off is missing... Personally I recommend adding the signoff
lines earlier in the process.

thanks
-- PMM

