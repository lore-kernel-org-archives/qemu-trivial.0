Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXnrE-0001hg-92
	for mharc-qemu-trivial@gnu.org; Wed, 19 Jul 2017 08:13:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nmccallu@redhat.com>) id 1dXdTC-0004Ub-Tb
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 21:08:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nmccallu@redhat.com>) id 1dXdT8-0000Yy-MG
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 21:08:06 -0400
Received: from mail-it0-f48.google.com ([209.85.214.48]:35154)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <nmccallu@redhat.com>) id 1dXdT8-0000Yd-HS
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 21:08:02 -0400
Received: by mail-it0-f48.google.com with SMTP id h199so18208127ith.0
	for <qemu-trivial@nongnu.org>; Tue, 18 Jul 2017 18:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zdScUbMDY2gJbPryL+G+CpImmltg+wDprMx4FwoUWow=;
	b=VYSbXgTiC6rMnhJacpw5jIiz2DTaOaXOv612mRTx+WlD8Et6jFX3+Lktl0vfmomECv
	qUcU0rgQbJkcH3T3T0SBtatnj+UGFKNPhVjZQJIcBcXamIk1EFNjEecbB2ySUaR/Iu+S
	vN05rqhJGdeNOrrPCCqcTZUHXFe0Zx88KZm010QaE70JuXF1rs+M66f+h9yD6c1153vJ
	v4uuAR9dz8oSgFKLU+ZAeZar22/VKXeaR+wikotmvr6HaLw5C8fj1lgzFgNnrgJBE/NE
	uip/D+NDHn2iEaSJkhGvTrnXfifxDEV6Wv/U7yR+nSbw6pBlgXHq0V9h2JFosVxtc4H2
	AJ1w==
X-Gm-Message-State: AIVw110lHEMrC3auZVSDMFIHARXHKGsbNPM6JC+Zv2zoqNwMeZRXUjxt
	OeZiNUZyhVnziPyToVhTt2cjhV81GXdm
X-Received: by 10.36.181.74 with SMTP id j10mr97101iti.94.1500426481809; Tue,
	18 Jul 2017 18:08:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.21.6 with HTTP; Tue, 18 Jul 2017 18:08:01 -0700 (PDT)
In-Reply-To: <5e542ce6-4192-4590-163e-de54002d74dd@redhat.com>
References: <CAOASepMWrxm0OxvuzeujfVK8JN-UzKCXtaz2vJRgGno=8CSMqQ@mail.gmail.com>
	<5e542ce6-4192-4590-163e-de54002d74dd@redhat.com>
From: Nathaniel McCallum <npmccallum@redhat.com>
Date: Tue, 18 Jul 2017 21:08:01 -0400
Message-ID: <CAOASepNxd4VT5usLnXLB9Kx=_K3h-N5nqmYArLWaRaQY5Cud3Q@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.48
X-Mailman-Approved-At: Wed, 19 Jul 2017 08:13:35 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Update references of
 "struct ucontext" to "ucontext_t"
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
X-List-Received-Date: Wed, 19 Jul 2017 01:08:07 -0000

Yes, it is a dup. Sorry for the noise.

On Tue, Jul 18, 2017 at 9:03 PM, Eric Blake <eblake@redhat.com> wrote:
> On 07/18/2017 07:58 PM, Nathaniel McCallum wrote:
>> Glibc used to have:
>>
>>    typedef struct ucontext { ... } ucontext_t;
>>
>> Glibc now has:
>>
>>    typedef struct ucontext_t { ... } ucontext_t;
>>
>> However, Qemu used "struct ucontext" in declarations. This is a
>> private name and compatiblity cannot be guaranteed. This patch
>> updates Qemu to only use the standardized type name.
>>
>> Signed-off-by: Nathaniel McCallum <npmccallum@redhat.com>
>> ---
>
> Looks like this duplicates:
> https://lists.gnu.org/archive/html/qemu-devel/2017-06/msg06508.html
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>

