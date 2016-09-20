Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bmPK9-0007xj-PY
	for mharc-qemu-trivial@gnu.org; Tue, 20 Sep 2016 13:59:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58948)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bmPK7-0007vV-Fp
	for qemu-trivial@nongnu.org; Tue, 20 Sep 2016 13:59:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bmPK6-0003fF-Dc
	for qemu-trivial@nongnu.org; Tue, 20 Sep 2016 13:59:15 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:33411)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bmPK6-0003f3-9X
	for qemu-trivial@nongnu.org; Tue, 20 Sep 2016 13:59:14 -0400
Received: by mail-vk0-x22e.google.com with SMTP id u196so38602959vkd.0
	for <qemu-trivial@nongnu.org>; Tue, 20 Sep 2016 10:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=geLbNfPtBs9hDyiQymvln/nD7RE6tkPzNKOb3khnD7c=;
	b=Al8YbwBFwndjs6GjlWzrZLLTswjAAEoJA2SLtEA6OBtS3ocZh5PEDDSYa5+J7thBC1
	X0+PZPjro4UDgjAhSNT3VdW9UGtog1AxpuiwC9GSlJFDONegQO34x65Vq9fD2Y2Q3hZO
	Dso2re5q5TJhcXuJL7QcZHThS3pNpL6FdO8i0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=geLbNfPtBs9hDyiQymvln/nD7RE6tkPzNKOb3khnD7c=;
	b=fNE42ikZAInYhcMG1HL6ynjqJDr6xAjNmDc/QTFdIXxsDVxFhAR+YfJJsyjAZ0q4Ak
	wVrAncwG4THH3P3W896jvoney3CZpqo0U6Bg04ZVCjFlHWH51dD3LB8uEN9q7cFdx7Zf
	FKIBNYjWgXSmFgVVPCPmAf+W4w3Uvg5S/ALjwTxSJ8tohBqBaynTVaZTWRT0PZJ5lq1K
	dZK/7K1CXY26pZBqlqhp6wzTQz+k/nMGHrj10jj/EtuBW6n3IhROxTREcag70OTTac3F
	/bzckpqAfkFeNUMtb9GWTKMQyZjNnkBo21C0kWkKqIeHvAy5F7cAO++kpAsGauxGMOK1
	gclg==
X-Gm-Message-State: AE9vXwOFaybSE2FHcJBLy/MiwqkxhNXMC6AufP+DJwTlgMbsPvo9AzEjVuWZWSJi4qWymdhcEiVwkIBuYzKZTr3W
X-Received: by 10.31.13.71 with SMTP id 68mr5421207vkn.175.1474394351747; Tue,
	20 Sep 2016 10:59:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Tue, 20 Sep 2016 10:58:51 -0700 (PDT)
In-Reply-To: <269ab2fb-a43b-c5ee-3ff4-c08f99054f8b@msgid.tls.msk.ru>
References: <1462237852-61856-1-git-send-email-chrisfriedt@gmail.com>
	<269ab2fb-a43b-c5ee-3ff4-c08f99054f8b@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2016 18:58:51 +0100
Message-ID: <CAFEAcA_Km8-bEYhy6k3YgJwVauuFGyXXGtXXQZx2Ba23+vYtCw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Christopher Friedt <chrisfriedt@gmail.com>, Fam Zheng <famz@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2v2] [RESENT-INLINE] Use
 libtool instead of ar to create static libraries on Darwin.
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
X-List-Received-Date: Tue, 20 Sep 2016 17:59:16 -0000

On 14 September 2016 at 08:30, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 03.05.2016 04:10, Christopher Friedt wrote:
>>
>> Currently, at least on Mac OS X 10.11.4 (El Capitan), Qemu fails to build
>> for a few reasons.
>>
>> One of those reasons is that Apple's ld (at least ld64) does not properly
>> process archive files created with ar (even Apple's ar).
>>
>> After some RTFM'ing, I came upon this tidbit, which is unfortunate.
>> Luckily, autotools packages are not broken.
>>
>> "Libtool with -static is intended to replace ar(5) and ranlib."
>> http://www.manpages.info/macosx/libtool.1.html
>>
>> In any case, this change takes Apple's recommendations into account and
>> allows Qemu to build on Mac OS X El Capitan.
>>
>> Signed-off-by: Christopher Friedt <chrisfriedt@gmail.com>
>> ---
>>  rules.mak | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/rules.mak b/rules.mak
>> index d1ff311..44421af 100644
>> --- a/rules.mak
>> +++ b/rules.mak
>> @@ -105,7 +105,11 @@ modules:
>>         $(call LINK,$(filter %.o %.a %.mo, $^))
>>
>>  %.a:
>> +ifdef CONFIG_DARWIN
>> +       $(call quiet-command,rm -f $@ && libtool -static -o $@ $^,"
>> libtool    $(TARGET_DIR)$@")
>> +else
>>         $(call quiet-command,rm -f $@ && $(AR) rcs $@ $^,"  AR
>> $(TARGET_DIR)$@")
>> +endif
>>
>>  quiet-command = $(if $(V),$1,$(if $(2),@echo $2 && $1, @$1))
>
>
> Hmm.  Is this patch still relevant?  Apparently I missed it back then.

I don't have El Capitan, but I can confirm that it doesn't break
the build on Yosemite, so I guess we should have it.

I'd like to know the error message the linker produces first,
though (and we should put that in the commit message).

The progress string argument to quiet-command is slightly wrong:
we capitalize the shortname of the command being run, so it
ought to look like "  LIBTOOL $(TARGET_DIR)$@" so it lines up
and looks nice with the other output.

thanks
-- PMM

