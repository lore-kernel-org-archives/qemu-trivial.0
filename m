Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmQ5E-0001uA-13
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 11:02:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UmQ58-0001lw-3R
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 11:02:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UmQ56-00025F-ES
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 11:01:58 -0400
Received: from mail-la0-x232.google.com ([2a00:1450:4010:c03::232]:34275)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UmQ56-000256-7l
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 11:01:56 -0400
Received: by mail-la0-f50.google.com with SMTP id dy20so4642637lab.23
	for <qemu-trivial@nongnu.org>; Tue, 11 Jun 2013 08:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=/TlsT0lZIyuEeuTafIFM9U+YHkviwMPIrVBuUqTTE80=;
	b=OFdrxwBvLN5GWYEi8YpSVndzVrArIhBQboIGufKtZ6W9k0O4QJkrStsapmaSGi4CHO
	peCrN4c0l4wvjUHayGfaTJiRKy58caODTklGsXWw21B9drDd0lFu6wMhMM9BD4ZKS6rI
	EPZVe6Ga18Qb5qHZ8jdRJlc0WrtJJCUXdJ/nqDaqK2uoxD0V03Spykor/Dr7CEAa+jz3
	v+KL9IahBKiCpEwNZH2/OxLE6XMN5KOoWbPReYyRdVrpyUggUNjTrWDuxEYWQcQdVs8u
	eSwmwWvvxRYx1GaBq3FtqWOLTPb6oLB2AKMXGv/hv08dy8D4btKQMc3Q0uEaG1nh/ri3
	/tUw==
X-Received: by 10.152.19.4 with SMTP id a4mr7555867lae.37.1370962915072; Tue,
	11 Jun 2013 08:01:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.138.200 with HTTP; Tue, 11 Jun 2013 08:01:34 -0700 (PDT)
In-Reply-To: <51B7183E.6070203@msgid.tls.msk.ru>
References: <1370897240-23490-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA88zpSQTLWSwu6ci7rytTMxkWWqjE4jfb=0Svj+9P8NsQ@mail.gmail.com>
	<51B7183E.6070203@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jun 2013 16:01:34 +0100
Message-ID: <CAFEAcA8g7Ck_vdAraiEsKdYBi=VM8PRTCrA9UnA6GAa+JgXUoQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnE2hRPVGsU2+zw0XZNwFFMmbDtNSJbJESkVwFv1gwLN9k9ENk7IAnB633TWjV54cVy1KEu
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::232
Cc: qemu-trivial@nongnu.org, "M. Mohan Kumar" <mohan@in.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] configure:
 explicitly disable virtfs if softmmu=no
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
X-List-Received-Date: Tue, 11 Jun 2013 15:02:02 -0000

On 11 June 2013 13:29, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 11.06.2013 01:45, Peter Maydell wrote:
>> This doesn't feel to me like it's quite the right way
>> to fix this bug. The current code in configure seems
>> to tangle up (a) was virtfs requested and can we do it?
>> with (b) what do we need to do if it was? (build some
>> extra tools) and (c) when does it make sense? not for
>> linux-user targets. So you end up with an 'else virtfs=no'
>> clause added in an odd place. If the mess was untangled
>> then this probably wouldn't be necessary.
>
> Um. I don't think that tangling is a bad thing really.
> Having different variables or options for it will be
> too bloated, in my opinion.  I don't think there should
> be anything done with it.

I don't want more variables. I just don't think we
should have "if not softmmu then do some other thing";
just check for whether the user asked for virtfs and
we can do it, and if so set virtfs=yes.

> How about something like this:
>
> --- a/configure
> +++ b/configure
> @@ -3810,7 +3810,7 @@ fi
>  if test "$libattr" = "yes" ; then
>    echo "CONFIG_LIBATTR=y" >> $config_host_mak
>  fi
> -if test "$virtfs" = "yes" ; then
> +if test "$virtfs" = "yes" && test "$target_softmmu" = "yes" ; then
>    echo "CONFIG_VIRTFS=y" >> $config_host_mak
>  fi

This seems like a step backwards to me. virtfs=yes should
just translate straight to CONFIG_VIRTFS and the makefile
should just not care if it's set if we happen not to be
building anything virtfs related.

>> Also, disabling building tools and docs in general seems
>> broken: --disable-tools disables building qemu-img, for
>> instance, but not its documentation. So maybe we should
>> fix this by generally making sure we don't build the docs
>> unless we build the tool as well.
>
> This has been addressed by a separate patch sent by afaerber.

That patch didn't touch anything virtfs proxy related.

thanks
-- PMM

