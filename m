Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axenk-0008Qq-L4
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 14:12:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1axenc-0008Cj-UW
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 14:12:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1axenR-0006uG-Ba
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 14:11:51 -0400
Received: from mail-yw0-x241.google.com ([2607:f8b0:4002:c05::241]:35967)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>)
	id 1axenQ-0006V8-4f; Tue, 03 May 2016 14:11:45 -0400
Received: by mail-yw0-x241.google.com with SMTP id u62so2591522ywe.3;
	Tue, 03 May 2016 11:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TpLDwPXZBpXAqlZ68vHs/cF3dsc6oyUySpZlNbD+bEE=;
	b=zWLx3gK5SejNbWtsuUNVHHLZG5hEQPgSXaP6vQ+6rJBShYXr5O39nE85GH2iVTp9nP
	Naq2n1Tm/CA3QSJ4NjHq6VFjv0YIQ//XvFjWQS3xucvjRit0VU8Y4PJM29kpYToRUe4B
	5vUVla4z7GQOxjkfw2ClTGzWxn2kTE4PWBeSErFbrGRGVqeOCa7dmiGw8fOtrnmKeXdw
	2tneLBNEd390bac3/7kF/7DABtb3O/4czK7upalUDBsDYvzQpIDyy8xY2Te8MduNmeXL
	nVBP8QZe0zahgaAL1tPJCEZJmKbNoJJtZFxriFSlCEaNeYBqNxxABgvU7Wo9/wnPmw22
	zIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TpLDwPXZBpXAqlZ68vHs/cF3dsc6oyUySpZlNbD+bEE=;
	b=PO8/OvOR2yvUeYuCZXf1I+2xRhNwHn7WOhePrR2f9EkpMiC8+ynYkVs79NOqbk6FXV
	6cviM29uQx0XMewPCmPiH5+5HYlIcp5K0tXkkBmoRKf8BKcT3Ga9FnsK1neriI451+xp
	uvXciXp+uk/LzhZn2lEjscwBdt/LFaUR7ogS/0cYGGkFhTSeAqyYtgNzLe95CfriKyoc
	/PpdXFDsstI2O3tP/PMR3gsWw60dMPLTskYAbU1QdKKEOQB5mhis+0PhHoS6OV5vVENS
	TB2XPynR5bu2fZFA7KdqZQDYOgPDg6HZN7VsRMhpb7EwWPlRyCHvdpiCtO3YMP/+rBbS
	wc+Q==
X-Gm-Message-State: AOPr4FU20fho08e5UYfEsvcNw8zjYBTffRD+bWfLtYtEniOqlOZTRtWOhKwmNMT0Jcuna/mlo9GfttpTy9pkpA==
X-Received: by 10.159.40.170 with SMTP id d39mr2001588uad.35.1462299072550;
	Tue, 03 May 2016 11:11:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.184.134 with HTTP; Tue, 3 May 2016 11:10:53 -0700 (PDT)
In-Reply-To: <5728E097.1060507@freebsd.org>
References: <1459861743-4514-1-git-send-email-haris.phnx@gmail.com>
	<CAE_WKMyO1LjEZ_T5-O7=X=MOpSe7AqTeXTOOkfiZ114bGjNeDQ@mail.gmail.com>
	<5728E097.1060507@freebsd.org>
From: haris iqbal <haris.phnx@gmail.com>
Date: Tue, 3 May 2016 23:40:53 +0530
Message-ID: <CAE_WKMy6tMKUFhdwV9T1ejBFHe=SeVeOfzZnFYyUCe8zNXAYZA@mail.gmail.com>
To: Sean Bruno <sbruno@freebsd.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] Changed malloc to
 g_malloc, free to g_free in bsd-user/qemu.h
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
X-List-Received-Date: Tue, 03 May 2016 18:12:03 -0000

On Tue, May 3, 2016 at 11:02 PM, Sean Bruno <sbruno@freebsd.org> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA512
>
>
>
> On 05/03/16 02:45, haris iqbal wrote:
>> Just a reminder. waiting for a review for the previous patch.
>>
>> On Tue, Apr 5, 2016 at 6:39 PM, Md Haris Iqbal
>> <haris.phnx@gmail.com> wrote:
>>> Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com> ---
>>> bsd-user/qemu.h | 4 ++-- 1 file changed, 2 insertions(+), 2
>>> deletions(-)
>>>
>>> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h index
>>> 03b502a..5fac42e 100644 --- a/bsd-user/qemu.h +++
>>> b/bsd-user/qemu.h @@ -357,7 +357,7 @@ static inline void
>>> *lock_user(int type, abi_ulong guest_addr, long len, int copy
>>> #ifdef DEBUG_REMAP { void *addr; -        addr = malloc(len); +
>>> addr = g_malloc(len); if (copy) memcpy(addr, g2h(guest_addr),
>>> len); else @@ -383,7 +383,7 @@ static inline void
>>> unlock_user(void *host_ptr, abi_ulong guest_addr, return; if (len
>>> > 0) memcpy(g2h(guest_addr), host_ptr, len); -
>>> free(host_ptr); +    g_free(host_ptr); #endif }
>>>
>>> -- 1.9.1
>>>
>>
>>
>>
>
> If this is the only patch needing review for the bsd-user code, please
> put me down as Reviewed by.

Sorry, I am a newbie. Just to confirm, should I send the patch again
with "Reviewed by : Sean Bruno" line?

>
> Reviewed-by: Sean Bruno <sbruno@freebsd.org>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2
>
> iQF8BAEBCgBmBQJXKOCTXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
> ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRCQUFENDYzMkU3MTIxREU4RDIwOTk3REQx
> MjAxRUZDQTFFNzI3RTY0AAoJEBIB78oecn5kZE0H/06zauEdcv8Y0K3KI3r2ioFS
> M6nqr/UXjqazqIeArBKDC+cnv47cnwH/x6Udn2on+CY9kR91QyUeG/DKUJdEp6Hs
> idUuTf3L0W8nhNUUXE9bwVI7H2KWpDzHJ52dnHuSXaQZnBE6Q1AFk0ge+hg+XcCU
> BsOqEkTAcxchOnvQJgNpMyXofI35QvSXqqaijTozMdGT7iHG0nKpO6KNW11ash2U
> YEVNs9nkr9I+B+qKPhhgX+v4dAuHSekaEstWbkqqSa4YsmqIylL1MNTpRTbEUSEG
> fScXKCOy3lANGV6u1sTzLIffR6N3WhkaYCuzYsQ7TQL/TAuYpBrQq7TQt8lb0Do=
> =qmUg
> -----END PGP SIGNATURE-----



-- 

With regards,

Md Haris Iqbal,
Placement Coordinator, MTech IT
NITK Surathkal,
Contact: +91 8861996962

