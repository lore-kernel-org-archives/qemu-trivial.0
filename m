Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ceeL9-00040G-9V
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2017 03:56:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ceeL6-0003y3-EB
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 03:56:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ceeL3-0000qh-9I
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 03:56:28 -0500
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:33780)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1ceeL3-0000qb-3C; Fri, 17 Feb 2017 03:56:25 -0500
Received: by mail-wr0-x241.google.com with SMTP id i10so4545976wrb.0;
	Fri, 17 Feb 2017 00:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=hYWh7cU+40buX8UlzKykJ4thBLU878oNJ1MZWDT4tJE=;
	b=mDRVfTbayia4p3DiCq5/2aUnjFlFwaKYpNCiwF/uRZO23QdeOkLraVIAolTOM+Ov60
	h535tXSiSJku3/VehPPyjZkIuigmtj9HEHilXNGhEkLUoowjveN69GD+sA9x0Mra3bFo
	Cx9CfWMQn9Sm26tAs5BwlV0L+E66KUQYIIeROLEGu0KuaS5iGB0tEyru2zQ2SSLkFIEi
	LsV+AJ0hzztxDS18oVwfZCcTZciySOIw5S6NijvYlZpreQSkaTmB36boWrio4cyLaNNw
	Nazr9MF4fIIlvL1LaYUBn4Ez261Y2JgekqBJ+npgUUt5BZHEUUS3qrCq38YzjUJ8HJ2B
	F7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=hYWh7cU+40buX8UlzKykJ4thBLU878oNJ1MZWDT4tJE=;
	b=T/9cgbXERCgIOLhH3Sz94+PnqBVbYmGFmFwRLYzr2ZXt4TScwBpwdHBQemzfCBWPrA
	VgDK99NcKdKwWEVjwDGMXGvztd/m5YJJSepALaBoqbUMIL2aX7WFysEzZx+zcTQ6JfkD
	WBqfR4eDR/RxAErxa8hCQIBeOgPQfhceAxUqPU4jMuaZ4KOxkN5BNUfPZmRfIW1YaayA
	bxFUm/ubw7+raUvJqMCnhYktS6AvF7Ypg5wXY4TQw7rzAuF4hSahlXSXptwABrh1eIfF
	tg2kJ4Qmy7VEmXibuvojJkNLKQu/Y6qBYLatd+BUD30SIoUpKWliLV5no8OdzjjA98nV
	WTJg==
X-Gm-Message-State: AMke39nf37ftLnmS0u6+v65nZEpuZhkHz3g0zYopob7JJQE6w8I6fSeHOgLv1920QV2nfA==
X-Received: by 10.223.173.171 with SMTP id w40mr4657352wrc.177.1487321783919; 
	Fri, 17 Feb 2017 00:56:23 -0800 (PST)
Received: from [192.168.10.165] (94-39-187-56.adsl-ull.clienti.tiscali.it.
	[94.39.187.56]) by smtp.googlemail.com with ESMTPSA id
	w127sm833671wmg.30.2017.02.17.00.56.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Feb 2017 00:56:23 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Laszlo Ersek <lersek@redhat.com>, Chad Joan <chadjoan@gmail.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
	<bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e19aed34-77c2-f588-351d-2daa8a099ae9@redhat.com>
Date: Fri, 17 Feb 2017 09:56:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::241
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
X-List-Received-Date: Fri, 17 Feb 2017 08:56:29 -0000



On 16/02/2017 18:23, Laszlo Ersek wrote:
> On 02/16/17 17:58, Paolo Bonzini wrote:
>>
>>
>> On 16/02/2017 17:30, Chad Joan wrote:
>>> Hello,
>>>
>>> This is a one-line patch to the configure script that will allow QEMU to be
>>> built on musl-libc based Linux systems.  This problem is only noticeable
>>> when QEMU is built with --enable-curses.
>>>
>>> Detailed reading material if you want to know where this came from:
>>> https://bugs.gentoo.org/show_bug.cgi?id=609364
>>
>> Hi,
>>
>> can you explain exactly which function is missing without
>> -D_XOPEN_SOURCE=500?  If it is curses' wide-char functions, why does it
>> fail with musl but not with glibc?  Is _XOPEN_SOURCE always defined by
>> glibc if you have _D_GNU_SOURCE?
> 
> It is not necessarily auto-defined, but the effect is "as if".

Ok, so the bug is that glibc _does_ auto-define _XOPEN_SOURCE:

#ifdef _GNU_SOURCE
# undef  _ISOC95_SOURCE
# define _ISOC95_SOURCE 1
# undef  _ISOC99_SOURCE
# define _ISOC99_SOURCE 1
# undef  _ISOC11_SOURCE
# define _ISOC11_SOURCE 1
# undef  _POSIX_SOURCE
# define _POSIX_SOURCE  1
# undef  _POSIX_C_SOURCE
# define _POSIX_C_SOURCE        200809L
# undef  _XOPEN_SOURCE
# define _XOPEN_SOURCE  700
# undef  _XOPEN_SOURCE_EXTENDED
# define _XOPEN_SOURCE_EXTENDED 1
# undef  _LARGEFILE64_SOURCE
# define _LARGEFILE64_SOURCE    1
# undef  _DEFAULT_SOURCE
# define _DEFAULT_SOURCE        1
# undef  _ATFILE_SOURCE
# define _ATFILE_SOURCE 1
#endif

and ncursesw looks for _XOPEN_SOURCE exclusively:

#ifndef NCURSES_WIDECHAR
#if defined(_XOPEN_SOURCE_EXTENDED) || (defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 500))
#define NCURSES_WIDECHAR 1
#else
#define NCURSES_WIDECHAR 0
#endif
#endif /* NCURSES_WIDECHAR */


So I do think that if musl wants to support _GNU_SOURCE, it should also auto-define;
however it doesn't, see https://git.musl-libc.org/cgit/musl/tree/include/features.h.

Alternatively, ncurses should be patched to look at _GNU_SOURCE in addition to
_XOPEN_SOURCE and _XOPEN_SOURCE_EXTENDED.

In any case, it's not a QEMU bug.  Other packages likely are going to have the same
issue, and fixing all of them is the wrong course of action.

Paolo

