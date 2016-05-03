Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axajc-0002b2-Rt
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 09:51:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60096)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axajT-0002H8-NE
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 09:51:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axajH-0003b3-OA
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 09:51:18 -0400
Received: from mail-oi0-x234.google.com ([2607:f8b0:4003:c06::234]:34086)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>)
	id 1axajG-0003Px-Fg; Tue, 03 May 2016 09:51:11 -0400
Received: by mail-oi0-x234.google.com with SMTP id k142so25856031oib.1;
	Tue, 03 May 2016 06:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x/atTeOAfi0OOg+LwZd/hyQfnb/tPjPV+OvWRPC1eSg=;
	b=0R2x4Irxh0s65sG6A1ef+75TUbFgZJbJIUDtBngygFEpXUUokfvIW4G8I3sT2ZxBoW
	GHSzc6xOoMykRVn2lhp7S7d+NcI9u7qBSiLJ4wFTCEBu/mUEgfkJP9D1R68l92e/uZhk
	M19RM3hRG1I0E0RRYx1mZF98oJwg0n16dwN5055lLs30vh7cV43xunSXRQzvx4s+A48z
	JBqy1ErwkunvsQCB0KHbAGlytkMrDEBy0I+1jLm1/FbXCP4rzZ19oRi7JCEsSH6bDkHs
	W8o1y/5LD/tuNB9Yur2RltLDLtGlloX3n5sbUWszXFZqndA8iAE+jUDMKSyEbT9akouL
	79Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x/atTeOAfi0OOg+LwZd/hyQfnb/tPjPV+OvWRPC1eSg=;
	b=XKL3cOVRI/vEs1yJsNlZZWbTFiQaFGjpYYYcKnBcDlSDUOw3CNl3Vt8GVZI2djGYlP
	4b7LrQgMLyvRCX8wQY6+hhmKx6QmlM6jokCJwLqWgL2I00Uv+RTVTI6a11aBmcpsPkAg
	/MBGDCL+9c00HakhBpt14ulaFVipHiDZeXxCrVJ+XJbm/5+bqXiS3sGpHEOOTGAGsIk2
	5tI5jxeUNB+C4MLXp/ni0baIyKCUdSqAWuXbUwKaf1aZljC/mqyJFt7K62aUg/oAB7fr
	TvtlAQvZlT8Zuewd66UyLvjF4briQ94b8gR+TEZm7pLQ1p6X3kKcl0qsgneFvUklmC9x
	g/tA==
X-Gm-Message-State: AOPr4FVOr6zoTquTuackGcQ8im4HfJvxYlfyKfJAFGVTBHjIk5lJxju43UOZSnvBNFt7UWBWiQH82qB+VIFGRQ==
X-Received: by 10.157.40.239 with SMTP id s102mr1116261ota.140.1462283435212; 
	Tue, 03 May 2016 06:50:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.4.120 with HTTP; Tue, 3 May 2016 06:50:15 -0700 (PDT)
In-Reply-To: <0b165339-9dde-57f8-959d-22122390ca0b@twiddle.net>
References: <1462237852-61856-1-git-send-email-chrisfriedt@gmail.com>
	<0b165339-9dde-57f8-959d-22122390ca0b@twiddle.net>
From: Christopher Friedt <chrisfriedt@gmail.com>
Date: Tue, 3 May 2016 09:50:15 -0400
Message-ID: <CAF4BF-T44ixRn6EVqLvPC7pktEcCO8qQDJJd1UgN8WX6T=Dwcw@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Cc: famz@redhat.com, mst@redhat.com, qemu-trivial@nongnu.org, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::234
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
X-List-Received-Date: Tue, 03 May 2016 13:51:30 -0000

On Tue, May 3, 2016 at 3:06 AM, Richard Henderson <rth@twiddle.net> wrote:
> On 05/02/2016 03:10 PM, Christopher Friedt wrote:
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
>
> Does it work to use libtool -static everywhere?

That *would* be nice... yeah, it would be nice if Apple's tools could
work the same as *all* of the other unices out there. Unfortunately,
that's not the case, since at least GNU libtool does *not* accept the
"-static" argument.

To be honest, if it weren't for the man page for libtool on Mac OS X
[1] dating all the way back to Snow Leopard saying that libtool is the
preferred tool on Mac for creating static archives, I'm left wondering
if this is just a massive oversight / bug in Apple's ld64.

[1] http://www.unix.com/man-page/osx/1/libtool/

