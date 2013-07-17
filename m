Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UzFG4-0003eD-Ma
	for mharc-qemu-trivial@gnu.org; Tue, 16 Jul 2013 20:06:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UzFG2-0003bU-50
	for qemu-trivial@nongnu.org; Tue, 16 Jul 2013 20:06:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UzFFz-00077V-3Y
	for qemu-trivial@nongnu.org; Tue, 16 Jul 2013 20:06:14 -0400
Received: from mail-bk0-f49.google.com ([209.85.214.49]:53662)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UzFFy-00077C-TM
	for qemu-trivial@nongnu.org; Tue, 16 Jul 2013 20:06:11 -0400
Received: by mail-bk0-f49.google.com with SMTP id mz10so490790bkb.8
	for <qemu-trivial@nongnu.org>; Tue, 16 Jul 2013 17:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=O/eX0Yp1Ri1uIwHWJvy4AR34lmcmVOYl6nc6GzDvtgk=;
	b=jBF3iOqtCFcki2bTZKLuoajjNW3QsUPAFgRstIOO+jfzWMh6S+tyHuVnMiuYBK9JgF
	VJjKxn+pr7TudLD37TgD6Sry4cWTwNOO6zuy344yEZOfyP/Gv98xdVk7ykieVKad5SpA
	R50cSLV8Cm4hncXfofgiNY5x0MUiLyHG2p/jEz+oocKSwnMHA4dRZ4ajgsCN3bxcpvvx
	LZxeUOXp3Shtc+QB/ZALGGTl8NhgMgsKYde82CHpHfm42gUeuIf36lk3uCpz0vg2dQxq
	1Ft8aEXnxVIFx9Q8J3JKeBmzNzpopW8JVihXzf3Z2ONSPmLYnIV7Qnxm/AXf55N1j2TA
	8jgA==
MIME-Version: 1.0
X-Received: by 10.205.116.137 with SMTP id fi9mr594463bkc.149.1374019569888;
	Tue, 16 Jul 2013 17:06:09 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.204.229.206 with HTTP; Tue, 16 Jul 2013 17:06:09 -0700 (PDT)
In-Reply-To: <51E58937.105@msgid.tls.msk.ru>
References: <1370361554-91658-1-git-send-email-emaste@freebsd.org>
	<CAEgOgz5fKfhum3DmLv_rNgNz4HAJNQs5Vp5OOtEdD4nieMrXUA@mail.gmail.com>
	<51B5F378.70804@msgid.tls.msk.ru> <51CD6760.30901@msgid.tls.msk.ru>
	<51E58937.105@msgid.tls.msk.ru>
Date: Wed, 17 Jul 2013 10:06:09 +1000
X-Google-Sender-Auth: i7Pkokm960CITQNNnqVMjJbWV4s
Message-ID: <CAEgOgz7wv3W=Oty2KphrOHNJ7HYY=c0oCVdnwYmy+guJH0uoLw@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
X-Gm-Message-State: ALoCoQm5d+G9irTqjq9PMwDae8hYqCxM7W3UBGP/VxwEl6JQ9K9+hJkJ1WPlqdoTV+quSxx4OisG
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.49
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block/m25p80: Update Micron
	entries
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
X-List-Received-Date: Wed, 17 Jul 2013 00:06:15 -0000

Sorry about the delay,

Ack.

We arent getting the long term fix to this soon, so lets apply the patch.

Regards,
Peter

On Wed, Jul 17, 2013 at 3:56 AM, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Ping^3 ?
>
> 28.06.2013 14:37, Michael Tokarev wrote:
>> 10.06.2013 19:40, Michael Tokarev wrote:
>>> 07.06.2013 07:51, Peter Crosthwaite wrote:
>>> []
>>>> Id like to give it a few days to see what they say before we merge
>>>> this. Ideally we have agreement between the two source trees, so we
>>>> can continue the copy-paste based update strategy.
>>>
>>> Do we have any agreement yet? :)
>>
>> Ping^2 ?
>>
>> Should I apply the initial patch?
>>
>> Thanks,
>>
>> /mjt
>>
>
>

