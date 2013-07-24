Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V1zak-0000kp-1m
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jul 2013 09:58:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1V1zaf-0000fk-EG
	for qemu-trivial@nongnu.org; Wed, 24 Jul 2013 09:58:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1V1zaZ-0000Uc-8E
	for qemu-trivial@nongnu.org; Wed, 24 Jul 2013 09:58:53 -0400
Received: from mail-qe0-x235.google.com ([2607:f8b0:400d:c02::235]:58808)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>)
	id 1V1zaU-0000T9-4P; Wed, 24 Jul 2013 09:58:42 -0400
Received: by mail-qe0-f53.google.com with SMTP id f6so2423507qej.40
	for <multiple recipients>; Wed, 24 Jul 2013 06:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=lrE+hJVkjPwYz1xzLcTTrko3wtYbB+W+v1h746FuVck=;
	b=Hah+Wo5ulzmw1gQOJhHAPyM26aey599XOMfYP4OyXkI1iRTL1Ijl2IFjBOTb0q/O0k
	YSM5gTQLDliwcIibwGa3H69elAw0xA+7mEswmMOg+SED5aQl2NkOwpFp328fYM99mujT
	LNvf1eES+oAybW7BLo934eeeDhst2n69WnU7Y68xmNorRUI4otFRS08ztceh4QBp86Dg
	ewXicp1CCOFWlOPZzihPcLWPfZlnxQmwRHcXQKm4CZfLyJ2kRhmS+TZGAYKT4V/GYSV9
	vZEu3AgZginnCBNC2Vz7FFI4xLBMT1G2Z2tcZqQzKMEgOTCCRSYWZXUTGLZaQETYCOja
	cCAw==
MIME-Version: 1.0
X-Received: by 10.49.63.103 with SMTP id f7mr43901903qes.89.1374674321074;
	Wed, 24 Jul 2013 06:58:41 -0700 (PDT)
Sender: carpeddiem@gmail.com
Received: by 10.224.209.6 with HTTP; Wed, 24 Jul 2013 06:58:41 -0700 (PDT)
In-Reply-To: <87ob9sjd6j.fsf@codemonkey.ws>
References: <1374225073-12959-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAPyFy2BLhkY6hRhadiwP8xeqAyTBLNuG2rT+GuT+bNUQj5EZ5g@mail.gmail.com>
	<87ob9sjd6j.fsf@codemonkey.ws>
Date: Wed, 24 Jul 2013 09:58:41 -0400
X-Google-Sender-Auth: CcyFE6aW2mA5GTJArDf_dEVPtNI
Message-ID: <CAPyFy2Bj0p_-UfyEAyUkmnh2M1wBzjw20BhQ9qXVzKCSfHszUg@mail.gmail.com>
From: Ed Maste <emaste@freebsd.org>
To: Anthony Liguori <aliguori@us.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c02::235
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL trivial 0/5] trivial patches
 for 2013-07-19
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
X-List-Received-Date: Wed, 24 Jul 2013 13:58:56 -0000

On 24 July 2013 09:32, Anthony Liguori <aliguori@us.ibm.com> wrote:
> Ed Maste <emaste@freebsd.org> writes:
>
>> On 19 July 2013 05:11, Michael Tokarev <mjt@tls.msk.ru> wrote:
>>> This is another trivial-patches pull request.  This time
>>> we have just 5 patches accumulated in two (!) weeks period.
>>> Please consider apply.
>> ...
>>> Michael Tokarev (2):
>>>       slirp: remove mbuf(m_hdr,m_dat) indirection
>>
>> Any idea when this might get pulled?  The FreeBSD build is broken
>> until this slirp fix makes it in.
>
> Two days ago.

Ahh, sorry - I was somehow pulling from a local mirror that got stuck.

