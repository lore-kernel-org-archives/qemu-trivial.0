Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cegSG-0004Zh-P5
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2017 06:12:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cegSE-0004ZO-3E
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 06:11:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cegS9-0000K3-22
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 06:11:58 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:35370)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1cegS8-0000Jg-RR; Fri, 17 Feb 2017 06:11:52 -0500
Received: by mail-wm0-x243.google.com with SMTP id u63so1952838wmu.2;
	Fri, 17 Feb 2017 03:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=XQQvyiOuHmtYiySRnNRp3nhuCb5wb+udO0L3m/RMil8=;
	b=a1GELgOnHNXuoBQOKov08EsK9zeGQ6cXrYnMKq780wy2Hf61ejJHRUrpcITJTUpVvV
	CqEzCDsdzH9UTwqVvo99YDcf+g8YKKAt5pvf/PPQ8fcG8aNnNtWFXS7P858BsjZA5HPn
	NtC8oV1Esp9L4RTK6vJDJh1gy7S8HNnCDiwIPfFzoowWjxS4SnuCf9ua20NPt4TkAzH9
	pzq3W4hI/oryZRA5nMTkhejeSUBuMspyP7+hRWCHrTeATaoHwFFLjmiV7+pKdpqP9KaZ
	J2tPcmWKuFGMUas1EJPFUpAytBjkAJ8Q8vBTMGKJQKNcVYJjFJc9SB6TasQJnKgxQor9
	+HPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=XQQvyiOuHmtYiySRnNRp3nhuCb5wb+udO0L3m/RMil8=;
	b=FP1y0s88Ak9UJ80xga1cQYyf0uslgDiQWB+62F9yANRXZgfp8PlkADLwFABcGDmjaD
	G+u+0A39TAYFj8qKjGzGuBeIzcRRawq5KQSraDTHX/S81oNBgLIQKNQFgJu1WilnxM3R
	JNlFBTLvYSG1U4k3M8ivU0TuohsvoFJOhISOS+iBtTl37UWnqxaz2Uq5SC0t/SEqdYQt
	6yqTpJXvLnxDRH15hRzuTpZN9HxBD9HnL1EmyUm7PbGvFt2/0BN1cJLk4sF/pkKyE7rG
	hxos69DnrGveTvCo0Y+aFuEzkaUYGxg6oPwyaaHQ06N96+k1m5ySYLpyeCbGRZMP9N5m
	+nDw==
X-Gm-Message-State: AMke39nm/XKqmLq05RSP9qy6gsbuy04RI8IZsIGLgKkL52RFzTAINUi/UbIPcc3Df37i6w==
X-Received: by 10.28.15.2 with SMTP id 2mr2965296wmp.66.1487329911477;
	Fri, 17 Feb 2017 03:11:51 -0800 (PST)
Received: from [192.168.10.165] (94-39-187-56.adsl-ull.clienti.tiscali.it.
	[94.39.187.56]) by smtp.googlemail.com with ESMTPSA id
	w17sm12573220wra.28.2017.02.17.03.11.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Feb 2017 03:11:50 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Laszlo Ersek <lersek@redhat.com>, Chad Joan <chadjoan@gmail.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
	<bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
	<e19aed34-77c2-f588-351d-2daa8a099ae9@redhat.com>
	<279d2ba8-dabc-0c50-ea7e-1cecccc22291@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6e37308a-5d95-8795-fd1a-25e4ace2158f@redhat.com>
Date: Fri, 17 Feb 2017 12:11:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <279d2ba8-dabc-0c50-ea7e-1cecccc22291@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-trivial] Fix build break during configuration on
 musl-libc based Linux systems.
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
X-List-Received-Date: Fri, 17 Feb 2017 11:11:59 -0000



On 17/02/2017 10:17, Laszlo Ersek wrote:
> Of course, *if* that other C library, and the Curses implementation,
> claim compatibility with glibc as far as _GNU_SOURCE goes, *then* I
> fully agree with you. (IOW, it depends on the condition that you
> formulated above, "if musl wants to support _GNU_SOURCE".)

They at least try, since their features.h supports it.

> Same for ncurses -- do they aim at SUSv2 conformance, or do they intend
> to consider _GNU_SOURCE specifically?

Well, ncurses is a GNU project so I suppose they mostly care about
whatever Autoconf does.  And indeed Autoconf does have some special
casing for -D_XOPEN_SOURCE=500:

  AC_CACHE_CHECK([whether _XOPEN_SOURCE should be defined],
    [ac_cv_should_define__xopen_source],
    [ac_cv_should_define__xopen_source=no
     AC_COMPILE_IFELSE(
       [AC_LANG_PROGRAM([[
          #include <wchar.h>
          mbstate_t x;]])],
       [],
       [AC_COMPILE_IFELSE(
          [AC_LANG_PROGRAM([[
             #define _XOPEN_SOURCE 500
             #include <wchar.h>
             mbstate_t x;]])],
          [ac_cv_should_define__xopen_source=yes])])])
  test $ac_cv_should_define__xopen_source = yes &&
    AC_DEFINE([_XOPEN_SOURCE], [500])

If musl needs _XOPEN_SOURCE for wchar.h, then it would be worth working
around in QEMU.  If it's just happening with ncurses, however, it'd be a
musl bug, which should be fixed in musl or worked around in ncurses.

Chad, can you check whether the programs below fails with musl:

/* First program */
#define _GNU_SOURCE
#include <wchar.h>
mbstate_t x;

/* Second program */
#include <wchar.h>
mbstate_t x;

/* Third program */
#define _XOPEN_SOURCE 500
#include <wchar.h>
mbstate_t x;

Just compile them with "gcc foo.c -O2".

Thanks,

Paolo

