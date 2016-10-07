Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsWTE-00023l-5u
	for mharc-qemu-trivial@gnu.org; Fri, 07 Oct 2016 10:49:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsWT9-000206-AM
	for qemu-trivial@nongnu.org; Fri, 07 Oct 2016 10:49:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsWT7-0007Fx-Cx
	for qemu-trivial@nongnu.org; Fri, 07 Oct 2016 10:49:50 -0400
Received: from mail-ua0-x231.google.com ([2607:f8b0:400c:c08::231]:34420)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsWT7-0007FE-6i
	for qemu-trivial@nongnu.org; Fri, 07 Oct 2016 10:49:49 -0400
Received: by mail-ua0-x231.google.com with SMTP id p25so46835293uaa.1
	for <qemu-trivial@nongnu.org>; Fri, 07 Oct 2016 07:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VsSzPNg3lG5Ty6ygfg4YLfNPethQpdA8FiTi8Z+ufjY=;
	b=VYBrx5q5L4QWUvbK1cxyVspvrAACUsTvO4Kj9a36IWyBY9lQSabk7vfa6NmSZ5nbYv
	Po0OflZRSd6l8krQkOrbbHAHn3gQr/CB6jsffYK+2xY4/DwMpcLlF/7h1ZxVZI9UeRwU
	XhFr+sm3s1v1HkL1N/b1UcWzH9RhK8Vba3JKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VsSzPNg3lG5Ty6ygfg4YLfNPethQpdA8FiTi8Z+ufjY=;
	b=VY0o/jfhdO835qWnliumZzjYeMDG8T7EhDabM9dCYYI/HWOoqj8hRIUVL3YueWaMbl
	pEeCS1l5wxYhPoI2XcHKNeHQNS1KXSOSrDPeHoOwZl8FQlvGXHczTt7Nua51gapDc5Be
	kdQLvlqDnBh7+hT+Y4nxf+Y4Mr5YQEZSQF0nZjX4rIghEDVhpFMlW6EO86uKsb1roksQ
	7lNpAyxTrlASuOcazzbadOZt5Vlblxi04EpPpzhwNlicIzvcBTH+3HNDiza4JNR4xPFP
	OAv5TTDFNM4T6oMFpwXWRJ2iQ1T7DtHXRHd0zlDPDl1cotGP4/QcJo9EJkEvCgPm1sgD
	7hWg==
X-Gm-Message-State: AA6/9Rm+HXrx89xy9K9vu6fFvFduV5zNVTdeGNHXjHSDZDvqaH53FqOW3IxWSA7PEJLMoNH7wnCvT9mERGLHkNgt
X-Received: by 10.176.69.238 with SMTP id u101mr14980295uau.175.1475851788526; 
	Fri, 07 Oct 2016 07:49:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Fri, 7 Oct 2016 07:49:27 -0700 (PDT)
In-Reply-To: <290de67f-8505-fbd7-c2fa-6fbe7ca604eb@redhat.com>
References: <1475829975-17413-1-git-send-email-anand.indukala@gmail.com>
	<290de67f-8505-fbd7-c2fa-6fbe7ca604eb@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2016 15:49:27 +0100
Message-ID: <CAFEAcA9Ov_G6Op0t93o4-k3G6Pud6PXKJ8m8WQjouKi1T9b3Ag@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: Anand J <anand.indukala@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::231
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] clean-up: removed duplicate
 #includes
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
X-List-Received-Date: Fri, 07 Oct 2016 14:49:55 -0000

On 7 October 2016 at 15:31, Eric Blake <eblake@redhat.com> wrote:
> On 10/07/2016 03:46 AM, Anand J wrote:
>> +++ b/hw/pci-bridge/pci_expander_bridge.c
>> @@ -13,7 +13,6 @@
>>  #include "qemu/osdep.h"
>>  #include "qapi/error.h"
>>  #include "hw/pci/pci.h"
>> -#include "hw/pci/pci_bus.h"
>>  #include "hw/pci/pci_host.h"
>>  #include "hw/pci/pci_bus.h"
>
> Changes like this are obviously correct...

...assuming that pci_host.h doesn't implicitly depend on
pci_bus.h having been included first. Deleting the second
of the duplicate lines rather than the first might be
safer.

thanks
-- PMM

