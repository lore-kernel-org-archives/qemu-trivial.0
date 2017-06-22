Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dO5oQ-00035u-FZ
	for mharc-qemu-trivial@gnu.org; Thu, 22 Jun 2017 13:22:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dO5oO-00033d-8a
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 13:22:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dO5oN-0000sY-89
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 13:22:32 -0400
Received: from mail-wr0-x22b.google.com ([2a00:1450:400c:c0c::22b]:34838)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dO5oN-0000sB-1r
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 13:22:31 -0400
Received: by mail-wr0-x22b.google.com with SMTP id k67so32100448wrc.2
	for <qemu-trivial@nongnu.org>; Thu, 22 Jun 2017 10:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V2FJJP04UKMuvHYIgAQysnzfo3YTY19Cs2N8Enw4Z+I=;
	b=b9mLczq51H5YKy8mJIpdACAZJ6PqOwjV3fU0Gt+jmIIc1v0z3D3jldcReTQa26e62f
	fXcLGL5+XJbl6qEu4QPr/whGL/vgoao9p8tcRHNWoa8QsSPY0LOkBHeUelTKCT5SOHzn
	ceCbqkTgRAcR89UV2LvJLPr5kjEqwX0MUahkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V2FJJP04UKMuvHYIgAQysnzfo3YTY19Cs2N8Enw4Z+I=;
	b=AZbf7FAtkS1B+wf8w9o5ZiVgXc+NpaHuQmYJ0guw0DH9CzgaoYFFfqQ61y5Ur6VwHY
	GO6TLv3jzGmRBfxy//HRtdL0C2C8lAFHWY67dWQtJoUYk4+OVRkCqzoJwDJFqVMuancB
	uxpG2zrzn54y7bnPzou2vwhzLeA6s+2UbbBbWkz+F0MVZROK5xswtvBPV9gMMFJ9+WcB
	OF7cXpeFJSp7NR2imljARgELTZSTbkx7o9DjZpN0Dxor94dleXf711gR6mLPl+RWfIO/
	q8+Q0xLEVgSiYxsG/z/lxB8qQ7hgBz5/rsgaP+lvgfd4aZvZwotN44dBwvahBVsroblh
	+Ljg==
X-Gm-Message-State: AKS2vOzw0Q7fbKFGBdXFwHTugq962igHFGgOaeicFNmvxmD+yjnGdeGc
	Hc5lOlXYUX8FHQDBgQChdEYFpisZGQ5X
X-Received: by 10.28.66.23 with SMTP id p23mr1519715wma.38.1498152149816; Thu,
	22 Jun 2017 10:22:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Thu, 22 Jun 2017 10:22:09 -0700 (PDT)
In-Reply-To: <87injo6jla.fsf@secure.mitica>
References: <149814756006.27338.8723356702388175951.stgit@bahia>
	<CAFEAcA8yqb8ykP8nCnoVNQUZd851RhOLFf2TfkHZmL2je+pP=Q@mail.gmail.com>
	<20170622184255.2d44e3bd@bahia.lab.toulouse-stg.fr.ibm.com>
	<87injo6jla.fsf@secure.mitica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Jun 2017 18:22:09 +0100
Message-ID: <CAFEAcA-g-=AkH3t8jOTFY_9zA6ECS57-3MS=cHPb+Q6sePzNsw@mail.gmail.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Greg Kurz <groug@kaod.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22b
Subject: Re: [Qemu-trivial] [PATCH] Separate function types from opaque
 types in include/qemu/typedefs.h
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
X-List-Received-Date: Thu, 22 Jun 2017 17:22:33 -0000

On 22 June 2017 at 18:03, Juan Quintela <quintela@redhat.com> wrote:
> Greg Kurz <groug@kaod.org> wrote:
>> On Thu, 22 Jun 2017 17:14:08 +0100
>> Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>>> On 22 June 2017 at 17:06, Greg Kurz <groug@kaod.org> wrote:
>>> > Function types cannot reside in the same sorted list as opaque types since
>>> > they may depend on a type which would be defined later.
>>> >
>>> > Of course, the same problem could arise if a function type depends on
>>> > another function type with greater alphabetical order. Hopefully we
>>> > don't have that at this time.
>>>
>>> The other approach would be to put function types somewhere
>>> else and leave typedefs.h for the simple 'opaque types
>>> for structures' that it was started as.
>>>
>>> For instance we have include/qemu/fprintf-fn.h as a precedent.
>>>
>>
>> Indeed, and I'm not quite sure why Juan decided to put these types into
>> typedefs.h instead of a dedicated header file in include/migration... is
>> it only because it was the quickest fix ?
>
> All other typedefs were defined there.  I can create a different include
> file, but I think that is "overengineering", no?  They are typedefs,
> just not of structs.  But I agree that they are the only ones.

Well, the comment in the file says "opaque types so that device init
declarations don't have to pull in all the real definitions", whereas
the ones you've added aren't opaque types, they are the real
definitions. They're also only used by a very small subset of .c
files, whereas typedefs.h goes everywhere.

thanks
-- PMM

