Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V1jbd-0007cz-3d
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jul 2013 16:54:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1V1jba-0007cl-2q
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 16:54:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1V1jbX-0005kG-BD
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 16:54:46 -0400
Received: from mail-ob0-f180.google.com ([209.85.214.180]:54043)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1V1jbX-0005k0-6U
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 16:54:43 -0400
Received: by mail-ob0-f180.google.com with SMTP id eh20so11078316obb.25
	for <qemu-trivial@nongnu.org>; Tue, 23 Jul 2013 13:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=VZUssFlp+be4x0/Ay2jETshPKqoXmUepgoiuDCCtgks=;
	b=QQ4wquQUTUQ3N7RhXMLzxMN2rPiuTOByOVFInYT0Jn46iHn/IZdjuO8kxqVO0ErmPa
	Yb3GoGGEq0yqwqJZrMOgvlR3f1QHTRuhzo+CRxg+spAOmBFftNpC2Uld92TUhCeTgE1O
	F5fzxvxdmzr+KH6E1EC6DW8tmAQ7F6xqG6k3ycYPI6EP2DG2Daq1hxSLz7meFz9vIoqT
	3+Lx5PAf8nX37skgL8PuLEcJSNJ2nfbe2yOsba49xL12FOUdNlDCTMWAS9smG+55mKZi
	rg/9Hhv4JFj+l9bKXNUftu+Dvtjud2tPzSEKmXJ1WfQBbXekvAUZnHbSb5B1zbxeswl0
	IAzg==
MIME-Version: 1.0
X-Received: by 10.60.131.171 with SMTP id on11mr32988509oeb.71.1374612882355; 
	Tue, 23 Jul 2013 13:54:42 -0700 (PDT)
Received: by 10.60.135.225 with HTTP; Tue, 23 Jul 2013 13:54:42 -0700 (PDT)
In-Reply-To: <874nbluhpr.fsf@codemonkey.ws>
References: <1373057744-20278-1-git-send-email-sw@weilnetz.de>
	<51E4D733.6090908@weilnetz.de> <51E84766.20603@weilnetz.de>
	<51EEE3CB.5030300@weilnetz.de> <874nbluhpr.fsf@codemonkey.ws>
Date: Tue, 23 Jul 2013 15:54:42 -0500
Message-ID: <CA+aC4ks2ZEhF7TVO8FwR_vsiT6_EVFuPjh+2K4A-8F4B19_TpQ@mail.gmail.com>
From: Anthony Liguori <anthony@codemonkey.ws>
To: Anthony Liguori <aliguori@us.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1
X-Gm-Message-State: ALoCoQkG5lRy2ScHRHEbZOD2mYiJKqE1Pd+VLmJqa4uRAl6Y3rNHGZjICdvWq9YtuUEMsVE4UyHO
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.180
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/4] po/Makefile: Fix
 regression and some minor issues
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
X-List-Received-Date: Tue, 23 Jul 2013 20:54:47 -0000

On Tue, Jul 23, 2013 at 3:47 PM, Anthony Liguori <aliguori@us.ibm.com> wrote:
> Stefan Weil <sw@weilnetz.de> writes:
>
>> Am 18.07.2013 21:52, schrieb Stefan Weil:
>>> Am 16.07.2013 07:16, schrieb Stefan Weil:
>>>> Am 05.07.2013 22:55, schrieb Stefan Weil:
>>>>> These patches are included:
>>>>>
>>>>> [PATCH 1/4] po/Makefile: Fix and improve help message
>>>>> [PATCH 2/4] po/Makefile: Fix *.mo generation for out-of-tree builds
>>>>> [PATCH 3/4] po/Makefile: Fix generation of messages.po
>>>>> [PATCH 4/4] po/Makefile: Use macro quiet-command for nice looking
>>>>>
>>>>> Regards
>>>>> Stefan W.
>>>> Ping?
>>> Ping^2
>>>
>>
>> Ping^3
>>
>> Who is maintaining GTK? Anthony?
>>
>> Is there any chance to get some of the issues which
>> are addressed by this series fixed in the next version of
>> QEMU?
>>
>> Patch 1 certainly could also be applied via qemu-trivial,
>> maybe some of the others, too. See
>> http://patchwork.ozlabs.org/patch/257202/.
>
> I really don't understand why, but patches completely ignored this
> thread so I haven't seen it until this ping.  I can't see any reason off
> hand but will investigate further.

Ah, it's quite obvious now.

Your leader has a typo, "PATH" instead of "PATCH".  My scripts ignore
threads that do not have "PATCH" or "PULL" in the subject.

Regards,

Anthony Liguori

