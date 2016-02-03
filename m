Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aR2ko-0006w4-SA
	for mharc-qemu-trivial@gnu.org; Wed, 03 Feb 2016 14:06:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aR2kl-0006p0-N7
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 14:06:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aR2kg-0002ZO-E5
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 14:06:07 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:35367)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aR2kf-0002ZC-6W
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 14:06:06 -0500
Received: by mail-vk0-x233.google.com with SMTP id e6so21373152vkh.2
	for <qemu-trivial@nongnu.org>; Wed, 03 Feb 2016 11:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=iz/CKX11t5etJHjTzzbcoTzHgoVYKo6rFzCrFMMuxDk=;
	b=E68plEuDWPZCjmLu3hMnfjqNG6bHoSwlFCXcfUD2I4CCicBCIKmKMe/m61sZWGiY5C
	EWC6g+br3MVjR1HBBZ5immS/rZ3eSBPK6uHsmEkBPsiNzU69XpsD6ji6RUBnlRfLmwPR
	KAS2drS7Lfi4/jmAwMS2412dDCeKafdaixOow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=iz/CKX11t5etJHjTzzbcoTzHgoVYKo6rFzCrFMMuxDk=;
	b=ZLUbfTdLsqo8mR/j+dw+nExsG8GzyNq1cAVaA4JmvU/l22ouUqNYOLmOHnjx+8q0z5
	RQ9i94psB43Ob/MnC+dX/JdFXoKrFykxKRiIVy6KiyPg5McOOmQVrhOgRkEEjvmLFjhD
	DG5Ibo/AJ2y+CfwRS+fzYPDDvQ7V3T69k+aEMb/uzwRYdEyNuslD+hI4zjKbZXwUe8l7
	r1IOj1Wm0KesHqhkc9+o2vZfrH8MHldGumGDG5rr+JCjH19yNoDYuWxkigGZEQ4ReoOu
	+FaPBkebaYbE5P5/vCG5PzDd7vThtMkKTiAW3rZhdeNVfVw5lHZMILRPJ/HMPA3DSbOo
	xDwA==
X-Gm-Message-State: AG10YOTA6/XJHg0ynTANe0gk6RZTjZpV58JNhWm4gR1fNVfkWPemLdqxRAcceMX7O/7q4coTiJdpQbWtBB6kohCV
X-Received: by 10.31.141.2 with SMTP id p2mr2403120vkd.37.1454526364658; Wed,
	03 Feb 2016 11:06:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Wed, 3 Feb 2016 11:05:45 -0800 (PST)
In-Reply-To: <87y4b1oc96.fsf@linaro.org>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-12-git-send-email-alex.bennee@linaro.org>
	<20150804123331.GB8960@aurel32.net> <87y4b1oc96.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Feb 2016 19:05:45 +0000
Message-ID: <CAFEAcA-+gzYE3ys6ybmYP0-0j6gd9RgE6amm4=dkjwgZ6rhj1A@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 11/11] cputlb: modernise
	the debug support
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
X-List-Received-Date: Wed, 03 Feb 2016 19:06:12 -0000

On 3 February 2016 at 18:54, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> It preserves the old behaviour (and the general behaviour of DEBUG_FOO
> going to stderr). However I'm happy to make it default to using the log
> output.
>
> It does raise the question of if we should just enable the debugging by
> default?

Not without thinking carefully about it. This is programmer
debug code for figuring out what's happening in a performance
sensitive bit of code. "Just print to stderr" is the classic
way to do this, and I don't think we should just convert that
into userfacing trace.

There may be useful user facing trace we can do of TLB
operations but I wouldn't assume that our current debug
printfs are it.

thanks
-- PMM

