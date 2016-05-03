Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axU69-00055M-6o
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 02:46:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axOqh-0006C7-Ie
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:10:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axOqV-0001Bu-LA
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:09:58 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:34804)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>)
	id 1axOqU-00014g-EA; Mon, 02 May 2016 21:09:51 -0400
Received: by mail-oi0-x243.google.com with SMTP id d139so541007oig.1;
	Mon, 02 May 2016 18:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=33sxpk7qpkBpcW8ZgcxKDnxUH0GTrGyqws0WcWnQrYQ=;
	b=CW5Z3tH2uPED4OORhjkGvmfGbkxf1RFm0RMzgiNQALTvk6l1FQbpMLdv1/TI20q/co
	lLetOqyWqazvaMmDcPhdp6jL/XhVm1Os/Eyb3GajJPtDUKzbrDQyR+VsUyTLeuC14cgO
	S8yNHkgJFJ5enA+FC9inlfSQ9iyJbM/NHB0cdc0ptwgzH6Q9HTAuBj3ct31o0vpB41Yx
	mrfbi4ewH6ok8khgckCzKmUNDbJ/mbZwoYLfwtx5sBTzclS/J8G4kErofYpnEsxyBD6P
	QWXs/jF/Bvr7OyHCyirw6AUGSHg9IgO1OnBRiF28bgKnHdaJsVlvyM6pPolqnOMW2MD+
	V9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=33sxpk7qpkBpcW8ZgcxKDnxUH0GTrGyqws0WcWnQrYQ=;
	b=ZngIs7MD/deo2mfPu0yYXNeG8Y589NptvDAJ6WqcychCADVHAMFCfXNCZ3EjPQYn0O
	jpOUBo6bE9kZ4hZ3bX6huv9Oj7qN2Q47Ak1F4eiiNkiV8nB0Fff+ZwcVYHQw57TMcWd8
	9xEiBMH1tvUpfakuB2XAnTn1a0cf1KHet0EBofrRo85i4CLfarvnWTcc1V6t7Gcd4QBJ
	lKRAdj6x0s0/VfQzBsOmPuAxWCpCYEcvJWFxgq/NNysR1hjhR/jwqs30K3vz6rXw8Oee
	epE1Hm5lN+ESRyJ4UaKfrMIfdgyWQOL1xyi2BmKB4Fc2FR8X36tAxvH2RpHA02Ze+H7H
	PPCQ==
X-Gm-Message-State: AOPr4FXAAOmbECdnR8gvFRralLR96Rt4W4lwsqoGGSc3cHxP1rPcvF4gI2Y+9+4DlDchhunuU/ZdYoRpPzCarw==
X-Received: by 10.157.40.239 with SMTP id s102mr15046930ota.140.1462237758894; 
	Mon, 02 May 2016 18:09:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.4.120 with HTTP; Mon, 2 May 2016 18:08:59 -0700 (PDT)
In-Reply-To: <20160503010435.GT1421@ad.usersys.redhat.com>
References: <1462236478-61645-1-git-send-email-chrisfriedt@gmail.com>
	<1462236478-61645-2-git-send-email-chrisfriedt@gmail.com>
	<20160503010435.GT1421@ad.usersys.redhat.com>
From: Christopher Friedt <chrisfriedt@gmail.com>
Date: Mon, 2 May 2016 21:08:59 -0400
Message-ID: <CAF4BF-SjsGbzkAxRuf_UmpJCXLdeQtHOETv2LEiOp9Eay5QUeA@mail.gmail.com>
To: Fam Zheng <famz@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, mst@redhat.com, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::243
X-Mailman-Approved-At: Tue, 03 May 2016 02:46:19 -0400
Subject: Re: [Qemu-trivial] [PATCH 1/2] Use libtool instead of ar to create
 static libraries on Darwin.
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
X-List-Received-Date: Tue, 03 May 2016 01:10:10 -0000

On Mon, May 2, 2016 at 9:04 PM, Fam Zheng <famz@redhat.com> wrote:
> Cc'ing Peter Maydell, who must have better ideas than me on building on Mac.
>
> On Mon, 05/02 20:47, Christopher Friedt wrote:
>>
>> Currently, at least on Mac OS X 10.11.4 (El Capitan), Qemu fails to build for a few reasons.
>>
>> One of those reasons is that Apple's ld (at least ld64) does not properly process archive files created with ar (even Apple's ar).
>>
>> After some RTFM'ing, I came upon this tidbit, which is unfortunate. Luckily, autotools packages are not broken.
>>
>> "Libtool with -static is intended to replace ar(5) and ranlib."
>> http://www.manpages.info/macosx/libtool.1.html
>>
>> In any case, this change takes Apple's recommendations into account and allows Qemu to build on Mac OS X El Capitan.
>>
>> Signed-off-by: Christopher Friedt <chrisfriedt@gmail.com>
>> ---
>>  rules.mak | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>
>> diff --git a/rules.mak b/rules.mak
>> index d1ff311..44421af 100644
>> --- a/rules.mak
>> +++ b/rules.mak
>> @@ -105,7 +105,11 @@ modules:
>>       $(call LINK,$(filter %.o %.a %.mo, $^))
>>
>>  %.a:
>> +ifeq ($(shell uname),Darwin)
>
> I think you can use "ifdef CONFIG_DARWIN" here.

Good suggestion. I missed that entirely.

>> +     $(call quiet-command,rm -f $@ && libtool -static -o $@ $^,"  libtool    $(TARGET_DIR)$@")
>
> Is libtool always available on Mac OS X? If not, we may need to add the
> detection to ./configure.

Apple's libtool should be installed with their command line tools, at
least as far back as Snow Leopard.

