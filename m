Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aU3U9-0003jk-RY
	for mharc-qemu-trivial@gnu.org; Thu, 11 Feb 2016 21:29:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1aU3U7-0003hC-4w
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 21:29:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1aU3U5-0007Sb-W4
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 21:29:27 -0500
Received: from mail-ob0-x22e.google.com ([2607:f8b0:4003:c01::22e]:32892)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>)
	id 1aU3U5-0007S6-RT; Thu, 11 Feb 2016 21:29:25 -0500
Received: by mail-ob0-x22e.google.com with SMTP id is5so102065281obc.0;
	Thu, 11 Feb 2016 18:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=K8r1PYYrnNWkJbKfmw7wZ5rQVKdn59PYKDKLTgNMtVc=;
	b=Sjs9OEPAJ8lVtrHAOMrf+5IxI+eX2kmhmxaAIWdaRLI1aj6jlvC7tOLDXqWPvKqgF9
	jPN/re3C+akQfH+xjDwZIY3Bg18Fvp9n1ih2G+Lc/jqAo21nVSEj2AePiIdEN97naAkv
	mXV5oZbYIK7gwx4C8f+fnFG4GFCQqdlerjyZg28S8r8Lz+ON8etj0pLCMEO25mXkgajj
	2TdyguYFTQtFjhpqaAc+qKad4LBxotsPBVfCK1j52kb4B/x6byzv20KqBSz2nIYP05oQ
	366HvbpROWDMBaxQaFN+QFiaL3+RlOXRfcinItmcYreh5iccPgGKof9nF2TbtYHxBWfs
	ag8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=K8r1PYYrnNWkJbKfmw7wZ5rQVKdn59PYKDKLTgNMtVc=;
	b=m5DYi3JHljhcEHq09FQpMHzeZ88kgOJgKPJgdcCiZzBbvYnoX6YuqgKCKOD+Mu7cZt
	pDubcQZWOJbxektachWFYbFxAd7VnC6Pe4y5qVO9TeT3AdmTXE6HJByvrazaxwoIh7zA
	qiik4hPRZw28FDKFzXpDjtFLOl/4Omyl21Xno924fkoJKwxltdpiL99Mqv3wguqrNwnM
	QmTFmxgbVoi3wX80yMnVqlFHWjG88BjUXxhdnCVCTackjZxmRxvzhcJMRRsgVE2OmfAl
	BKgDZ4ezD2WpLIqVHuU/ZcZnPkagu+5OaTC5j14r1DOxHuonfs5QGcgJVayFF38aMuXC
	T55A==
X-Gm-Message-State: AG10YOS+7ze5m6gyxP0pBqUgCYr1ZBr+D6tbtZ5lGyc/luqAcwT3jvoFTzdVU0KORKeYYrLponW0UmeUQz7CXg==
MIME-Version: 1.0
X-Received: by 10.182.144.133 with SMTP id sm5mr51851986obb.69.1455244165081; 
	Thu, 11 Feb 2016 18:29:25 -0800 (PST)
Received: by 10.76.79.73 with HTTP; Thu, 11 Feb 2016 18:29:25 -0800 (PST)
In-Reply-To: <56937240.2080305@redhat.com>
References: <AC19797808C8D548ABDE0CA4A97AA30A30DEB409@XMB-DCFR-37.europe.corp.altran.com>
	<569368F6.3050704@msgid.tls.msk.ru> <56937240.2080305@redhat.com>
Date: Fri, 12 Feb 2016 03:29:25 +0100
Message-ID: <CAJ+F1C+fOokKt-E7bbZ31NO8tCp5ky2JN==zPm1mEZTktuR9AA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::22e
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Ashley Jonathan <jonathan.ashley@altran.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Keep pty slave file
 descriptor open until the master is closed
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
X-List-Received-Date: Fri, 12 Feb 2016 02:29:28 -0000

Hi

On Mon, Jan 11, 2016 at 10:13 AM, Paolo Bonzini <pbonzini@redhat.com> wrote=
:
>
>
> On 11/01/2016 09:33, Michael Tokarev wrote:
>> 11.12.2015 14:29, Ashley Jonathan wrote:
>>> I have experienced a minor difficulty using QEMU with the "-serial pty"=
 option:
>>>
>>> If a process opens the slave pts device, writes data to it, then immedi=
ately closes it, the data doesn't reliably get delivered to the emulated se=
rial port. This seems to be because a read of the master pty device returns=
 EIO on Linux if no process has the pts device open, even when data is wait=
ing "in the pipe".
>>>
>>> A fix seems to be for QEMU to keep the pts file descriptor open until t=
he pty is closed, as per the below patch.
>>
>> The patch looks fine, so
>>
>> Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
>>
>> but I'd love to have an ACK from the maintainer about this one,
>> or for it to pick it up.
>
> Ok, I'll pick it up after I've read up a bit more on PTYs.

That patch slows down qemu a lot when using -chardev
pty,id=3Dcharserial0 -device isa-serial,chardev=3Dcharserial0. I forgot a
lot about how pty/pts work, and reading some man pages didn't help me
much to understand the issue, I would suggest to revert it until a
better solution is found.


--=20
Marc-Andr=C3=A9 Lureau

