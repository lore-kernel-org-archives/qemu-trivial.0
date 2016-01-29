Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPAzr-0006lL-4J
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jan 2016 10:30:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aPAzk-0006cK-Lc
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 10:30:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aPAzj-0004pP-QT
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 10:29:56 -0500
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:36068)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aPAzj-0004pI-Lc
	for qemu-trivial@nongnu.org; Fri, 29 Jan 2016 10:29:55 -0500
Received: by mail-vk0-x22f.google.com with SMTP id n1so43689050vkb.3
	for <qemu-trivial@nongnu.org>; Fri, 29 Jan 2016 07:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/iieOUZ1ZfqWzU7dhF9k3FmluDO/VoWqxQqcLk5s46c=;
	b=CNqXZrrkJIQwB1qC0lOUVAyEgd9o1AMPrK+tgwSL9Ey1X+IRNc/nG/eNSifJE4QR++
	1ZhpLA9Y9NMBF5bRa751G4s8w2PdZpBR4+FQZe7BNARp6L9kEZpiBIwlRx3rk8Abnebf
	Vhv3qI3y22xL+jKKRZ8XGcqd5fbAU13oCF/LE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/iieOUZ1ZfqWzU7dhF9k3FmluDO/VoWqxQqcLk5s46c=;
	b=hE6v8fsBY6YgyZXvIPwpHIj4Is+r8yflQF1g94G4bIGCQtWgUNgg83BGyEzEeu9OaT
	QD9Cz8aoHjbYhGl+bR6//ejcO6p2cedrGrIJ+/4SDNr788t3ygMz7ERmcxz4Vm/xs6Kl
	Cynk5ZTFXRZfegYSfcXN30dJ77sBqvRMYgCo0QqimHuQJ8sf/o14JQGCw5njze3ERqnV
	jUzwnzGva8WlCxAwytoqPLRlZvDU1rxPMR6G9Ae+hN4Q4ppKGzQASY5bX7xuNviH5NVo
	VYXzKPmX1artPbIIyj+InLYuNIcN1anCIYo+225UtJLf+9MVqzakazkGoZ1bcBs6bDAB
	4IJA==
X-Gm-Message-State: AG10YOTlbXDj3WPNDy67Yu3EyOWT3AdQ1jdnoPsL4p3sP7sOIMwPIDeGzd8OZhJ9bE2LE8kVstJlPyJeWvCmPcjt
X-Received: by 10.31.47.207 with SMTP id v198mr6266914vkv.6.1454081395206;
	Fri, 29 Jan 2016 07:29:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 29 Jan 2016 07:29:35 -0800 (PST)
In-Reply-To: <56AB818B.1060500@redhat.com>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<CAM2+HU4Z39LoKjXqMRDQYbozQAi2-tqdo=d8TLrvVrJ6v6HHyQ@mail.gmail.com>
	<56AB78A6.7070505@redhat.com> <56AB7B48.9020007@linaro.org>
	<CAFEAcA9MYCFf-GCTnzHWUkaf6=_QCh=dsceaSg+4j8m3qgucpw@mail.gmail.com>
	<56AB818B.1060500@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jan 2016 15:29:35 +0000
Message-ID: <CAFEAcA-zGdWjy7MyzRnKanL8s-qwtVDdSZp-0P+41V37GTL-gA@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"zhaoshenglong@huawei.com" <zhaoshenglong@huawei.com>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 1/1] arm: virt: change GPIO trigger
	interrupt to pulse
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
X-List-Received-Date: Fri, 29 Jan 2016 15:30:02 -0000

On 29 January 2016 at 15:13, Wei Huang <wei@redhat.com> wrote:
>
>
> On 01/29/2016 08:50 AM, Peter Maydell wrote:
>> I wonder if we should be asserting the GPIO pin in the powerdown-request
>> hook and then deasserting it on system reset somewhere...
>
> This is another possibility. We can try to reset the pl061 state by
> hooking up with dc->reset and see what happens.

Ah, yes, PL061 hasn't been updated to implement reset. That is almost
certainly your problem.

thanks
-- PMM

