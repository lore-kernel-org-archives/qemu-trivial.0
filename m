Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VyDaR-0008Sa-GG
	for mharc-qemu-trivial@gnu.org; Tue, 31 Dec 2013 23:39:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1VyDaL-0008JD-G3
	for qemu-trivial@nongnu.org; Tue, 31 Dec 2013 23:39:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1VyDaF-0000j6-Ug
	for qemu-trivial@nongnu.org; Tue, 31 Dec 2013 23:39:13 -0500
Received: from mail-wi0-f176.google.com ([209.85.212.176]:49403)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1VyDaF-0000it-Oo
	for qemu-trivial@nongnu.org; Tue, 31 Dec 2013 23:39:07 -0500
Received: by mail-wi0-f176.google.com with SMTP id hq4so17736166wib.15
	for <qemu-trivial@nongnu.org>; Tue, 31 Dec 2013 20:39:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=tE1JVhA0tjnKLqhCAij0+m7H0C7gRGYLTO/xOKovYXs=;
	b=jngl1oUlH0KEg2Fcob54CQKrc5sLDoOiM9wBkxfi47eUEgEz34keaoquKyeA1FLgze
	DVOszX8mjfusOu2HSkNV2RxTGeeNd+NV2x7geCuXEKY4/vwuTpt9fBpA+DvEfTi/n4Ik
	YJPWvvUhWuvYRmWt3nTvLFfkDlIqHGw9fnNvxtxryLQiFqm5iUo7dis0V1N4bx9b1jmd
	FP5xfPTGfbn4ImsERBH0UD+OfHMYKZNYc505b+tlOqWBZc/dY5fcywaSGVpXQyxXDsFa
	5vmqYLQz7SdvPOux9HAgg4L3W5iFO1x9iEB29KIoDHfJSrUYklEu78udKery8x7CknCy
	otcw==
X-Gm-Message-State: ALoCoQkSP3Oh+pNRp666mehFGBA4KpBDIGzjq7wmDWGW/9brFocQ7vzaCirY7v0gxDgmkZQzZ/8C
MIME-Version: 1.0
X-Received: by 10.180.36.105 with SMTP id p9mr49560070wij.58.1388551146088;
	Tue, 31 Dec 2013 20:39:06 -0800 (PST)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.227.13.9 with HTTP; Tue, 31 Dec 2013 20:39:06 -0800 (PST)
In-Reply-To: <CAJBZ5eOu2Xs0Z9rYSCdNexUE-qJ3FvpnxgWcNfqJdT8koBNQXA@mail.gmail.com>
References: <1388464944-26911-1-git-send-email-keweihk@gmail.com>
	<CAEgOgz54Zj9w8gQaMNBvVCiFQX5raPFXLGODy97PrD-TmYSBvw@mail.gmail.com>
	<CAJBZ5eP8tRvaQf6qW-zzUs_WQ2WcwTyo0i5Xz3ak8SSprU9vmQ@mail.gmail.com>
	<CAFEAcA8iVQWWYDLZLS60U=u=Hyd4WToG_nWtcG0ZHVs7-ELnwA@mail.gmail.com>
	<CAJBZ5eOu2Xs0Z9rYSCdNexUE-qJ3FvpnxgWcNfqJdT8koBNQXA@mail.gmail.com>
Date: Wed, 1 Jan 2014 14:39:06 +1000
X-Google-Sender-Auth: Gt1Ak69fcBU2pfkGEJJhrSRiYqQ
Message-ID: <CAEgOgz6iog6wvdEmDeHXeK5DDrfi_ZVE_Ur1JYSHpbE_OjVvEw@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Kewei Yu <keweihk@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.176
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 1/1] qtest: Fix the bug
 about disabling vnc causes "make check" hang
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
X-List-Received-Date: Wed, 01 Jan 2014 04:39:18 -0000

On Wed, Jan 1, 2014 at 12:29 PM, Kewei Yu <keweihk@gmail.com> wrote:
>
> 2014/1/1 Peter Maydell <peter.maydell@linaro.org>
>>
>> On 31 December 2013 13:29, Kewei Yu <keweihk@gmail.com> wrote:
>> > 2013/12/31 Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>> >>
>> >> On Tue, Dec 31, 2013 at 2:42 PM, Kewei Yu <keweihk@gmail.com> wrote:
>> >> >                                    "%s", qemu_binary, s->socket_path,
>> >> >                                    s->qmp_socket_path, pid_file,
>> >> > +                                  qtest_vnc_param ?: "",
>> >>
>> >> I do vaguely remember someone going to efforts to remove uses of "? :
>> >> foo" (with the blank true value).
>> >
>> >  I'm not clear the sentence's meaning.
>>
>> Using the ternary operator "X ? Y : Z" with an empty 2nd operand
>> "X ?: Y" is not standard C. It's a GCC extension. There was a
>> suggestion a year or so back that we should remove the uses of
>> it, but the consensus was that this was unnecessary, since in
>> practice we rely on other GCC extensions. Clang also supports
>> this syntax, and it's the only other compiler we care about.
>>
>
> Oh! Thank you, I got it.
>
>> In this case it seems reasonable, especially since the line
>> immediately below this addition is using it too.
>
>
> But,do I need to fix them to be "X ? Y : Z" and keep them consistent?
>

No, it's already consistent. No change to patch required. Apart from
the grammar and spelling.

Regards,
Peter

> Faithfully yours
> Kewei Yu
>
>> thanks
>> -- PMM
>
>
>

