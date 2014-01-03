Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vyv42-0000ry-G0
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jan 2014 22:04:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Vyv3w-0000oT-Nt
	for qemu-trivial@nongnu.org; Thu, 02 Jan 2014 22:04:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Vyv3s-0002iL-6w
	for qemu-trivial@nongnu.org; Thu, 02 Jan 2014 22:04:40 -0500
Received: from mail-we0-f180.google.com ([74.125.82.180]:34440)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Vyv3s-0002iB-0u
	for qemu-trivial@nongnu.org; Thu, 02 Jan 2014 22:04:36 -0500
Received: by mail-we0-f180.google.com with SMTP id t61so13032336wes.39
	for <qemu-trivial@nongnu.org>; Thu, 02 Jan 2014 19:04:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=LNIk7I0aJc7WPip7xmc7kRhEc8UB15EZ2HiVFZ3uI8s=;
	b=PpA1W9CQS8U6Pxg9+QzqLOqzARetDswq6Qq7xWTvHDh1CRlNV2P2KxTVLsK9HLtlTK
	yiGIEgELbHCXZuUWSL62lGkocJFhReqon0jLooc5YDTKETcwhCGH52Tx/9eKc1f2K3jz
	nPizIjaQoW+wueXv43cXF9YCzHsj9U9xP/xgEo1G54YXCRcTwccijxSXoBSYJSOLJJUZ
	CpXaQOJXFI2Tg8GePoGZvzpcPiiPCLxdcGEcGElMgWDKlLR/DqpoEKS6Sh7JD0Lz4H+T
	auLRl/Ei3EKDKapR2dynAX8u3LCAKPSM+TAKU2YWL7OnxU9MFbUN/2Nkdn9KPpS5lbhq
	th0Q==
X-Gm-Message-State: ALoCoQmHz+kAe9QTNpr+c8WYpLlNFDDAhRWbWAYKTEEqAcsx1J8HEUG4kMRwRa5Mkh8feXpZBUta
MIME-Version: 1.0
X-Received: by 10.180.188.169 with SMTP id gb9mr89897wic.41.1388718275154;
	Thu, 02 Jan 2014 19:04:35 -0800 (PST)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.227.13.9 with HTTP; Thu, 2 Jan 2014 19:04:35 -0800 (PST)
In-Reply-To: <CAJBZ5eNOxuBnatFgQUEhPUwK9HJoddND=ov1DrXnSE31yGS_zQ@mail.gmail.com>
References: <1388464944-26911-1-git-send-email-keweihk@gmail.com>
	<CAEgOgz54Zj9w8gQaMNBvVCiFQX5raPFXLGODy97PrD-TmYSBvw@mail.gmail.com>
	<CAJBZ5eP8tRvaQf6qW-zzUs_WQ2WcwTyo0i5Xz3ak8SSprU9vmQ@mail.gmail.com>
	<CAEgOgz5_cT3B38fEUChB7+w7KTsZL5bbTQYiAvp6_i47nNvFMw@mail.gmail.com>
	<52C57D63.4080809@suse.de>
	<CAJBZ5eNOxuBnatFgQUEhPUwK9HJoddND=ov1DrXnSE31yGS_zQ@mail.gmail.com>
Date: Fri, 3 Jan 2014 13:04:35 +1000
X-Google-Sender-Auth: 8kOzhcG4occZzaRvuMOWosoX7u8
Message-ID: <CAEgOgz4=zMcRMeJj9ZWfTuQV9UFEBoujTU0_aVHdTnbBSqyMmg@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Kewei Yu <keweihk@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.180
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
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
X-List-Received-Date: Fri, 03 Jan 2014 03:04:45 -0000

On Fri, Jan 3, 2014 at 1:01 PM, Kewei Yu <keweihk@gmail.com> wrote:
>
> 2014/1/2 Andreas F=E4rber <afaerber@suse.de>
>>
>> Am 01.01.2014 05:40, schrieb Peter Crosthwaite:
>> > On Tue, Dec 31, 2013 at 11:29 PM, Kewei Yu <keweihk@gmail.com> wrote:
>> >> 2013/12/31 Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>> >>> On Tue, Dec 31, 2013 at 2:42 PM, Kewei Yu <keweihk@gmail.com> wrote:
>> >>>> When we disabling vnc from "./configure", the qemu can't use the vn=
c
>> >>>> option.
>> [...]
>> >>>> So qtest can't use the "vnc -none ", otherwise "make check" will
>> >>>> hang.
>> >>>
>> >>> Curious, why exactly does make check hang? Shouldn't it just fail wi=
th
>> >>> an error result in this case?
>> >>
>> >> Yeah, there is an error result "VNC support is disabled".
>> >
>> > I think its just terminology then. s/hangs/fails.
>>
>> Actually no. When qtest gets an unsupported command line argument, so
>> that QEMU exits right away, then qtest hangs, waiting for the process.
>> This was easily reproducible by mistyping machine names in my qom-test.
>> That's a separate issue though.
>
> Yeah, It actually waits for the a handler and doesn't exit from "make
> check".
> Maybe I didn't show a detailed description.
> So, Should I submit the patch v4?

Probably not just for this. "fails" is fine.

Regards,
Peter

>>
>>
>> Regards,
>> Andreas
>>
>> --
>> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
>> GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnb=
erg
>
>

