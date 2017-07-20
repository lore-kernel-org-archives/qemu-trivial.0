Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYIsT-00061e-8s
	for mharc-qemu-trivial@gnu.org; Thu, 20 Jul 2017 17:20:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dYIsR-0005xf-AP
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 17:20:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dYIsQ-0002UP-6w
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 17:20:55 -0400
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:35362)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dYIsQ-0002UE-0V
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 17:20:54 -0400
Received: by mail-wm0-x22e.google.com with SMTP id w126so34509967wme.0
	for <qemu-trivial@nongnu.org>; Thu, 20 Jul 2017 14:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xI74DtcBYkQifnNE/L/4C7wxjBbjKE4p/QUCiR6y12I=;
	b=GZHRNbIcMqs198FK8vcO7M8Svz2Rh2DMGm0P8EXWVplQqJB9JKygt3TYeZalccM4s+
	h4w+xPJSg+/mtLJuGbUAtTu6V2YNfWyGN/3QIEeoSKrMlGSOVjJUQCxWkAfac1uYkimu
	8nDmSbEWJSN96Oq7z/ZYdywU9fcDdvmQg00Kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xI74DtcBYkQifnNE/L/4C7wxjBbjKE4p/QUCiR6y12I=;
	b=SPJvzGfxluPSHrdAJCahc/SO/PCqzDL/Wwby2TEEZSwBa4EZ9nQFZwdHAbd7ilSkD9
	RLhJQ41DoA2gM3HcrU8kiQ09L+xFkKA+zE8VGJe2Is867qvlaFqmc6Te9MGYWhj8sGIN
	JmgR3IXObCIF9RsORrwQpVsqbRSVxydBXI2azHdDKFMbGhoqKsenMm0Xd3Yqsb66ij0N
	acULpbiMstUcDyRTs2bbyJDQIgQAqdUcvX+QqKpX7L6qRZn+M0T1jYH1o/PH8OPR27Wj
	HdYqa8bnl6cVMkn+7k0LExy6DEFTQSAeYQb0bcPBbj/Z/3xJbjoyPtHX41MKSP20a8VH
	wm9g==
X-Gm-Message-State: AIVw110GTOwaBszOvRZwC2SfxaGlZ8sybIzGo2Ns4MNNhKp8AFICkGpe
	JfKVOwWJEEERjhL8UfRfPg7pyrIrkTJE
X-Received: by 10.28.97.86 with SMTP id v83mr3380667wmb.74.1500585652715; Thu,
	20 Jul 2017 14:20:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Thu, 20 Jul 2017 14:20:32 -0700 (PDT)
In-Reply-To: <15cdd5e0-48f8-35be-8fa3-c57bc50828f6@redhat.com>
References: <1500568341-8389-1-git-send-email-peter.maydell@linaro.org>
	<eec67af4-3f8e-bb85-0854-61f4d450f627@redhat.com>
	<CAFEAcA9M0jeER9Ygg74_kQXv4CeW2_PMns7=t=Jw6sxkYhANpA@mail.gmail.com>
	<15cdd5e0-48f8-35be-8fa3-c57bc50828f6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jul 2017 22:20:32 +0100
Message-ID: <CAFEAcA9Wdw+nwnCo1MbDVzHmzRfbSz9ah5ZxZLGKErytoDz5JQ@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Kamil Rytarowski <kamil@netbsd.org>,
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22e
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10]
 util/oslib-posix.c: Avoid warning on NetBSD
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
X-List-Received-Date: Thu, 20 Jul 2017 21:20:56 -0000

On 20 July 2017 at 22:10, Eric Blake <eblake@redhat.com> wrote:
> On 07/20/2017 03:53 PM, Peter Maydell wrote:
>> On 20 July 2017 at 19:26, Eric Blake <eblake@redhat.com> wrote:
>>> On 07/20/2017 11:32 AM, Peter Maydell wrote:
>>>> On NetBSD the compiler warns:
>>>> util/oslib-posix.c: In function 'sigaction_invoke':
>>>> util/oslib-posix.c:589:5: warning: missing braces around initializer [-Wmissing-braces]
>>>>      siginfo_t si = { 0 };
>>>>      ^
>>>
>>> Uggh. That is a broken compiler.  C99 declares that 'anything = {0}' is
>>> supposed to be a valid way to zero-initialize anything.
>>
>> Looks like maybe it was https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53119
>
> Would it be better to add a configure check for broken -Wmissing-braces
> (where we would then add -Wno-missing-braces to the (outdated) NetBSD
> compiler)?

There's also a pointer to a clang bug which is not marked as fixed,
and even in gcc it's down as not fixed in 4.8 or 4.9 if I'm reading
the bug comments right.

> But then again, we already rely on gcc/clang's extension of foo={}
> (which is valid for C++, what a shame that the two languages picked
> different universal-zero initializers), so it's probably less churn to
> just fix the few outliers to also rely on the extension than it is to
> bloat configure just to permanently work around the broken compiler.

This is AFAICT the only instance that needs fixing, because the
compiler only warns if the first element in the struct isn't
a simple data type that can be initialized with '= 0'. If NetBSD
had happened to use a similar definition to Linux (which happens
to start with "int si_signo;") we wouldn't have had to change this
initializer. (The fact that so many still-prevalent gcc versions
behave like this is probably why the only case the NetBSD compile
found is one that is an initializer of a system-header-defined
struct where NetBSD has taken a somewhat odd approach.)

(Personally if I were the C standards folks I'd fix it by
blessing the gcc-extension that makes "{}" a valid zero
initializer and bringing it into line with C++.)

thanks
-- PMM

