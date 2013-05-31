Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UiQaz-0005o5-OC
	for mharc-qemu-trivial@gnu.org; Fri, 31 May 2013 10:46:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UiQax-0005nZ-70
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 10:46:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UiQav-0005zG-2i
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 10:46:19 -0400
Received: from mail-lb0-f169.google.com ([209.85.217.169]:51118)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UiQau-0005yv-Rp
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 10:46:16 -0400
Received: by mail-lb0-f169.google.com with SMTP id 10so1787628lbf.0
	for <qemu-trivial@nongnu.org>; Fri, 31 May 2013 07:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=5Op3jMs1cu1NYuzebknbtk/+Grf4xDwFCJvKgJdlIaQ=;
	b=FaONtAzMLQegHyMIL/B4CI6SpJlRWdaVru3DqvICjEjTONuacnjZ10sgL0GUXNEqxd
	xWPLFRYhqXRGi5uM51XUF1jmVuMl7fqDdd+91KBiFI8ASoOJB2Ck1z4koMcPisn3DDHZ
	b+Zw0g00Ihaas5tw7z6XsZ4NefknbxEy157jf8SRLc2CEodxGHhh52BTfCVzMxI/slY1
	JhjcQgi6kVawn/2gCWK6Gt9Pj19h4fFK/Su6MJg9r7PcihUeziTl37jvcBgsQS5eyEG+
	nQVg3+cCi37Q7HvQ6nPZY4nl0ufGMmk53EYwYQNe+9NM7syIxGZBTxL25NUb8gtt/y3c
	lsYw==
X-Received: by 10.112.35.69 with SMTP id f5mr5916779lbj.105.1370011575798;
	Fri, 31 May 2013 07:46:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.2.39 with HTTP; Fri, 31 May 2013 07:45:55 -0700 (PDT)
In-Reply-To: <87ppw7fgmh.fsf@schwinge.name>
References: <1369993154-17690-1-git-send-email-thomas@codesourcery.com>
	<51A89273.8010400@msgid.tls.msk.ru>
	<CAFEAcA9LomV1rkJPPctUgxG0aJzCHiGr6VYSsSmaGytvQv9hUQ@mail.gmail.com>
	<87ppw7fgmh.fsf@schwinge.name>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 May 2013 15:45:55 +0100
Message-ID: <CAFEAcA86uj7Er+1QadznCfTTEmDGK0NqVrWmvE365zNV1=j=3w@mail.gmail.com>
To: Thomas Schwinge <thomas@codesourcery.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnxCMfgGTxldJqnMdUyOzWoWHnf3hbP+xNdX7e83o5vWiySjIS3ZyjsAvm4QinuLRcWq0QA
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.169
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fpu: Simplify
 floatx80ToCommonNaN function.
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
X-List-Received-Date: Fri, 31 May 2013 14:46:20 -0000

On 31 May 2013 14:01, Thomas Schwinge <thomas@codesourcery.com> wrote:
> On Fri, 31 May 2013 13:34:12 +0100, Peter Maydell <peter.maydell@linaro.org> wrote:
>> That said, I think any new patches to fpu/ need to
>> come with an explicit statement that they can be
>> licensed under the softfloat-2a license or GPLv2
>> or BSD (etc etc) so they aren't an obstacle to
>> the softfloat-2a-to-2b conversion that is in the works.
>> [cc'd Anthony so he can correct me if I'm wrong.]
>
> I hereby place this one contribution (which I think wouldn't constitute a
> copyrightable change anyway) into the Public Domain, allowing any kind of
> usage.

I think we'd generally suggest creative commons CC0 as being
in less of a legally grey area internationally than "public
domain", if you're happy with that.

Either way,

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

