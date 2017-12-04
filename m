Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eLt8F-0005YA-TM
	for mharc-qemu-trivial@gnu.org; Mon, 04 Dec 2017 10:58:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eLt8D-0005X6-BT
	for qemu-trivial@nongnu.org; Mon, 04 Dec 2017 10:58:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eLt8C-00008U-HB
	for qemu-trivial@nongnu.org; Mon, 04 Dec 2017 10:58:09 -0500
Received: from mail-oi0-x22c.google.com ([2607:f8b0:4003:c06::22c]:33551)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eLt8C-000080-CR
	for qemu-trivial@nongnu.org; Mon, 04 Dec 2017 10:58:08 -0500
Received: by mail-oi0-x22c.google.com with SMTP id w131so12037297oiw.0
	for <qemu-trivial@nongnu.org>; Mon, 04 Dec 2017 07:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jKJL5hT3nOZt576FirGP1mRqERkxMNjsbiqjRKJ69VU=;
	b=OsZzMyoHBsh09qGSknHJ69VBUGOjIj7KvXAuj2eWGEtIRAtEo5vW1hnUna69jGa78v
	6avWNWspi3lWr49Y33v0W9M3G/6rXcqb0fgbdiVNQ71tX1PnyrJZNXJP5y5cwL6KUXHm
	hdFE1rp9SeVl9VehnO/PnjnyMreIvhZW0vWO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jKJL5hT3nOZt576FirGP1mRqERkxMNjsbiqjRKJ69VU=;
	b=FlqpBbIhC9YRNN9L5KFDSqNXpsmfzDh60sTEcaUHqGJ28RApecej5qfxdc9Q9DKLHI
	ZOAgQyZUah3g/K0q8mLhnVKgrk4xN74XFlWW0ZJlxsXt1fMHMwK4xIbmDrZKMIGqJZEg
	gEULrbLuBPgxFl4NWtKVxvX/dSTAxnCY37uNebX0ULYLtcrpJ5L8E9faBQb+TudRc7po
	+Xo9aCqdMl6Q7oaNkxLgthNWgeZQ63OY89T2hnThsu50vDMUjOI4rufxkGPHieMbISp8
	EYlxxhELs/m0ghmAeKt8O8FR6ZYtMob29W66ivZeGNoPC0Vq6cMlG8WN9o6bm6Do+gC8
	ZB1g==
X-Gm-Message-State: AJaThX7MFV1CNJJlkeyMwZf55i4+3yemTbnZgUYj/mokx3igoE2kfAqr
	w9hueEQt288cbgrIuQsMjrnnQw263YinaRtcF8GTJA==
X-Google-Smtp-Source: AGs4zMZmeuFMfapgf8Qq9RcIxZ/MZssAZlS8b6IRi30BMv/4FRQjogNZ9F1bDiM/QYwh4vm25AX3BKsh6f9jazR78z8=
X-Received: by 10.202.108.66 with SMTP id h63mr13374162oic.305.1512403087433; 
	Mon, 04 Dec 2017 07:58:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Mon, 4 Dec 2017 07:57:46 -0800 (PST)
In-Reply-To: <fa45711a-9203-423f-b9a9-e2006847f6f4@redhat.com>
References: <1512254273-7567-1-git-send-email-shravan2x@utexas.edu>
	<fa45711a-9203-423f-b9a9-e2006847f6f4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Dec 2017 15:57:46 +0000
Message-ID: <CAFEAcA-kO_cJKUs5sPkL5ynLd+nNrKac4dgUT-=1QmBC=e7qkg@mail.gmail.com>
To: Max Reitz <mreitz@redhat.com>
Cc: Shravan Rajinikanth <shravan2x@utexas.edu>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22c
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-img: Fixed grammatical
 error in dump_human_image_check
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
X-List-Received-Date: Mon, 04 Dec 2017 15:58:10 -0000

On 4 December 2017 at 15:51, Max Reitz <mreitz@redhat.com> wrote:
> On 2017-12-02 23:37, Shravan Rajinikanth wrote:
>> Signed-off-by: Shravan Rajinikanth <shravan2x@utexas.edu>
>> ---
>>  qemu-img.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/qemu-img.c b/qemu-img.c
>> index 68b375f..bea9268 100644
>> --- a/qemu-img.c
>> +++ b/qemu-img.c
>> @@ -580,7 +580,7 @@ static void dump_human_image_check(ImageCheck *check, bool quiet)
>>          if (check->leaks) {
>>              qprintf(quiet,
>>                      "\n%" PRId64 " leaked clusters were found on the image.\n"
>> -                    "This means waste of disk space, but no harm to data.\n",
>> +                    "This means disk space is wasted, but data is safe.\n",
>>                      check->leaks);
>>          }
>
> How exactly is this a grammatical error?  (I'm not a native English
> speaker, but it always seemed perfectly OK to me)

I think "This means" more naturally takes a verb phrase, not a noun phrase.
I don't know that I'd go so far as to say that the current text is
ungrammatical, but I do think the proposed change sounds more natural to me.

thanks
-- PMM

