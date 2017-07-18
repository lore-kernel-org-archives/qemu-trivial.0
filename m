Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXSko-00007c-5n
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 09:41:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXSkm-000053-46
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 09:41:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXSkl-0007Ko-7f
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 09:41:32 -0400
Received: from mail-it0-x244.google.com ([2607:f8b0:4001:c0b::244]:35969)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXSkl-0007KF-2z; Tue, 18 Jul 2017 09:41:31 -0400
Received: by mail-it0-x244.google.com with SMTP id k3so2106715ita.3;
	Tue, 18 Jul 2017 06:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=r3AW1JrYhU1A8Owis226/Nhpl97pefSERneNt/eXVmk=;
	b=e5g+yeOND8zheawzW+UhL9pPeEq//0jINXysG0s4SUwabmgncv9nFSHQ97O9SnQw1N
	akslqISlGEcFKeQL8LfVBJaJxI/YgJZ252OD/t1mpeej4Z8gRrD7gRNkjITkVEmDU/c9
	sjawP99PT4GtM2NwkXI7z00KDaDUI7ITys/KYC+IuIf4pV68wgClVUFS2BqDhH7f9oj5
	44fYi+uNlCUSChkCi/VGcrf6oLd60yNe+mSzOM9dui+5pAvvls0xU87sXS2x6eC86mRe
	XeT1i1X3ioKF90nZsfXxfbn/dcG7tMq4P76UC2HfthfDv0j8FdSCxbatK3JQprgM+cUS
	ShfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=r3AW1JrYhU1A8Owis226/Nhpl97pefSERneNt/eXVmk=;
	b=pty3vEbQYR4f0e3RjEvPXr1UQ3EFEXtInskuHP1KKeCLrqUACwWH2RQeE+xy17ER6u
	B4KOq/4TW6zE4fHcDWDlaaqWN4AoHl5hrFr9pRNJtLIqG8DcthYdhIeAyb/F82O1eCp7
	ruVMl7BkS/PVN6xcdcwGoXBZBNcqftYiAVJkeZEyjPYODphXWfhZD4Tl5rMAJO9gxAxx
	GiTVLSBx9LLzyxsBSc+MtB6yOS4aSQtYuRQsqRTBaRNkG2/xDeh/xz81cpq2VDOpuGss
	1gVY5ZySvCppQyLoUOVXmqN5jT2N/ZjX714+Dwuqa6TdZvc6qarKNhAUA9B1LoyCEdWF
	XnUQ==
X-Gm-Message-State: AIVw111A5YB3Q9QMHtUZLCpOQ87cShc1XEkecZ5oBWQPc8g3Fu9m+G+A
	P6lqhp61l5dCMWwY13RRSThbbSVg/g==
X-Received: by 10.36.125.5 with SMTP id b5mr2645787itc.110.1500385290342; Tue,
	18 Jul 2017 06:41:30 -0700 (PDT)
MIME-Version: 1.0
Sender: philippe.mathieu.daude@gmail.com
Received: by 10.107.152.16 with HTTP; Tue, 18 Jul 2017 06:41:29 -0700 (PDT)
In-Reply-To: <87bmoi806u.fsf@linaro.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-27-f4bug@amsat.org>
	<CAJ+F1C+WsdUp3Vtx+-FZ9g7URSAQuJWb6h7-w6yJXM+4TKQNjA@mail.gmail.com>
	<87bmoi806u.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 18 Jul 2017 10:41:29 -0300
X-Google-Sender-Auth: a-5DKFGUAcpKnOEDfnT1-H6JC9g
Message-ID: <CAAdtpL7HcwwpCNjVxpaX=nB72LS_CJjU=VdS_aH0EM6i8QVBOw@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
	qemu trival <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 26/29] tests/tcg: use
 ARRAY_SIZE macro
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
X-List-Received-Date: Tue, 18 Jul 2017 13:41:33 -0000

On Tue, Jul 18, 2017 at 8:16 AM, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
> Pranith has had a couple of revs at this:
>
>   Subject: [PATCH v5 00/19] Cleanup of TCG tests
>   Date: Thu,  1 Dec 2016 00:14:14 -0500
>   Message-Id: <20161201051433.17168-1-bobby.prani@gmail.com>
>
> We have the cross-compilers available as a fallback via docker although
> not every one can seamlessly use it for building stuff. Is getting a
> working cross-compiler setup too much of a hurdle fore those that want
> to build cross-arch tests?

I have a WiP branch using qemu to cross-run tests it _works_ funny but
when it fails it is not funny to understand what is really buggy...
/to be continued.../

Phil.

