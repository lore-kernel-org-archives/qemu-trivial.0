Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXNFX-0008IB-1r
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 00:03:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <avi@cloudius-systems.com>) id 1WXBNo-0000s8-FV
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 11:22:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <avi@cloudius-systems.com>) id 1WXBNi-0007aH-G5
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 11:22:48 -0400
Received: from mail-ee0-f42.google.com ([74.125.83.42]:40171)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <avi@cloudius-systems.com>) id 1WXBNi-0007a1-4s
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 11:22:42 -0400
Received: by mail-ee0-f42.google.com with SMTP id d17so756964eek.15
	for <qemu-trivial@nongnu.org>; Mon, 07 Apr 2014 08:22:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=qsiDR7FhOz0T4Lt8Gr+HANjCjHBvw6yluNgVLzZJ2Aw=;
	b=SYn6NR7hWfGrYnQMvqEN7yMZUfyUVNRx4oqzilWIhJesm8caiPgJ/XOKDwqVmYkGr4
	c74ZocGXuVxK5J+Rr8Pqbiw3P6zXdTmiffkp34v5lwXwThiBVYyo2gGFIPL1EeVUGFaL
	VJzWaQmkvc4Nlnve5ph4C6R69vmhuQsDYI3LcBVFfK6SRM8sns7YexlvhBlVOB0qRQHy
	bIGdzCjJJkQeXEK4TgcGDcEwoeyUo+XWANncvp9aCAGZh5Vlwuql+sQ8+SksAO0hdaM0
	YjugtXzsISo957iMjrnkrrX7dtvhA7Sk1LYuCajkPQ2Gta8lM2s2T1W2V4qBnqJ8L/R4
	9PNA==
X-Gm-Message-State: ALoCoQl2qS1xCKkTPJ0IGODuJHpbYtF/Gcc1EoxqMswPV0qoDQToisEnj2wJRUvSAf0Rw2uIPatb
X-Received: by 10.14.98.69 with SMTP id u45mr1515727eef.81.1396884161378;
	Mon, 07 Apr 2014 08:22:41 -0700 (PDT)
Received: from augustus.local (84.94.198.183.cable.012.net.il. [84.94.198.183])
	by mx.google.com with ESMTPSA id u46sm42401592eel.1.2014.04.07.08.22.39
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Apr 2014 08:22:40 -0700 (PDT)
Message-ID: <5342C2BE.4020805@cloudius-systems.com>
Date: Mon, 07 Apr 2014 18:22:38 +0300
From: Avi Kivity <avi@cloudius-systems.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1396019577-2013-1-git-send-email-peter.maydell@linaro.org>
	<1396019577-2013-3-git-send-email-peter.maydell@linaro.org>
	<5340FDA3.1080902@msgid.tls.msk.ru>
	<CAFEAcA_uN=+R6UZ6FiRshH2XvSCYBKwcHZu5ugd_02rKeM=yDQ@mail.gmail.com>
	<5342BC96.6010204@cloudius-systems.com>
	<CAFEAcA-dCJ+i+g7F+hxgPr3AZjwOgrWj4X+9dXLvpj56JYQ07A@mail.gmail.com>
In-Reply-To: <CAFEAcA-dCJ+i+g7F+hxgPr3AZjwOgrWj4X+9dXLvpj56JYQ07A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.83.42
X-Mailman-Approved-At: Tue, 08 Apr 2014 00:03:01 -0400
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Patch Tracking <patches@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/3] int128.h: Avoid
 undefined behaviours involving signed arithmetic
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
X-List-Received-Date: Mon, 07 Apr 2014 15:22:54 -0000

On 04/07/2014 06:17 PM, Peter Maydell wrote:
> On 7 April 2014 15:56, Avi Kivity <avi@cloudius-systems.com> wrote:
>> On 04/06/2014 01:18 PM, Peter Maydell wrote:
>>> The alternative would be to say that Int128 should have
>>> undefined behaviour on underflow/overflow and the test
>>> code is wrong, but that doesn't seem very useful to me.
>> Isn't the test broken here?  It is trying to add (or shift) -2^127 and
>> something else, and the result truly overflows.
> Well, the test code is assuming "semantics as per 2s
> complement arithmetic" and checking various corner cases.
> As I say, we could define that this is invalid and
> rewrite the test cases.

It is invalid.  The test thinks that -2^127 * 2 == 0, but if a guest 
could trigger it, it would probably be a security issue.



