Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wtirf-0005Cx-Mn
	for mharc-qemu-trivial@gnu.org; Sun, 08 Jun 2014 15:34:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53438)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1WtirT-0004v5-G3
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 15:34:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1WtirK-0005jT-6m
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 15:34:35 -0400
Received: from mail-qg0-x231.google.com ([2607:f8b0:400d:c04::231]:40143)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1Wtir1-0005cU-Qe; Sun, 08 Jun 2014 15:34:07 -0400
Received: by mail-qg0-f49.google.com with SMTP id a108so7841530qge.22
	for <multiple recipients>; Sun, 08 Jun 2014 12:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=kiTAqcPhdvhO3nyn6gAs+JIaTgCTboB5hEaeisAuQzE=;
	b=vT0ghlk3d1FnnT9flM9JtmoYwfcOupsD+qkTP6nmA6pu2ewkcd4wQMWFWGEg11MRev
	s4ItYc89Ixj5r0H8ctJ3sE5r6+l4lcbrgKIzGOeLiFOTDE20vaD0V4DJImrgyF+h4jj2
	9LulzTXJ3Ykcq+nNOvZqy2grypkFm6smtWPaxPtzPCoQxwgsEYorrROkp/0s5VVaj2/2
	HmPWoCDO/6n+MzCmWyF0tTj38VGxR7VwsX6fiZoWq2rhsxeL1D4cQmC0cu9cRV0152K7
	wE/N5bKUNDh2ZSEusuTHbNbrM6RU3pwhlcTqDwqJUhOflRO0rqsS2+a7tA6zW9QLJmN1
	aH/A==
X-Received: by 10.229.27.198 with SMTP id j6mr27263379qcc.12.1402256046346;
	Sun, 08 Jun 2014 12:34:06 -0700 (PDT)
Received: from pike.twiddle.home
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by mx.google.com with ESMTPSA id b7sm26660758qae.32.2014.06.08.12.34.03
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 08 Jun 2014 12:34:04 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <5394BAA9.30609@twiddle.net>
Date: Sun, 08 Jun 2014 12:34:01 -0700
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
References: <1402160924-14152-1-git-send-email-peter.maydell@linaro.org>
	<539452F2.8070509@msgid.tls.msk.ru>
	<CAFEAcA-ngVhdG5EemWziTcUbgKtwb+yDsFMTCKK0nk=wfKU_2w@mail.gmail.com>
In-Reply-To: <CAFEAcA-ngVhdG5EemWziTcUbgKtwb+yDsFMTCKK0nk=wfKU_2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH] tcg: mark tcg_out* and tcg_patch* with
 attribute 'unused'
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
X-List-Received-Date: Sun, 08 Jun 2014 19:34:44 -0000

On 06/08/2014 12:04 PM, Peter Maydell wrote:
> The other approach we could take would be to move these
> definitions from this .c file into a .h file (tcg-backend-helpers.h ?).
> Then clang won't complain (it seems to only warn about unused
> static-inline-functions in .c files, not in .h files).
> 
> Richard: do you have a preference?

I don't like the idea of moving these to a public header, and I don't think
it's worthwhile creating a new private header.  I'm ok with the unused attribute.


r~

