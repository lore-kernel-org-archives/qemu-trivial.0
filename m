Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UT8Eg-0008RW-Km
	for mharc-qemu-trivial@gnu.org; Fri, 19 Apr 2013 06:08:06 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UT8Ea-0008Nz-VR
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2013 06:08:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UT8EX-0007nV-5c
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2013 06:08:00 -0400
Received: from mail-lb0-f176.google.com ([209.85.217.176]:55680)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UT8EW-0007nA-Ue
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2013 06:07:57 -0400
Received: by mail-lb0-f176.google.com with SMTP id y8so3580881lbh.35
	for <qemu-trivial@nongnu.org>; Fri, 19 Apr 2013 03:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=0BEdxzT+7z5C30lvg7J5OPuaIkQ+HOGC3d4PyJ34yoY=;
	b=NJ/8PpoO6accRmziagzZ2fadrvkN+v7Oiao+RGsAJMppS98b4CUEq4duA6M5kq5JwB
	Jghac9JaSiB9YfhOfZDdvS5+z3yFJxBbQtKvGbnZyJVcoaHlWKnW5MocXq8ntkbLFh7w
	XvVAJNcLU9p0HlS3vNjr34k2J0sqJ5ieJyEvtCQJwwW9zYgkVloi6taqEJjow80cIgY8
	RNs7r9isfhbOImI5LLOPuDEfsSWdIcZHF4doaGcApAEfDMQGQBg8c08ay4BbUw2HIuKz
	1yraoULTURXE9rD/kESoY4sjDZYCQ2m/tAaJa+OiLviVtqYbSWplBhkhRPgGR38P892G
	rUMA==
X-Received: by 10.112.140.1 with SMTP id rc1mr7762267lbb.43.1366366075227;
	Fri, 19 Apr 2013 03:07:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.198.198 with HTTP; Fri, 19 Apr 2013 03:07:35 -0700 (PDT)
In-Reply-To: <20130419093939.GE30143@stefanha-thinkpad.redhat.com>
References: <1365972770-13777-1-git-send-email-sw@weilnetz.de>
	<20130419093939.GE30143@stefanha-thinkpad.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Apr 2013 11:07:35 +0100
Message-ID: <CAFEAcA8wgKW84pk+CqO4jGzY1WFk790pYFyZUjX5WatP6DgJyw@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnHR5wbWb1DiYI2FBJiyTd5Z7tO7G8mT00BUNw+n93VdkgGZjYOgz+lLX9lW1evzOF+VQ7m
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.217.176
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw: Add lost ARM core again
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
X-List-Received-Date: Fri, 19 Apr 2013 10:08:05 -0000

On 19 April 2013 10:39, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Sun, Apr 14, 2013 at 10:52:50PM +0200, Stefan Weil wrote:
>> -CONFIG_ARM5MPCORE=y
>>  CONFIG_ARM9MPCORE=y
>> +CONFIG_ARM11MPCORE=y
>
> Did you mean to remove CONFIG_ARM5MPCORE?

This is correct -- we don't emulate the Cortex-A5.

-- PMM

