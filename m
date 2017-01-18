Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cTl0H-00075c-J8
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jan 2017 02:49:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTl0F-00074I-RQ
	for qemu-trivial@nongnu.org; Wed, 18 Jan 2017 02:49:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTl0F-0003aE-5y
	for qemu-trivial@nongnu.org; Wed, 18 Jan 2017 02:49:55 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:34109)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <skiver.cloud.yzy@gmail.com>)
	id 1cTl0D-0003Z8-95; Wed, 18 Jan 2017 02:49:53 -0500
Received: by mail-qt0-x242.google.com with SMTP id a29so626160qtb.1;
	Tue, 17 Jan 2017 23:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZsSVphOq6VSwUm1KmJAJtGGCOSgalw1v+H5I/Kk0kxA=;
	b=QXkdHAdzX1Y69Mq1YVHEu2ZJU3JRQx++WK0EHScBPd403D67h6RTXiuYCl1r3Kzhpz
	HSA+/bYYyjQY8I0tRD0/OuA2br51gTRO5SiLtnTfS0sTz7/3BsVRYMsmEQ5rR/lc0vbp
	hpW/a45LN0VHQCJ+hyhU9OfgvIhX/XFMJysP3OvUaJdZ5KphcVx6mHXoVPNhX76aklSO
	LWLEYVAMro4kAZz4a16Ku+hZewj364keQTJSLvHurFOl1F8+nPOCYGKMNcwVFJaGF93Z
	NSOzJMA/B19EjlXHC7kXvHnxsrFrkAECgiHcq83SE/qCWNm1i3MRkYiU5nLeD56EgSp4
	CGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZsSVphOq6VSwUm1KmJAJtGGCOSgalw1v+H5I/Kk0kxA=;
	b=QxZSJje2ceqYc6k2M7mFtWq8lGi/0wpT7uUfFPfz24bnpCMgUZtA7z/f5B8VOZs9zq
	zZNUGutjuQhWvj7mZ4Pw7MRD/xCU1glRYVTIwQxDVjV+22dl7BWuINuNc0JdrLHpOlQP
	537rLF1fUhtdMMsyIXcPwE9hwAqr6dBQfOqMLlJdNzwXrnyCZBZa01JXAn7UbTEmaGhg
	Rr2o9uRfKZTMbATaswdZZWaAVQchYGOhVGCJPp/AY2MM9SDPmjMlVc0qvZsFHnmpxEkt
	r5Vlknlky1/HyC4cHGTUUuEjvJW55RYhZntrYs7upc8Zx7i6h80yX/PAvT0TXor0cShk
	wBxw==
X-Gm-Message-State: AIkVDXIiWknc3q1K5qHjFi690XJFya+HL8XqzXRjhOQti3g2qhaaVL1RGYxvBsxdc5Cdn/agPbACHL38xyBVVw==
X-Received: by 10.200.34.155 with SMTP id f27mr1517566qta.129.1484725792694;
	Tue, 17 Jan 2017 23:49:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.82.231 with HTTP; Tue, 17 Jan 2017 23:49:52 -0800 (PST)
In-Reply-To: <c8fbc6e3-7862-ad33-1344-b21b8118e0fc@redhat.com>
References: <1484709699-3455-1-git-send-email-skiver.cloud.yzy@gmail.com>
	<66ed2121-c207-d2f4-2e05-b6474bfa6a49@redhat.com>
	<CAHkcwacJ_BBOTDBxrDejqNiuzWcfrjVRWM-yNeuRF98tEc+xPw@mail.gmail.com>
	<c8fbc6e3-7862-ad33-1344-b21b8118e0fc@redhat.com>
From: Yang Ziyue <skiver.cloud.yzy@gmail.com>
Date: Wed, 18 Jan 2017 15:49:52 +0800
Message-ID: <CAHkcwacbQXoyqn2y5AL=-LfmO6W7jmET1K8PQy1QfJpiYbxHLg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
	Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ziyue Yang <yzylivezh@hotmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-trivial] [PATCH v4 1/2] gdbstub.c: fix GDB connection
 segfault caused by empty machines
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
X-List-Received-Date: Wed, 18 Jan 2017 07:49:56 -0000

Got it. Thanks!

2017-01-18 15:48 GMT+08:00 Thomas Huth <thuth@redhat.com>:
>  Hi,
>
> On 18.01.2017 08:43, Yang Ziyue wrote:
>> Hi Thomas,
>>
>> I'm not quite sure about that, but did you mean that I should mention
>> the second patch before the Sign-off line instead of in the commit
>> message?
>
> No, I meant: You still got the sentence "Also some updates from
> fprintf(stderr, ...) to error_report." in the description of your first
> patch. But indeed this is now done in the second patch instead. So
> simply remove that sentence from the description of your first patch,
> and everything is fine :-)
>
>  Thomas
>

