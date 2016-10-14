Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buzYW-0000Ex-Cw
	for mharc-qemu-trivial@gnu.org; Fri, 14 Oct 2016 06:17:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1buzYU-0000Ee-PH
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2016 06:17:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1buzYQ-0002Q2-Ei
	for qemu-trivial@nongnu.org; Fri, 14 Oct 2016 06:17:33 -0400
Received: from mail-lf0-x22e.google.com ([2a00:1450:4010:c07::22e]:33288)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1buzYQ-0002Pb-5N; Fri, 14 Oct 2016 06:17:30 -0400
Received: by mail-lf0-x22e.google.com with SMTP id x79so193240100lff.0;
	Fri, 14 Oct 2016 03:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=RAz3oRdthgvJvvaHo8XJdofFiWkVNh0OyOsaIikCrQA=;
	b=V32WFyMXpAR9pOOD4mYDSp22MRLfO6HKydZwGfW3mI1+VjaOoZeuMS5u4UkOVZUjHa
	B4GrxkSU8nrDT5R7Sk+18XY1jG6T4SqLX2I30h7+qnMIz3iJkxuhg9brebaqrB7cH4er
	Vn9aWPl7TMOzYFOdoKJb/2jaVuyoZeTtX3h0NnRCxDtaiKrc5ykkUwclvUwMrpmMzcGS
	9YbRWz2Ra61ROz6N9co/xT/I1wZXbPnPh9mXki7lcVDieo8G/9BMXcNbG4UpfWfV1fI8
	Gs5yx4rbXA8Uek4lgQsUDhOvRLxz1ZdpFmjrjntv+AdzNbmJj8tt8cJkyl8o1iqgu+9E
	HN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=RAz3oRdthgvJvvaHo8XJdofFiWkVNh0OyOsaIikCrQA=;
	b=Dwtnzm8qYbWK4pQazGRGL6+60EX7ig6Qm61d7MjpUoDMhLqEmJe/yQPMpp0n7vVz80
	rY7sHQBZ9ZKGjmR2WIjmaENPApCz9nnvh550DRgnO2Zrvq7YrqqiRYKBNBaNAwd8raoh
	uYjpjHVExugrHhC0bbPMZ6z/rbIFeY3AHqLwcFqmaSVBpWgzm1Biz6RUF1aBRjXTHSKd
	hBxGmlSC7WVUTfNbip/yy2UD1LAjkK3ZZyNg4G2RyldOsUPWtYwX5p8jzVVGjODcyuXs
	Ubz88Akro9riPD55ft3vYBRBqJJnc6rkHEgZmFuWzPpuqvI1sXkL+n4LnPOmp8vfcLje
	eKNQ==
X-Gm-Message-State: AA6/9Rn1S4zqQ9YjvSoC0i7KvFnKwvx32oezQZ6NSC3KeaJD9/EmWh2IaRgE3AQILCr5CQ==
X-Received: by 10.25.135.130 with SMTP id j124mr2742366lfd.44.1476440248826;
	Fri, 14 Oct 2016 03:17:28 -0700 (PDT)
Received: from [192.168.10.165] (94-39-150-81.adsl-ull.clienti.tiscali.it.
	[94.39.150.81]) by smtp.googlemail.com with ESMTPSA id
	l203sm4939874lfe.17.2016.10.14.03.17.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Oct 2016 03:17:27 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>, "qemu-trivial@nongnu.org"
	<qemu-trivial@nongnu.org>
References: <1476383370-30650-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA8QADee1et4jSGP26i8atRy2KG29wMab_nieisNvCicEQ@mail.gmail.com>
	<20161014095330.GA20003@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bb3abc6a-3f5b-f1d4-7bc9-6b5e6c41de3c@redhat.com>
Date: Fri, 14 Oct 2016 12:17:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20161014095330.GA20003@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::22e
Subject: Re: [Qemu-trivial] [PATCH] Fix build for less common build
 directories names
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
X-List-Received-Date: Fri, 14 Oct 2016 10:17:35 -0000



On 14/10/2016 11:53, Stefan Hajnoczi wrote:
> > Why does it need to care about the build directory name at all?
> > Ideally builds should be entirely deterministically reproducible
> > whatever the path to the source or build directory names is...
>
> It's trying to construct the relative path from the source directory to
> a trace-events file (inside the source directory).  This is used so that
> block/trace-event macros have BLOCK in their name while net/trace-events
> have NET, etc.

But Stefan (Weil) is right, it's actually including the path to the
build directory if you're building with objdir!=srcdir.  It should not
need that.

Paolo

