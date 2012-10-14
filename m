Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TNV0Y-0002iE-OH
	for mharc-qemu-trivial@gnu.org; Sun, 14 Oct 2012 16:41:58 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNV0W-0002Xz-5W
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:41:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNV0V-0000gv-EW
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:41:56 -0400
Received: from mail-ia0-f173.google.com ([209.85.210.173]:51382)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TNV0S-0000gT-NC; Sun, 14 Oct 2012 16:41:52 -0400
Received: by mail-ia0-f173.google.com with SMTP id m10so3249544iam.4
	for <multiple recipients>; Sun, 14 Oct 2012 13:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=P/wpOeJ5WuyNBOimYjg1psp2K6EtzqKN/rz0jRolHOA=;
	b=zIpOFRbUw/NMJZCXACqWw3eoth/bKOJpP7mAEiNQEEQ460yJ0VKr6Z/X8CUhzsd8Gq
	IDCLryu4FFbsqKtYXPcYxL1hXiA4cCIdoXIcgsX8zQ3LrIG7miTISnGt12lDx1PAbSyv
	DjULhf4LiTRILYqZ9SB9ySWg63E2Dq2Q4jR/1O7OSjxqB+U4kAqQOZDMpb1DbXhrfl1n
	gtQX6Fs04EUdymnZFrEhh/1OLi4wJ11yRJi+M4MUzC7y6STDyxZlk3lzv//nD9lcAl8z
	vgsapCwFb/3H5zdu8lcY5dQ9kjFf7/AnKH4LY2tB/MkaY+Ij2yxBq2Jsi9r6t1PkKca+
	bU5A==
Received: by 10.50.220.161 with SMTP id px1mr7222092igc.27.1350247312089; Sun,
	14 Oct 2012 13:41:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.53.130 with HTTP; Sun, 14 Oct 2012 13:41:30 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1210150030520.5387@linmac>
References: <cover.1350244587.git.blauwirbel@gmail.com>
	<CAAu8pHtYEb8PXnFSyWn9ZEZkFvd4y4e77oxc-L+jZOOodLaNJw@mail.gmail.com>
	<alpine.LNX.2.00.1210150030520.5387@linmac>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sun, 14 Oct 2012 20:41:30 +0000
Message-ID: <CAAu8pHvjEh-4Ozjix=ufhhCTvc=PZKO9R+1eabfr_B8-NNmyEQ@mail.gmail.com>
To: malc <av1474@comtv.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 00/11] static patches
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
X-List-Received-Date: Sun, 14 Oct 2012 20:41:57 -0000

On Sun, Oct 14, 2012 at 8:32 PM, malc <av1474@comtv.ru> wrote:
> On Sun, 14 Oct 2012, Blue Swirl wrote:
>
>> On Sun, Oct 14, 2012 at 7:58 PM, Blue Swirl <blauwirbel@gmail.com> wrote:
>> > I made a small tool to detect unused functions and
>> > variables. Here's some fixes.
>>
>> Just run the attached tool in an object directory and after some time,
>> it will produce a list of suspect symbols:
>> AES_decrypt ( ./aes.o)
>> AES_encrypt ( ./aes.o)
>
>
>> AUD_get_elapsed_usec_in ( ./audio/audio.o)
>> AUD_get_elapsed_usec_out ( ./audio/audio.o)
>> AUD_init_time_stamp_in ( ./audio/audio.o)
>> AUD_init_time_stamp_out ( ./audio/audio.o)
>> AUD_is_active_in ( ./audio/audio.o)
>> AUD_is_active_out ( ./audio/audio.o)
>
> And those are all part of public API mentioned in audio.h
> Unused yes, but they are not static intentionally.

Yes, I checked those. The tool is a fool. There are other cases like
softfloat functions and TCG runtime parts which may be unused for some
host/target combinations. In theory, with lots of #ifdeffery or
splitting the files into smaller pieces, the unused parts could be
disabled, but that would be silly. A better approach might be using
some kind of AR library but it would still be a lot of effort for
little gain.

>
> [..snip..]
>
> --
> mailto:av1474@comtv.ru

