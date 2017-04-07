Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cwbW3-0001EK-TM
	for mharc-qemu-trivial@gnu.org; Fri, 07 Apr 2017 17:33:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cwbW0-0001Am-Sm
	for qemu-trivial@nongnu.org; Fri, 07 Apr 2017 17:33:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cwbW0-0007H4-5x
	for qemu-trivial@nongnu.org; Fri, 07 Apr 2017 17:33:56 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34363)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cwbVt-0007GC-T3; Fri, 07 Apr 2017 17:33:49 -0400
Received: by mail-qk0-x243.google.com with SMTP id p68so11843291qke.1;
	Fri, 07 Apr 2017 14:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=9A3YOv0ynsAligbiFP6Lqg2jMw+L1yo58Ytdy+gCbrY=;
	b=SKsRlY37QR5EJZb335OBfcT69lxcLANpExwxfavh6H6Zo3Ilfr/j1M0TMqwH7xjpkj
	mEHExGe7xnZg5rnkznBsXxlVpGP0X0c9VC3wWd+u8+koeKRKCh6/Q0VbmYT+f35zUbXY
	7aiAmIMp2YVNgYWUwGw7Nj9Xd/Y+XPDG9moQpQw5ytjzqrmMMYEdXz0KNAggJzGWyaLp
	Yh1bjuXoMs+QDTuNyGT8vEsKtYsLSo7JWek4rdlC2miWbiqg1HSLAfWN56Yc/Z9/JSmd
	KyE5QMhU3A2RjZI6PIoVWssk4ZSMabCzsyL7H86B9j06uF9Sr73Jc1icUSCQlxmckb+r
	u0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=9A3YOv0ynsAligbiFP6Lqg2jMw+L1yo58Ytdy+gCbrY=;
	b=JTrAkBEz02NuqQWXbjwiQXhDuBPi/y/vyiz438GJBY12M9Ms/w1Tm9YyY/mqSWRW5H
	ERDp3kg/YkdDfxURfpK18kDC6dQAO+2vTGf2r6r2EhHbZOqJhHZVz9ehtCfsStgQW594
	2eGwvCxmvXKyl6/aF64ZJl0helH9letBCOlOAbAnfuwzPbLmAoD23ZiDFqsfqR1DuXIY
	dTlzk+DfU56MN+0YCtWZ+jTgTfBLCH305seAk1KfpgbEo3B9EBOWL9xz2RM+yoI7XCod
	Qz2mqQogo8AATb7EPokQbLk/maXDPNh5o8X118VRoS7PYnvW9xUJ4kOifZ1PXAy4v+Lm
	QZaQ==
X-Gm-Message-State: AN3rC/7t/ftWgBcsluxwLeZK+kzil4J+az4e+BtJ6cmRR4nR+na7KcmQ0HmLVuJUDqj6VA==
X-Received: by 10.233.235.14 with SMTP id b14mr13296108qkg.86.1491600829277;
	Fri, 07 Apr 2017 14:33:49 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	d142sm3842506qkc.32.2017.04.07.14.33.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Apr 2017 14:33:48 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20170322204844.446-1-f4bug@amsat.org>
	<20170322204844.446-2-f4bug@amsat.org>
	<87y3vw1o94.fsf@dusky.pond.sub.org>
	<1490255007.463.11.camel@redhat.com>
	<CAJ+F1CJNy+e83EHR_8uzAHURxDk6idnNTTL_FoD-krWPue7Lww@mail.gmail.com>
	<1490262680.463.27.camel@redhat.com>
	<87tw6ktban.fsf@dusky.pond.sub.org>
	<1490277406.13302.1.camel@redhat.com>
	<878tnwm6g7.fsf@dusky.pond.sub.org>
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-trivial@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f5610e3c-116f-ae57-1e67-1fd930a59c4c@amsat.org>
Date: Fri, 7 Apr 2017 18:33:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <878tnwm6g7.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH RESEND 1/3] usb-ccid: make
 ccid_write_data_block() cope with null buffers
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
X-List-Received-Date: Fri, 07 Apr 2017 21:33:58 -0000

Hi Markus, Gerd.

On 03/23/2017 11:08 AM, Markus Armbruster wrote:
> Gerd Hoffmann <kraxel@redhat.com> writes:
>
>> On Do, 2017-03-23 at 13:41 +0100, Markus Armbruster wrote:
>>> Gerd Hoffmann <kraxel@redhat.com> writes:
>>>
>>>>   Hi,
>>>>
>>>>>  oops, there are hard-coded calls with NULL/0. I suppose to fix clang
>>>>> warning, it would need to check if data != null for memcpy.
>>>>
>>>> I'd check for len > 0, and in that if branch we can also assert on data
>>>> == NULL and thereby check that len and data are consistent.
>>>
>>> If len is non-zero but data is null, memcpy() will crash just fine by
>>> itself, so why bother asserting.
>>
>> To make clang happy?  But maybe clang is clever enough to figure data
>> can't be null at that point in case we call memcpy with len != 0
>> only ...
>
> If Clang needs another hint to become happy, then an assertion is a fine
> way to provide it.

Apparently Clang isn't clever enough using an assertion.

I'll resend checking len.

