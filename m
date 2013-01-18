Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TwCNU-0001sV-UI
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jan 2013 08:53:04 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TwCNR-0001s2-Tv
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 08:53:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TwCNQ-00074i-PT
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 08:53:01 -0500
Received: from mail-la0-f51.google.com ([209.85.215.51]:48492)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TwCNQ-00074Z-IZ
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 08:53:00 -0500
Received: by mail-la0-f51.google.com with SMTP id fj20so3915357lab.10
	for <qemu-trivial@nongnu.org>; Fri, 18 Jan 2013 05:52:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=T4eZQnKIWlNYEV59+jR6mjtXzcxhUlTH31prQX0r8nU=;
	b=iqM6qcbQVWIzwnHRzbw9saHDKyv83gjJemb7DJ99IwviUGEMgJihVWRwdXS+htmwGX
	WL/FfY/HqUDUsfPsT9kr39RlEYAoW3xZS0s9j9MRZTjM+0cKNKwPTsOSj2+8VBjQiksb
	VsricMAWDEDFDolAQBekJYBPBxWByWpXpQmjabFTu782BPL36aU+YinXn8ttetOF1bJJ
	hC4v9Kev8acXE0UbspbC+8wcsBYGlWFv1wfF4oX9MOz669ONmA1K27wcFop4E62eU9Fe
	KZn//yRYyrEDM5I+11iMsjrc5gSCwhKuYOenUbqkF1h0XFJ78PxDqtEfzij1dDx8EaPN
	DnUQ==
X-Received: by 10.152.104.199 with SMTP id gg7mr8464897lab.14.1358517178777;
	Fri, 18 Jan 2013 05:52:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.55.176 with HTTP; Fri, 18 Jan 2013 05:52:37 -0800 (PST)
In-Reply-To: <20130118134716.GD24367@stefanha-thinkpad.redhat.com>
References: <1358437928-2420-1-git-send-email-peter.maydell@linaro.org>
	<20130118134716.GD24367@stefanha-thinkpad.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Jan 2013 13:52:37 +0000
Message-ID: <CAFEAcA89htyrBZLcL+HOA-6K4g8bM62_obQsK2i60dO9CveYAw@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQmzesmmNeDeq9uLyRIrWceWWfDyMN5D6wOGCIhGz/1NJzN1sZgwzO1AWsFxBqviLkNxyZxH
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.215.51
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-pixman.h: Avoid mutual
 inclusion loop with console.h
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
X-List-Received-Date: Fri, 18 Jan 2013 13:53:03 -0000

On 18 January 2013 13:47, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Thu, Jan 17, 2013 at 03:52:08PM +0000, Peter Maydell wrote:
>> Remove an unnecessary mutual inclusion loop between qemu-pixman.h and
>> console.h, since the former was only including the latter for
>> 'PixelFormat*', which can be provided by typedefs.h.  This requires a
>> minor adjustment to qemu-pixman.c, which was relying on the implicit
>> inclusion of console.h for the actual struct PixelFormat definition,
>> and on implicitly dragging in a header defining NULL.

> CC    ui/curses.o
> In file included from ui/spice-core.c:40:0:
> /home/stefanha/qemu/include/ui/spice-display.h:93:5: error: unknown type =
name =E2=80=98QEMUCursor=E2=80=99

Oops. I don't have spice in my dev environment I guess.
Having spice-display.h include console.h will probably fix this.

-- PMM

