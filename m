Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bZcwf-0003g5-Hm
	for mharc-qemu-trivial@gnu.org; Tue, 16 Aug 2016 07:54:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bZcwd-0003eI-B3
	for qemu-trivial@nongnu.org; Tue, 16 Aug 2016 07:54:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bZcwY-0000e2-Ep
	for qemu-trivial@nongnu.org; Tue, 16 Aug 2016 07:54:10 -0400
Received: from mail-ua0-x236.google.com ([2607:f8b0:400c:c08::236]:33515)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bZcwX-0000dk-Ne
	for qemu-trivial@nongnu.org; Tue, 16 Aug 2016 07:54:06 -0400
Received: by mail-ua0-x236.google.com with SMTP id 74so117242680uau.0
	for <qemu-trivial@nongnu.org>; Tue, 16 Aug 2016 04:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UWSaiW0E0NMTyqEeNCmG64BvlPBIWg4kNToKpaa3+n8=;
	b=TE26HFyl2binMeQsjnNyS3WCqy8/bcRffI6cPbyzvskp43Jn1wkI7v1K5UNCv0+axt
	5N/MiKMYV9LBipQPdeH330cGvENmZ76O3+Vdurm8bSWKWDo0zTHehWUlJUIoXFPofWyV
	4NjAFEM81boG/YInSUbI7Tuj67sTKlxNAYm4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UWSaiW0E0NMTyqEeNCmG64BvlPBIWg4kNToKpaa3+n8=;
	b=DUSdrkT/U7ie2Ja4PnSZjQNz42V8wXUaUbv9btkENWaZPmTqb7Aac4sLLzLfMhngw5
	cIRc3sZYszgNk6sGUpdqntDytcjuQbgOFS2b2j1bbKZeF+FA+JAeHulMdLAxTRaNn1Xs
	wqOGQqXtE/NS5+LVAxi0lXaD+zAjsxdVAxG0PLmdKdRCIzXHvUpOMV2MT71ne42lJBfF
	E9onjwULJqjatx64BbVgyy6iSOUBKxBw2s5mFYO5oX+ZoM9lm5WDmej4t6vQ/cHO7srZ
	8anmxcgDsf/WuBarSh7RxhXQs3H2fyG2OdTs3wwNHZVuInnwHQjQwOFzuNE1TQMfHH8f
	ve8A==
X-Gm-Message-State: AEkoouuFBN3BGzxoUlxhbsgmKwr8O8VS7IgLY/QeKzwJSAnTLm4mG+ZzpGFxJR4l29p3ysWYaGsEkD6Nfx2FBX79
X-Received: by 10.31.15.67 with SMTP id 64mr17072929vkp.37.1471348445220; Tue,
	16 Aug 2016 04:54:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.149 with HTTP; Tue, 16 Aug 2016 04:53:44 -0700 (PDT)
In-Reply-To: <f5853dbe-2c39-6c0a-5168-e5309325f1d9@comstyle.com>
References: <1471249494-17392-1-git-send-email-thuth@redhat.com>
	<f5853dbe-2c39-6c0a-5168-e5309325f1d9@comstyle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Aug 2016 12:53:44 +0100
Message-ID: <CAFEAcA8GoYSsjHz95Z=kjdWo8w-08QJFA6eS6OKyLLedw652JA@mail.gmail.com>
To: Brad Smith <brad@comstyle.com>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::236
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.7] slirp: Rename
 "struct arphdr" to "struct slirp_arphdr"
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
X-List-Received-Date: Tue, 16 Aug 2016 11:54:12 -0000

On 16 August 2016 at 05:03, Brad Smith <brad@comstyle.com> wrote:
> On 08/15/16 04:24, Thomas Huth wrote:
>>
>> struct arphdr is already used by the system headers on OpenBSD
>> and thus QEMU does not compile here anymore. Fix it by renaming
>> our struct to slirp_arphdr instead.
>>
>> Reported-by: Brad Smith
>> Buglink: https://bugs.launchpad.net/qemu/+bug/1613133
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>
>
> Thanks, this does fix the build.

Applied, thanks.

-- PMM

