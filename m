Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UsZLl-00044c-22
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2013 10:08:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1UsZLh-0003yx-7K
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 10:08:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1UsZLe-0006DS-FU
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 10:08:29 -0400
Received: from mail-qa0-x22f.google.com ([2607:f8b0:400d:c00::22f]:54966)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>)
	id 1UsZLY-0006CN-FL; Fri, 28 Jun 2013 10:08:20 -0400
Received: by mail-qa0-f47.google.com with SMTP id i13so597167qae.6
	for <multiple recipients>; Fri, 28 Jun 2013 07:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ljf6QLD1XC6lg4M3tWueXqbFD69WGJe3lx1lZagYx4Q=;
	b=WtrNe0qkFRegwNE4mbqQyiDfK8cMXudc6yhj9Z7N34Y0XjYFn6uyEnyWA8guHqk63v
	85x7588SXWyD9NINzP0bun9dNwgxkzJyuoeSVnVc3okDyYgpCuY/fuYrheMtER/oO/uF
	9KBuHNNe+AsY7AQb4lDrUWcQhjp1owtfo72pFk7b8jLX8SfCGBst52bR1yG5dO3OIQJz
	iVpcjVkqV5LlnCTMlbXFfwVR6GXL4vhZ7J9sN8Jbjlmbi7hi4Qpuq4jv8REn0k/8Inpq
	EJO7iNjtpq5PzaN6lxfJ2h8eLpxh5YN9iQGE5XMyuXobGD14V60k6Osao+V67+thyYdc
	psvw==
MIME-Version: 1.0
X-Received: by 10.49.13.229 with SMTP id k5mr17161502qec.64.1372428500167;
	Fri, 28 Jun 2013 07:08:20 -0700 (PDT)
Sender: carpeddiem@gmail.com
Received: by 10.224.180.78 with HTTP; Fri, 28 Jun 2013 07:08:20 -0700 (PDT)
In-Reply-To: <CAFEAcA-M9RnRv8TZjcY8C1KgRj+2k8JT1QKrtHhfo6BafNQQWQ@mail.gmail.com>
References: <1372101677-46175-1-git-send-email-emaste@freebsd.org>
	<51CD669A.1010100@msgid.tls.msk.ru>
	<CAPyFy2Bzh-nK7zkc3JwvPEd4AYH0CriA1vu_kGqoCXdaAk0i1A@mail.gmail.com>
	<51CD8985.6020401@redhat.com>
	<CAFEAcA-M9RnRv8TZjcY8C1KgRj+2k8JT1QKrtHhfo6BafNQQWQ@mail.gmail.com>
Date: Fri, 28 Jun 2013 10:08:20 -0400
X-Google-Sender-Auth: Smd_eIU9m6hBjLaZOv2zOiwuzD8
Message-ID: <CAPyFy2AaR6gdtimuQwaojCFoJt=bthEVKDA48GXxRWUXMPmDkw@mail.gmail.com>
From: Ed Maste <emaste@freebsd.org>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c00::22f
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tls.h: Enable TLS on FreeBSD
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
X-List-Received-Date: Fri, 28 Jun 2013 14:08:32 -0000

On 28 June 2013 09:05, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 28 June 2013 14:03, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> Il 28/06/2013 14:54, Ed Maste ha scritto:
>>> An objection seemed to be that it is not really needed yet, but as
>>> pointed out by Peter this isn't really the case.  This patch brings us
>>> (FreeBSD) in line with per-thread data semantics on Linux and is used
>>> by qemu system emulation as well.
>>
>> It brings it in line with Linux, even though FreeBSD has the same need
>> for TLS as OpenBSD and Windows (i.e. none).  In other words, we go from
>> two cases (need TLS and uses it, has no TLS and doesn't need it) to
>> three (we add "uses TLS with no need for it").
>
> I don't understand what you mean by "no need for it". We are
> already multithreaded in system mode, so this is simply
> making FreeBSD do the same thing as Linux. That seems like a
> clear improvement to me.

I agree; even if this is a hack, it's a well-tested one.  Indeed, even
on a FreeBSD host most users already have this change, as they have
built from ports or used prebuilt packages.

